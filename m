Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A21BC33CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 08:52:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D89A2072A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 08:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MnF41Jd0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kXx2Ru1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D89A2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDsw5ETABmRzdRgd42Q6n33GVlQzk8uUt5fWHuIgAj8=; b=MnF41Jd0I584bM
	Ioue8IgtT/U2e+Maa8vNm8nSfmOroRtmSW7zsIRPOGkDLNe2kr8NYm8al3iSkz53RKzXuVlv4tQAY
	3zJbVkSZ5IPGqy7ZB6rDHy/LFmjcgd9TvpSzWMOS/6z4EvDR4iEO1ufejRmiCH8GrML02gLJlIaG3
	EByyHK0FXrrwlVs2j/kg3PK7tl7XdVeBDvfKJTH/H+onBJ7VNcvPNeLU/VDIk4Ro9hId09ZnhMg7w
	4x4+/UHNv1W9+H3RV0fQkXHTZbiN80mIPMHoLHfvcNOD0TwBXoZpD2Ackj/ackkLWKhsbr6IAsREy
	hnQZt0HljsnxhNvkwWgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipq20-0005tX-BO; Fri, 10 Jan 2020 08:52:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipq1w-0005az-Da; Fri, 10 Jan 2020 08:52:34 +0000
X-UUID: e827c589892c432a9286efcc8396da2d-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=y/OSJpRfsXPqxj4MvMlH1zRHUOGo+E0kY4E8nZfJ6qo=; 
 b=kXx2Ru1YN0sUN/YySq3X+kpat7OrFYzLllQH+6wgzmzH0V7MKjL6r8WgOU75o/0gr2U6AXIFoAtqNG4YjWajT/LFq1puMIwenDGytSMk4stioH7UINIit8LlvwUalVjR855XK7NzmTa4kNEx338mft4i07CWbRBzyKSPtNK3DpM=;
X-UUID: e827c589892c432a9286efcc8396da2d-20200110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 441199512; Fri, 10 Jan 2020 00:52:25 -0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 00:52:23 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 10 Jan 2020 16:52:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 16:50:50 +0800
Message-ID: <1578646330.18795.4.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add mt8173 elm and hana board
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 10 Jan 2020 16:52:10 +0800
In-Reply-To: <20200110073730.213789-3-hsinyi@chromium.org>
References: <20200110073730.213789-1-hsinyi@chromium.org>
 <20200110073730.213789-3-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_005232_477260_562DD287 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Enric Balletbo i
 Serra <enric.balletbo@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-01-10 at 15:37 +0800, Hsin-Yi Wang wrote:
> Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Changes in v2:
> - remove downstream nodes and unused nodes
> - use GPIO_ACTIVE_LOW for ps8640 gpios
> - move trackpad to hana
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |    3 +
>  .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
>  .../boot/dts/mediatek/mt8173-elm-hana.dts     |   16 +
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   60 +
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   15 +
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1040 +++++++++++++++++
>  6 files changed, 1161 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 458bbc422a94..b45a45a565a1 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -6,5 +6,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> new file mode 100644
> index 000000000000..a3616bc3d859
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2019 MediaTek Inc.
> + */
> +
> +/dts-v1/;
> +#include "mt8173-elm-hana.dtsi"
> +
> +/ {
> +	model = "Mediatek Hana rev7 board";
> +	compatible = "google,hana-rev7", "mediatek,mt8173";
> +};
> +
> +&cpu_thermal {
> +	trips {
> +		cpu_crit: cpu_crit@0 {
> +			temperature = <100000>;
> +			type = "critical";
> +		};
> +	};
> +};
> +
> +&gpio_keys {
> +	/delete-node/tablet_mode;
> +	/delete-node/volume_down;
> +	/delete-node/volume_up;
> +};
> \ No newline at end of file

nit: Please add a newline at end of file for all files in this patch.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
> new file mode 100644
> index 000000000000..8cbcc75192e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2016 MediaTek Inc.
> + */
> +
> +/dts-v1/;
> +#include "mt8173-elm-hana.dtsi"
> +
> +/ {
> +	model = "Mediatek Hana rev0 board";
> +	compatible = "google,hana-rev6",
> +			"google,hana-rev5", "google,hana-rev4",
> +			"google,hana-rev3", "google,hana-rev2",
> +			"google,hana-rev1", "google,hana-rev0",
> +			"google,hana", "mediatek,mt8173";
> +};
> \ No newline at end of file

<...>

> +
> +&pwrap {
> +	pmic: mt6397 {
> +		compatible = "mediatek,mt6397";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		mt6397rtc: mt6397rtc {
> +			compatible = "mediatek,mt6397-rtc";
> +		};
> +
> +		syscfg_pctl_pmic: syscfg_pctl_pmic@c000 {
> +			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
> +				     "syscon";
> +			reg = <0 0x0000c000 0 0x0108>;
> +		};
> +
> +		pio6397: pinctrl@c000 {
> +			compatible = "mediatek,mt6397-pinctrl";
> +			pins-are-numbered;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		mt6397clock: mt6397clock {
> +			compatible = "mediatek,mt6397-clk";
> +			#clock-cells = <1>;
> +		};
> +
> +		mt6397regulator: mt6397regulator {
> +			compatible = "mediatek,mt6397-regulator";
> +
> +			mt6397_vpca15_reg: buck_vpca15 {
> +				regulator-compatible = "buck_vpca15";
> +				regulator-name = "vpca15";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +				regulator-allowed-modes = <0 1>;
> +			};
> +
> +			mt6397_vpca7_reg: buck_vpca7 {
> +				regulator-compatible = "buck_vpca7";
> +				regulator-name = "vpca7";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <115>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vsramca15_reg: buck_vsramca15 {
> +				regulator-compatible = "buck_vsramca15";
> +				regulator-name = "vsramca15";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vsramca7_reg: buck_vsramca7 {
> +				regulator-compatible = "buck_vsramca7";
> +				regulator-name = "vsramca7";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vcore_reg: buck_vcore {
> +				regulator-compatible = "buck_vcore";
> +				regulator-name = "vcore";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vgpu_reg: buck_vgpu {
> +				regulator-compatible = "buck_vgpu";
> +				regulator-name = "vgpu";
> +				regulator-min-microvolt = < 700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <115>;
> +			};
> +
> +			mt6397_vdrm_reg: buck_vdrm {
> +				regulator-compatible = "buck_vdrm";
> +				regulator-name = "vdrm";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1400000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vio18_reg: buck_vio18 {
> +				regulator-compatible = "buck_vio18";
> +				regulator-name = "vio18";
> +				regulator-min-microvolt = <1620000>;
> +				regulator-max-microvolt = <1980000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vtcxo_reg: ldo_vtcxo {
> +				regulator-compatible = "ldo_vtcxo";
> +				regulator-name = "vtcxo";
> +				regulator-always-on;
> +			};
> +
> +			mt6397_va28_reg: ldo_va28 {
> +				regulator-compatible = "ldo_va28";
> +				regulator-name = "va28";
> +			};
> +
> +			mt6397_vcama_reg: ldo_vcama {
> +				regulator-compatible = "ldo_vcama";
> +				regulator-name = "vcama";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vio28_reg: ldo_vio28 {
> +				regulator-compatible = "ldo_vio28";
> +				regulator-name = "vio28";
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vusb_reg: ldo_vusb {
> +				regulator-compatible = "ldo_vusb";
> +				regulator-name = "vusb";
> +			};
> +
> +			mt6397_vmc_reg: ldo_vmc {
> +				regulator-compatible = "ldo_vmc";
> +				regulator-name = "vmc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vmch_reg: ldo_vmch {
> +				regulator-compatible = "ldo_vmch";
> +				regulator-name = "vmch";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
> +				regulator-compatible = "ldo_vemc3v3";
> +				regulator-name = "vemc_3v3";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vgp1_reg: ldo_vgp1 {
> +				regulator-compatible = "ldo_vgp1";
> +				regulator-name = "vcamd";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <240>;
> +			};
> +
> +			mt6397_vgp2_reg: ldo_vgp2 {
> +				regulator-compatible = "ldo_vgp2";
> +				regulator-name = "vcamio";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vgp3_reg: ldo_vgp3 {
> +				regulator-compatible = "ldo_vgp3";
> +				regulator-name = "vcamaf";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vgp4_reg: ldo_vgp4 {
> +				regulator-compatible = "ldo_vgp4";
> +				regulator-name = "vgp4";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vgp5_reg: ldo_vgp5 {
> +				regulator-compatible = "ldo_vgp5";
> +				regulator-name = "vgp5";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +
> +			mt6397_vgp6_reg: ldo_vgp6 {
> +				regulator-compatible = "ldo_vgp6";
> +				regulator-name = "vgp6";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +				regulator-always-on;
> +			};
> +
> +			mt6397_vibr_reg: ldo_vibr {
> +				regulator-compatible = "ldo_vibr";
> +				regulator-name = "vibr";
> +				regulator-min-microvolt = <1300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-enable-ramp-delay = <218>;
> +			};
> +		};
> +	};
> +};
> +
> +&spi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi_pins_a>;
> +	mediatek,pad-select = <1>;
> +	status = "okay";
> +	/* clients */
> +	cros_ec: ec@0 {
> +		compatible = "google,cros-ec-spi";
> +		reg = <0x0>;
> +		spi-max-frequency = <12000000>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		google,cros-ec-spi-msg-delay = <500>;
> +
> +		i2c_tunnel: i2c-tunnel@0 {
> +			compatible = "google,cros-ec-i2c-tunnel";
> +			google,remote-bus = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			battery: sbs-battery@b {
> +				compatible = "sbs,sbs-battery";
> +				reg = <0xb>;
> +				sbs,i2c-retry-count = <2>;
> +				sbs,poll-retry-count = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&thermal {
> +	bank0-supply = <&mt6397_vpca15_reg>;
> +	bank1-supply = <&da9211_vcpu_reg>;
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&ssusb {

sorting according to name, please put this before thermal.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
