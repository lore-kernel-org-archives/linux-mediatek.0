Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E5CC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2FxFIuFS/8D2OioON2ALOE9HyJa5XT3DomtjkJOvW8=; b=wInzryUZ/5aJnX233lj2dGQ4qz
	I4hNP/uUnfRxq/4LIdMGj8hSr5IFNTLyG2Mr6ZyC2h/Q6wkKiF5qDhKcI7Rx0ZgEjGFCpWHS5+1hi
	JLdDWx1FFGybTIJ3n0spPxe4tyfIqtv/hE57fgSva90/KXhjdxAkDfXY3mVUUq7cNcleozILNTbVq
	B7adtrIrE4pJQi2NXvS6kGELJCjE9W7emC1q/mqAbl0u3/dS/3JixHJigDzYYOyklje4S4b0lUtKh
	6aj8beOMyywB3pl8gWK54qNMqZrznYjaRrLU+eizW84UGmmSYmf7JasnYCW2iYW1nGZ4/N+gyzCPV
	XW9Vfigg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOYf-00CNcH-Pw; Tue, 07 Feb 2023 14:02:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOYb-00CNbM-4A
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Feb 2023 14:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F2FxFIuFS/8D2OioON2ALOE9HyJa5XT3DomtjkJOvW8=; b=DAR7D9oc5KzfvzTIIqnHgMfxvU
	GJ78CVmybi72HMaQfMwBtfGb21snDUP/4Z5HqX8GN43W9TVsMJCoBNY2pdx8vm4ir9oo1z0nSZGIT
	sU6NMh+NpKJwMKZIiX75h2Lf/6FDlDPVy7H7euiSnhbiLYMDOlMH/XmfefY4S1qLv4a/Le41r4rLR
	EtjQlGCpziPDMM8p/XxQm6ze0ZEDSrOuXu6vkVWi0T7Trhdwr/kULPn/yA0o5mwZDlaD5lSgUxa9U
	XIjjZ+TmfLj2h7Zl3zwMSR6j7tqoW4q/qJxR3lH+klxiA/sLHhweZ+9Kg+1WgkLv1S02rmb4uvuBf
	6u4pxWSA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPNjF-006tS4-2A
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Feb 2023 13:09:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id o36so10999910wms.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2FxFIuFS/8D2OioON2ALOE9HyJa5XT3DomtjkJOvW8=;
        b=FRekK/MZYQb9ROVrWixBdRpCNg9ZkWgH5cgXuoraaBhZEshm2dfWAZ4zlIHMJsDB7I
         Jk9pigODPTcAXuJgtDRGGF3/f+5WCr9Eq3wBnXtYl+V92d88yAtKOvHYOwoRUv4lO9+O
         KtJFakRStSeunB84OnXoaIvTn+mY1oKTH1Y5uw48uH/kJ2ygM3SckKxZ8ENIqqAFoEhz
         HlV0V+nVc1rleD2rUr81R7sbaoVZs9/bLpGSwpQrXZcg4tyIg5O7OwA+etSXXHVPhdVt
         o8jNQnWEwfCygtpRaIZRXbfEzuRZQZii6CkRDlPQldXj5KZ5LR7MbB/7hUqRHvX80hWX
         YUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2FxFIuFS/8D2OioON2ALOE9HyJa5XT3DomtjkJOvW8=;
        b=Eqv777m+/BNGidvoKFD2urKeBtsfiCdd0WyYFCGtbtXX09EWgdcyk4X5XvH+JDt9Bq
         y2RZ6Jp0Lha3Z2TBkTQO65zK6diNbSKe6nGi50HSDTJUDgWtBLQt1TJIDJFT2moIYvVc
         poHofnifkUAgEIT9mUVPMj45zBsp9qVHrX9MSNZms737ifkn5LuDv4U/oWuVsbNNIugv
         oe7SdQZCpjRArl3mxn0euq5t26oGZFCbVpIaXFD4jgHVOUMe4JOu3LtTjHvS+2g4FA53
         w61Bcg8DtcihVjmZ2guSiqRzXa31MspYbH970SZia69G78u/kH00crYncdBcuB5p50MM
         qFdA==
X-Gm-Message-State: AO0yUKUCOX2K93uu0aPTEsEUVJp27kqVoRkOZEbqfd2wZRZD5lqPib35
	LkCQmNr8E3zhdbB2nYI0wo7DAg==
X-Google-Smtp-Source: AK7set/RMK477DelBkWkMVMOtzYjlOrZRlpa/s35N/1+Npyz6cmVKjEWL7cp5vuNJmaiLbzGBXrvGw==
X-Received: by 2002:a05:600c:1c96:b0:3df:9858:c032 with SMTP id k22-20020a05600c1c9600b003df9858c032mr13746065wms.7.1675775412407;
        Tue, 07 Feb 2023 05:10:12 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm17987385wmk.25.2023.02.07.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:11 -0800 (PST)
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
Subject: [PATCH v13 5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
Date: Tue,  7 Feb 2023 14:09:57 +0100
Message-Id: <20230207130958.608305-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207130958.608305-1-bchihi@baylibre.com>
References: <20230207130958.608305-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_130947_266520_6299CF77 
X-CRM114-Status: UNSURE (   9.93  )
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
index 09df105f4606..c7e958f8f1b5 100644
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


