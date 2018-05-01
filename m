From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [RFC 06/11] arm64: dts: mediatek: Add Elm Rev. 3 device tree
Date: Tue, 01 May 2018 10:00:43 +0200
Message-ID: <de15feb98f78539234d4947fe134d1c9f3e1ee2b.camel@paulk.fr>
References: <1506690553-27357-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1506690553-27357-7-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1508316574.13340.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6639029939759361242=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508316574.13340.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: jacopo@jmondi.org, magnus.damm@gmail.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============6639029939759361242==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NNs47EJfg1PPe0rELooX"


--=-NNs47EJfg1PPe0rELooX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 18 octobre 2017 =C3=A0 16:49 +0800, Yingjoe Chen a =C3=A9crit :
> Hi,
>=20
>=20
> On Fri, 2017-09-29 at 15:09 +0200, Ulrich Hecht wrote:
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile            |    1 +
> >  arch/arm64/boot/dts/mediatek/mt8173-elm-rev3.dts |   21 +
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     |  210 +++++
> >  arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi     | 1014
> > ++++++++++++++++++++++
> >  4 files changed, 1246 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-rev3.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index 151723b..0521e29 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm-rev3.dtb
> > =20
> >  always		:=3D $(dtb-y)
> >  subdir-y	:=3D $(dts-dirs)
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-rev3.dts
> > b/arch/arm64/boot/dts/mediatek/mt8173-elm-rev3.dts
> > new file mode 100644
> > index 0000000..68d4095
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-rev3.dts
> > @@ -0,0 +1,21 @@
> > +/*
> > + * Copyright 2016 MediaTek Inc.
> > + * Author: Eddie Huang <eddie.huang@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License version 2
> > as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt8173-elm.dtsi"
> > +
> > +/ {
> > +	model =3D "Mediatek Elm rev3 board";
> > +	compatible =3D "google,elm-rev3", "google,elm",
> > "mediatek,mt8173";
> > +};

When mainlining ARM Chromium OS devices, it seems that per-revision dts
files are often dropped and merged into a single-revision dts for the
whole device. This is perhaps because the early revisions of the devices
are for internal development and never make it to the market.

Also, I would suggest using an explicit model name instead of copying
the compatible. Here, that would be "Chromebook R13 CB5-312T".

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > new file mode 100644
> > index 0000000..850037f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -0,0 +1,210 @@
> > +/*
> > + * Copyright 2016 MediaTek Inc.
> > + * Author: Eddie Huang <eddie.huang@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License version 2
> > as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include "mt8173-oak.dtsi"
> > +
> > +/ {
> > +	hdmicon: connector {
> > +		compatible =3D "hdmi-connector";
> > +		label =3D "hdmi";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_connector_in: endpoint {
> > +				remote-endpoint =3D
> > <&hdmi_mux_out_hdmi>;
> > +			};
> > +		};
> > +	};
> > +
> > +	hdmi_mux: hdmi_mux {
> > +		compatible =3D "gpio-display-mux";
>=20
> Where is the binding for this?
>=20
> > +		status =3D "okay";
> > +		detect-gpios =3D <&pio 36 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&hdmi_mux_pins>;
>=20
>=20
> If you use gpio_request or related api, it will set pinmux
> automatically.
> Do we really need this pinctrl?
>=20
> > +		ddc-i2c-bus =3D <&hdmiddc0>;
> > +
> > +		ports {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			port@0 { /* input */
> > +				reg =3D <0>;
> > +
> > +				hdmi_mux_in: endpoint {
> > +					remote-endpoint =3D
> > <&hdmi0_out>;
> > +				};
> > +			};
> > +
> > +			port@1 { /* output */
> > +				reg =3D <1>;
> > +
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				hdmi_mux_out_anx: endpoint@0 {
> > +					reg =3D <0>;
> > +					remote-endpoint =3D
> > <&anx7688_in>;
> > +				};
> > +
> > +				hdmi_mux_out_hdmi: endpoint@1 {
> > +					reg =3D <1>;
> > +					remote-endpoint =3D
> > <&hdmi_connector_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	sound: sound {
> > +		compatible =3D "mediatek,mt8173-rt5650";
> > +		mediatek,audio-codec =3D <&rt5650 &hdmi0>;
> > +		mediatek,mclk =3D <1>;
> > +		mediatek,platform =3D <&afe>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&aud_i2s2>;
> > +		codec-capture {
> > +			sound-dai =3D <&rt5650 1>;
> > +		};
> > +	};
> > +};
> > +
> > +&aud_i2s2 {
> > +	pins1 {
> > +		pinmux =3D <MT8173_PIN_128_I2S0_LRCK__FUNC_I2S1_WS>,
> > +			 <MT8173_PIN_129_I2S0_BCK__FUNC_I2S1_BCK>,
> > +			 <MT8173_PIN_130_I2S0_MCK__FUNC_I2S1_MCK>,
> > +			 <MT8173_PIN_131_I2S0_DATA0__FUNC_I2S1_DO_1
> > >,
> > +			 <MT8173_PIN_12_EINT12__FUNC_I2S2_WS>,
> > +			 <MT8173_PIN_13_EINT13__FUNC_I2S2_BCK>,
> > +			 <MT8173_PIN_132_I2S0_DATA1__FUNC_I2S2_DI_2
> > >;
> > +		bias-pull-down;
> > +	};
> > +};
> > +
> > +&cpu_thermal {
> > +	sustainable-power =3D <4500>; /* milliwatts */
> > +	trips {
> > +		threshold: trip-point@0 {
> > +			temperature =3D <60000>;
> > +		};
> > +
> > +		target: trip-point@1 {
> > +			temperature =3D <65000>;
> > +		};
> > +	};
> > +};
> > +
> > +&cros_ec {
> > +	i2c_tunnel_b: i2c-tunnel@1 {
> > +		compatible =3D "google,cros-ec-i2c-tunnel";
> > +		google,remote-bus =3D <1>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		anx7688: anx7688@2c {
> > +			compatible =3D "analogix,anx7688";
> > +			status =3D "okay";
> > +			reg =3D <0x2c>;
> > +
> > +			port {
> > +				anx7688_in: endpoint {
> > +					remote-endpoint =3D
> > <&hdmi_mux_out_anx>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&hdmi0 {
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		port@1 {
> > +			reg =3D <1>;
> > +			hdmi0_out: endpoint {
> > +				remote-endpoint =3D <&hdmi_mux_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&hdmi_phy {
> > +	status =3D "okay";
> > +	mediatek,ibias =3D <0xc>;
> > +};
> > +
> > +&i2c0 {
> > +	ps8640: edp-bridge@8 {
> > +		compatible =3D "parade,ps8640";
>=20
> binding?
>=20
> > +		reg =3D <0x8>;
> > +		sleep-gpios =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios =3D <&pio 115 GPIO_ACTIVE_HIGH>;
> > +		mode-sel-gpios =3D <&pio 92 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&ps8640_pins>;
>=20
> same here.
> Please check all pinctrl nodes that set FUNC to GPIO in this patch.
>=20
> > +		vdd12-supply =3D <&ps8640_fixed_1v2>;
> > +		vdd33-supply =3D <&mt6397_vgp2_reg>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		port@0 {
> > +			reg =3D <0>;
> > +
> > +			ps8640_in: endpoint {
> > +				remote-endpoint =3D <&dsi0_out>;
> > +			};
> > +		};
> > +
> > +		port@1 {
> > +			reg =3D <1>;
> > +
> > +			ps8640_out: endpoint {
> > +				remote-endpoint =3D <&panel_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&gpio_keys {
> > +	lid {
> > +		gpios =3D <&pio 69 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +&mt6397_vgp6_reg {
> > +	regulator-always-on;
> > +};
> > +
> > +&pio {
> > +	hdmi_mux_pins: hdmi_mux_pins {
> > +		pins1 {
> > +			pinmux =3D
> > <MT8173_PIN_36_DAISYNC__FUNC_GPIO36>;
> > +		};
> > +	};
> > +};
> > +
> > +&ps8640_fixed_1v2 {
> > +	regulator-enable-ramp-delay =3D <2000>;
> > +};
> > +
> > +&rt5650 {
> > +	#sound-dai-cells =3D <1>;
> > +	realtek,dmic1-data-pin =3D <2>;
> > +	realtek,jd-mode =3D <2>;
> > +};
> > +
> > +
> > +&trackpad {
> > +	vcc-supply =3D <&mt6397_vgp6_reg>;
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi
> > new file mode 100644
> > index 0000000..33a5b07
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi
> > @@ -0,0 +1,1014 @@
> > +/*
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License version 2
> > as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "mt8173.dtsi"
> > +#include "mt8173-pinfunc.h"
> > +
> > +/ {
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0 0x40000000 0 0x80000000>;
> > +	};
> > +
> > +	backlight_lcd: backlight_lcd {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm0 0 1000000>;
> > +		brightness-levels =3D <
> > +			  0  16  32  48  64  80  96 112
> > +			128 144 160 176 192 208 224 240
> > +			255
> > +		>;
> > +		default-brightness-level =3D <9>;
> > +		power-supply =3D <&bl_fixed_reg>;
> > +		enable-gpios =3D <&pio 95 GPIO_ACTIVE_HIGH>;
> > +
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&disp_pwm0_pins>;
> > +		status =3D "okay";
> > +	};
> > +
> > +	bl_fixed_reg: fixedregulator@2 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "bl_fixed";
> > +		regulator-min-microvolt =3D <1800000>;
> > +		regulator-max-microvolt =3D <1800000>;
> > +		startup-delay-us =3D <1000>;
> > +		enable-active-high;
> > +		gpio =3D <&pio 32 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&bl_fixed_pins>;
> > +	};
> > +
> > +	chosen {
> > +		linux,stdout-path =3D &uart0;
> > +	};
> > +
> > +	firmware {
> > +		chromeos {
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&chromeos_write_protect>;
> > +			write-protect-gpio =3D <&pio 4
> > GPIO_ACTIVE_LOW>;
> > +		};
> > +	};
> > +
> > +	gpio_keys: gpio-keys {
> > +		compatible =3D "gpio-keys";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&gpio_keys_pins>;
> > +
> > +		lid {
> > +			label =3D "Lid";
> > +			gpios =3D <&pio 12 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <0>; /* SW_LID */
> > +			linux,input-type =3D <5>; /* EV_SW */
> > +			gpio-key,wakeup;
> > +		};
> > +
> > +		power {
> > +			label =3D "Power";
> > +			gpios =3D <&pio 14 GPIO_ACTIVE_HIGH>;
> > +			linux,code =3D <KEY_POWER>;
> > +			debounce-interval =3D <30>;
> > +			gpio-key,wakeup;
> > +		};
> > +
> > +		tablet_mode {
> > +			label =3D "Tablet_mode";
> > +			gpios =3D <&pio 121 GPIO_ACTIVE_HIGH>;
> > +			linux,code =3D <1>; /* SW_TABLET_MODE */
> > +			linux,input-type =3D <5>; /* EV_SW */
> > +			gpio-key,wakeup;
> > +		};
> > +
> > +		volume_down {
> > +			label =3D "Volume_down";
> > +			gpios =3D <&pio 123 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <KEY_VOLUMEDOWN>;
> > +		};
> > +
> > +		volume_up {
> > +			label =3D "Volume_up";
> > +			gpios =3D <&pio 124 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <KEY_VOLUMEUP>;
> > +		};
> > +	};
> > +
> > +	panel: panel {
> > +		compatible =3D "lg,lp120up1";
> > +		power-supply =3D <&panel_fixed_3v3>;
> > +		ddc-i2c-bus =3D <&i2c4>;
> > +		backlight =3D <&backlight_lcd>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint =3D <&ps8640_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	panel_fixed_3v3: regulator@1 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "PANEL_3V3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		enable-active-high;
> > +		gpio =3D <&pio 41 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&panel_fixed_pins>;
> > +	};
> > +
> > +	ps8640_fixed_1v2: regulator@2 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "PS8640_1V2";
> > +		regulator-min-microvolt =3D <1200000>;
> > +		regulator-max-microvolt =3D <1200000>;
> > +		enable-active-high;
> > +		regulator-boot-on;
> > +		gpio =3D <&pio 30 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&ps8640_fixed_pins>;
> > +	};
> > +
> > +	sdio_fixed_3v3: fixedregulator@0 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "3V3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		gpio =3D <&pio 85 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	usb_p1_vbus: regulator@3 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "usb_vbus";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		gpio =3D <&pio 130 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	usb_p0_vbus: regulator@4 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vbus";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		gpio =3D <&pio 9 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +};
> > +
> > +&cec {
> > +	status =3D "okay";
> > +};
> > +
> > +&cpu0 {
> > +	proc-supply =3D <&mt6397_vpca15_reg>;
> > +};
> > +
> > +&cpu1 {
> > +	proc-supply =3D <&mt6397_vpca15_reg>;
> > +};
> > +
> > +&cpu2 {
> > +	proc-supply =3D <&da9211_vcpu_reg>;
> > +	sram-supply =3D <&mt6397_vsramca7_reg>;
> > +};
> > +
> > +&cpu3 {
> > +	proc-supply =3D <&da9211_vcpu_reg>;
> > +	sram-supply =3D <&mt6397_vsramca7_reg>;
> > +};
> > +
> > +&cpu_thermal {
> > +	sustainable-power =3D <5000>; /* milliwatts */
> > +};
> > +
> > +&dsi0 {
> > +	status =3D "okay";
> > +	ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		port@1 {
> > +			reg =3D <1>;
> > +
> > +			dsi0_out: endpoint {
> > +				remote-endpoint =3D <&ps8640_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dpi0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_phy {
> > +	status =3D "okay";
> > +	mediatek,ibias =3D <0x3f>;
> > +};
> > +
> > +&i2c0 {
> > +	status =3D "okay";
> > +
> > +	rt5650: audio-codec@1a {
> > +		compatible =3D "realtek,rt5650";
> > +		reg =3D <0x1a>;
> > +		avdd-supply =3D <&mt6397_vgp1_reg>;
> > +		cpvdd-supply =3D <&mt6397_vcama_reg>;
> > +		interrupt-parent =3D <&pio>;
> > +		interrupts =3D <3 IRQ_TYPE_EDGE_BOTH>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&rt5650_irq>;
> > +		realtek,jd-mode =3D <3>;
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	clock-frequency =3D <1500000>;
> > +	status =3D "okay";
> > +
> > +	da9211: da9211@68 {
> > +		compatible =3D "dlg,da9211";
> > +		reg =3D <0x68>;
> > +
> > +		regulators {
> > +			da9211_vcpu_reg: BUCKA {
> > +				regulator-name =3D "VBUCKA";
> > +				regulator-min-microvolt =3D <
> > 700000>;
> > +				regulator-max-microvolt =3D
> > <1310000>;
> > +				regulator-min-microamp  =3D
> > <2000000>;
> > +				regulator-max-microamp  =3D
> > <4400000>;
> > +				regulator-ramp-delay =3D <10000>;
> > +				regulator-always-on;
> > +/*				regulator-supported-modes =3D
> > +					<REGULATOR_OPERATION_MODE_F
> > AST
> > +					 REGULATOR_OPERATION_MODE_N
> > ORMAL>;*/
>=20
> Please remove unused code.
> Same for all comment out parts in this patch.
>=20
>=20
> Joe.C
>=20
>=20
>=20
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
--=20
Paul Kocialkowski,

developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-NNs47EJfg1PPe0rELooX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlroHqsACgkQhP3B6o/u
lQyDIA/+Nk4I+s3AV8wOy5Fu82fjrmec53mPgDUCTsmbd/0SeDqH9js0nATPHKpZ
fMAFiJ5wuDuIw7YHe7WJS/KvW+jJPN4kC8Re8vrzWsGsCjyJTM+n9AKsUOwr0cEx
VbIwu0E0ZnJsY+E5o6TCR+S1QWk4d/H/NlMjB/ASneIPtUaQELsbW5+cF0RTUj2A
vvivWbbMsPqQRvh0dxZf4g1HIyxZxqjHjaSX3b9CtpZj585WBlgBnncFxjY9X5gF
/JMKv3Y6ZDIETgsKisDXbvi6HuQvGzWkssrXwOOmyA5DOvcvpa/FfFVd/U1Sg2iK
XPhqUNaIswdKIPIWGqdxpdrOQJf1FKTI0M8Xp7Kju6G358zSD12YWTAxTOC3khU8
BFaD/HoOah5Qlb9XqGLOkTVf7YyVEzm2DfIVrnAVm8Y8MHLmuhuE5f5mE9D5l2zh
MbhIbG0uXHyaQi+ZL0f42mTBriNZC3S1dPspAdxm3q0XGS24Xn5pZCgl3As72UM+
6S+z+9emsDJ0ALFd7fekFGa92ytQcO3Q5slWd4OiZ2IimabPAC2249ZDNXu3+8yd
31cFSgBLuzChAPawmTD+t9TlEKZicwyvmAutWPcDKFzJSGm8p3mCn498JMGa25K3
Ub9WI/I9Dda9NINU8glffOoenT1uxHfokq/Os37Ie8NLtZyU3fM=
=2ctw
-----END PGP SIGNATURE-----

--=-NNs47EJfg1PPe0rELooX--



--===============6639029939759361242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6639029939759361242==--
