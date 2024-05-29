Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4143C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LavDOYWBGYfpww4RDDUlyMd6cUxBIrRNj68m4ClU2/E=; b=GgL0CzJJoTuf3Vf/mDvNfkemEm
	qcIGfd78Wk2m+gsW4USUzOdq35JiuMeCWZlRDcJs4M8yo6FotaKHxCuu2E9wyikbffhmtxdotOa/b
	AYoxkoFi0OW4qZsMXGl2gqzynGLxdTlNSRMalTbbFnEmSXXuv17DyUvIexrQDIUMeGnAfJZIfvxUJ
	8OO4knPyooAzB5t5nURzlT5tA/VS+kagVRfBr8CC33RSMtZmgGDdOYtrT29GPr4ouW287HToJT7Ji
	y97Uet2ySk02NNFY0GcXtoTEhcaNgIuMgxTjJcM5lehKi2uNkfs2Pj2mO9JQBkMXgNrbOIV+fZtjH
	sYQvKkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKc-00000002wOm-11Ea;
	Wed, 29 May 2024 05:58:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKG-00000002w5K-3usn
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-420180b5897so14261715e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962294; x=1717567094; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LavDOYWBGYfpww4RDDUlyMd6cUxBIrRNj68m4ClU2/E=;
        b=yfq9DvRBKjLcI+679IzeN3VQ8kEtY1d7Gb/AyBYhFxO04ITg9BnLZ9FWUyXJi4dH9E
         RBj9AU3CwYhoWVBk2KjCDnsW49VDN0j+C+DRQjNlThfAhQt6Y4sjRL7rWX0wG+z3w7cn
         Twn8bDghObSwQJuKu7lJORbC++HWUAZcjOyyBr3gsGHITdqPb2RybSPL5AzuUYgnRmFC
         XGSmqRnzwnLuUBYZFw9+s3rVIjD/Pl2cHSCAxL5kv7eJyyYTgb8g2v5NpuJNClpOSoK7
         oYCGZCcKTt1I0VnJqtWFrrDMDZDGoOG7O4YJMBCT4hbnh9j1Q0q7hsHRbakB98VaGc1h
         KbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962294; x=1717567094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LavDOYWBGYfpww4RDDUlyMd6cUxBIrRNj68m4ClU2/E=;
        b=U9pYDP9jfrldO+8OR96ihvpm4OD87bYZK03tMAxGW7eruKt4dO7yFeHibCOXRLE8Ny
         u1ovkM2sEoqO5vvHSTVyn8bj7zKojLWq+9ZaBbW795FYj1dRNNTvwq59KEur931+1OG2
         sQUvG2iiCwkCZq953ED/rMSJnR3Pd9MIYs99VYHr5GCGCWvYHA2398ZOSAUZjM+cyL+p
         1iniMaC83mMGK2MyHIxd3PY98Rx7mZFBNJewLQXpH6SZ5CxAQXzBQ4oz9vjygWUMC78s
         JC0ANs/pzE44jMFbN/TqAgygO/C2QIwiXAAWDalNcZrkDfFuISkkvH5vuoR8EsRKONZY
         aKBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1L8eVXG0R79OnKxUwcOhmsaA7c6Pjg923hROaipJsxXDnUc9PT2FQCM1ACINswlPyUFB0MDkXhNndrdTcxX6Cx9xeSNov01eodxJWNdU5KCHE
X-Gm-Message-State: AOJu0YwFHfoyK5G+PuA/B2sRdHwXzex2XHU4YN9e2W+GPTltb72sueES
	TVUFxchsIBZ+TTPQqKRhUh+y2e3v6pcPk1lLRNq1yt6i6qJS8XyOFJxC0xmFCg8=
X-Google-Smtp-Source: AGHT+IHZIfWohQ6uIpAxspL5iEeAtgBFpqQ7jWd1q9AEXPsxCa6NOaculobfj9SZhiYUVhggmiBOKg==
X-Received: by 2002:a05:600c:5806:b0:41b:e84d:67a3 with SMTP id 5b1f17b1804b1-42108962e2emr98466085e9.0.1716962294034;
        Tue, 28 May 2024 22:58:14 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:13 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 29 May 2024 07:58:01 +0200
Subject: [PATCH v6 6/6] arm64: dts: mediatek: mt8188: add default thermal
 zones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-6-0c71478a9c37@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=11449;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=6HvcJw/GiUMGA5QgSQkB+3ZEuSp1mJLMjRQtbGjzMsU=;
 b=mvxaIs4kZQBuy1OCGzgeNIRqej7H1QiOg2k9FUBBJsIaH1ixK53E4fYwlMxmoXPZSJNl6SAki
 47bOhw5Ha/rCCBztqz5Wq6GHU8UZJ+49wBPJOVNqFcaGM+kJ3iHnuFt
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225817_019309_BDA8837F 
X-CRM114-Status: GOOD (  12.31  )
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

Inspired by the vendor kernel but adapted to the upstream thermal
driver version.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 447 +++++++++++++++++++++++++++++++
 1 file changed, 447 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 02786fe9891b..cd27966d2e3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -13,6 +13,8 @@
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
 #include <dt-bindings/reset/mt8188-resets.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
 	compatible = "mediatek,mt8188";
@@ -418,6 +420,450 @@ psci {
 		method = "smc";
 	};
 
+	thermal_zones: thermal-zones {
+		cpu-little0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <150>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
+
+			trips {
+				cpu_little0_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_little0_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_little0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_little0_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-little1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <150>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
+
+			trips {
+				cpu_little1_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_little1_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_little1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_little1_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-little2-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <150>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
+
+			trips {
+				cpu_little2_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_little2_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_little2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_little2_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-little3-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <150>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
+
+			trips {
+				cpu_little3_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_little3_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_little3_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_little3_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-big0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
+
+			trips {
+				cpu_big0_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_big0_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_big0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_big0_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu-big1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
+
+			trips {
+				cpu_big1_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_big1_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_big1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_big1_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		apu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_APU>;
+
+			trips {
+				apu_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				apu_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				apu_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_GPU0>;
+
+			trips {
+				gpu_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				gpu_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
+
+			trips {
+				gpu1_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu1_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				gpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		adsp-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_ADSP>;
+
+			trips {
+				soc_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				soc_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		vdo-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_VDO>;
+
+			trips {
+				soc1_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc1_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				soc1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		infra-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_INFRA>;
+
+			trips {
+				soc2_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc2_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				soc2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_CAM1>;
+
+			trips {
+				cam1_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cam1_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cam1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam2-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8188_AP_CAM2>;
+
+			trips {
+				cam2_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cam2_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cam2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
@@ -1322,6 +1768,7 @@ gpu: gpu@13000000 {
 					<&spm MT8188_POWER_DOMAIN_MFG3>,
 					<&spm MT8188_POWER_DOMAIN_MFG4>;
 			power-domain-names = "core0", "core1", "core2";
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 

-- 
2.37.3


