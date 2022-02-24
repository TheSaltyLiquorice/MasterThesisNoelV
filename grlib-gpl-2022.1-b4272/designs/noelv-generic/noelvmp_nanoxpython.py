# NanoXPython script for synthesis,place,route and generation of bitstream
import os
import sys
from os import path
from nxmap import *
dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append(dir)
project=createProject(dir)
project.load('noelvmp_native.nym')
if not project.synthesize():
    sys.exit(1)
project.save('noelvmp_synthesized.nym')

if not project.place():
    sys.exit(1)
project.save('noelvmp_placed.nym')

if not path.exists(dir + '/noelvmp_pads.py'):
    project.savePorts('noelvmp_generated_pads.py')

if not project.route():
    sys.exit(1)
project.save('noelvmp_routed.nym')

#Reports
project.reportInstances()

#Analyzer
analyzer = project.createAnalyzer()
analyzer.launch()

#Generate Bitstream
project.generateBitstream('noelvmp_bitfile.nxb')

project.destroy()
