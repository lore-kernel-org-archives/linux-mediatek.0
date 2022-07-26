Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF94FC04A68
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N02ENN8wREPX4veIj3cGqV28PXqeQzl2/6jGMwhV5k4=; b=qeRo6NlNJjI2bTY04V09V+GQER
	bwYRoQOWM0mLo4HU+iuxlu4LU1ajKjeuQrNgHtVTB+vuxIT0UdlX7LC/d5xKEXVoxCTeHjPnhhW7R
	ngnHE7wH26+ZnZaROgNa1iF0PWnImqoGgVqKhbyTnm7QiooRV55P5ng2cOBVllHjKLDjnZ8y+vZie
	3N0QA9r6ADgxvVcBpr4GqoIQ6OqjzV9CVL1I4bh2Aww6nJr7UKEhFaqx+F2zwgbLqweNUoMvGj6E9
	l59+IttIHjRhiwL5rWq+pZXmzxxT0bdZE4q84n2hEsZ26aOCXstQ/lXw5alIlCfMwv1fts0s8qV94
	rGBzPRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL51-00HaPK-BS; Tue, 26 Jul 2022 13:58:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1x-00HYY3-Pf
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:55:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id v5so8801620wmj.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N02ENN8wREPX4veIj3cGqV28PXqeQzl2/6jGMwhV5k4=;
        b=vO9zvYPT5F1jd3WhvAXktLAz6qcb8YZgGeLh1fXmtfpqcsBFp8Js3hB+qnqryJRuBl
         2tV1KtKbEj+iw2CLAXaujRN8QpTGItj84cZdY3YIt8Wqcxrq1Y9Tqqf0XdvmBml1R99U
         MVrxwDL2oeW8hl/hZs/K4zffKdBlG573cIGBw0SoXvP78XIxAg7fGITYYjJfOFl7NLZj
         Sv+SuVeq9vsL5XPjan/wzSLX4NWjqAoRiTF4uXqC1huzb6719k+s+RsdiBN7mKdU0vlk
         AxQnUwdaAbm/Bi5jSow290CBHv1JEdr0DF4WeHltdnDaKon0HvytQGi+Q3w5aqyJ8ZvY
         4jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N02ENN8wREPX4veIj3cGqV28PXqeQzl2/6jGMwhV5k4=;
        b=En79vy50Zl/2oBQzEAiZCAudCWieCQ4FIauInleNjua57gtt+ofoqeVre5uGtrmH6/
         Qw6GTgs7hPMtUW2dDiFOV9ZaGHmQ9t0cugw3WFq/Kdz65UBe0AitYXBAtODOo9cXK4TH
         ngzFF02dt5QT8i4WvFIJUV6b0DsXnSD2nHZqjTGdvm11JXKSzIjkOnKg1bXyakkVnpIl
         Tm4GUD9wnxuzZYUXVXnaEnr9WmmmBh/uqqUlsOsZC3U97z74Cpfn1PkQmThPZSPCScYg
         QbNgkO8p4FIi3A6hMWXuUeP6sexX5YCf8FPJeCLQXMaSamfJa/8WCYctGFfLVrdMp01u
         pHYw==
X-Gm-Message-State: AJIora8a7KpPie9tns/BW6eLiaaitwwuV/hcEWXDfMLqHWGp7/OVAL8l
	53kULzA2lEXXznICfKi1W2VD+A==
X-Google-Smtp-Source: AGRyM1vhX7RgKC8IGy97eICF/591FulDH1b+GwMaL7So30RUVSvED/g4XVgQWTuECYQ6Gn9vbOzMZQ==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id n125-20020a1c2783000000b003a2fd82bf46mr24814709wmn.29.1658843723039;
        Tue, 26 Jul 2022 06:55:23 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020adf9c8d000000b0021e4c3b2967sm15244670wre.65.2022.07.26.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:55:22 -0700 (PDT)
From: Balsam CHIHI <bchihi@baylibre.com>
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
Subject: [PATCH v8 6/6] arm64: dts: mt8195: Add thermal zone
Date: Tue, 26 Jul 2022 15:55:06 +0200
Message-Id: <20220726135506.485108-7-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726135506.485108-1-bchihi@baylibre.com>
References: <20220726135506.485108-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_065525_887736_8BC0A7C1 
X-CRM114-Status: GOOD (  11.53  )
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

This adds the thermal zone for the mt8195.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 115 ++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4fbf24b5d202..78017224930c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2022 MediaTek Inc.
  * Author: Seiya Wang <seiya.wang@mediatek.com>
  */
 
@@ -11,6 +11,9 @@
 #include <dt-bindings/memory/mt8195-memory-port.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/power/mt8195-power.h>
+#include <dt-bindings/reset/mt8195-resets.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -810,6 +813,28 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvtsap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8195-lvts-ap";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x1100b000 0 0x400>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
+		};
+
+		lvtsmcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8195-lvts-mcu";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x11278000 0 0x400>;
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
@@ -1613,4 +1638,92 @@ vencsys_core1: clock-controller@1b000000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu-big1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 0>;
+		};
+		cpu-big2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 1>;
+		};
+		cpu-big3-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 2>;
+		};
+		cpu-big4-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 3>;
+		};
+		cpu-little1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 4>;
+		};
+		cpu-little2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 5>;
+		};
+		cpu-little3-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 6>;
+		};
+		cpu-little4-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsmcu 7>;
+		};
+		vpu1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 0>;
+		};
+		vpu2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 1>;
+		};
+		gpu1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 2>;
+		};
+		gpu2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 3>;
+		};
+		vdec-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 4>;
+		};
+		img-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 5>;
+		};
+		infra-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 6>;
+		};
+		cam1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 7>;
+		};
+		cam2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvtsap 8>;
+		};
+	};
 };
-- 
2.34.1


