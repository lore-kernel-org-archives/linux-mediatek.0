Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09561C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkQfpvEXLkkBGK82faSfAh95Y59PRiFEur7hbwKeQSE=; b=u/kpCFpEFxwRnUopO5mV5FYZkT
	2P7Yzl4nIkRZ73nTPYRuPwohJIAyat6QCx8+VaI9a7JZK7iMRZST8Nb6ReWoJXZO+t8KALRmmPYeO
	11k73G3GkxPsvtff0fZCoSTeaOpmTPAZXIbsSZujdrD0JUhjahav5DKjHEcv8IVLTZillxMcpTpPS
	OjHllQYDhsumIOYdKRi22exSPhS/LDcaxhO3Rn0n2dLgerbK9LJlAHDFaq9veY9BoMiDJl1/ykjkk
	Tcufu5823TGKJgzD9vHGPdpJXqLSB3vDcM0foTGCt5jzMsybF1ZDUxsv8z+rMVyEa3wF5kX9SWmLQ
	dZ+NvJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4cK-0016RO-A6; Thu, 09 Feb 2023 10:57:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4bf-001690-MO
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Feb 2023 10:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DkQfpvEXLkkBGK82faSfAh95Y59PRiFEur7hbwKeQSE=; b=m/JlNphiEt86/iNCy4NgEwnzpv
	51BtWFDlHY9oBSX+NQp79KCXbUEvIl6iq5Mffk7vIWyNYBu9X04Hdo58EGlowHo1wpfiPXYpBAli+
	CUJgnXfsTleHZIDX64JZYcJD+hYFNpBULdRDsl0uIUfFNAzEBOdpNXFqvL6+X/89eexJh22YxHEta
	gWOSnREfx65270bupIM0olPvLvHI6Uktc1DW/+UyhDHG5sIOInbKwZAnRdEw8AmKF3uCykkB40LuV
	yJ4qqxCZ2HP5vciR+92/UTygbLFNhKRRcniKnh9MDAzvMEB7fINxtdybU86YcEkHoOZ2APQ08aVJw
	4pjzxkIQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pQ4aw-007srH-2Y
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Feb 2023 10:56:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3558666wmb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 02:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkQfpvEXLkkBGK82faSfAh95Y59PRiFEur7hbwKeQSE=;
        b=mPqy6Bcrf4sv+Zqx/JqWjfw6kNqQEjkOzJg47tM/lr6WZOhvgFRLyUogxhmLjJWgfP
         SbXqRyTrxwAOzaADo4YCEZLCWhFHNAx5aXCIcdaJIpHCg+rYFstoSBdUnitgZj9JTV8P
         nzsjbzm7EcjUmU/DuMZ4PRRHiUAoSFNuED0rBkmTW1Q0LvBFTcHsdSv4rzU7gs/jfTlq
         U4Yb0NPwk5gLMCIbaFTf9xC+HbXhNvQ+Bvw/U23TtSj45tLXmjoVjTTXk+ayFUEwk5C/
         4Qaen5CJzIXybkok+/rKTZUikX9lQAcz24K6xL3eORUN8xcLXnoB0bbMI/JMs00+ba+y
         tZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkQfpvEXLkkBGK82faSfAh95Y59PRiFEur7hbwKeQSE=;
        b=qXoBL6kFhpJ+byruzW0j3x3jDrqQuYn+FofYd4x2vKacXbIgNtjuvrDavszmTRkZ6j
         U/AsLDUiteMTjaYrDJwtBIJIuU5T8YJSw5pJ2+mKC7CzbCi/pliKPiMWgj+NrgFel54Q
         mzsMJCRuaPPQoLK0Z9c6eQ6cJxbeXfGQltdlgKyr94KZV6fqZbn6r/EdZc6gALB4hyLM
         uiWh2NEeEU+1j48elVBveirQ/sHVO/TgJd46FCy0J8KGvjSYBqiqmHdhM1o6F4SuSBJN
         8txvSlphMQSfFvP/eNgEhrwkFQl7XUuKXoa2v/UbkCnZsCQYMomkWDne+LLON7WKQESe
         ev7Q==
X-Gm-Message-State: AO0yUKV8qCd8zqxpzT+cIZ+4fTscaOf2q8lOlzM4BTPwqmPZxRIVINSl
	IMQ7hh1wdQ0TE2pAI1FdL49NSln2Myh+ZkCCo3A=
X-Google-Smtp-Source: AK7set9lMcnihuaam5mA7briorjCYjSvgNWxH6qnlI03x7Jc/W9gTnLZZl1Rx8dG/YamZlz0s+xj3A==
X-Received: by 2002:a05:600c:2e89:b0:3e1:bfc:d16e with SMTP id p9-20020a05600c2e8900b003e10bfcd16emr6400221wmn.39.1675940198536;
        Thu, 09 Feb 2023 02:56:38 -0800 (PST)
Received: from t480-bl003.. (185.173.185.81.rev.sfr.net. [81.185.173.185])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm9140466wms.1.2023.02.09.02.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:56:38 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v14 5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
Date: Thu,  9 Feb 2023 11:56:27 +0100
Message-Id: <20230209105628.50294-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209105628.50294-1-bchihi@baylibre.com>
References: <20230209105628.50294-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_105603_490745_40553609 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add thermal zones and thermal nodes for the mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 129 +++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 09df105f4606d..c7e958f8f1b5a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/mt8195-resets.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -954,6 +955,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8195-lvts-ap";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+			#thermal-sensor-cells = <1>;
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
@@ -1114,6 +1126,17 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8195-lvts-mcu";
+			reg = <0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+			#thermal-sensor-cells = <1>;
+		};
+
 		xhci1: usb@11290000 {
 			compatible = "mediatek,mt8195-xhci",
 				     "mediatek,mtk-xhci";
@@ -2387,4 +2410,110 @@ dp_tx: dp-tx@1c600000 {
 			status = "disabled";
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
+			trips {
+				cpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU1>;
+			trips {
+				cpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU2>;
+			trips {
+				cpu2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu3-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
+			trips {
+				cpu3_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>;
+			trips {
+				cpu4_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu5-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU1>;
+			trips {
+				cpu5_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu6-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU2>;
+			trips {
+				cpu6_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu7-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU3>;
+			trips {
+				cpu7_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.34.1


