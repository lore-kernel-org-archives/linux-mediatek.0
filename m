Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE40CC25B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=; b=k4uVjVqtYLaqMtgh1zpawg08OC
	oNQboeEQIMuPXhvzSoeqFAgUkU7W4/1ViC0IlGnjjdnpdOv8AHc+13me2Hi89duljd2bvWMA/6zHw
	rSeZMLHU/JGYBplaHeJkdle0wckPO9iBKUtMqldXzkx2OLWzUc6LkrTRGKKMEqCXfGCY8nCm4xLXM
	eawf3LccojaGfOZtUze6qDRTh/Tt1rw4wJHcItdYiNOMFXEc3LA+8nqARejxU7z9g8DmreXanAPcQ
	2h3YFmgL9JbSFsJ7L8lBY1xajgdMpvqph/6KZPP5WcfDuFBE9ODdHOFfoNRaRpOMHIjaFCwWdUMFC
	3JN0K/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Q7w-000000006Gj-2Zgt;
	Tue, 21 May 2024 14:06:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Q7q-000000006BI-2nwO
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 14:06:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so29161925e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716300352; x=1716905152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=;
        b=cBsN01sk4j1GjSlx8+kNXEt+lFXOhKKR7G08LBuAJR669PiaKYwQ6/gfexSx9bCTk6
         NQG89IHDj3pIfqwz4ZlC1IxR4ddbAGhc5jjBQZ22uAaU9yh1ReGXyqQodyp5Lgs0vTrn
         9jZEmxwKXE+OXtR2tFi0E0QCiDbQi/2OBTnN6leVk4mTlbFe9sAAzdODEB5u2sW/kx9Z
         c29s5vAyuVSgRZS6Fw1lX6nfWsZABvoA/zSey3BTPC8915UjMTuS2CsAYhsOmAr0D8LA
         7eizHfGHGXnyPvXuLtg1jc49Kk7i1a3inRzihEIdf8wkyI/oU3oT8/QBHJmmjSbT6o2K
         4ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300352; x=1716905152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=;
        b=eu7HL5cu3+FjDCZSC9NencVskGQnUoxwAnl4y4jeyC3KJu506OWL1vs03JXRZXXqhS
         Oou9u2vaPpXSvp9N4I2Aoc+fr2M2p1du0bDrcH9TLLVa3lbaR69tkpHESwdtZl1ytRlh
         CfN6PxWD67ZQRGFteZlUML/1P6F0ZRCVCjJ05MxZ+R0GvSSsRMaGtIT8By2GB3EFJK+U
         OoLVEN1gPxeAx+uxjdErBhHvkxe1F4t87JFeEY0bAd5ZcT3bPsdFfLuLxE0Wi9AKHIv3
         JvfjYNeUBvPC9mKrKShQXiardtDFpJB2hNTW1LeTQYpt8nspg1EzANpp5GFNg1ADPbZN
         pagw==
X-Forwarded-Encrypted: i=1; AJvYcCVeMPIrrXD99upjWdZv5KquWQfvwqSoBZtuFQoumveCMRjtlr4mtalIGBwb0F/Un8L/MKOPit1LNS5S9R4BDgoAsf1EfWERNZhso4yVckp13wx2
X-Gm-Message-State: AOJu0YxsIWZUnBKoMY1hU2jPsGzD9Tvdcl81QsGF+E2gBVNJWBoZWEWR
	2r+vGUXk2wJPI86fIGHj4Ec0et3nd1GeEd/uuOLEwBQp2coNepFUUu+0Fg5jdqY=
X-Google-Smtp-Source: AGHT+IGmcQ3zhXcwGKq9p4o4lUrXXiEQ7n47lXZBsIoCw5/9guA9QsF0d6CS+Kcs/jF8lR3BYU6Paw==
X-Received: by 2002:a05:600c:21d5:b0:420:ed93:bca0 with SMTP id 5b1f17b1804b1-420ed93be2amr48817025e9.20.1716300352002;
        Tue, 21 May 2024 07:05:52 -0700 (PDT)
Received: from [127.0.1.1] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42015deac1asm342085945e9.17.2024.05.21.07.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:05:51 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 21 May 2024 16:05:37 +0200
Subject: [PATCH v4 3/4] arm64: dts: mediatek: mt8188: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-mtk-thermal-mt818x-dtsi-v4-3-b91ee678411c@baylibre.com>
References: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
In-Reply-To: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300346; l=2934;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=UpRqfVTfJj/4HAmfkOjlSQQqb0p0PX5zc+/lgsWNhqY=;
 b=QlwxxxZ+8IMEsZ1KOsNLteR7x+69FK/C7WOhQnM3tCwzAiPWf4eqocPeOLgGz5mYgXKfSnXrW
 ag145bsqnZ7BAnVx5kKVFz5biNQeMyaroUGbCeVtlwoY4LGAtDJ8dfV
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_070558_858267_4E501845 
X-CRM114-Status: GOOD (  10.17  )
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
index b4315c9214dc..a9f1b9db54a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
+#include <dt-bindings/reset/mt8188-resets.h>
 
 / {
 	compatible = "mediatek,mt8188";
@@ -357,6 +358,7 @@ infracfg_ao: syscon@10001000 {
 			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		pericfg: syscon@10003000 {
@@ -491,6 +493,17 @@ spi0: spi@1100a000 {
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
@@ -604,6 +617,17 @@ mmc1: mmc@11240000 {
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
@@ -827,6 +851,17 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
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
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8188-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;

-- 
2.37.3


