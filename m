Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BACAC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E983760EFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E983760EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZYUYFiZ2jlFfR1Kz9HNTYiRRNlYIKk6eVn87VlA+Aw=; b=cTJks+DIIcNKky
	n01AHKJDpKzkdzG6skflQICOdKkaC2ofCgyRxgFWusgJjK9OTWCG3iXBRf7q1MZipqAVxBOw50xF1
	V1wY+milail4b3PufLCGMK3kLRveJOI32i/7JsVDKMyx9YB/95EKjUtoctBQnFIZeU1UPX+6ombD0
	8ekTufG0xvlOfSJtwYQBMpFLnZuGDxCArwadobBd4bF7WHXxY9TwmpVD5OvrxCgUgy9hHdYSFyd2X
	1/QIFfuRs6YeFe3e/VVzH96tkgpA43EH5/iIB+cVttayzIbq3p232mv5YTiyt632B29LLRAVt7Gde
	9OkuqEGuTvfkIV1toUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFfh7-00HRgo-MC; Mon, 16 Aug 2021 16:42:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFfgO-00HRQH-El
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 16:41:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id k29so24513702wrd.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ri5K1Xpjc4a4zjNHt8k/tccc7l+lexuuCDCYomtiW64=;
 b=fsWJKH+0VfSp4+mk99VbiWU+aOxWRQF1uKnQBKOdUacrT9mpUf8NrFQ0ZSeFt0hb0M
 SEp6y8StXl7ZDdCbR75BdMp2ImU551lmP/MO6LTRG2YMHS0M4DeyzRZOGUUnWR4fVBlR
 urHnvSMVl5eDS8YiEEEkmRjO7mqbBQ+nd5/RAvsA44nMq2Qv54BjmIO3Z+nhk4T3Zehv
 N6umhJlCVWeZY/qeXAhrhBLeoub3qUYFVkK9uVtIOawpC0MglXH0XASyiBs+l8NLlD59
 me6UqnfXCliq/Y1U4jXpoV/+PxYDk0jx2le0q9h9XREHdPFf3bKI4iYoZV3+BHYkRuyb
 6mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ri5K1Xpjc4a4zjNHt8k/tccc7l+lexuuCDCYomtiW64=;
 b=Q8n7b8OWXvoLOpHm+in+TY2GhPPkbw6l7ygxunoyHHO0k5Qcj8itzdfXx/6RRW7hSj
 mRKIp3VUvFXd3zD4VgEOyDhVnHXUZgTGJOV8Oh30UWkEwehAm4quK80GNN2UHn6fzbU2
 T34nmMSQ4HZkaZz8n80eOO9S8wGx9TitaRz7DT7DuUVOwWS5SaV47ZLZiWLrlXmR/p9q
 H62eIxaaKcOQNrf1vVoupRyfV/JA7uLVVY7nCP+8ckE8cxw7/gP3NGuxAwWIQDz85V04
 GFaOU5p9M72c/l2zbZazh+0F+HSLpkm/jWjOhWAi4mlGxo2ZCrO8FCh2Nwnj+JfxTtNW
 bZXQ==
X-Gm-Message-State: AOAM5302s4bGCE58Czl9jnrFh5ZDs4XwNqurcoX5WwFGUwjdDKE/sjz8
 dWjG804BRcHfemF5GYp3JvBNag==
X-Google-Smtp-Source: ABdhPJwp1/e6QTN+KaNFg1J0WU8Yg38zk3IRnsteKkDATQXEImuAmK8bkrejDz6ojc+sXaEzYbdYeA==
X-Received: by 2002:adf:c044:: with SMTP id c4mr4686867wrf.275.1629132110579; 
 Mon, 16 Aug 2021 09:41:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a81:3690:b885:8dcf:f8c6:7841])
 by smtp.gmail.com with ESMTPSA id m10sm15211730wro.63.2021.08.16.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 09:41:49 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: ben.tseng@mediatek.com, michael.kao@mediatek.com, ethan.chang@mediatek.com,
 fparent@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 3/3] arm64: dts: mt8195: Add thermal zone and thermal policy
Date: Mon, 16 Aug 2021 18:43:07 +0200
Message-Id: <20210816164307.557315-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816164307.557315-1-abailon@baylibre.com>
References: <20210816164307.557315-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_094152_631162_84A68F8D 
X-CRM114-Status: GOOD (  11.40  )
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

1. Add SoC and board thermal zones.
2. Add thermal throttle policy

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 164 +++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d05492ff8f190..62d0944dea4db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/reset/ti-syscon.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -475,6 +476,21 @@ spi0: spi@1100a000 {
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
+			clock-names = "lvts_clk";
+			resets = <&infracfg_rst 1>,
+					<&infracfg_rst 2>;
+			nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
+			nvmem-cell-names = "e_data1","e_data2";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
 			reg = <0 0x11010000 0 0x100>;
@@ -830,4 +846,152 @@ vdosys1: syscon@1c100000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		soc_max {
+			polling-delay = <1000>; /* milliseconds */
+			polling-delay-passive = <1000>; /* milliseconds */
+			thermal-sensors = <&lvts 0>;
+			sustainable-power = <1500>;
+
+			trips {
+				threshold: trip-point@0 {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				target: target@1 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc_max_crit: soc_max_crit@0 {
+					temperature = <115000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu1
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu2
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu3
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>;
+					contribution = <3072>;
+				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&cpu4
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu5
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu6
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+								<&cpu7
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>;
+					contribution = <1024>;
+				};
+			};
+		};
+		cpu_big1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 1>;
+		};
+		cpu_big2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 2>;
+		};
+		cpu_big3 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 3>;
+		};
+		cpu_big4 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 4>;
+		};
+		cpu_little1{
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 5>;
+		};
+		cpu_little2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 6>;
+		};
+		cpu_little3 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 7>;
+		};
+		cpu_little4 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 8>;
+		};
+		vpu1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 9>;
+		};
+		vpu2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 10>;
+		};
+		gpu1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 11>;
+		};
+		gpu2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 12>;
+		};
+		vdec {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 13>;
+		};
+		img {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 14>;
+		};
+		infra {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 15>;
+		};
+		cam1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 16>;
+		};
+		cam2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 17>;
+		};
+	};
 };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
