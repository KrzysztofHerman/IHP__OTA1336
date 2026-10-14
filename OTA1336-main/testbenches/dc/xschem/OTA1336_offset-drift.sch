v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 880 -1750 1680 -1350 {flags=graph
y1=0.068
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.05

divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
x2=0.05
sim_type=dc
hilight_wave=-1
legend=1
digital=0
rainbow=1
color=4
node=vout
hcursor1_y=0.59911881}
T {Calculations of the input offset temperature drift
are made using postprocessing python script} 35 -1060 0 0 0.4 0.4 {}
N 640 -930 640 -900 {
lab=vdd}
N 640 -840 640 -820 {
lab=GND}
N 1230 -960 1230 -930 {
lab=#net1}
N 1230 -870 1230 -820 {
lab=GND}
N 1430 -1020 1540 -1020 {lab=Vout}
N 1270 -980 1270 -820 {lab=GND}
N 870 -860 870 -820 {lab=GND}
N 870 -930 870 -900 {lab=#net2}
N 1010 -990 1180 -990 {lab=vm}
N 740 -930 870 -930 {lab=#net2}
N 1010 -1010 1010 -990 {lab=vm}
N 910 -990 1010 -990 {lab=vm}
N 1010 -1050 1180 -1050 {lab=vp}
N 910 -930 910 -910 {lab=#net3}
N 800 -1050 800 -990 {lab=vp}
N 1270 -820 1430 -820 {lab=GND}
N 1110 -820 1230 -820 {lab=GND}
N 1230 -820 1270 -820 {lab=GND}
N 910 -850 910 -820 {lab=GND}
N 870 -820 910 -820 {lab=GND}
N 740 -820 870 -820 {lab=GND}
N 740 -930 740 -900 {lab=#net2}
N 740 -840 740 -820 {lab=GND}
N 1430 -1020 1430 -950 {lab=Vout}
N 1350 -1020 1430 -1020 {lab=Vout}
N 1430 -890 1430 -820 {lab=GND}
N 1270 -1100 1270 -1060 {lab=vdd}
N 640 -820 740 -820 {lab=GND}
N 1110 -820 1110 -810 {lab=GND}
N 910 -820 1110 -820 {lab=GND}
N 1010 -1075 1010 -1050 {lab=vp}
N 800 -1050 1010 -1050 {lab=vp}
C {devices/code_shown.sym} 10 -1730 0 0 {name=MODEL only_toplevel=false
format="tcleval( @value )"
value="
.lib cornerCAP.lib cap_typ
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ

"}
C {launcher.sym} 920 -1270 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_offset_drift.raw dc"
}
C {title-3.sym} 0 0 0 0 {name=l16 author="IHP-GmbH 2026" title="AC simulations" rev=1.0 lock=true}
C {vsource.sym} 640 -870 0 0 {name=VDD value="DC 1.2"}
C {lab_pin.sym} 640 -930 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {gnd.sym} 1110 -810 0 0 {name=l4 lab=GND}
C {isource.sym} 1230 -900 0 0 {name=I2 value=80u}
C {lab_pin.sym} 1270 -1100 1 0 {name=p8 sig_type=std_logic lab=vdd}
C {vsource.sym} 740 -870 0 0 {name=V1 value="DC 0.0"
}
C {OTA1336.sym} 1260 -1020 0 0 {name=x3}
C {lab_pin.sym} 1540 -1020 2 0 {name=p9 sig_type=std_logic lab=Vout}
C {capa.sym} 1430 -920 0 0 {name=Cload2
m=1
value=500f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1010 -1075 0 0 {name=p1 sig_type=std_logic lab=vp}
C {lab_pin.sym} 1010 -1010 0 0 {name=p3 sig_type=std_logic lab=vm}
C {vsource.sym} 800 -960 0 0 {name=V2 value="DC 0.6"
}
C {vsource.sym} 910 -960 0 0 {name=V3 value="DC 0.6"
}
C {vcvs.sym} 910 -880 0 0 {name=E1 value=-1}
C {devices/code_shown.sym} 27.5 -1595 0 0 {name=NGSPICE1 only_toplevel=false 
value="
.control
  
  shell rm tb_offset_drift.raw
  shell rm offset_drift.csv
  let mc_runs = 10
  let run = 0
  let tm =-55
  set curplot=new          
  set scratch=$curplot    
  set appendwrite
  let voff=unitvec(mc_runs)
  
  dowhile run < mc_runs   
    reset
    options temp=$&tm
    echo $&tm
    dc V1 -50m 50m 10u
    let tm = tm + 1
    meas dc Vin_at when Vout=0.6	    
    set run = $&run   
    set plt = $curplot          
    setplot $scratch       
    let vvout\{$run\} = \{$plt\}.v(Vout)
    let voff[run]=\{$plt\}.Vin_at
    setplot $plt
    let run = run + 1
    write tb_offset_drift.raw
    end
wrdata offset_drift.csv \{$scratch\}.voff
.endc
"}
