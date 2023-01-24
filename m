Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA36C54E94
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYZQGFlPP5P/RkMABIrbs0eSZjZa02mf4fdtuwRY9mc=; b=IixSi1NKoeeSXkXr07JZyjAftV
	9GkaumXC61zxzwYVh7X1T4JXJETcukls61ekr+OE937XQWoWqUBXLk6tfinmsCGLfbVHHmT04g2j8
	B6GEFzGjkMYA3GZqlNCPFsRMXidRoGQKnKUSDYaKOXnclNtfhBYZ/jotsBRFckcTvEBGLj5q8b7xE
	D5hHrJQfBqOuKAavfOAtZl5G2i2NAD9cqTUXcPu1FlcU0F0wjNbYd5zye4zQTVLH0g/9Njw4fDhth
	7ZZqNquQzTxI0ZZzqcTZkN81lEDfJMFRe3HjCU7KdWxtGqDqDMB76EkTz1MYAmVwB7rPpTBwYgeT0
	1+R40FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJxH-004CaS-R6; Tue, 24 Jan 2023 14:07:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJsz-004ASG-DK
	for linux-mediatek@bombadil.infradead.org; Tue, 24 Jan 2023 14:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VYZQGFlPP5P/RkMABIrbs0eSZjZa02mf4fdtuwRY9mc=; b=GUe0xGku+PNZLHxaj3xpaDpN7G
	tYtXeQ18lqemck9NdfF7NlqYzLQdIUQDl/W5hGQPsp0QlLBjENHPOwk07yGK0mBo2n5p9DPU3I8JH
	2+PxMJ5Fita0/ham/wGWvz6GFsdyeI7GCzZqGqSE22QvfAlMe/cMD7LynZIFX2JUDlvydcvpUuk+4
	UYZMbqsbfTYUJKIaSIHmKcOXgWM8SilP86iXNaIxK12mx2n2U8AGA17uf7fIfANDW6VO6yqSpmgSh
	Z/z1Z0fA2ibVpUZurh5bF/6pDFOXQNR8dDAU9xD3pRz1tbRcq2nzpZlYn0O9oIl144CqunvDWIS56
	ApHNaI4Q==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKJAY-001qyb-2w
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jan 2023 13:17:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id h12so9847493wrv.10
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYZQGFlPP5P/RkMABIrbs0eSZjZa02mf4fdtuwRY9mc=;
        b=LvzJ5qejfKsGezJgZ0/qaFtlHArz8tyPy2zcpYrl3qtC+Md2S1iHJ5ZsZ5wgCO6dCi
         jn2efJJ09102dQxMA8YGKJdPa4B3GxCvLdyoGxA/3hixN9zVk0defqqVTFJdr0kOXQvi
         d4CI0xfE0gMAn8IwdZm1YdNL/qUxrMPP+T7P9RpUx10hzjrvU0VtOwNOx7Esq6Sq3wy/
         ySLC1M37orcjxu7ivMppTIyYUkBpdA/t0auKXNDeCW3GgOPR5r9g/IHv2DQw8PW8s+Ui
         XI0N2i+GcazkL9WFtRcnRxx8tb8VN3R9FudUFaE9PZhcVqVZHLbS9SSzfeWKwhlh7eCA
         hb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYZQGFlPP5P/RkMABIrbs0eSZjZa02mf4fdtuwRY9mc=;
        b=Av9YEbjI8sGdNK44PYFujJVXxRfJw4S4YgzwN3QaPj7oxoSyon60NXMuHS8gqy0q9l
         eyqnuD+csJLkRrCpa2GHLteHdI1VjCzdWJkmolsbttWeVraPOylgnIol++p1C7uacy/M
         7uTa1fTNIHKVJ/upaLC5DgQTTWyo/8tcAjVUHOtZuuv3IKuqM1UtcX7z1T11wdjlt+5T
         jZfhIfRW6jybx/fGd+yNG4BhMkbGUkXtCs+F7HJGPZIzbAE160x482t+r6C9uiCbyHfr
         LxepaSDGCIcpXw0m0ZOVtjIgucQXI7o/oh6tJbSz1G/ScUWf/OT+QalOIC+XmrzDJdkz
         iHdQ==
X-Gm-Message-State: AFqh2kqydbVkqYV15gI32ySxG0SfoVp4UjIeqC1TGoQJRzA4vsDf7QtU
	qtA8Ccnl1E1Npe+AzI0lzxCo4Q==
X-Google-Smtp-Source: AMrXdXuQYFl4pUTj0SbP3xV3T+Aw2YTblcG/tXvardPqn07thVl0y+FReYxWRPg4/OF7WMHUoCoDiQ==
X-Received: by 2002:a5d:6186:0:b0:2bd:dc24:cade with SMTP id j6-20020a5d6186000000b002bddc24cademr19692374wru.16.1674566245280;
        Tue, 24 Jan 2023 05:17:25 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfb5ebf8cfsm49427wrp.21.2023.01.24.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:17:25 -0800 (PST)
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
Subject: [PATCH v11 5/6] arm64/dts/mt8195: Add thermal zones and thermal nodes
Date: Tue, 24 Jan 2023 14:17:16 +0100
Message-Id: <20230124131717.128660-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124131717.128660-1-bchihi@baylibre.com>
References: <20230124131717.128660-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_131659_869589_D912DB6C 
X-CRM114-Status: GOOD (  10.14  )
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
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 129 +++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 09df105f4606..636676f4ba25 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/mt8195-resets.h>
+#include <dt-bindings/thermal/mediatek-lvts.h>
 
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


