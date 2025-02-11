cwlVersion: v1.2
class: Workflow

requirements:
  InlineJavascriptRequirement: {}
  ScatterFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
  SubworkflowFeatureRequirement: {}
inputs:

  readU_1: File
  readU_2: File
  bacteria_ids: File
  kraken_res_dir: Directory
  threads: int

outputs:
  krakenNB_res:
    type: File
    outputSource: pre-viromeV2/krakenNB_res
  readNB_1:
    type: File
    outputSource: pre-viromeV2/readNB_1
  readNB_2: 
    type: File
    outputSource: pre-viromeV2/readNB_2
  count:
    type: File
    outputSource: pre-viromeV2/count

steps:
  pre-viromeV2:
    run: cwl/preViromeV2.cwl
    in:
      read_1: readU_1
      read_2: readU_2
      threads: threads
      bacteria_ids: bacteria_ids
      kraken_res_dir: kraken_res_dir
    out: [readNB_1, readNB_2,count,krakenNB_res]
