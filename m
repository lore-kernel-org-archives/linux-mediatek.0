Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956BFC27C44
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH/Fg2Ib1WNtveytiPiMO6OnHe/f0VN621Z3OJJZHZg=; b=O4/f9Qv2YQcvQkLlhBRTK2fU2G
	lDur3jz9pMbF11nNatoupFt412txACOXmZswsVLkXxKeDPGYa+lraHkUeqR1LXDR3JE+Xz9EqFO/+
	OZgqnVC7ecj+boDcW3qMx2YXH3Od2ZayvnI1RIZFRXWyj2F59THf8vQxU+QLSIIBzQ3+lq3sNOuso
	UsSCGoITzKZMx57NKOACvPUHkdz7yZg1X9EaKl8dWW5nonqipOhGKvcMWsboCoS+lNT6FU4X1S5vN
	Xn2N0AJT3q38eDZy0f6Ef/tBJBfTJnhSfbC6o5md4KeEe6H1PYoXmiiuYI+6nNfqUg9jnwHIW7S+M
	7vGQKkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5Hb-0000000GQS9-3gEN;
	Mon, 03 Jun 2024 10:51:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE5HQ-0000000GQHC-17FA
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 10:51:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso29364095e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717411865; x=1718016665; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH/Fg2Ib1WNtveytiPiMO6OnHe/f0VN621Z3OJJZHZg=;
        b=NM4lLIP0K+iWKo7ZGmNIV0Rh/qJ8eIBtJsiVoGL9RmeJp0zwb9g7D1rCifSAIhOWv8
         DZyJUBLKv8nkLPe9jZADgZVjndJBlmQytXinWR5lrtSbHyDorKfYRi1cTs6JWz+K+XXj
         4yCJKcH4mmENk8UAnI2m1vu0vEevIGI4UvLmhQ8evGFMi/4xrVBgo0FmGDwjsmMG07A+
         XUopTR11BIYrrf5P5lRFsyfVdNmRzeVvOp3knb3GIHY+B7a4DE+izAChY8JT8XpcaIhW
         rOZvPaxV8nCH4y7B2WOFUTciaF2MYy7RFeHHithW9oeAiOLaYgG0aruBy1tKWhza32pg
         r9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411865; x=1718016665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH/Fg2Ib1WNtveytiPiMO6OnHe/f0VN621Z3OJJZHZg=;
        b=g2O846JofJtXwDWd87M9ER4BQvKjWAh0b5dHsyKmUGvsRzkoWnlXoVW2ckBdRy87es
         6jAj6J1LkR90nZZYtRnAe5inpPjwJejKeJWC/Z4KGsRje9k6PtJ/COoZvOXQggEPi6We
         7j8Co6GbgfeCQEAu3sXX3qtrlakWHk08TfXGn9pPQu4aeMBrfAcUUTayPl/3bO5y5ZVL
         e9flEHZjhgWecN4LcSJDjzdZYxrHIpt4ttJtMJDPXln2RrKF1g20/I0qc5thPmqh4CSJ
         O6QCPJVzHnqXihsWNAeWvxwJgZKhcZdpjbpDCREYDrWDEBGv/Zjw1a8G15fpOLuHDusL
         sdhA==
X-Forwarded-Encrypted: i=1; AJvYcCU1MAG4a0FAZck0SsS3qTPlwzw7Td5whiDYl0VWu4TEr2ZSsQIYq/yCQsIUSq+T4I2soHa+3a91RO443siXxC+zqPkL+xCmzw5KSGbC7oJfIVlg
X-Gm-Message-State: AOJu0YxPLarkd9fhQf3zbeye5enMSyu6DnecreiLhG45K7o7TEA22oA+
	JPM2kjXskyNpmksc8uUtmeowO5w+pEq+6RL0mFye8bo2hzIlG2zwYxIWSa7oqD8=
X-Google-Smtp-Source: AGHT+IFg05hUJ+UhR1WuW3a3UOq5pjw9Flrk4uLNqvG+ay3rTDzn0O/Z7Iw1iLXiw14U2aWWNr+jUQ==
X-Received: by 2002:a05:600c:5012:b0:418:f991:8ad4 with SMTP id 5b1f17b1804b1-4212e047519mr62376905e9.6.1717411865666;
        Mon, 03 Jun 2024 03:51:05 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm95372535e9.19.2024.06.03.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:51:05 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 12:50:51 +0200
Subject: [PATCH v7 4/6] arm64: dts: mediatek: mt8186: add default thermal
 zones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-mt818x-dtsi-v7-4-8c8e3c7a3643@baylibre.com>
References: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
In-Reply-To: <20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717411855; l=7860;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=lPgsulGv9GpCiinxcEjh9k1yG/tfMpaueb3shauQV5g=;
 b=p+SoN5gmJzAKZ6pn3yzDgBwHeGquM4KfP3Y+wTQCNv9PggaHPFLkV0/uxu/EfpITVJw2EB6l9
 8crXgGllKsrCPdaxkmqgGmxYdoLcEYENs0/TOs2DxoloQUdTpDp0czR
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_035108_381376_34D1FEB7 
X-CRM114-Status: GOOD (  11.13  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 297 +++++++++++++++++++++++++++++++
 1 file changed, 297 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index caec83f5eece..95fe5a05f0d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -13,6 +13,8 @@
 #include <dt-bindings/power/mt8186-power.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/reset/mt8186-resets.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
 	compatible = "mediatek,mt8186";
@@ -2197,4 +2199,299 @@ larb19: smi@1c10f000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu-little0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <150>;
+			thermal-sensors = <&lvts MT8186_LITTLE_CPU0>;
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
+			thermal-sensors = <&lvts MT8186_LITTLE_CPU1>;
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
+			thermal-sensors = <&lvts MT8186_LITTLE_CPU2>;
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
+		cam-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts MT8186_CAM>;
+
+			trips {
+				cam_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cam_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cam_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nna-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts MT8186_NNA>;
+
+			trips {
+				nna_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				nna_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				nna_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		adsp-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts MT8186_ADSP>;
+
+			trips {
+				adsp_alert0: trip-alert0 {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				adsp_alert1: trip-alert1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				adsp_crit: trip-crit {
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
+			thermal-sensors = <&lvts MT8186_GPU>;
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
+		cpu-big0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&lvts MT8186_BIG_CPU0>;
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
+			thermal-sensors = <&lvts MT8186_BIG_CPU1>;
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
+	};
 };

-- 
2.37.3


