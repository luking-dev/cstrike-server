FROM cajuclc/cstrike-docker:latest

ARG metamod_version=1.20
ARG amxmod_version=1.8.2

ENV CSTRIKE="${HOMEDIR}/cstrike"
ENV PORT="27015"
ENV MAP="de_dust2"
ENV MAXPLAYERS="16"
ENV SV_LAN="0"

RUN ./steamcmd.sh +login anonymous +force_install_dir ../cstrike +app_update 90 validate +quit || :
RUN ./steamcmd.sh +login anonymous +force_install_dir ../cstrike +app_update 70 validate +quit || :
RUN ./steamcmd.sh +login anonymous +force_install_dir ../cstrike +app_update 10 validate +quit || :

WORKDIR ${CSTRIKE}
USER steam

COPY files/steam_appid.txt steam_appid.txt

# Add maps
COPY maps/maps/ cstrike/maps/
COPY maps/gfx/ cstrike/gfx/
COPY maps/overviews/ cstrike/overviews/
COPY maps/sound/ cstrike/sound/
COPY maps/sprites/ cstrike/sprites/
COPY files/mapcycle.txt cstrike/mapcycle.txt

# Add default config
COPY files/cfgs/server.cfg cstrike/server.cfg

# Install metamod
RUN mkdir -p cstrike/addons/metamod/dlls
RUN curl -sqL "http://prdownloads.sourceforge.net/metamod/metamod-$metamod_version-linux.tar.gz?download" | tar -C cstrike/addons/metamod/dlls -zxvf -
COPY files/liblist.gam cstrike/liblist.gam
# Remove this line if you aren't going to install/use amxmodx, dproto and podbot
COPY files/plugins.ini cstrike/addons/metamod/plugins.ini

# Install dproto
RUN mkdir -p cstrike/addons/dproto
COPY files/dproto_i386.so cstrike/addons/dproto/dproto_i386.so
COPY files/cfgs/dproto.cfg cstrike/dproto.cfg

# Install AMX mod X
RUN curl -sqL "http://www.amxmodx.org/release/amxmodx-$amxmod_version-base-linux.tar.gz" | tar -C cstrike/ -zxvf -
RUN curl -sqL "http://www.amxmodx.org/release/amxmodx-$amxmod_version-cstrike-linux.tar.gz" | tar -C cstrike/ -zxvf -
COPY files/maps.ini cstrike/addons/amxmodx/configs/maps.ini

# Install Bots (podbot)
RUN mkdir -p cstrike/addons/podbot
COPY podbot cstrike/addons/podbot

ENTRYPOINT ["./hlds_run", "-game", "cstrike", "-strictportbind", "-ip", "0.0.0.0", "-port", "${PORT}", "+sv_lan", "${SV_LAN}", "+map", "${MAP}", "-maxplayers", "${MAXPLAYERS}"]