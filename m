Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A63C46CD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aC/jqfThqXUSI51sfHhy0CvTGG4B4LNXIBP7bVGM1r0=; b=zRhjxfJx2MY2tSK9pbEVLEFM5m
	oH0ntodnFbGIUqejgpbxLARCzUZl4PzB0ls9rJOyFCiqAZMNB4cIEdmFJ20xG/GgQpdEzb8V+Otfn
	OIV8ZglXzdW4D6EYzYComvQ+BrN6brSocK7x/nrfM2n5k136Qpvw0VQAm4q3VrFjUkWh4H5gSVAeP
	cbGUy+kwlqdwnxl2DUhFKxi3DpF/rN9/1X6IcL71c1gAu1dkL8ZBJalkSOEHRe9nkp/ec8Z/wW7Tg
	iEVp6E2yo9+HWnUUVbnwWcJnIjnyIrYkQ6dkBD6+87dRUebCDDyGxvRA7LgQXan4AMQX0k9CSm9ry
	Id1hUMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ7kh-000PXv-0d;
	Fri, 29 Dec 2023 07:57:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ7kd-000PWc-0V;
	Fri, 29 Dec 2023 07:57:52 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a2343c31c4bso756222266b.1;
        Thu, 28 Dec 2023 23:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703836668; x=1704441468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aC/jqfThqXUSI51sfHhy0CvTGG4B4LNXIBP7bVGM1r0=;
        b=fUKDurfPrDWXvhN5qjOL9vmQXnh3Ln2uXEsdO71JL6/X2gbEKu+YDeouWnrL6HPGEw
         T4BwboHudDWITCnnyAdEu0ecgxOb8yfhM1pikJ07Xo2h5aX1342dO1wjMVIMaKiGLTZv
         1bJqnKDlMUu56vNUcuWGQVNQSK/0FeiEuSTfgn17p7xGaeFuiVenk1kznsJzFmNj9+42
         DHli5hgW/0Adc3Mge3A1uusWZ4dwSHirXH0f35d0egeOYqV7U0jKAF815jrxG8q4c8ix
         vH/ePjcCzT/FG56KYqzcgX6pTFzHOII1OCD1wdBwFZUNDukmolQPw+szi4qJXGgneE1R
         srvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703836668; x=1704441468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aC/jqfThqXUSI51sfHhy0CvTGG4B4LNXIBP7bVGM1r0=;
        b=vqhmhT2RNzoXsAckWgWLiZrNrHNfupHwS/yDxTc0eBIf0pjRm2I9KwoGvJmTwImGLx
         C/FjkVAKHHoNpHU+LDfTSSiCKFpAeNSKQL4FU08ohPi+whr7gKaMIWdB5z6yPgNOJq62
         MA/mxyCfyhGS+QPiPo+fCzSs3K1TrQjZanSB001FRmZWUKTuEiNoJJs1NkPyGk96HSWh
         dXXCkFfd2Yt184PJvQC8kiB79ltScF6nu+vuFvw0VzXmAI1CfoQNPe6vvW17U50FKKHZ
         ODAeVLKdeDL9eSqWksNJjhShK9WGoIp7Vq45rUugXM3nPx0KuvX0n5EnwsW5dtekuVxk
         j/vA==
X-Gm-Message-State: AOJu0Ywafm4XkPyppqQAOtm5dkzfg6J0UQngLTNZXpK8XF888oVLp4hz
	SOAfhJvO/ErGLsLSIVxepRM=
X-Google-Smtp-Source: AGHT+IHrAtN7LZkNf03QOXG8GL5AdPbgF5/rBKk+hdBcHgXDuq6+YX9HC4AtU5B+mXYXn+wbY/N6zw==
X-Received: by 2002:a17:906:519a:b0:a27:7cc5:425d with SMTP id y26-20020a170906519a00b00a277cc5425dmr401094ejk.52.1703836668210;
        Thu, 28 Dec 2023 23:57:48 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id wh13-20020a170906fd0d00b00a2684d2e684sm8120865ejb.92.2023.12.28.23.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 23:57:47 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7986: reorder properties
Date: Fri, 29 Dec 2023 08:57:38 +0100
Message-Id: <20231229075739.8328-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_235751_198203_80C18245 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Use order described as preferred in DTS Coding Style. Mostly just move
"compatible", "reg" and "ranges" properties. In two nodes also move
vendor-prefixed props down.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 67 ++++++++++++-----------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index fc751e049953..23feeff881de 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -27,34 +27,34 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		cpu0: cpu@0 {
-			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
 			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
-			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
 			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
-			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x2>;
+			device_type = "cpu";
+			enable-method = "psci";
 			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
-			device_type = "cpu";
-			enable-method = "psci";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
+			device_type = "cpu";
+			enable-method = "psci";
 			#cooling-cells = <2>;
 		};
 	};
@@ -131,22 +131,22 @@ timer {
 	};
 
 	soc {
-		#address-cells = <2>;
-		#size-cells = <2>;
 		compatible = "simple-bus";
 		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
 
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			interrupt-parent = <&gic>;
-			interrupt-controller;
 			reg = <0 0x0c000000 0 0x10000>,  /* GICD */
 			      <0 0x0c080000 0 0x80000>,  /* GICR */
 			      <0 0x0c400000 0 0x2000>,   /* GICC */
 			      <0 0x0c410000 0 0x1000>,   /* GICH */
 			      <0 0x0c420000 0 0x2000>;   /* GICV */
+			interrupt-parent = <&gic>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
 		};
 
 		infracfg: infracfg@10001000 {
@@ -311,9 +311,9 @@ i2c0: i2c@11008000 {
 
 		spi0: spi@1100a000 {
 			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100a000 0 0x100>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0 0x1100a000 0 0x100>;
 			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_MPLL_D2>,
 				 <&topckgen CLK_TOP_SPI_SEL>,
@@ -325,9 +325,9 @@ spi0: spi@1100a000 {
 
 		spi1: spi@1100b000 {
 			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100b000 0 0x100>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0 0x1100b000 0 0x100>;
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_MPLL_D2>,
 				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
@@ -389,7 +389,6 @@ mmc0: mmc@11230000 {
 		};
 
 		thermal: thermal@1100c800 {
-			#thermal-sensor-cells = <1>;
 			compatible = "mediatek,mt7986-thermal";
 			reg = <0 0x1100c800 0 0x800>;
 			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
@@ -397,30 +396,30 @@ thermal: thermal@1100c800 {
 				 <&infracfg CLK_INFRA_ADC_26M_CK>,
 				 <&infracfg CLK_INFRA_ADC_FRC_CK>;
 			clock-names = "therm", "auxadc", "adc_32k";
-			mediatek,auxadc = <&auxadc>;
-			mediatek,apmixedsys = <&apmixedsys>;
 			nvmem-cells = <&thermal_calibration>;
 			nvmem-cell-names = "calibration-data";
+			#thermal-sensor-cells = <1>;
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
 		};
 
 		pcie: pcie@11280000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
+			reg = <0x00 0x11280000 0x00 0x4000>;
+			reg-names = "pcie-mac";
+			ranges = <0x82000000 0x00 0x20000000 0x00
+				  0x20000000 0x00 0x10000000>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			reg = <0x00 0x11280000 0x00 0x4000>;
-			reg-names = "pcie-mac";
 			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
 			bus-range = <0x00 0xff>;
-			ranges = <0x82000000 0x00 0x20000000 0x00
-				  0x20000000 0x00 0x10000000>;
 			clocks = <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
 				 <&infracfg CLK_INFRA_IPCIE_CK>,
 				 <&infracfg CLK_INFRA_IPCIER_CK>,
 				 <&infracfg CLK_INFRA_IPCIEB_CK>;
 			clock-names = "pl_250m", "tl_26m", "peri_26m", "top_133m";
-			status = "disabled";
 
 			phys = <&pcie_port PHY_TYPE_PCIE>;
 			phy-names = "pcie-phy";
@@ -431,6 +430,8 @@ pcie: pcie@11280000 {
 					<0 0 0 2 &pcie_intc 1>,
 					<0 0 0 3 &pcie_intc 2>,
 					<0 0 0 4 &pcie_intc 3>;
+			status = "disabled";
+
 			pcie_intc: interrupt-controller {
 				#address-cells = <0>;
 				#interrupt-cells = <1>;
@@ -441,9 +442,9 @@ pcie_intc: interrupt-controller {
 		pcie_phy: t-phy {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
+			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
 			status = "disabled";
 
 			pcie_port: pcie-phy@11c00000 {
@@ -468,9 +469,9 @@ thermal_calibration: calib@274 {
 		usb_phy: t-phy@11e10000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
+			ranges = <0 0 0x11e10000 0x1700>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0 0x11e10000 0x1700>;
 			status = "disabled";
 
 			u2port0: usb-phy@0 {
@@ -498,11 +499,11 @@ u2port1: usb-phy@1000 {
 		};
 
 		ethsys: syscon@15000000 {
-			 #address-cells = <1>;
-			 #size-cells = <1>;
 			 compatible = "mediatek,mt7986-ethsys",
 				      "syscon";
 			 reg = <0 0x15000000 0 0x1000>;
+			 #address-cells = <1>;
+			 #size-cells = <1>;
 			 #clock-cells = <1>;
 			 #reset-cells = <1>;
 		};
@@ -579,26 +580,26 @@ eth: ethernet@15100000 {
 					  <&topckgen CLK_TOP_SGM_325M_SEL>;
 			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
 						 <&apmixedsys CLK_APMIXED_SGMPLL>;
+			#reset-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			mediatek,ethsys = <&ethsys>;
 			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
 			mediatek,wed-pcie = <&wed_pcie>;
 			mediatek,wed = <&wed0>, <&wed1>;
-			#reset-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 		};
 
 		wifi: wifi@18000000 {
 			compatible = "mediatek,mt7986-wmac";
+			reg = <0 0x18000000 0 0x1000000>,
+			      <0 0x10003000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>;
 			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
 			reset-names = "consys";
 			clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
 				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
 			clock-names = "mcu", "ap2conn";
-			reg = <0 0x18000000 0 0x1000000>,
-			      <0 0x10003000 0 0x1000>,
-			      <0 0x11d10000 0 0x1000>;
 			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.35.3


