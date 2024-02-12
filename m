Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADF2C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IaPhTAEYUwdytg2N6Sa0MXZmbVZReaezPPENwmQqlE=; b=seAKU9kFahNAYGdSocvgJdBmOi
	8SpcOOHHpltP+XrAJiw9fO7odpMDaqxqDw/D8NJ8YB72C/eKGeiQ1F/4bF6qZZ9zBPupVmo9BwiQe
	h0qUWVJw6GIR+Bhm/vWisfuRHV41yruwRvpoIt2e/SPkp1ciK2azm+tNNSAG/de1j2v+GImrz3zEO
	Svh2+NG5BYkwfY9sQAR5ice+87gmFL7tYEyi5hp6HVd6KkkSn3KSP2V5Bj7pxd09S7xkeAejIr0mS
	SOUJwKaucOZ0BDx2FAqzQdENIquDE0LB1fRWA8LqEbelnHt0PXilxLyympTb6A1LF1J1B4vzZDWY/
	aGlV7G8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVF8-00000005Eyg-1ANo;
	Mon, 12 Feb 2024 12:17:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVF4-00000005Evr-2QK1;
	Mon, 12 Feb 2024 12:16:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a271a28aeb4so388932166b.2;
        Mon, 12 Feb 2024 04:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740216; x=1708345016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IaPhTAEYUwdytg2N6Sa0MXZmbVZReaezPPENwmQqlE=;
        b=Z76g6K7Q/pjkHn2IArEhPpyKIPSuPKW+YDP3FjeXN9Yl1UydI4+yFqan1eURjaIN7H
         14fdY9hi8Cg2/qDv7/szD1wgfNZ8apLLGsv0oCRyhdux9liZaLPmWrAuRjy6VHEhSQ3R
         k7VUHIZ0h6K0UjbEYmflpqFViLplUm9Y+CEJLBvFecSBFk5kMcvBncLfd1vt6htCOrfn
         bdDOrWhXPaezjIY9eiQeMy5oAOEAsnfTNf8gEzGnK/iia1G/pGJTc4dLypnyx0RA3cs+
         7jmQVgTrxNPEzjHBi5B6QMObHMX21ZXlvKpk5znbvt69D66oLiszzguELmVulHo2Tl57
         WzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740216; x=1708345016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IaPhTAEYUwdytg2N6Sa0MXZmbVZReaezPPENwmQqlE=;
        b=iWEvmOpurzTNhyxuLhVgjecaol+2qOkAEquCJ6Q+tdY+XNk20pS4TKkNRZMCxFIKJZ
         i9GPiWj7RhyL8kHH/yPzyjR3CYWXv5enofrIxx0x8WjpIdAoD1fjSTOf7dotRDIjAbYo
         INBhPgd0AGBZYZLgjIu57mrMkjLuqcJcF+CSAuhPEziRwTuYbjMtFGT0tOGK3WFGwfzW
         MgUJ/D6PPab6GWY2M5wBRWA52M4nJUqX+lmE+8G7cNDrV8xj+1Ad5ZRPYkea1ss9z5Nb
         mdiWBXDr/Z3Rv6lfzdEqmAWfY/ttUU19vzItP53gaFZovlyCkdrKLsw9phDvtjQHEBQz
         uzkw==
X-Forwarded-Encrypted: i=1; AJvYcCVLumm6bUcyQ6ITFrHSUoo2/iOKzceW20fkzv901Lw6JSSg4a32Fr2oCrQL/jQPmU2pNuJAtFHj42ufrZW0fOlIoCsXac2A0gepSRo3YkQ19vNlcswrbIOz8t1MwQE8cVtpMLA98R1tedZso47Uwfenh+cOoNglG9c=
X-Gm-Message-State: AOJu0YwRQkeoXB7D+M4xt9TW1DE9lDu7TaoS/x0zQwH5INGWUbkEw1MG
	+dZOK0KRakh/ttlRS3LLsqT29OvTBhwJdGq532h3HwauSMv5dPZY
X-Google-Smtp-Source: AGHT+IFTYempM7Llg0ES1sfr764RUYvl6IJ/3B9RjZklli4cu2kA60IZeQFuOhSpINiVoL+uXeU7LA==
X-Received: by 2002:a17:906:a3c5:b0:a3c:c980:5936 with SMTP id ca5-20020a170906a3c500b00a3cc9805936mr983262ejb.24.1707740215771;
        Mon, 12 Feb 2024 04:16:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOmnULA95O1M00mJG4OJhDdKkHROKCiWco/KyAfP1fR5XQuGe6aAIJBcZiKKbvIbgKBQ2xasPQuJXnXXgS0vQPHPKDEUyc2GdOLvynRPzPuSR09LSz7zrmu7AANX6seN6s58J08AmGX/QTixOkrdquNqZ8SGEFZw1/stE+D8vG7zPRaXfpzZ9gMVPaK2g1P+ZhO99Viq1Q9Ci/VuESvNEQlliTfktF8phE9wCLve5X76n2gafNA46+TDsfoao4YNz9WqNfcsOUOIxaH5NFpnCYtRFfaA64YSF34s+Lkc1mzZtZ2+PXktnEpHr2yljiaWerQ181CxQhwhqW11VcJe2PSVG0MmAeWg==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lu1-20020a170906fac100b00a3c97e49bc9sm147850ejb.218.2024.02.12.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:16:55 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH REBASED 1/2] arm64: dts: mediatek: mt7986: reorder properties
Date: Mon, 12 Feb 2024 13:16:19 +0100
Message-Id: <20240212121620.15035-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041658_649383_1A9F09DE 
X-CRM114-Status: GOOD (  11.62  )
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
index d974739eae1c..eba5e27a1bbe 100644
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
@@ -310,9 +310,9 @@ i2c0: i2c@11008000 {
 
 		spi0: spi@1100a000 {
 			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100a000 0 0x100>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0 0x1100a000 0 0x100>;
 			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_MPLL_D2>,
 				 <&topckgen CLK_TOP_SPI_SEL>,
@@ -324,9 +324,9 @@ spi0: spi@1100a000 {
 
 		spi1: spi@1100b000 {
 			compatible = "mediatek,mt7986-spi-ipm", "mediatek,spi-ipm";
+			reg = <0 0x1100b000 0 0x100>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0 0x1100b000 0 0x100>;
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&topckgen CLK_TOP_MPLL_D2>,
 				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
@@ -388,7 +388,6 @@ mmc0: mmc@11230000 {
 		};
 
 		thermal: thermal@1100c800 {
-			#thermal-sensor-cells = <1>;
 			compatible = "mediatek,mt7986-thermal";
 			reg = <0 0x1100c800 0 0x800>;
 			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
@@ -396,30 +395,30 @@ thermal: thermal@1100c800 {
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
@@ -430,6 +429,8 @@ pcie: pcie@11280000 {
 					<0 0 0 2 &pcie_intc 1>,
 					<0 0 0 3 &pcie_intc 2>,
 					<0 0 0 4 &pcie_intc 3>;
+			status = "disabled";
+
 			pcie_intc: interrupt-controller {
 				#address-cells = <0>;
 				#interrupt-cells = <1>;
@@ -440,9 +441,9 @@ pcie_intc: interrupt-controller {
 		pcie_phy: t-phy {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
+			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
 			status = "disabled";
 
 			pcie_port: pcie-phy@11c00000 {
@@ -467,9 +468,9 @@ thermal_calibration: calib@274 {
 		usb_phy: t-phy@11e10000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
+			ranges = <0 0 0x11e10000 0x1700>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0 0x11e10000 0x1700>;
 			status = "disabled";
 
 			u2port0: usb-phy@0 {
@@ -497,11 +498,11 @@ u2port1: usb-phy@1000 {
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
@@ -578,26 +579,26 @@ eth: ethernet@15100000 {
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


