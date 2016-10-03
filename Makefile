# adapted from 'Atlas Make' @ https://github.com/bradoyler/atlas-make/tree/master/us-congress
# US Congressional Districts (scale:1m) http://nationalmap.gov/small_scale/mld/cgd114p.html
# Index: http://nationalmap.gov/small_scale/atlasftp.html

STATES=AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY PR VI

# 50 states + DC, PR & VI: closest thing to KeyValue pairs
AL_fips=01
AK_fips=02
AZ_fips=04
AR_fips=05
CA_fips=06
CO_fips=08
CT_fips=09
DE_fips=10
DC_fips=11
FL_fips=12
GA_fips=13
HI_fips=15
ID_fips=16
IL_fips=17
IN_fips=18
IA_fips=19
KS_fips=20
KY_fips=21
LA_fips=22
ME_fips=23
MD_fips=24
MA_fips=25
MI_fips=26
MN_fips=27
MS_fips=28
MO_fips=29
MT_fips=30
NE_fips=31
NV_fips=32
NH_fips=33
NJ_fips=34
NM_fips=35
NY_fips=36
NC_fips=37
ND_fips=38
OH_fips=39
OK_fips=40
OR_fips=41
PA_fips=42
RI_fips=44
SC_fips=45
SD_fips=46
TN_fips=47
TX_fips=48
UT_fips=49
VT_fips=50
VA_fips=51
WA_fips=53
WV_fips=54
WI_fips=55
WY_fips=56
PR_fips=72
VI_fips=78
# todo: AS,MP,GU

all: us/114th-congress.json all-states

all-states:
	for i in ${STATES} ; do make states/$$i/114th-congress.json ; done

.SECONDARY:

gz/%.tar.gz:
	mkdir -p $(dir $@)
	curl 'ftp://rockyftp.cr.usgs.gov/vdelivery/Datasets/Staged/SmallScale/Data/Boundaries/$(notdir $@)' -o $@.download
	mv $@.download $@

shp/us/114th-congress.shp: gz/cgd114p010g.shp.tar.gz

shp/us/%.shp:
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar -xzm -C $(basename $@) -f $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)

shp/%/114th-congress.shp: shp/us/114th-congress.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '${$*_fips}'" $@ $<

us/114th-congress.json: shp/us/114th-congress.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		-q 1E6 \
		-s 1E-7 \
		-p CONG_DIST,CONG_REP,PARTY_AFF,STATE,STATE_FIPS \
		--id-property=STATE_FIPS+CONG_DIST \
		-- congress=$<

### how to create custom recipe for a single state ###
states/AK/114th-congress.json: shp/AK/114th-congress.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		-q 1E6 \
		-s 1E-7 \
		-p CONG_DIST,CONG_REP,PARTY_AFF,STATE,STATE_FIPS \
		--id-property=+CONG_DIST \
		-- congress=$<

states/%/114th-congress.json: shp/%/114th-congress.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		-q 1E6 \
		-s 1E-8 \
		-p CONG_DIST,CONG_REP,PARTY_AFF,STATE,STATE_FIPS \
		--id-property=+CONG_DIST \
		-- congress=$<

##### clean targets ##########
clean-all: clean/shp

clean/%:
	rm -rf $(notdir $@)