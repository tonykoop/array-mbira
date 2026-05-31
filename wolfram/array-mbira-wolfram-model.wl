(* Array Mbira parametric acoustic model.
   All physical values below are estimates only and are not fabrication authority. *)

ClearAll["Global`*"];

arrayMbiraMetadata = <|
   "instrument" -> "Array Mbira",
   "packet" -> "Round 8 Wolfram build-packet model",
   "modelName" -> "Parametric plucked metal tine and isomorphic grid estimate model",
   "authority" -> "reference_only",
   "calibrationStatus" -> "uncalibrated estimates; pending measurement"
   |>;

tineLengthEstimate = 0.095; (* estimate — pending measurement, not fabrication authority *)
tineWidthEstimate = 0.006; (* estimate — pending measurement, not fabrication authority *)
tineThicknessEstimate = 0.0012; (* estimate — pending measurement, not fabrication authority *)
tineDensityEstimate = 7850.; (* estimate — pending measurement, not fabrication authority *)
tineYoungsModulusEstimate = 200.0*^9; (* estimate — pending measurement, not fabrication authority *)
clampStiffnessFactorEstimate = 0.94; (* estimate — pending measurement, not fabrication authority *)
tipMassEstimate = 0.00025; (* estimate — pending measurement, not fabrication authority *)
modalMassCoefficientEstimate = 0.236; (* estimate — pending measurement, not fabrication authority *)
betaCantileverMode1Estimate = 1.875104068711961; (* estimate — pending measurement, not fabrication authority *)
gridColumnSemitoneStepEstimate = 2; (* estimate — pending measurement, not fabrication authority *)
gridRowSemitoneStepEstimate = 5; (* estimate — pending measurement, not fabrication authority *)
referenceRatioEstimate = 1.; (* estimate — pending measurement, not fabrication authority *)

tineArea[width_, thickness_] := width*thickness;
tineSecondMoment[width_, thickness_] := width*thickness^3/12;
tineModalMass[density_, width_, thickness_, length_] :=
  modalMassCoefficientEstimate*density*tineArea[width, thickness]*length;
tipMassLoadingFactor[tipMass_, modalMass_] := 1/Sqrt[1 + tipMass/modalMass];

tineFrequencyHzEstimate[length_, width_, thickness_, density_, youngsModulus_,
   clampFactor_, tipMass_] :=
  Module[{area, secondMoment, modalMass},
   area = tineArea[width, thickness];
   secondMoment = tineSecondMoment[width, thickness];
   modalMass = tineModalMass[density, width, thickness, length];
   clampFactor*tipMassLoadingFactor[tipMass, modalMass]*
    (betaCantileverMode1Estimate^2/(2*Pi*length^2))*
    Sqrt[(youngsModulus*secondMoment)/(density*area)]
   ];

gridRatioEstimate[row_, column_, rowStep_, columnStep_] :=
  referenceRatioEstimate*2^((row*rowStep + column*columnStep)/12);

arrayMbiraGridEstimate[rowMin_, rowMax_, columnMin_, columnMax_, rowStep_,
   columnStep_] :=
  Dataset[
   Flatten[
    Table[
     <|"row" -> row, "column" -> column,
      "relativeRatioEstimate" ->
       gridRatioEstimate[row, column, rowStep, columnStep]|>,
     {row, rowMin, rowMax}, {column, columnMin, columnMax}],
    1]
   ];

arrayMbiraNominalEstimate = <|
   "singleTineFrequencyHzEstimate" ->
    tineFrequencyHzEstimate[tineLengthEstimate, tineWidthEstimate,
     tineThicknessEstimate, tineDensityEstimate,
     tineYoungsModulusEstimate, clampStiffnessFactorEstimate,
     tipMassEstimate],
   "gridRelationshipEstimate" ->
    arrayMbiraGridEstimate[-2, 2, -2, 2, gridRowSemitoneStepEstimate,
     gridColumnSemitoneStepEstimate]
   |>;

arrayMbiraExplorer =
  Manipulate[
   Column[{
     Style["Array mbira tine and grid estimate model", 14, Bold],
     "All inputs are placeholders pending measurement; this model is reference_only.",
     <|"singleTineFrequencyHzEstimate" ->
       tineFrequencyHzEstimate[lengthMeters, widthMeters, thicknessMeters,
        densityKgPerM3, youngsModulusPa, clampFactor, tipMassKg]|>,
     Plot[
      tineFrequencyHzEstimate[length, widthMeters, thicknessMeters,
       densityKgPerM3, youngsModulusPa, clampFactor, tipMassKg],
      {length, 0.04, 0.16},
      AxesLabel -> {"tine length estimate (m)",
        "frequency relationship estimate (Hz)"},
      PlotRange -> All],
     arrayMbiraGridEstimate[-2, 2, -2, 2, rowStepSemitones,
      columnStepSemitones]
     }],
   {{lengthMeters, tineLengthEstimate, "tine length estimate (m)"}, 0.04,
    0.16},
   {{widthMeters, tineWidthEstimate, "tine width estimate (m)"}, 0.003,
    0.015},
   {{thicknessMeters, tineThicknessEstimate,
     "tine thickness estimate (m)"}, 0.0005, 0.003},
   {{densityKgPerM3, tineDensityEstimate,
     "tine density estimate (kg/m^3)"}, 6000., 9000.},
   {{youngsModulusPa, tineYoungsModulusEstimate,
     "Young modulus estimate (Pa)"}, 100.0*^9, 230.0*^9},
   {{clampFactor, clampStiffnessFactorEstimate,
     "clamp stiffness factor estimate"}, 0.70, 1.05},
   {{tipMassKg, tipMassEstimate, "tip mass estimate (kg)"}, 0., 0.0015},
   {{rowStepSemitones, gridRowSemitoneStepEstimate,
     "row interval estimate (semitones)"}, 1, 12, 1},
   {{columnStepSemitones, gridColumnSemitoneStepEstimate,
     "column interval estimate (semitones)"}, 1, 12, 1},
   SaveDefinitions -> True
   ];

arrayMbiraModel = <|
   "metadata" -> arrayMbiraMetadata,
   "nominalEstimate" -> arrayMbiraNominalEstimate,
   "explorer" -> arrayMbiraExplorer
   |>;
