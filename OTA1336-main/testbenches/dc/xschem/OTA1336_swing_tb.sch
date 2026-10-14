v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 880 -1750 1680 -1350 {flags=graph
y1=-0.018
y2=0.15
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
x2=1.2
sim_type=dc
hilight_wave=-1
color=6
node=diff
legend=1
digital=0
rainbow=0}
N 80 -1050 80 -1020 {
lab=vp}
N 310 -1050 310 -1020 {
lab=vdd}
N 310 -960 310 -940 {
lab=GND}
N 190 -940 310 -940 {
lab=GND}
N 190 -940 190 -920 {
lab=GND}
N 80 -940 190 -940 {
lab=GND}
N 80 -960 80 -940 {
lab=GND}
N 610 -900 610 -870 {
lab=#net1}
N 610 -810 610 -790 {
lab=GND}
N 650 -1130 650 -1000 {
lab=vdd}
N 420 -990 560 -990 {
lab=vp}
N 760 -960 920 -960 {lab=Vout}
N 650 -920 650 -870 {lab=GND}
N 810 -900 810 -880 {
lab=GND}
N 485 -930 560 -930 {lab=Vout}
N 485 -930 485 -745 {lab=Vout}
N 485 -745 760 -745 {lab=Vout}
N 760 -960 760 -745 {lab=Vout}
N 730 -960 760 -960 {lab=Vout}
C {vsource.sym} 80 -990 0 0 {name=V1 value="DC 0.6 AC 1 0"
}
C {vsource.sym} 310 -990 0 0 {name=VDD value="DC 1.2"}
C {gnd.sym} 190 -920 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 310 -1050 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 80 -1050 0 0 {name=p3 sig_type=std_logic lab=vp}
C {devices/code_shown.sym} 10 -1730 0 0 {name=MODEL only_toplevel=false
format="tcleval( @value )"
value="
.lib cornerCAP.lib cap_typ
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
"}
C {devices/code_shown.sym} 20 -1610 0 0 {name=NGSPICE only_toplevel=false 
value="
.control
save all
dc V1 0.0 1.2 100u
let diff=vout-vp
write tb_OTA_dc.raw
.endc
"}
C {launcher.sym} 930 -1310 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_OTA_dc.raw dc"
}
C {gnd.sym} 650 -870 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 420 -990 0 0 {name=p11 sig_type=std_logic lab=vp}
C {isource.sym} 610 -840 0 0 {name=I2 value=80u}
C {gnd.sym} 610 -790 0 0 {name=l11 lab=GND}
C {lab_pin.sym} 650 -1130 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {OTA1336.sym} 640 -960 0 0 {name=x3}
C {title-3.sym} 0 0 0 0 {name=l16 author="IHP-GmbH 2026" title="AC simulations" rev=1.0 lock=true}
C {lab_pin.sym} 920 -960 2 0 {name=p9 sig_type=std_logic lab=Vout}
C {capa.sym} 810 -930 0 0 {name=Cload2
m=1
value=500f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 810 -880 0 0 {name=l2 lab=GND}
