Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FAC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTThKJu6zcjqAVlsbBA/iqJFx1UIib2KrBmXVWycIGc=; b=ydi5SqYQcwRTbzAyDd1cMjGspV
	Wh11NucsI/nBVl4OEE8Pl2r9QoonOBjEaQYs0M4ekTxQRERFpWyfRvaFu2uBes7jt9QQ2t6VHe61J
	3OzU+h3fo83iS1VQe/kZePleterFVXhqIWI9rYrWSxdHEJqbNXqCgSPfpJe6RGbErYTXLPrGZKdFn
	mIJmcuZeylSC28YeQYEEYiuWnVWXVa2iutyxmL6FlEhJjYn4jPaK33+JlvRWt30FNSGsgYlulyUc4
	dM531GmcHSDcL3GwZZLGt2A9vVQFVbPciUxNNbTeDyXWDuoA3SXr8U5NdpRPu7SXemlYuLLk4kVgF
	UiIaEAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaHD-001YqS-LO; Tue, 07 Mar 2023 16:34:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaGa-001YYk-Ou
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 16:34:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso7572035wms.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678206857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTThKJu6zcjqAVlsbBA/iqJFx1UIib2KrBmXVWycIGc=;
        b=OT2VxDKfiAeO66n7+C77FwXuRNIzPwDlp7TqJeznJqRhRIQv/vpbbnJZfVDRGomfA+
         lpyC5Ud7i9X1xl3e7DrzoTOA9GQ/i9ImOU4zEYoEB+ynp8ZlhzKPDLPfk/wSYwheMHCA
         Ecq0I2ArAU86EHr7KKVYG+A6pXwWLD8ub6GpnSt0uelpIZOdFMmrVny3JVQLlgWrcL5P
         AmePt6hrIecGKK5jWMgmFxR67Cv98WlQ/hkzv/4NFmGo9B6ntVVmzi2hWZn0CTbv7nJ0
         O7shFGT3m4xcltUSt62mXbPQCLwO8ozUbbfwUOzRQ14uIXhFW+OtM4qdffs2R74TJhdK
         aRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTThKJu6zcjqAVlsbBA/iqJFx1UIib2KrBmXVWycIGc=;
        b=ZvPByQsx7f62rTBJ5IoqlXKzfcoHz3QCJ1cV3i4tUeHsXGTWJsBLYgS8VYhLO6HlHY
         ny+OlwfxGbkxP2hDQW9q+2x+tw6CkSEQtu/2Ba5nz11y4TTrTF5P5ckcYRfYH9hFS/vL
         O08GJ/jR7lAHmVHW23gsT+fIKCEUFjWS72j3tnhk0cDukH4ycX0ldYMyJ8eqy0QSd6II
         ICAVlCDTUciMwMBxyY3q+AvfA7FFC0xaQRzd9h2tcUR0WhCCgl/G34hCDZzcWEzRWRAc
         AJzUme+NTwNXddRc4rHWcuXPRR91/V13VQFXaPVnuFn2uUiw7M/HVijHSZqbOHSrf58z
         J3jQ==
X-Gm-Message-State: AO0yUKVam9NfmTky5K5bOBrXIkOu5MqKeeQXf0xS1oasvF+BIVKaLiaM
	+w3rv8oxbTyqu0JFePk+gOPBdA==
X-Google-Smtp-Source: AK7set9PG/UuhJMg814YC4BXFrBxO1E2AZ4O3ODXYQdkXvw9zAlKUPKe6AoFCcQYaQE0dvN21xIsbA==
X-Received: by 2002:a05:600c:a48:b0:3da:acb1:2f09 with SMTP id c8-20020a05600c0a4800b003daacb12f09mr14003534wmq.19.1678206857478;
        Tue, 07 Mar 2023 08:34:17 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d49c1000000b002c563b124basm12778117wrs.103.2023.03.07.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:34:17 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8192: Add thermal zones and thermal nodes
Date: Tue,  7 Mar 2023 17:34:12 +0100
Message-Id: <20230307163413.143334-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307163413.143334-1-bchihi@baylibre.com>
References: <20230307163413.143334-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_083420_821271_22BE0B7E 
X-CRM114-Status: GOOD (  11.05  )
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

Add thermal zones and thermal nodes for the mt8192.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 263 +++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 424fc89cc6f7..45c3d65a118a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt8192-power.h>
 #include <dt-bindings/reset/mt8192-resets.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -620,6 +621,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8192-lvts-ap";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_e_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -946,6 +958,17 @@ nor_flash: spi@11234000 {
 			status = "disabled";
 		};
 
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8192-lvts-mcu";
+			reg = <0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+			nvmem-cells = <&lvts_e_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		efuse: efuse@11c10000 {
 			compatible = "mediatek,mt8192-efuse", "mediatek,efuse";
 			reg = <0 0x11c10000 0 0x1000>;
@@ -1650,4 +1673,244 @@ larb2: larb@1f002000 {
 			power-domains = <&spm MT8192_POWER_DOMAIN_MDP>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
+
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
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
+
+			trips {
+				cpu7_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_VPU0>;
+
+			trips {
+				vpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_VPU1>;
+
+			trips {
+				vpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_GPU0>;
+
+			trips {
+				gpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_GPU1>;
+
+			trips {
+				gpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		infra-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_INFRA>;
+
+			trips {
+				infra_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_CAM>;
+
+			trips {
+				cam_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD0>;
+
+			trips {
+				md0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD1>;
+
+			trips {
+				md1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md2-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD2>;
+
+			trips {
+				md2_crit: trip-crit {
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


