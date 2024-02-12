Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11EC4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXgBeJ/zS0L0k9t0dD78NVfQ3/+/ikaDrZipKP3SKjI=; b=u3PAw/pZPavCyTvqsPwR+ZUN5V
	LKcA3MNQPEeJAZ3YINT4l1oItgBSipHwGUa2x4sVE9tD0ATAgOhuW37RPpj/LqgokOJB/vBOb+7Yd
	wIYOb6yOoA9HDT9FK2b8VcCH9xZVal1cSvcqoy7Bt6JR20RqX52kpsWOfoQNAEex/wBu/5mceDN5D
	FzeRsXyjs/f3gAx2JSaocyTGWhK8t9fIt23nXMB8RB56rZMb3gIG8KnIxBTidZ14HsSPj11VcUflW
	ItEx9hcP4db1MGVy0YVff5fLXSnQNmDJ/lIxcGgsVIuaPQAN9K0DuAoV2wwssztZjzKN/PKWU/dRs
	OrCGg/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVFD-00000005F0e-2PeZ;
	Mon, 12 Feb 2024 12:17:07 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVF6-00000005Ewc-1qYQ;
	Mon, 12 Feb 2024 12:17:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3be9edf370so353554466b.2;
        Mon, 12 Feb 2024 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740218; x=1708345018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXgBeJ/zS0L0k9t0dD78NVfQ3/+/ikaDrZipKP3SKjI=;
        b=GvlOTg4uqjw+SUssQw96GtpvFwKdeI1uou4zODBGAB4bc+wCyrULIl3zlNu2+4htbw
         wp9Qc9Zpi/iozlVC/uQTki9JLYajCsq8aZJ7DzE7j4BhBdbGci6IHAQfUKPFkUk1y3SU
         qalZA2J6cKuuDN5yX9xBPuWPldI0GZyf1N1mk5+EJKjkalG28eu7qE01I7ZdVju8BX6q
         4SKBrofD2Pb3W4dc77JGjrwePi0NEhpsYt1qTgByODJjCQ6iA3G56DvWbOT9eZ9EIDdo
         xUXhkwyC2BaYB0M92SGyoHwXy8COXQxIXk+UR8iz3FUGWM3+5Dd2AbiLyo9aDW5hLxfG
         Karg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740218; x=1708345018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXgBeJ/zS0L0k9t0dD78NVfQ3/+/ikaDrZipKP3SKjI=;
        b=VDbKk4e2EVCPBB2qUZGUznd6lO16eVjQXuVeDWZTpqKYyND/v5SBDis6OTeA9V+0V0
         dmnzQyMl0uxC02AeXsY7bb4sH2KhXYPMtoNsDA5l+cZV2xRK9rLueUiXbPfHQhZ7mQ1Q
         v11qzC8kvEkUnY7SCu+Mc56Il+NikUsNFzLZMgS1wXxszYCQp/cuKZ7IWHY/08pfqcPv
         2jwFtSFjWaBx+vhvlDsLzv1Ze+jQtHHRM8E9NAQUEsvI9ecSurgrpvr++MMO9Vqtq9gj
         QdqmED3O/6mNc6Z83zC5JJKeL+K/EDz7QsCvTjY+uShBcb7sLeookRnhdSiMlNMBRHxe
         S03g==
X-Gm-Message-State: AOJu0YxChElVCe1Rvm8Br5dcACy+eVt1WmA4x5BAXBvJ2XR58XZvhVmT
	W/GtC/szruG3C3+GMliD1ENp5ISqXAsF5/sLNhUtzzQsiT98e/Qd
X-Google-Smtp-Source: AGHT+IG0bmACKBZt+rsKUFnfLFoMc5TlIBN7CJQ5wcr+iac/2NWf5fEY1ZGbLqIDT3F/rdOD+om1CA==
X-Received: by 2002:a17:906:7c55:b0:a3b:f7cf:6616 with SMTP id g21-20020a1709067c5500b00a3bf7cf6616mr4518736ejp.18.1707740217711;
        Mon, 12 Feb 2024 04:16:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXba1TtBmqJyOtVRFS1fmxYDIct4BqQiofpW2EQj/eLrWvFqbUFV2lEVwJm/1DgBSdWKdmfb6Oq9dN6heDMPKY0OAiS5xrNYWcLnF9ExxHaHCAb107x1sS7NlRkW9Uxb2Tc+aJ8ALsGKFdGtIwNTgHkRh4zbjLD66l7uNTubd6lVX85rbVuy3EFQvFwFfHwZVOTA79b29DbSDgq6LPINHMmjPEU1GCy90ZtRvUBXQsl0isQb47g/ODJ2XOYxh64x8c3ImDwB5FuVc1syarDEeQ3sVHg1RCUpXvafff8y4KiKKW/iONKjA6GJQpW/olF2Ge27rl5PQwaSC1Km37u4KSSPz8bTDYYkw==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lu1-20020a170906fac100b00a3c97e49bc9sm147850ejb.218.2024.02.12.04.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:16:57 -0800 (PST)
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
Subject: [PATCH REBASED 2/2] arm64: dts: mediatek: mt7986: reorder nodes
Date: Mon, 12 Feb 2024 13:16:20 +0100
Message-Id: <20240212121620.15035-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240212121620.15035-1-zajec5@gmail.com>
References: <20240212121620.15035-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041700_512317_23667ABE 
X-CRM114-Status: GOOD (  12.44  )
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
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 116 +++++++++++-----------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index eba5e27a1bbe..b3f416b9a7a4 100644
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
@@ -203,6 +194,19 @@ pio: pinctrl@1001f000 {
 			#interrupt-cells = <2>;
 		};
 
+		pwm: pwm@10048000 {
+			compatible = "mediatek,mt7986-pwm";
+			reg = <0 0x10048000 0 0x1000>;
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
@@ -240,19 +244,6 @@ crypto: crypto@10320000 {
 			status = "disabled";
 		};
 
-		pwm: pwm@10048000 {
-			compatible = "mediatek,mt7986-pwm";
-			reg = <0 0x10048000 0 0x1000>;
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
@@ -336,6 +327,21 @@ spi1: spi@1100b000 {
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
@@ -387,21 +393,6 @@ mmc0: mmc@11230000 {
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
@@ -533,20 +524,6 @@ wed1: wed@15011000 {
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
@@ -589,6 +566,20 @@ eth: ethernet@15100000 {
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
@@ -646,4 +637,13 @@ cpu_trip_active_low: active-low {
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


