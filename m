Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D66BC433F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACEE2065E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqpf2WP8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Q52Y0Aru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ACEE2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3nST4AP7LCmtRqedaqVsVRiiqywmPOTSE7oWn2dUKV4=; b=mqpf2WP8umBufnckzsaDlXM3W
	jgQPL4ULGTjgk3RDd7Vsml4Iglit+k3b7qxQ+z7mGIjOWi6uYnRCJ5ZIzeLCaQ3iyRmJO1ytDFbGt
	Sq7slzi50XFsi6u78dW5CYJKvistt1AblOw5QGZkosmHiIIJgpAlsb1mGB9Ne5H8VdzlB5d2pt5ka
	2G+416UrwCQEIQEr0vNVlqHDTtU1NUl+6U8oKOR+BSWb2MzE5ffqCzRVcyMl7UB4YreNvGkBtK/IF
	X4v652DzBTLKgp5bjaeindm8/T7W9T1BvI70nbMNSXAxZUOOU7mD5w66QdYcLWiAACyOcRiTaHVve
	iOo2uo+Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Ndk-00008Z-8Y; Tue, 28 Jul 2020 11:19:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Ndh-00006W-VZ; Tue, 28 Jul 2020 11:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935106;
 bh=V7oRKHspT8bz+DCILEYZfiQBm7br8j1f9O+VvLDkf7E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q52Y0ArufaHdGsvzQc6TVQd17WvUyhEJVwOgPL1IEMRxhdjZ37kcUnVq0NPMBygSG
 2rVHnJ6uvioXiAthij60xJMezf0kjbiuvCm0SyzQC0KNqU29V7inFkEBX8qYpqqra/
 6XXno87WG0G9S72b4XENCLSAFXY7pAyNBI2W+qoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M6DWi-1k6zKz3r9k-006bqj; Tue, 28 Jul 2020 13:18:26 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/5] arm: dts: mt7623: add display subsystem related device
 nodes
Date: Tue, 28 Jul 2020 13:18:00 +0200
Message-Id: <20200728111800.77641-6-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728111800.77641-1-frank-w@public-files.de>
References: <20200728111800.77641-1-frank-w@public-files.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BrlD/lpiH2E3b3b7Becre33Vm8cjszLu/2SD+JYKvyLrs5fZW/h
 kxbCfpXSSlfEGZq5VpCGShfMXv+iVQQrIS+V1wEWHld/I4s8vtt4eOH50aDDgHcCvvIaARD
 zs/xJX53X4i7mv4Z/kKkAHbUeuiuw+y9ghx5nAB+bWxcAhobOFAyeCnYuKlqj9b3XHZz+zR
 /TEOY+Q/bnB/CIVfl1BSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BVkf93G43zQ=:KlzLPO/jav59S0ROnmbWdv
 qZWHge+631AY1hLkzCEDpyVRaslLskbkWkOFFyJ6JJtit8q28u7snKMzvL03kONKuBWw7Ldpw
 CPbxKc3jNNRDqa0du4cEmhQ+Bhqs9iOx/dx5JZtqqaZZq4zURIEn10wMu1SYExKjHxoNFiVnv
 ARW6WjjuLTLOpMCn/vspTIP/iS8dTFB2HS8fouc9qpaWg/myGF1YmZbTSf1sOqqJ4vYNWSYCW
 0gKgSrWmRE/MdoAKi9Evix27o4MrlBoYuktf9axtfhY9XGBkpToJKEugrmKMolpZEp4fTy67h
 zTBCaknBukuJsMB8qEbx0pQ8Ev7tAuaTu3GyaniPnKgHVK7mUwi5SkTtRkcemRW6XRKeWhtaV
 QDGOpm3vpYO/z+TNBTdndhnMzt4CpXBvQnYyjkiHnpmxLAalsdPLYkyZj35jZebBOgZmCDtBg
 F8KcXCLa5PFcJ/AXuF0vilcgW5VuIdGHZHNFdz8N9NduHtko28asnIAVlTZ7n5OyiJylQ198T
 +xVfsz+1A01pgsChCnEk7EMcIahM+tIf+kshw5bL67FqWGcZh6367Gu880ZmMC/32OhDB0Ect
 CSs4csPuDua8YARxIgQ08hNPlSbL9x5Gz2ACNGXJJD/iclqEno8jZOCNZJWqc35heCG8w2Gns
 hw5ULkmT/rcDX+yDVCjfyREOMbK1/V+KEnE9JxdByx0i5tth3Trq5r0+Hy6PpVz/o7TFl0USz
 ei6uGXXWfICmt1sUT/sigRuKdHtZaqPQIEp51kcq2KgAaIAk1jiZ/cqCh0ZjfvOLV0jt5d5Nf
 9pT9SiRuAbjXewY3sC2kMTaz5oxCo67Wb7AW14OskS8hlFiyRiZn6XhzpBOBRzkeVM4sOPblZ
 xlTMTfJUT8xkTVyFUrNT+jZNCoMrcM5b3FNkw5rY6+aMNxuy6QlxqY8gtNLuR/HPqGIqdQmLY
 Goj011R+v4liOhPjjMnIRV7Ba+69qR+WhCbs0FB9vUfbuBPZKkBbXv1o75Ix+mZXVtLHPLVWf
 s4d9C3c8Y1E2G2d+8w1oHdeP+yA57jpSJH2nn2M6Avi3v6vZLnmLp6WdFrSbDD9w4b7jgp4xI
 nsXu9RMTgbxLqA0Scf1FGriQZCkoygGZ33cYK1yHWgR7JPMff/sorpBIag679U760a8zDj8tY
 mLAwBKb3de1DrDbwOucFRTiUmvOyCsepmAjrkpZkOoNplLJd5WV3AcC1oPzvSaJzR0DYqPYJs
 wxgIc/9ZWTEYqoQYD9g9qJRxQygJovuh94LVDYQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_071922_339756_DD709865 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

Add display subsystem related device nodes for MT7623.

Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623.dtsi                 | 177 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  85 +++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  85 +++++++++
 3 files changed, 347 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a106c0d90a52..d584a3d678ba 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -24,6 +24,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;

+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -321,6 +326,25 @@ pwrap: pwrap@1000d000 {
 		clock-names = "spi", "wrap";
 	};

+	mipi_tx0: mipi-dphy@10010000 {
+		compatible = "mediatek,mt7623-mipi-tx",
+			     "mediatek,mt2701-mipi-tx";
+		reg = <0 0x10010000 0 0x90>;
+		clocks = <&clk26m>;
+		clock-output-names = "mipi_tx0_pll";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+	};
+
+	cec: cec@10012000 {
+		compatible = "mediatek,mt7623-cec",
+			     "mediatek,mt8173-cec";
+		reg = <0 0x10012000 0 0xbc>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_CEC>;
+		status = "disabled";
+	};
+
 	cir: cir@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
@@ -369,6 +393,18 @@ apmixedsys: syscon@10209000 {
 		#clock-cells = <1>;
 	};

+	hdmi_phy: phy@10209100 {
+		compatible = "mediatek,mt7623-hdmi-phy",
+			     "mediatek,mt2701-hdmi-phy";
+		reg = <0 0x10209100 0 0x24>;
+		clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+		clock-names = "pll_ref";
+		clock-output-names = "hdmitx_dig_cts";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	rng: rng@1020f000 {
 		compatible = "mediatek,mt7623-rng";
 		reg = <0 0x1020f000 0 0x1000>;
@@ -568,6 +604,16 @@ bch: ecc@1100e000 {
 		status = "disabled";
 	};

+	hdmiddc0: i2c@11013000 {
+		compatible = "mediatek,mt7623-hdmi-ddc",
+			     "mediatek,mt8173-hdmi-ddc";
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0 0x11013000 0 0x1C>;
+		clocks = <&pericfg CLK_PERI_I2C3>;
+		clock-names = "ddc-i2c";
+		status = "disabled";
+	};
+
 	nor_flash: spi@11014000 {
 		compatible = "mediatek,mt7623-nor",
 			     "mediatek,mt8173-nor";
@@ -766,6 +812,84 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};

+	display_components: dispsys@14000000 {
+		compatible = "mediatek,mt7623-mmsys",
+			     "mediatek,mt2701-mmsys";
+		reg = <0 0x14000000 0 0x1000>;
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
+	ovl@14007000 {
+		compatible = "mediatek,mt7623-disp-ovl",
+			     "mediatek,mt2701-disp-ovl";
+		reg = <0 0x14007000 0 0x1000>;
+		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_OVL>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14008000 0 0x1000>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	wdma@14009000 {
+		compatible = "mediatek,mt7623-disp-wdma",
+			     "mediatek,mt2701-disp-wdma";
+		reg = <0 0x14009000 0 0x1000>;
+		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_WDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	bls: pwm@1400a000 {
+		compatible = "mediatek,mt7623-disp-pwm",
+			     "mediatek,mt2701-disp-pwm";
+		reg = <0 0x1400a000 0 0x1000>;
+		#pwm-cells = <2>;
+		clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
+			 <&mmsys CLK_MM_DISP_BLS>;
+		clock-names = "main", "mm";
+		status = "disabled";
+	};
+
+	color@1400b000 {
+		compatible = "mediatek,mt7623-disp-color",
+			     "mediatek,mt2701-disp-color";
+		reg = <0 0x1400b000 0 0x1000>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi: dsi@1400c000 {
+		compatible = "mediatek,mt7623-dsi",
+			     "mediatek,mt2701-dsi";
+		reg = <0 0x1400c000 0 0x1000>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DSI_ENGINE>,
+			 <&mmsys CLK_MM_DSI_DIG>,
+			 <&mipi_tx0>;
+		clock-names = "engine", "digital", "hs";
+		phys = <&mipi_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
+
+	mutex: mutex@1400e000 {
+		compatible = "mediatek,mt7623-disp-mutex",
+			     "mediatek,mt2701-disp-mutex";
+		reg = <0 0x1400e000 0 0x1000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt7623-smi-larb",
 			     "mediatek,mt2701-smi-larb";
@@ -778,6 +902,44 @@ larb0: larb@14010000 {
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};

+	rdma1: rdma@14012000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14012000 0 0x1000>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb = <&larb0>;
+	};
+
+	dpi0: dpi@14014000 {
+		compatible = "mediatek,mt7623-dpi",
+			     "mediatek,mt2701-dpi";
+		reg = <0 0x14014000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DPI1_DIGL>,
+			 <&mmsys CLK_MM_DPI1_ENGINE>,
+			 <&apmixedsys CLK_APMIXED_TVDPLL>;
+		clock-names = "pixel", "engine", "pll";
+		status = "disabled";
+	};
+
+	hdmi0: hdmi@14015000 {
+		compatible = "mediatek,mt7623-hdmi",
+			     "mediatek,mt8173-hdmi";
+		reg = <0 0x14015000 0 0x400>;
+		clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+			 <&mmsys CLK_MM_HDMI_PLL>,
+			 <&mmsys CLK_MM_HDMI_AUDIO>,
+			 <&mmsys CLK_MM_HDMI_SPDIF>;
+		clock-names = "pixel", "pll", "bclk", "spdif";
+		phys = <&hdmi_phy>;
+		phy-names = "hdmi";
+		mediatek,syscon-hdmi = <&mmsys 0x900>;
+		cec = <&cec>;
+		status = "disabled";
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt7623-imgsys",
 			     "mediatek,mt2701-imgsys",
@@ -1102,6 +1264,21 @@ pins-cir {
 		};
 	};

+	hdmi_pins_a: hdmi-default {
+		pins-hdmi {
+			pinmux = <MT7623_PIN_123_HTPLG_FUNC_HTPLG>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	hdmi_ddc_pins_a: hdmi_ddc-default {
+		pins-hdmi-ddc {
+			pinmux = <MT7623_PIN_124_GPIO124_FUNC_HDMISCK>,
+				 <MT7623_PIN_125_GPIO125_FUNC_HDMISD>;
+		};
+	};
+
 	i2c0_pins_a: i2c0-default {
 		pins-i2c0 {
 			pinmux = <MT7623_PIN_75_SDA0_FUNC_SDA0>,
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f90f38c..7a1763472018 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -21,6 +21,19 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};

+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+		ddc-i2c-bus = <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply = <&mt6323_vproc_reg>;
@@ -114,10 +127,24 @@ memory@80000000 {
 	};
 };

+&bls {
+	status = "okay";
+
+	port {
+		bls_out: endpoint {
+			remote-endpoint = <&dpi0_in>;
+		};
+	};
+};
+
 &btif {
 	status = "okay";
 };

+&cec {
+	status = "okay";
+};
+
 &cir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cir_pins_a>;
@@ -128,6 +155,28 @@ &crypto {
 	status = "okay";
 };

+&dpi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			dpi0_out: endpoint {
+				remote-endpoint = <&hdmi0_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dpi0_in: endpoint {
+				remote-endpoint = <&bls_out>;
+			};
+		};
+	};
+};
+
 &eth {
 	status = "okay";

@@ -199,6 +248,42 @@ fixed-link {
 	};
 };

+&hdmi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins_a>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint = <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_ddc_pins_a>;
+	status = "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias = <0xa>;
+	mediatek,ibias_up = <0x1c>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins_a>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 0447748f9fa0..c86807a676fc 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -24,6 +24,19 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};

+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+		ddc-i2c-bus = <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply = <&mt6323_vproc_reg>;
@@ -106,10 +119,24 @@ sound {
 	};
 };

+&bls {
+	status = "okay";
+
+	port {
+		bls_out: endpoint {
+			remote-endpoint = <&dpi0_in>;
+		};
+	};
+};
+
 &btif {
 	status = "okay";
 };

+&cec {
+	status = "okay";
+};
+
 &cir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cir_pins_a>;
@@ -120,6 +147,28 @@ &crypto {
 	status = "okay";
 };

+&dpi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			dpi0_out: endpoint {
+				remote-endpoint = <&hdmi0_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dpi0_in: endpoint {
+				remote-endpoint = <&bls_out>;
+			};
+		};
+	};
+};
+
 &eth {
 	status = "okay";

@@ -203,6 +252,42 @@ fixed-link {
 	};
 };

+&hdmi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins_a>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint = <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_ddc_pins_a>;
+	status = "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias = <0xa>;
+	mediatek,ibias_up = <0x1c>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins_a>;
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
