Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B99C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJGFFpyBzNQW6CoIQ52XwyrDz+SQ9l0tl8UYT3Gzx48=; b=UVIr9H4NPwObUjHfc0i4gtRrcN
	IPw8vQ0y5S1qPuSJ6JXfim6a+aeKgI9Yu/pv29emt5Z7TIZofR7IpcrHh14TH9rfgsyZpZDJb583Z
	30qIfIkB1SQEzKAe0S4NnpS3T/Ta6DxCQP2KaeXLMEARzjoLCruMPGVLLS/rqyOxc9liPTj0U9X6K
	Z1gJEkzsBa/lN59K6TM3djMBGWoOq8DD/ts0Q/981BgKsOh5PY/NNI7wAr+5uynRdoJnm8aa0wp8Q
	ayJbMF+sP4qUHYHwLHlk2ZbI/GyFTTgbQ/aOCS0nvtdUr2qAaQh32q5zlB1aWON5xHA/aJVqSKhfw
	jyZbE1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu3P-00000009ZXH-0N1w;
	Tue, 13 Feb 2024 14:46:35 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu3L-00000009ZVb-2pwm
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 14:46:34 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d10961248fso9169421fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707835589; x=1708440389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJGFFpyBzNQW6CoIQ52XwyrDz+SQ9l0tl8UYT3Gzx48=;
        b=RXP1GUGknyy8OKZA8AOqsoXm8CibqIkiaDRiYJkZuPjlOkDyfaFTjVj+MDc95ARCJ9
         77LHMPpWylczLIg/MyDgH1Vzk0LN/lnY2PbVNFDz0bAjNM03smAoJuG6G/2ERaKTyGJ9
         8IrdCmfw8OZHQBi1R7nmbVmb9ISiBp5jvTiprmFspB2xmc7mW9WI4l1t2Q19zyyy4h/d
         j3XIfG62kA+X24VqRKmLnNz+Fq+X7vECcETRP9iYv61fgqJDYEPPrrY8BCANvQJBFwNq
         GuRoFQl0ItlcascECrHVxLMRvz5YueP98PXTLEUpDRDPHeNZ3Y/cQCkwXkEZLgSrjsYg
         9G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835589; x=1708440389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJGFFpyBzNQW6CoIQ52XwyrDz+SQ9l0tl8UYT3Gzx48=;
        b=QfunrCXXPwpTBYWFQm9KSeElOtUaFWO4ZznToyiB5BWn67Wvf2l5zRmjQA89HFDuBy
         GhqEB0b1MnSpkMhsa5QJQ0XtVpkUlDUZLlQg9O7mYqkE/QdcbTehuBwgOLGDc7VcxN+k
         kAxW8BlJAGPCtAvoBnwSuCVGTxNfj70T2/8Rr14VkbxmnSt/NhTrjto0o9McYIUfsSb7
         eWPrbMSSFS7T5OKE6EOnw4VHYmTaeoahzl+XRpibya15ydJ6RKj9h/7wO+XGeggSymhD
         swVvtdA66UE0I1Ru9T6YDUAEAIZo2avO+G6/YXW8tBS7N46UKdyvZFw5K/793k9a4iqJ
         Jc/Q==
X-Gm-Message-State: AOJu0YwTQ/li3jpkbGPuw4a8lwCIKuA95N9KKXoL6Vk9mBoriWZsitwO
	xLGLDc2+Rykx94AeBEGwiY5WytXx+kuYFTmukMG+gtasvaDt4C4GnA65/f72avg=
X-Google-Smtp-Source: AGHT+IEw8a0U2ScUAR1Kwbgr0ZeQ/OOzbh+dcPNcy6tFAbwRUP8ubzqTERTayNc0nA5pBEeOUcp7yg==
X-Received: by 2002:a2e:914b:0:b0:2d0:d9a7:60cc with SMTP id q11-20020a2e914b000000b002d0d9a760ccmr6422089ljg.23.1707835589451;
        Tue, 13 Feb 2024 06:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXNgKlR75DDD6TXU3t0ao6cBbnfYFC/+/yWc/VQtkfrF2Lj9aC51pV9x9IWGa1qCZNvizFnKhbERMVrpU1dvsARq0MuCGrqCMYx56x7evXBgVoOCEcDA4bVl1ydWeq4td8mezqK5JVg5sTZDSj5t/Q7GqkBUV9DrW9YtG5D/ZbLOaQYbaOX4kvNiQfXnJLxw6hfnQCY0iQRmVZBaAvyMVWWvy9Wuqm4o+a2iTdEyNKonMCN+a8M7CKV8Y9Or+E4YdmMH/8iJrAKWQ+HpGj1ZFM00Slxg+2uEig59r0HzGADj3EgQB/q/vuEiLairj19JdrzawqOC1acivgyPCAeRjjSWGIMX5mtLw=
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id bg10-20020a05600c3c8a00b0040fd3121c4asm12054253wmb.46.2024.02.13.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:46:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: replace underscores in node names
Date: Tue, 13 Feb 2024 15:46:26 +0100
Message-Id: <20240213144626.341463-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_064631_918447_4FD1B8E0 
X-CRM114-Status: GOOD (  12.57  )
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

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi              |  2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi               |  8 ++++----
 .../dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso     |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi           |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi               | 10 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts        |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi               |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index ed1a9d319415..6d218caa198c 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -261,7 +261,7 @@ pericfg: syscon@10003000 {
 		#clock-cells = <1>;
 	};
 
-	syscfg_pctl_a: syscfg_pctl_a@10005000 {
+	syscfg_pctl_a: syscon@10005000 {
 		compatible = "mediatek,mt2712-pctl-a-syscfg", "syscon";
 		reg = <0 0x10005000 0 0x1000>;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index c3677d77e0a4..0e9d11b4585b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -117,7 +117,7 @@ topckgen: topckgen@10000000 {
 		#clock-cells = <1>;
 	};
 
-	infrasys: infracfg_ao@10001000 {
+	infrasys: syscon@10001000 {
 		compatible = "mediatek,mt6797-infracfg", "syscon";
 		reg = <0 0x10001000 0 0x1000>;
 		#clock-cells = <1>;
@@ -452,19 +452,19 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};
 
-	imgsys: imgsys_config@15000000  {
+	imgsys: syscon@15000000  {
 		compatible = "mediatek,mt6797-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
 		#clock-cells = <1>;
 	};
 
-	vdecsys: vdec_gcon@16000000 {
+	vdecsys: syscon@16000000 {
 		compatible = "mediatek,mt6797-vdecsys", "syscon";
 		reg = <0 0x16000000 0 0x10000>;
 		#clock-cells = <1>;
 	};
 
-	vencsys: venc_gcon@17000000 {
+	vencsys: syscon@17000000 {
 		compatible = "mediatek,mt6797-vencsys", "syscon";
 		reg = <0 0x17000000 0 0x1000>;
 		#clock-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
index 543c13385d6e..7b97c5c91bd0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
@@ -15,7 +15,7 @@ fragment@0 {
 		__overlay__ {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			spi_nand: spi_nand@0 {
+			spi_nand: flash@0 {
 				compatible = "spi-nand";
 				reg = <0>;
 				spi-max-frequency = <10000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
index 256f245ac01d..1c9fc791bdfc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
@@ -14,7 +14,7 @@ / {
 
 &cpu_thermal {
 	trips {
-		cpu_crit: cpu_crit0 {
+		cpu_crit: cpu-crit0 {
 			temperature = <100000>;
 			type = "critical";
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 335aed42dc9e..6d962d437e02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1135,7 +1135,7 @@ rtc: mt6397rtc {
 			compatible = "mediatek,mt6397-rtc";
 		};
 
-		syscfg_pctl_pmic: syscfg_pctl_pmic@c000 {
+		syscfg_pctl_pmic: syscon@c000 {
 			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
 				     "syscon";
 			reg = <0 0x0000c000 0 0x0108>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index fe572a2f8f79..3458be7f7f61 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -222,14 +222,14 @@ CPU_SLEEP_0: cpu-sleep-0 {
 		};
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 9 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
-	pmu_a72 {
+	pmu-a72 {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 13 IRQ_TYPE_LEVEL_LOW>;
@@ -286,7 +286,7 @@ target: trip-point1 {
 					type = "passive";
 				};
 
-				cpu_crit: cpu_crit0 {
+				cpu_crit: cpu-crit0 {
 					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -318,7 +318,7 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		vpu_dma_reserved: vpu_dma_mem_region@b7000000 {
+		vpu_dma_reserved: vpu-dma-mem@b7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xb7000000 0 0x500000>;
 			alignment = <0x1000>;
@@ -366,7 +366,7 @@ pericfg: power-controller@10003000 {
 			#reset-cells = <1>;
 		};
 
-		syscfg_pctl_a: syscfg_pctl_a@10005000 {
+		syscfg_pctl_a: syscon@10005000 {
 			compatible = "mediatek,mt8173-pctl-a-syscfg", "syscon";
 			reg = <0 0x10005000 0 0x1000>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 76449b4cf236..333c516af490 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -33,7 +33,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		scp_mem_reserved: scp_mem_region@50000000 {
+		scp_mem_reserved: scp-mem@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index cdc8d86cb432..93dfbf130231 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1964,7 +1964,7 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
-		venc_jpg: venc_jpg@17030000 {
+		venc_jpg: jpeg-encoder@17030000 {
 			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
 			reg = <0 0x17030000 0 0x1000>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
-- 
2.34.1


