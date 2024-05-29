Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C0AC25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=; b=jPiD6Ct1tYEdqzEf2D0mGHwkMU
	wqvkOlKgXriTEq1t8Tn7L0JnEm7KojQI144ArWdXWaauXrrzXl1pOlsu3/efkVV9YG207pebhHgab
	bfPjm4RFRBIJF46Dj6uZGvHBnreiFW2bCiXwdA9AkwKdT4I71SK06iZcj7T1RRI3Fjo7RkAoCWJms
	WJ9HAo1VPZvDFbHyl46FjQg1J5AF9QLv8SanyrLHd9OSsgnBXgy50al7KpDpN3d09L+nrNPk5CicM
	h3+6oO0H3PUHd0Fco6Ou3Hq3qMvhhJ4v2/hkMgwXGvZYy23iygafS8Xfy0tQUv8MsRZYUW5BpB6bC
	zt/9siVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKP-00000002wCf-02M1;
	Wed, 29 May 2024 05:58:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKD-00000002w3y-12Zt
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-420180b5922so19963325e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962292; x=1717567092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=;
        b=Mfp9FJi8697raxooaZS3Dv/ROPKsiEqD2eJc3A3FrCGvakvNdKsRTVwQvZ7TtLP3k3
         3pXinYtEbN0CLusaHta7AsAxw/GKUu0R3DXC1l4hHjr6+2vnSEMl+jxP3nntcjzgfrmL
         wDff9sJFIsRTL9OsfeZWTlyQRvFsPqOeGhuRRJ+pHMWcgzWyxchc8U0n/YLDMvMPPL/H
         820FrbVZ0GfBXdSG2dldowTPTK7rTUXnmPPwOU4WU2K59CpDgjvrVrRi0fC9zAlo1S3t
         ZkswUAYm84pr7KV/sA4Y6mslBkRjsjYlki1RrehkSpHJ0tENUH+84NdAEbjILEpmaeAz
         DRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962292; x=1717567092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRW7Z+RxEALad/svOO1raRC4NcXEXhP3a8BeFtPc0+A=;
        b=ZErvmPGiNxSkrStMP8TtHUVDUcqaNhQRXFqQPGi/NtG+c38Poyf4IxHozaCJRo6LmA
         o5kPTlZe6A8XUkVVJGckJIFDv8suYXKDfCyD1VnpMYYT0uciKrxql2eDrmonHtIvGOnd
         IzMS3CUM/3rI+9UiGoZwgnu/iAZOSbcA/OfBffJKol+ORmyitSxQqgYhQ2ZTBWosHDLz
         FmZqqkbOJHxCuqizpkohe3s2rFMjyKbyxJJ8095REKBrlLRnN/Kpdj/D4mhmBtsj0VL+
         fjxVxtWyPGBXuu4RCzA1tCXtbNrBIIfmMjVvj6nZatO/emPYzJICzikt7Nre1eu0So2U
         VxTg==
X-Forwarded-Encrypted: i=1; AJvYcCUwjfK7V/TWnmUmtV8/+ORuBsARXBVjkX5+KpWy3QBt8ueLCgRVZjvl34i7DvoZZDWEGTVvrs+h29sZpVraQMuJ93+1eDC8TDSEP0J+DgDAQ4gZ
X-Gm-Message-State: AOJu0YwcOf8s+1BO6qycCWIDefmOzdahbQPidO8xMmdqDsb6Mm3mhZ/Z
	zKTx3uBsSDQwNEDRZbe9Qv9V+15T5CFXO+9RlEVr6WvLRhvbc/JFIpqL+t6+c6o=
X-Google-Smtp-Source: AGHT+IGzPi3uV8Qolda3R0jgiKag6ByLgs3ixXBc3FAS908o3cyTyPcfAJb4H+/YejtSLMggLnj/pg==
X-Received: by 2002:a05:600c:296:b0:41f:f32d:d6c with SMTP id 5b1f17b1804b1-42108a53016mr142767015e9.23.1716962292052;
        Tue, 28 May 2024 22:58:12 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:11 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 29 May 2024 07:58:00 +0200
Subject: [PATCH v6 5/6] arm64: dts: mediatek: mt8188: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-5-0c71478a9c37@baylibre.com>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=2943;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=a+N8mpao7+QeANDnMFXYaOS/6MVQmW9fHDWrXbASce8=;
 b=oJuNvvc75KFtnVqOakvIcFJySZhl3GRFOsEwG9SQWUSfhhwM7G3A13Oj4W8Uz/ymTnQFDxFC8
 K6AHaPrYivcClMPXvWfgkF74RG5wHhY1u6HVxiF4XekFmUGkdgZUUKv
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225813_411336_11C37DD4 
X-CRM114-Status: GOOD (  10.86  )
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


