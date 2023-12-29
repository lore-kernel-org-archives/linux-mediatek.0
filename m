Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C683C46CD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P67FAbYgYiwNxp7OFTRw42rLTF9X3i2GMJZApqfKWc=; b=ygtML/7KUGPyGi6wp3GSX/38Su
	5Ufvvcwgng5w+u2ZkmlgUe4nfQCZT1Vp7jmGowyZoD/Gl+UB8bU/1obZG86ccy7yVo3Cmbf0vitT3
	TRKn1xGNN98nGEOmB+1DXPilwOit4JA9karmCxB/JrT+WpnACPC4dB6CmMvVcuE/7iob37LdNARj0
	JxPwIRrWVWoofEEFDKiny+uTOCIdO6J9TUAVQtnd9Yg73eNQYM0hM6k13f4wvF2CPQu4h8UfBURrf
	vSTCWwIh4nAE6xwRy2jTRrAMb79OTtkg4V73CTxJDzh5oF9kyMdpO6lc774UCGFPcHTsnfgXxqjyA
	oPE7bctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ7kq-000PZe-14;
	Fri, 29 Dec 2023 07:58:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ7ke-000PWg-1x;
	Fri, 29 Dec 2023 07:57:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40d4103aed7so81581335e9.3;
        Thu, 28 Dec 2023 23:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703836670; x=1704441470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P67FAbYgYiwNxp7OFTRw42rLTF9X3i2GMJZApqfKWc=;
        b=EDpvp3POhOqiWnFGrqeYEpaMg8cPIAryOAd0DFEzwYrU16g0ccKH8bmDpqc76tar7M
         HTWh43Kcj5/2F2dUxy820762o/xgwvBrzujHASYi7FGM6ooQJZ80Q20S5fWLGOP1zzQe
         YZG37f51EuE9Fih/f1lSBZwPklUlPigm7ubTDJPbh1tduADM2fIwZGih0yK80LB3F6LB
         lsITVzwys6TpfJXZD0k+4NFcFxbiOnEOKrFbnAlJCTAyYP0pSqYTO8lGncOur9FjCVoh
         h4kiJlYSnvqnArgrnTuOcjzzDtkjvuHglZJKyjYZmm9PLoMox6QRAmLliAAGtet2DMuC
         MpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703836670; x=1704441470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P67FAbYgYiwNxp7OFTRw42rLTF9X3i2GMJZApqfKWc=;
        b=KS/fsOA9ZouFXbh2FMOGaIhIkiZtpqjqhccf8tw+B2ZhRFXw7+zCQwzRE/qa5h4Mu2
         4+NfrocB8FXwY6gcTByWTXYvPvwL4GYpX1QPbiijVNE3Ampm2j17NjxywpQTkyDUzFJ+
         +1N7QI0S4Erg4bkK3z4KK/bkm3yV25fpVZW2vWm3WrlajSXtO0RpiaTFOief8vlHjPRv
         ibtcRmXg7BKpn+NKk2y4FhNH0Y5GaOPNeNgSzPFHUCqbASDpWskH4UXsfbs20z2kVwS3
         xjr7aI2S3+a+0Qh17b8IUzfjx1c+LrpD3HyUtlYCm0mm63y0Or87rgi5jUS9vZSbu16f
         nPNw==
X-Gm-Message-State: AOJu0YxAyG1L9WqGxgqmOhDJJA2TiBqReg+giq91JCt/WVcq1XQN5ayU
	jJYNDcSorVPEHPjeZQ0HVZY=
X-Google-Smtp-Source: AGHT+IEwDq9rzaVHewB/ph/t8AJ7nJZtNx1u0xpKOQX5/AkLLUa2D36QF/PcMWY6bhsR20lfw6g8dQ==
X-Received: by 2002:a05:600c:2d84:b0:40b:5e59:ccb3 with SMTP id i4-20020a05600c2d8400b0040b5e59ccb3mr5746648wmg.148.1703836669989;
        Thu, 28 Dec 2023 23:57:49 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id wh13-20020a170906fd0d00b00a2684d2e684sm8120865ejb.92.2023.12.28.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 23:57:49 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7986: reorder nodes
Date: Fri, 29 Dec 2023 08:57:39 +0100
Message-Id: <20231229075739.8328-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231229075739.8328-1-zajec5@gmail.com>
References: <20231229075739.8328-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_235752_642963_09CCEB89 
X-CRM114-Status: GOOD (  12.63  )
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

Use order described as preferred in DTS Coding Style:
1. Sort bus nodes by unit address
2. Use alpha-numerical order for the rest

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 118 +++++++++++-----------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 23feeff881de..a0f28b9ada18 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -16,13 +16,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	clk40m: oscillator-40m {
-		compatible = "fixed-clock";
-		clock-frequency = <40000000>;
-		#clock-cells = <0>;
-		clock-output-names = "clkxtal";
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -59,6 +52,13 @@ cpu3: cpu@3 {
 		};
 	};
 
+	clk40m: oscillator-40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		#clock-cells = <0>;
+		clock-output-names = "clkxtal";
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -121,15 +121,6 @@ wo_boot: wo-boot@15194000 {
 
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -202,6 +193,20 @@ pio: pinctrl@1001f000 {
 			#interrupt-cells = <2>;
 		};
 
+		pwm: pwm@10048000 {
+			compatible = "mediatek,mt7986-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			#clock-cells = <1>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_PWM_SEL>,
+				 <&infracfg CLK_INFRA_PWM_STA>,
+				 <&infracfg CLK_INFRA_PWM1_CK>,
+				 <&infracfg CLK_INFRA_PWM2_CK>;
+			clock-names = "top", "main", "pwm1", "pwm2";
+			status = "disabled";
+		};
+
 		sgmiisys0: syscon@10060000 {
 			compatible = "mediatek,mt7986-sgmiisys_0",
 				     "syscon";
@@ -240,20 +245,6 @@ crypto: crypto@10320000 {
 			status = "disabled";
 		};
 
-		pwm: pwm@10048000 {
-			compatible = "mediatek,mt7986-pwm";
-			reg = <0 0x10048000 0 0x1000>;
-			#clock-cells = <1>;
-			#pwm-cells = <2>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&topckgen CLK_TOP_PWM_SEL>,
-				 <&infracfg CLK_INFRA_PWM_STA>,
-				 <&infracfg CLK_INFRA_PWM1_CK>,
-				 <&infracfg CLK_INFRA_PWM2_CK>;
-			clock-names = "top", "main", "pwm1", "pwm2";
-			status = "disabled";
-		};
-
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7986-uart",
 				     "mediatek,mt6577-uart";
@@ -337,6 +328,21 @@ spi1: spi@1100b000 {
 			status = "disabled";
 		};
 
+		thermal: thermal@1100c800 {
+			compatible = "mediatek,mt7986-thermal";
+			reg = <0 0x1100c800 0 0x800>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_THERM_CK>,
+				 <&infracfg CLK_INFRA_ADC_26M_CK>,
+				 <&infracfg CLK_INFRA_ADC_FRC_CK>;
+			clock-names = "therm", "auxadc", "adc_32k";
+			nvmem-cells = <&thermal_calibration>;
+			nvmem-cell-names = "calibration-data";
+			#thermal-sensor-cells = <1>;
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
+		};
+
 		auxadc: adc@1100d000 {
 			compatible = "mediatek,mt7986-auxadc";
 			reg = <0 0x1100d000 0 0x1000>;
@@ -388,21 +394,6 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
-		thermal: thermal@1100c800 {
-			compatible = "mediatek,mt7986-thermal";
-			reg = <0 0x1100c800 0 0x800>;
-			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&infracfg CLK_INFRA_THERM_CK>,
-				 <&infracfg CLK_INFRA_ADC_26M_CK>,
-				 <&infracfg CLK_INFRA_ADC_FRC_CK>;
-			clock-names = "therm", "auxadc", "adc_32k";
-			nvmem-cells = <&thermal_calibration>;
-			nvmem-cell-names = "calibration-data";
-			#thermal-sensor-cells = <1>;
-			mediatek,auxadc = <&auxadc>;
-			mediatek,apmixedsys = <&apmixedsys>;
-		};
-
 		pcie: pcie@11280000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
@@ -534,20 +525,6 @@ wed1: wed@15011000 {
 			mediatek,wo-ccif = <&wo_ccif1>;
 		};
 
-		wo_ccif0: syscon@151a5000 {
-			compatible = "mediatek,mt7986-wo-ccif", "syscon";
-			reg = <0 0x151a5000 0 0x1000>;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		wo_ccif1: syscon@151ad000 {
-			compatible = "mediatek,mt7986-wo-ccif", "syscon";
-			reg = <0 0x151ad000 0 0x1000>;
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		eth: ethernet@15100000 {
 			compatible = "mediatek,mt7986-eth";
 			reg = <0 0x15100000 0 0x80000>;
@@ -590,6 +567,20 @@ eth: ethernet@15100000 {
 			status = "disabled";
 		};
 
+		wo_ccif0: syscon@151a5000 {
+			compatible = "mediatek,mt7986-wo-ccif", "syscon";
+			reg = <0 0x151a5000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wo_ccif1: syscon@151ad000 {
+			compatible = "mediatek,mt7986-wo-ccif", "syscon";
+			reg = <0 0x151ad000 0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		wifi: wifi@18000000 {
 			compatible = "mediatek,mt7986-wmac";
 			reg = <0 0x18000000 0 0x1000000>,
@@ -647,4 +638,13 @@ cpu_trip_active_low: active-low {
 			};
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
 };
-- 
2.35.3


