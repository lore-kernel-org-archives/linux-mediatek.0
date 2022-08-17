Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAF5C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqBN/1lbDDUExS5IZ7DoqaWZVSkfYt/y1o6RlIQJrH0=; b=K6QcWvTh3mfMqcCyY5V1Q/Hq34
	ZepgHr1gr0nakK51pq5z8Ac5TfH3sdn6frWglQRERmya5cjgzpkoIkyCMReMX5hraj2Q6Fq/xaDte
	A656YgMKeZJiE4ezPEE0TtZNj7Bzvc9mF2Vvikum54NyX0EW+yrf/xBwt4U4ZDWngz0gGyQd0KgrX
	ycPSEW+BrZ9EGoepMHgXzxt8Ztwe4nLK1b0GSel9CYRqr7XRlJizyQXjDtqoKWwaG1wIjae9OXW0U
	LvVSmaWu/ON0y9uc56i2ozWBis+3lo9cVT3NnTC4NwLweZae7RGnCHWpZeLXWwxKFZKvZH6XjIwow
	gS9ZOcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE9t-00Eesj-2I; Wed, 17 Aug 2022 08:12:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE6e-00EZ0g-Ry
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 08:08:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso585829wmh.5
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vqBN/1lbDDUExS5IZ7DoqaWZVSkfYt/y1o6RlIQJrH0=;
        b=uf6YkzyFQ14zCs70XWWzM9dZH85T8/q1k7HQueBM2LvFHPbhfDqQ3HCMcckugNviMF
         F3NTw3U9cE6D3PKUY4SiDVjpZPa/l28lAxVKqhMxhJFRdj+TPItJoKMYa84Wb5Gs+61i
         5quMuW8tDoJQE+FKH5KhTQif+vaYwz/xadhYpKJZbqwlXcscHpegS/HlXIfHsdK2uWiI
         YMaAR9BDfwnVGAd9HgjVPCBBymXtyUMZVC5AvYv3307rNL5mDFZATXExEwpBcsWeb6hB
         bRxJGncCU4QJ3pHX9TvxeDwLDuXSkwfKs9OTcDZ+Dhv8rcaYIAJa2oT4l5ToHsr2dz9Q
         CWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vqBN/1lbDDUExS5IZ7DoqaWZVSkfYt/y1o6RlIQJrH0=;
        b=HxrbH7wZzVBHjAY3na2sQVWyEUNdebKWqfHDZVqFH0CFxrw9cOlyNcmn+In9/DDXkB
         ZsJqkRnmlSPytaDBQHPxLw/ugcJQ9Mz0JzC5y9lbDeoXjOTtnphN26CRRvFB1JO1AGUk
         kFXWlshICarinP7nyG3suP3mbCpFQWOmliCviIHROBRiOtPnwAI1lXwKs8QwUfa5biok
         AreO8q8wkETX9m4kipNZXzT0xBHpQynjIjrmImBnKm7C5op/SQ9UDpkZqI6O9APFp3+d
         0cgYmSMFe7NP69MbAbccItSsK243pcbUQGWlFpxDqFPMnUOuf0ZR838JUX0BBwiCLO/T
         t+2A==
X-Gm-Message-State: ACgBeo3RyPzD7xdGtFPd5zEYvxWLPeqKWN5klpQoR898S0VAmo9EjSvB
	jSd02ryRyXCi7LaD6giTAFxeVQ==
X-Google-Smtp-Source: AA6agR7xyAkug/0FUS2iV/tqnv/KSc31hp2N9qhVSWYwlEjmgU4SC/wDn1yaJLlWRb74RXcsko3bfA==
X-Received: by 2002:a05:600c:1497:b0:3a5:f608:d765 with SMTP id c23-20020a05600c149700b003a5f608d765mr1264422wmh.19.1660723732364;
        Wed, 17 Aug 2022 01:08:52 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003a54d610e5fsm1391992wmq.26.2022.08.17.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 01:08:51 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v9,6/7] arm64: dts: mt8195: Add thermal zones and thermal nodes
Date: Wed, 17 Aug 2022 10:07:56 +0200
Message-Id: <20220817080757.352021-7-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817080757.352021-1-bchihi@baylibre.com>
References: <20220817080757.352021-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_010852_972302_0E39A249 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Tinghan Shen <tinghan.shen@mediatek.com>

Add thermal zones and thermal nodes for the mt8195.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Co-developed-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Co-developed-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 95967a0196d8..aafbbe83e6ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/reset/mt8195-resets.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -452,6 +453,28 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8195-lvts-ap";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
+		};
+
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8195-lvts-mcu";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
@@ -1106,4 +1129,92 @@ vencsys_core1: clock-controller@1b000000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 0>;
+		};
+		cpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 1>;
+		};
+		cpu2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 2>;
+		};
+		cpu3-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 3>;
+		};
+		cpu4-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 4>;
+		};
+		cpu5-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 5>;
+		};
+		cpu6-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 6>;
+		};
+		cpu7-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu 7>;
+		};
+		vpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 0>;
+		};
+		vpu2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 1>;
+		};
+		gpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 2>;
+		};
+		gpu2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 3>;
+		};
+		vdec-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 4>;
+		};
+		img-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 5>;
+		};
+		infra-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 6>;
+		};
+		cam1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 7>;
+		};
+		cam2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap 8>;
+		};
+	};
 };
-- 
2.34.1


