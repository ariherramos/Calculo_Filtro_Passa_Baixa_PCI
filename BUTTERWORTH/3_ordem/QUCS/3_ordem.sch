<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1124,800,0.683013,0,0>
  <Grid=10,10,1>
  <DataSet=3_ordem.dat>
  <DataDisplay=3_ordem.dpl>
  <OpenDisplay=1>
  <Script=3_ordem.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Título>
  <FrameText1=Desenhado por:>
  <FrameText2=Data:>
  <FrameText3=Revisão:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Pac P1 1 40 130 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 40 160 0 0 0 0>
  <Pac P2 1 770 130 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 770 160 0 0 0 0>
  <Eqn Eqn1 1 910 100 -28 15 0 0 "S21_dB=dB(S[2,1])" 1 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <.SP SP1 1 230 270 0 71 0 0 "lin" 1 "0 Hz" 1 "3 GHz" 1 "3000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <SUBST Subst1 1 610 290 -30 24 0 0 "4.1" 1 "1.5306 mm" 1 "34.7 um" 1 "2e-2" 1 "0.022e-6" 1 "0.15e-6" 1>
  <Pac P3 1 80 630 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 80 660 0 0 0 0>
  <Pac P4 1 490 630 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0>
  <GND * 1 490 660 0 0 0 0>
  <Eqn Eqn2 1 740 580 -28 15 0 0 "S43_dB=dB(S[4,3])" 1 "S33_dB=dB(S[3,3])" 1 "yes" 0>
  <GND * 1 200 690 0 0 0 0>
  <GND * 1 400 700 0 0 0 0>
  <L L1 1 300 580 -26 10 0 0 "15.9 nH" 1 "" 0>
  <C C3 1 200 630 17 -26 0 1 "3.18 pF" 1 "" 0 "neutral" 0>
  <C C2 1 400 630 17 -26 0 1 "3.18 pF" 1 "" 0 "neutral" 0>
  <MLIN MS4 1 170 90 -26 15 0 0 "Subst1" 1 "3.1 mm" 1 "4 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS5 1 650 90 -26 15 0 0 "Subst1" 1 "3.1 mm" 1 "4 mm" 1 "Hammerstad" 0 "Hammerstad" 0 "26.85" 0>
  <MLIN MS3 1 410 90 -26 15 0 0 "Subst1" 1 "0.5 mm" 1 "25.6mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS1 1 290 90 -26 15 0 0 "Subst1" 1 "20 mm" 1 "6 mm" 1 "Hammerstad" 0 "Hammerstad" 0 "26.85" 0>
  <MLIN MS2 1 530 90 -26 15 0 0 "Subst1" 1 "20 mm" 1 "6 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
</Components>
<Wires>
  <320 90 380 90 "" 0 0 0 "">
  <440 90 500 90 "" 0 0 0 "">
  <200 90 260 90 "" 0 0 0 "">
  <40 90 40 100 "" 0 0 0 "">
  <40 90 140 90 "" 0 0 0 "">
  <560 90 620 90 "" 0 0 0 "">
  <770 90 770 100 "" 0 0 0 "">
  <680 90 770 90 "" 0 0 0 "">
  <80 580 80 600 "" 0 0 0 "">
  <80 580 200 580 "" 0 0 0 "">
  <490 580 490 600 "" 0 0 0 "">
  <330 580 400 580 "" 0 0 0 "">
  <400 580 490 580 "" 0 0 0 "">
  <400 580 400 600 "" 0 0 0 "">
  <200 580 270 580 "" 0 0 0 "">
  <200 580 200 600 "" 0 0 0 "">
  <200 660 200 690 "" 0 0 0 "">
  <400 660 400 700 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
