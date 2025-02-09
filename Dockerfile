FROM debian:stable

RUN apt-get update && \
  apt-get install -y build-essential clang git curl msitools \
  gcc-arm-none-eabi binutils-arm-none-eabi

RUN curl -L 'https://content.vexrobotics.com/vexcode/v5code/VEXcodeProV5_2_0_6.msi' -o vex.msi && \
  msiextract vex.msi && \
  mv 'Program Files/VEX Robotics/VEXcode Pro V5/sdk' /sdk

ENV VEX_SDK_PATH=/sdk

COPY --chmod=777 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
