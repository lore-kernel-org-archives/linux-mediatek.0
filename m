Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5191DC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUn3qqmzO6D0AmBcABsG3a/w0MTCXJSuS2eYVUnJzg4=; b=Ljha/a+6DCgKrNQZ+vd4NnbAOd
	APr/2810uyY2SXVMfhelTogvZqL+jlq9JblMO1N/GgAnjJqMyQ1dlbPebuyzSooYpq0fI/5pdYMAY
	HmoJdiEY5dXPNrGsh64TZF3XV5RQssYF8ez2F5ygTqoxiiD1tKXsdVSM7Gz7j1O+ogiueaAq7uCMy
	n2S6hE7lQuQvYubGmC7pntf6arN00s+7MPQWlpKyoGHDUTGeR6fBX/pxXaESHSULpV5euAp7OKBF7
	28zD71Rgb8y/uerzQK4RefDBQrjwBJhtfV74X9B2aeXV1tbGZ1KuMYXSd4sU1ZDGGmazOUjZcgK9h
	gQIeu1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKd5-0000000AEgG-43Qp;
	Mon, 18 Mar 2024 21:34:47 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKd1-0000000AEdH-0EP4
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:34:44 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 83E7D235ED;
	Mon, 18 Mar 2024 17:34:42 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=X2sRkyjakE0VEnTnqSb6o38pW
	Zf+n5FfGmDjclnooxc=; b=VaDHW9NtGMN1+1+DrZJCpIkawXgF/ABEzxgtTRUiY
	vZJfKWB97b13pNjufrNJbHl3PEdGxXwD8oztUvcXROShEeTRBfr9UW7BOrGcVzxQ
	q+/tXzbBqYLdnx9Mqe55aqQZBIROoNZLLrkRUw2PyG91MC/xmjL4Too3+1xgNuDL
	wA=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 7A03B235EC;
	Mon, 18 Mar 2024 17:34:42 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=biv2CycJifyejMyHV8LrosOmw/5LZ/RLDnuSuMaU8TY=; b=aPEKY8mftOLrs1AjQVirtdckqclSxv+MuIPA/fnsCuvAR+wvYe2FvIwkL1HihGmqyIHNLU9eZfqqlmG4l7nCfH3/dLyIESCqU7NmwQCIO3y66+NCO7Gf3F36bnOEQqVM61QwQO4tT/wQ9GJd56cUYjPv5Wcum1U/UiMuF1E99lM=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 652AB235E8;
	Mon, 18 Mar 2024 17:34:38 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 0FE60BE2BB0;
	Mon, 18 Mar 2024 17:24:51 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 13/13] arm64: dts: mediatek: mt8188: add default thermal zones
Date: Mon, 18 Mar 2024 17:22:15 -0400
Message-ID: <20240318212428.3843952-14-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: 528EAE3A-E56F-11EE-A361-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_143443_162861_1FE95839 
X-CRM114-Status: GOOD (  12.64  )
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
index 5a3c58a77c..ea90ad4baa 100644
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
+		cluster0-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS1_0>;
+
+			trips {
+				cluster0_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cluster0_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cluster0_alert>;
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
+		cluster1-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS1_1>;
+
+			trips {
+				cluster1_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cluster1_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cluster1_alert>;
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
+		cluster2-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS1_2>;
+
+			trips {
+				cluster2_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cluster2_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cluster2_alert>;
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
+		cluster3-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS1_3>;
+
+			trips {
+				cluster3_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cluster3_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip =3D <&cluster3_alert>;
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
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS2_0>;
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
+			thermal-sensors =3D <&lvts_mcu MT8188_MCU_TS2_1>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS3_1>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS4_0>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS4_1>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS4_2>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS5_0>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS5_1>;
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
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS6_0>;
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
+		cam21-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts_ap MT8188_AP_TS6_1>;
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


