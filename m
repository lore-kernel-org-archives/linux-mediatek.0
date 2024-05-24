Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02452C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=; b=LtKBPG/4/UCkdznbg6AQcneh7P
	pnd7hQriKxohsttzWmbIdZjNHtkbzdv2eWweKptPKd/F6tmhw3LKHBMv2QmVlq+7g7fFCSvd1tqyI
	qrc7e9q6wEd1g6xVMNwWIu3zuXHZcnuryIMivCTMaZ4Ekgc5n6tZ7gKQMMe+sGbOz0lMWaL43rFya
	g2LhSC/MnuQCoM1io7iNkxFq7/ulzhguDZMhytLFMZXTnrFOz63ONuRzBAKxvl2jVLnnLrdvkxuMt
	4XbvcvWTgyVhOYknBqbYnlyHcd8jRbEnSuO6yELKRsb02zG2ZZsYYFldvOY7k3utYyuvE3nrbC8P6
	zkM0YOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQrh-00000008TKK-3x5u;
	Fri, 24 May 2024 09:05:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr8-00000008Sv4-1g6E
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 09:04:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4202ca70318so60089215e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716541492; x=1717146292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=;
        b=W3tuO7Z7Q2hRicUOmo8XHmhNw95kZFoOZFzdQYeywqxE8DxwHxfdwrQD5+5m9ENP4T
         yt09DUaxpAem7njZx7eZpYIljd2YkeT11XAaIfVoIffMobQgQJp0bmqj2rmNqeWhReCF
         KWBCHOirKB9mfllYChDO/zN0uPwcDyLD3PgcHJDsRoon2EGl6E1/koTa+EiQ4rMQu6CO
         0XhnWhq4u8PuzaAxwglc7Ao1C7iSvfWKj1fCjS6IMizEpgWejqz2tqghkWxwq7VABj+x
         V6hbKLw3aS8W3KjXAU/9kdGSVxrP9M0KE3KUte7eBQAlV3GwQxRREXWljyyQMzbv2UOQ
         S43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541492; x=1717146292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwXTa5ISuv1Kx02m8OOMsEkndfJD0rih1gKoinHaSN8=;
        b=Hvp5zutdUET0o2pIAwJDa9KSnBqe+XTPdI3BgcEu9CMixJmOCWoeAePZDwmyJU6D4u
         fu8s+GhTtnGw4SUFRUUJvoLSTSj+eii83m0HxLpL68jmb3WObvjx+XEup7lhMDiEaY1r
         dh3BcHuVCrm4mZ/G0KJlHle3I1bqBhukaQMY56CjM4hf+UwXBKkZ7CNbaKqgEPOT9fPD
         bwYKELxBV4r9P8PzXhIi+CDQ04295QdnxGH6otBkQ1wQxfCMRLKMwod41xMZU3BttaRh
         WoLxErLTYs0sHbGiuuuhL4+X93ho4Q5VdKKqP0BTJe40tlNSfMNvv8zRoX/CzvluisZb
         qw8A==
X-Forwarded-Encrypted: i=1; AJvYcCVQK//p0A5nkxUVRP+wmBIoTzc4rtz4JPWZ9xTRJ1XkDqpaXXBXlmvzrCBJA++aMvIZR80MFHfsJAJuwYi3y6fahZwOOG5yWzsJ6gIOM5Rm6VuR
X-Gm-Message-State: AOJu0YyyvhZITieffsVD5GmWMvBA2YFRYrK0tjSqVQ1o4vQVYEqo3DOr
	dX6RTTF022RqIKwrpI6zAQwTfE3lHDtgicWCU4RWemWdLlhYVm2YQetkdfrBqjg=
X-Google-Smtp-Source: AGHT+IFenMcuhS9OsEyd+h7AaddD2iy90CZR7BBfUN10hVId+maydXEPDYGko74NzdBb4Y9rrZNbKw==
X-Received: by 2002:a05:600c:4690:b0:41b:f3b6:e5da with SMTP id 5b1f17b1804b1-421089f981dmr13646005e9.36.1716541492077;
        Fri, 24 May 2024 02:04:52 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm47273045e9.13.2024.05.24.02.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:04:51 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 24 May 2024 11:04:38 +0200
Subject: [PATCH v5 5/6] arm64: dts: mediatek: mt8188: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-mtk-thermal-mt818x-dtsi-v5-5-56f8579820e7@baylibre.com>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
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
 linux-pm@vger.kernel.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716541478; l=2934;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=UpRqfVTfJj/4HAmfkOjlSQQqb0p0PX5zc+/lgsWNhqY=;
 b=Gx+63BRCjTxPhtYHJO94l+rLZO/giNvzvSPnRBXAOb4fiO0zkouPa+UhiVToPGnfja1IeLBsv
 S8PaOVfWQWRAdfrvCg8GMOaIdgVkSFYOVvrvc50uQVKXzwylwaIGpSm
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_020454_533623_E243DD97 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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


