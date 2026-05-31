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
minimumTineLengthEstimate = 0.04; (* estimate — pending measurement, not fabrication authority *)
maximumTineLengthEstimate = 0.16; (* estimate — pending measurement, not fabrication authority *)
minimumTineWidthEstimate = 0.003; (* estimate — pending measurement, not fabrication authority *)
maximumTineWidthEstimate = 0.015; (* estimate — pending measurement, not fabrication authority *)
minimumTineThicknessEstimate = 0.0005; (* estimate — pending measurement, not fabrication authority *)
maximumTineThicknessEstimate = 0.003; (* estimate — pending measurement, not fabrication authority *)
minimumTineDensityEstimate = 6000.; (* estimate — pending measurement, not fabrication authority *)
maximumTineDensityEstimate = 9000.; (* estimate — pending measurement, not fabrication authority *)
minimumTineYoungsModulusEstimate = 100.0*^9; (* estimate — pending measurement, not fabrication authority *)
maximumTineYoungsModulusEstimate = 230.0*^9; (* estimate — pending measurement, not fabrication authority *)
minimumClampStiffnessFactorEstimate = 0.70; (* estimate — pending measurement, not fabrication authority *)
maximumClampStiffnessFactorEstimate = 1.05; (* estimate — pending measurement, not fabrication authority *)
minimumTipMassEstimate = 0.; (* estimate — pending measurement, not fabrication authority *)
maximumTipMassEstimate = 0.0015; (* estimate — pending measurement, not fabrication authority *)
minimumGridSemitoneStepEstimate = 1; (* estimate — pending measurement, not fabrication authority *)
maximumGridSemitoneStepEstimate = 12; (* estimate — pending measurement, not fabrication authority *)
gridSemitoneStepIncrementEstimate = 1; (* estimate — pending measurement, not fabrication authority *)
minimumGridRowEstimate = -2; (* estimate — pending measurement, not fabrication authority *)
maximumGridRowEstimate = 2; (* estimate — pending measurement, not fabrication authority *)
minimumGridColumnEstimate = -2; (* estimate — pending measurement, not fabrication authority *)
maximumGridColumnEstimate = 2; (* estimate — pending measurement, not fabrication authority *)

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
    arrayMbiraGridEstimate[minimumGridRowEstimate, maximumGridRowEstimate,
     minimumGridColumnEstimate, maximumGridColumnEstimate,
     gridRowSemitoneStepEstimate, gridColumnSemitoneStepEstimate]
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
      {length, minimumTineLengthEstimate, maximumTineLengthEstimate},
      AxesLabel -> {"tine length estimate (m)",
        "frequency relationship estimate (Hz)"},
      PlotRange -> All],
     arrayMbiraGridEstimate[minimumGridRowEstimate, maximumGridRowEstimate,
      minimumGridColumnEstimate, maximumGridColumnEstimate,
      rowStepSemitones, columnStepSemitones]
     }],
   {{lengthMeters, tineLengthEstimate, "tine length estimate (m)"},
    minimumTineLengthEstimate, maximumTineLengthEstimate},
   {{widthMeters, tineWidthEstimate, "tine width estimate (m)"},
    minimumTineWidthEstimate, maximumTineWidthEstimate},
   {{thicknessMeters, tineThicknessEstimate,
     "tine thickness estimate (m)"}, minimumTineThicknessEstimate,
    maximumTineThicknessEstimate},
   {{densityKgPerM3, tineDensityEstimate,
     "tine density estimate (kg/m^3)"}, minimumTineDensityEstimate,
    maximumTineDensityEstimate},
   {{youngsModulusPa, tineYoungsModulusEstimate,
     "Young modulus estimate (Pa)"}, minimumTineYoungsModulusEstimate,
    maximumTineYoungsModulusEstimate},
   {{clampFactor, clampStiffnessFactorEstimate,
     "clamp stiffness factor estimate"}, minimumClampStiffnessFactorEstimate,
    maximumClampStiffnessFactorEstimate},
   {{tipMassKg, tipMassEstimate, "tip mass estimate (kg)"},
    minimumTipMassEstimate, maximumTipMassEstimate},
   {{rowStepSemitones, gridRowSemitoneStepEstimate,
     "row interval estimate (semitones)"}, minimumGridSemitoneStepEstimate,
    maximumGridSemitoneStepEstimate, gridSemitoneStepIncrementEstimate},
   {{columnStepSemitones, gridColumnSemitoneStepEstimate,
     "column interval estimate (semitones)"},
    minimumGridSemitoneStepEstimate, maximumGridSemitoneStepEstimate,
    gridSemitoneStepIncrementEstimate},
   SaveDefinitions -> True
   ];

arrayMbiraModel = <|
   "metadata" -> arrayMbiraMetadata,
   "nominalEstimate" -> arrayMbiraNominalEstimate,
   "explorer" -> arrayMbiraExplorer
   |>
