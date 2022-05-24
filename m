Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4021C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJ7RjHFlzmArSQ4Mhx/I1DmTVWWbY9nc8gyAepj9pdU=; b=XyukcMpXF9RxDV
	ZY3x3O0NtKM3nKYVYpMGhHBJjykWsv320WlxYi3XvePeG5avc+Wczpac//rCV202KF7G2zjgk3cv1
	MiT2xBgM+Xc0wWFhXSUbWJ2WpaVBwuBhI0/1BfPkQrF+x8o7K6M89pa50EkWqhV+ZS0g8E2qqMJoY
	YLXisY74wYCecMlCtRwwu/EE0kacTd8opjDfqh52S/LGAGFIR5dpzEWjhMeS9hTiu2lAvV+tDG7IK
	Cp0YQiD9G11T+yBvcJq4YCbnydTruytfVeQpL/jgv0fJv/b/kESHQE+Uis1CamFY/zSJeqETqeB5r
	OZgvSkSPRKssfTpr4+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWTe-008SRX-Q4; Tue, 24 May 2022 15:29:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWSE-008Rhm-CI
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 15:28:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id f2so26271730wrc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXAnLmzQrgqQaSJtyjFJWoEYu8dDLIqEgDWHqFINN08=;
 b=cv59JtLB1DMCmnpxy0QvDJStxO8ZvCXtCfCY4OCgVkzrBXQTcf8ujp/k2ONKQRYaPX
 wtke5nkEcRjpRVA0Aa/CoVsiD7WaUgQMRCXsn49xDzBfk+GM3NStDzNP9VCTuFpwzzaq
 unjaa+Ag+9+bZwk595FWb+MVNMylT1Zm4M5bqwaVDD+12GgQuIRH8993Ny3gFJ5MdSfy
 5LHu1KGgF7DOtyUzAgrCutpnhb1csg88pJr2wgEtQmFM4mZkqmRGgnv6RfhccH5x1wic
 3YBj6Aw9qVpCNcGKB2/cD35dJRTpJnAe0EOdD0feeNkfI40MElsFceNS3cSS0six95uS
 bf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXAnLmzQrgqQaSJtyjFJWoEYu8dDLIqEgDWHqFINN08=;
 b=XYtBhErdjUKqSIv/KCRCoRRcQVRaFX7pwxzf6IdXrTrIlG682CmWXlXYpYM+3aBsES
 uDoMjqYlfTfD+iQSCr45jZoSpzghXg9/gX6aqXepeb6MwwLgz43Guflii7msP46oco+3
 9l8SoRdmysyus2hfRQSGnC+xCrsEmOusU5MUJwnjNx80q9V67/mBgd6y85Y/FLhlgmSS
 sRjTqY+qSpeK4jHNB3JHRnKAK3UL+BP9/CV2FOhQq3xW3PTPgLsJntu5fTYnPev9ObC1
 D8KvDvdZ8V/hBY6hwvGG+Ca7ZkcEMPbcS2DQC06mupeHXgoC4dclpV7DoUBwl1OFaUAN
 /lNQ==
X-Gm-Message-State: AOAM530bby4GSTFLvh1Hpx/Jj9lQ+y2bOPzkHe6p5PVO0lGHJCRi6Q+I
 S3/G3mrb4ZGXjJnAyrolcPJwbg==
X-Google-Smtp-Source: ABdhPJzb9pI/bDL6XkMTlf8Z6N07rnuBuKsU8LO2ruGUS0CBYqbWdTzI3s4eD78oq8NcuY2+KRas2Q==
X-Received: by 2002:a5d:574a:0:b0:20d:70c:3aa8 with SMTP id
 q10-20020a5d574a000000b0020d070c3aa8mr23475115wrw.255.1653406091891; 
 Tue, 24 May 2022 08:28:11 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003974027722csm2703693wms.47.2022.05.24.08.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:28:11 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Ben Tseng <ben.tseng@mediatek.com>, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v7 6/6] arm64: dts: mt8195: Add thermal zone
Date: Tue, 24 May 2022 17:25:53 +0200
Message-Id: <20220524152552.246193-7-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524152552.246193-1-abailon@baylibre.com>
References: <20220524152552.246193-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_082814_472746_23EE6B1C 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tinghan Shen <tinghan.shen@mediatek.com>

This adds the thermal zone for the mt8195.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 104 +++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 51443e83d906..8421cf35ae03 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
+#include <dt-bindings/reset/mt8195-resets.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -812,6 +813,21 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts: lvts@1100b000 {
+			compatible = "mediatek,mt8195-lvts";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x1100b000 0 0x1000>,
+				<0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>,
+				 <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+
+			nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
+			nvmem-cell-names = "e_data1","e_data2";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
@@ -1616,4 +1632,92 @@ vencsys_core1: clock-controller@1b000000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu-big1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 0>;
+		};
+		cpu-big2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 1>;
+		};
+		cpu-big3-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 2>;
+		};
+		cpu-big4-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 3>;
+		};
+		cpu-little1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 4>;
+		};
+		cpu-little2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 5>;
+		};
+		cpu-little3-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 6>;
+		};
+		cpu-little4-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 7>;
+		};
+		vpu1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 8>;
+		};
+		vpu2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 9>;
+		};
+		gpu1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 10>;
+		};
+		gpu2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 11>;
+		};
+		vdec-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 12>;
+		};
+		img-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 13>;
+		};
+		infra-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 14>;
+		};
+		cam1-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 15>;
+		};
+		cam2-thermal {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 16>;
+		};
+	};
 };
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
