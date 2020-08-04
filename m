Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1FDC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE68207FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeL0Zu4Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Gq6MX+KB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE68207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JJ6v0Rz8OC24D2bUcBhJu19G8LBcyyRuQYOah7USEUQ=; b=qeL0Zu4ZaWwWt2YNKcvwOBw3Z
	Pi488+ynAIxbRE401G7iwHQOAyHo2Z5TA+Kc5chzmJz2fpNUPJkWt9ofilngCe2dSainKkAW7EeTM
	kDyZWy6fa6ABBdnY7xDnVOM0FRPChk2f3m0SkdTxVpuFtemccfNgzGcXywSn+/CK4YkRvMIGeh8Pt
	Tx16D/Vk9oOXgF7StN2XMdxSEZYDDTVUfl4B4OlooruY71i4RAPQwTiq34xX8h22euNxn7GRZTFPl
	R5EGDROTuFZOUk6cJUqzC7tYei8hcwooe0zQ3dQXPY/n48Xq0heFrXd/UT+Z0pRxTSpuVgOn8NJ6i
	S8u5dwD9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30FD-0004z2-9N; Tue, 04 Aug 2020 16:56:55 +0000
Received: from mxwww.masterlogin.de ([95.129.51.220])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30EZ-0004hj-VE; Tue, 04 Aug 2020 16:56:19 +0000
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 371FC96151;
 Tue,  4 Aug 2020 16:56:14 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id F387C402F8;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzBGcZ+vbk/R/lBHASsN4TX5ORmNe1ddeJtTwA/FqeQ=;
 b=Gq6MX+KBgiiOpWed/9+P5b9/A42SGpHYsGVvQsoGrwaPFtLH5bnRUhhLLQP+WHiCCM41bD
 XgLiJCcPFzYhRW1WCQrnBZiDDkDl1uE6a6LK12YaF2Nwtw+UVtOU4KN5/hluX4jcLU+0Td
 glhUUMByuOrh70iLyah+2oMLObkswGY=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2DEFF3603C2;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem related device
 nodes
Date: Tue,  4 Aug 2020 18:55:55 +0200
Message-Id: <20200804165555.75159-8-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_125616_302676_A4E7C2B5 
X-CRM114-Status: GOOD (  11.63  )
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
changed
v3->v4:
  drop display_components which is duplicate of existing mmsys
v2->v3:
  drop bls to dpi routing
---
 arch/arm/boot/dts/mt7623.dtsi                 | 170 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  72 ++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  72 ++++++++
 3 files changed, 314 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a106c0d90a52..f2cb44a69454 100644
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
@@ -766,6 +812,77 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};
 
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
@@ -778,6 +895,44 @@ larb0: larb@14010000 {
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
@@ -1102,6 +1257,21 @@ pins-cir {
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
index 2b760f90f38c..b1c83e919015 100644
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
@@ -114,10 +127,18 @@ memory@80000000 {
 	};
 };
 
+&bls {
+	status = "okay";
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
@@ -128,6 +149,21 @@ &crypto {
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
+	};
+};
+
 &eth {
 	status = "okay";
 
@@ -199,6 +235,42 @@ fixed-link {
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
index 0447748f9fa0..7e3ded7d9e7d 100644
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
@@ -106,10 +119,18 @@ sound {
 	};
 };
 
+&bls {
+	status = "okay";
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
@@ -120,6 +141,21 @@ &crypto {
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
+	};
+};
+
 &eth {
 	status = "okay";
 
@@ -203,6 +239,42 @@ fixed-link {
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
