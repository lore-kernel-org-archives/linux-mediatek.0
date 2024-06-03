Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB171C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=; b=B566pbSW4CC5p1aYsb2PiBBYv7
	cbat9j3lCX2XXYGbKAK0z3wDN1oOOKGshsSHnvvqVazGXP+7jcg0ymyUN1pj34JutJQovUXiZkhwE
	IBI9s3IE2vsMkZJAkU7He8olD5+5vm9XGFjpm/wNcSHL7nDHUdtyeiV/uRmXdXSYpaW1ZW8vqJEG/
	FaQierGf5OOd/ss7uN45t9lmGNxw5APwv8uVVc5f2AgKWJ2zY/lbuN9lYYJORGhFc33nBR9Yomprz
	JGKsBnZBIOLsEbYQNh9rphE9K8Am8dV81tpzzDNgK++ZPeDAeRN/xQQcgmnyXnWYVQiFlqxhoME89
	3SEJeICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5Hh-0000000GQY0-3rI9;
	Mon, 03 Jun 2024 10:51:25 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HS-0000000GQIV-2oXj
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:13 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so19282871fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411868; x=1718016668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=;
        b=1bpMPwU+dT8desDpKc2Dw7ThqlTM9REAtKE5n/MUzx3n4ifu2pvYYiAtyda9s44OfN
         6GxbIYjve24v9cpuiluU+pAIpn6HgnLBmLbpKFzjxewwHIW6zpLGwbNLYf7FkYB/2Tda
         uqGZAlNaWlpNnmKiDih9G157anK6PHygrZLEXJhrZPcL8Y6Ke3g52/4OnAmiTRj1kiEs
         juoA6jKSeFIlXQtfpiz/3UuoWRhqrqWjQ4ILBpMrrKk9NTrY8rdmKYYCsgVqUTX9JMor
         sq49KMkQ7GNxxkasQqYeTgokIkj7QFxqLO2TjhJzRns35IonwzuEtCB0y4HhUKlejyjs
         4g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411868; x=1718016668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=;
        b=ai0TntRkRy+sxRtBK/Te0guMuS8/K+bDV4et8XWj/3u/lOpoJDZTqPuRpoLeL0FbfK
         DCzJxfZRsmStKwS623W+v0cITUaE6mik1IluaLkzQw06g3IFOyCHT6BdV0orNAwt+jEY
         qsKjkq+l0g8e7Y4Ht8igy22uuNAv28BTWE9egkNnbLEejz5ntEIKMs/DVbRaQG1tBSBD
         y/k8mCH+jacmLWIb49xhKeSOh59QQRgiqSYBP3zmxdrUcDWNVC+fdRnER3sT23zi7FYt
         vgPvyV5P8mzIECy80B5YjlnQhTUFvi19dy/yzuTkoYpVkDa3R8j+UL67gPy688RFxnGA
         Yt9g==
X-Forwarded-Encrypted: i=1; AJvYcCUKZbtp2hRPXIXFWIFChZxlFqzobUBeKhbw02shu4fgtDrzL1X5u/nb4jK9Nz7p5WPJdm791ZKLhK/pnIoxGfzp0D9LU+OW6nufoPHnQyyMdiPk
X-Gm-Message-State: AOJu0YyuaVeLpVDkhjbnr+aYFUXO7FemR0olsyq0RPMhhaJSe7+0Mi60
	6qYtHN9bKeKmLvls+AlSUERtI3TFP2JNneOIUpgqmKIF43vibVFa0p5eWZPogl8=
X-Google-Smtp-Source: AGHT+IEGQ/xC8cX47PtpinhY28EGaWP+Mr4APwZrrd6T4OFRq3QMU1+xhuIu0AkIriafaOGRhgkcGg==
X-Received: by 2002:a2e:b615:0:b0:2ea:7d47:82a3 with SMTP id 38308e7fff4ca-2ea9519b87emr58662711fa.37.1717411867679;
        Mon, 03 Jun 2024 03:51:07 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:51:07 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 12:50:52 +0200
Subject: [PATCH v7 5/6] arm64: dts: mediatek: mt8188: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-5-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=2943;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=a+N8mpao7+QeANDnMFXYaOS/6MVQmW9fHDWrXbASce8=;
 b=nPcjEmvEDQuDtpxAh7mvZz2ffsRr5fj3qPdL3X5DhgO6KVn3q8ZDpj1hjVdfG5wxvVClk3weC
 QqeeaNkkDhlBBnKbra1B7aOJADUxtXQsEYidq8Xne/9nTcyJKSxyLXL
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035110_868029_CC374760 
X-CRM114-Status: GOOD (  10.29  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Various values extracted from the vendor's kernel driver.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Link: https://lore.kernel.org/r/20240402032729.2736685-14-nico@fluxnic.net
[Angelo: Fixed wrong nvmem-cell-names]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 29d012d28edb..02786fe9891b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
+#include <dt-bindings/reset/mt8188-resets.h>
 
 / {
 	compatible = "mediatek,mt8188";
@@ -464,6 +465,7 @@ infracfg_ao: syscon@10001000 {
 			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		pericfg: syscon@10003000 {
@@ -937,6 +939,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8188-lvts-ap";
+			reg = <0 0x1100b000 0 0xc00>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
+			nvmem-cells = <&lvts_efuse_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
 			#address-cells = <1>;
@@ -1050,6 +1063,17 @@ mmc1: mmc@11240000 {
 			status = "disabled";
 		};
 
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8188-lvts-mcu";
+			reg = <0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
+			nvmem-cells = <&lvts_efuse_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c0: i2c@11280000 {
 			compatible = "mediatek,mt8188-i2c";
 			reg = <0 0x11280000 0 0x1000>,
@@ -1273,6 +1297,17 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 			#clock-cells = <1>;
 		};
 
+		efuse: efuse@11f20000 {
+			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
+			reg = <0 0x11f20000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			lvts_efuse_data1: lvts1-calib@1ac {
+				reg = <0x1ac 0x40>;
+			};
+		};
+
 		gpu: gpu@13000000 {
 			compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
 			reg = <0 0x13000000 0 0x4000>;

-- 
2.37.3


