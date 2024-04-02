Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB627CD128D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSax+1r67aUwlWsAEYaVmuknWH6vaAOJ6jRB7WOHe5M=; b=GHCvDHf1/G6iolA1uuWznT+tB3
	30sdMbk0cS7ud1QGgNAs7SG4kdF0ROfyFESBdeg7YFFSAE0kzdyz5+LAiZXJQ+NnUBI7b6NFqf7FK
	3wQVzK0HCmsKaJkSLBZLKB2TZTiDPiU+hXcUpzFEJF2r3dRda+128R0wU+m7h+WQH8u14kYdNxxjE
	vQVGBM9kue/SU+BFsMkucD5lHutl34uMU6YmcGKtEtV4sDsoI2DcTdpm24Jc29bVK5sdxutkwPmPh
	as5jK8ibkVKnPJAre54jcrP6eWh/AsMHqP4FRocnI3hoKuAQ4GS/JmjZVz46C3Yj9qDMC+mhZw75T
	EkXajjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv6-00000009adl-1vCA;
	Tue, 02 Apr 2024 03:34:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv4-00000009acT-0uNI
	for linux-mediatek@bombadil.infradead.org;
	Tue, 02 Apr 2024 03:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hSax+1r67aUwlWsAEYaVmuknWH6vaAOJ6jRB7WOHe5M=; b=XmfuZfOHEowc4juQokB1mibW2r
	qkjUNch1Xv6YH3uGJwb9g9jRnEgBStwyhngqERc7LjUFJo7hU1Rf1IUQNkTahwTLVQvp8NjC+VI0o
	LKzWdg+Wi+z/HlJCHdUS+DPrglIR6nc9BsLWuGHYEmF1fqLOYdRDQpZktkZsr9pypcOvXglWF3ZXu
	/JozYhnE3ZJ1bkMdV8y+3migfCymCaKC5xwW4B16h3HI1hfHisQI9/zdBU08O3gwvLiEAmjxCoW5+
	cd340xFC8imVBJu8sit62KHqQt0HCGNZTCSF2N+4PVNg1KlRmH7njnfNMC6f8qndFq5JNkz7wWCgM
	t4oDKjdQ==;
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUuy-00000003POs-3R2v
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:40 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id A276F250D7;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=YD53FIMSNhmKy6veQFEgq13wF
	F2wke3yYidvl5FoGbQ=; b=Mgxy4P7K6naTNp7hZEcKw9BRF+eeLyH/XjkFjzFXR
	ECIUYF+chM6WnBzHyECwwoh4gNt63iB7ZflHlha2u7F9vfx669mMMV7tW4+BIDps
	jTDYCtntIgz7viKdnhOYpjOfrvAtcVUI4Zlaqvzoq5l+84P2QxQvkLLEND+sknQv
	0E=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 9ACB4250D6;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=HZopFeX8NiLDsAr5t76/L/Cxak+6Mp/JkdbfcBRoQB4=; b=kIOECA8SRxftYCE7MXbRFOaIQpn8BVbB4OWanvn5cuOEo0vFzvhqsKcqLZ21rHFdKUzlBaeLscofb/pYOo8kIVa0eso+LCT/cM4d14ZT6RrSyO5l/Xz+kEdZEKfQ/EohouTfNe4rin9IQYH/xk9+VnzuFoC+bRvZ2qfdbyoMDtU=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 7872C250D3;
	Mon,  1 Apr 2024 23:34:23 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 3B641C1CEDB;
	Mon,  1 Apr 2024 23:27:46 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default thermal zones
Date: Mon,  1 Apr 2024 23:25:49 -0400
Message-ID: <20240402032729.2736685-16-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E60D618C-F0A1-11EE-8A1C-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_043438_033629_8F39D38F 
X-CRM114-Status: GOOD (  11.52  )
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
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 348 +++++++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
index 101c9c9f4b..1101dd1b75 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
 #include <dt-bindings/reset/mt8188-resets.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
=20
 / {
 	compatible =3D "mediatek,mt8188";
@@ -311,6 +313,352 @@ psci {
 		method =3D "smc";
 	};
=20
+	thermal_zones: thermal-zones {
+		cpu-little0-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
+
+			trips {
+				cpu_little0_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_little0_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_little0_alert>;
+					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
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
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
+
+			trips {
+				cpu_little1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_little1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_little1_alert>;
+					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
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
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
+
+			trips {
+				cpu_little2_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_little2_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_little2_alert>;
+					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
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
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
+
+			trips {
+				cpu_little3_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_little3_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_little3_alert>;
+					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu_big0-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_BIG_CPU0>;
+
+			trips {
+				cpu_big0_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_big0_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_big0_alert>;
+					cooling-device =3D <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu_big1-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_BIG_CPU1>;
+
+			trips {
+				cpu_big1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cpu_big1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cpu_big1_alert>;
+					cooling-device =3D <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		apu-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_APU>;
+
+			trips {
+				apu_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				apu_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_GPU1>;
+
+			trips {
+				gpu1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				gpu1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		gpu2-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_GPU2>;
+
+			trips {
+				gpu2_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				gpu2_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		soc1-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_SOC1>;
+
+			trips {
+				soc1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				soc1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		soc2-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_SOC2>;
+
+			trips {
+				soc2_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				soc2_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		soc3-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_SOC3>;
+
+			trips {
+				soc3_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				soc3_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		cam1-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_CAM1>;
+
+			trips {
+				cam1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cam1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		cam2-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_CAM2>;
+
+			trips {
+				cam2_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cam2_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+	};
+
 	timer: timer {
 		compatible =3D "arm,armv8-timer";
 		interrupt-parent =3D <&gic>;
--=20
2.44.0


