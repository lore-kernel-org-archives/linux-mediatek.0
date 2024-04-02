Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81CCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0TVlPOz8B1vft8FvN3tRV0KsFhjcZo/npqFIylpP5s=; b=xV4gwKL/XgU33KfLNfMlaNMp2m
	8Xy6kOTq704HZOI40xVeD3j61u2TVCp7OV8iZQ4QTN4BnHz37u4qMyy4ofhHDbS6whtd+QmwRO8UX
	HLKZsVj3Y8XmWYFQSP5mUtRz6qaGYBF9+Rhqput3ucgPadOxfq7Fw47M/0jcO2bjHs9WmV5094ShE
	nKM3h2+6206RksmDncmdrfGJVMuHh+yUSUT0r68sVe6/8klZKjd9wicYleN+vXgoMgOK5SjG9n1d7
	nLFTQMoqJbnVmmNwXizcGMQPm3GreALuaMom1VUlHPWh2cfPkieg57gn7eXYHreOjqynDZiknTgep
	0iZ9mWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUuo-00000009aUV-2wc8;
	Tue, 02 Apr 2024 03:34:27 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUul-00000009aTO-3Wnb
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:25 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id F08121DBE4A;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=iaRq8RWDam5/LdFo2wAYpnNoS
	w8NwToip4dllNg1s6Y=; b=tg1VsyFTtXbu3M7WI9btc2ETc+TY3Kt21/ATF0KY5
	wZ9xTJsBBwNrm6wq6OJ1yEoaJSYJUW4qwuzDelNN/Xdct/nJia3M6qNP7mPxuMod
	lDdtmJ1i5TWpyUsxgYMV4i9TS4NKcyFRsEM/8x/9xVnb0qOFludA9fmEBtOfj0+v
	kI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id E6E5E1DBE49;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=X03K292IBHfL26DsED73h4EbbgjYJRN7QvfkRS/DOnM=; b=vIH9qoWe4Us24N56AZlGgHDeapxaknpLSKVSdbZo3YXusPeP0M0xwmZarPU83TQwVrNhCamwnX3AuuRsdCarW6EOBKLgJv7Imgi3gw18nU716buCTYdqt20rr4xnWkWG3k2gVYjOkpiHa0Yhj3A22AyzUx36FKBrXUz+FiodMzw=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 509CA1DBE46;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 3E2D7C1CED2;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 09/15] arm64: dts: mediatek: mt8186: add default thermal zones
Date: Mon,  1 Apr 2024 23:25:43 -0400
Message-ID: <20240402032729.2736685-10-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E55C2C32-F0A1-11EE-B3C1-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203424_059594_3F83DB88 
X-CRM114-Status: GOOD (  11.26  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 236 +++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8186.dtsi
index cef8244007..d466f6323a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -13,6 +13,8 @@
 #include <dt-bindings/power/mt8186-power.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/reset/mt8186-resets.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
=20
 / {
 	compatible =3D "mediatek,mt8186";
@@ -2115,4 +2117,238 @@ larb19: smi@1c10f000 {
 			power-domains =3D <&spm MT8186_POWER_DOMAIN_IPE>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu-little0-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_LITTLE_CPU0>;
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
+			thermal-sensors =3D <&lvts MT8186_LITTLE_CPU1>;
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
+			thermal-sensors =3D <&lvts MT8186_LITTLE_CPU2>;
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
+		cam-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_CAM>;
+
+			trips {
+				cam_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				cam_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		nna-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_NNA>;
+
+			trips {
+				nna_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				nna_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		adsp-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_ADSP>;
+
+			trips {
+				adsp_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				adsp_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		mfg-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_MFG>;
+
+			trips {
+				mfg_alert: trip-alert {
+					temperature =3D <85000>;
+					hysteresis =3D <2000>;
+					type =3D "passive";
+				};
+
+				mfg_crit: trip-crit {
+					temperature =3D <100000>;
+					hysteresis =3D <2000>;
+					type =3D "critical";
+				};
+			};
+		};
+
+		cpu_big0-thermal {
+			polling-delay =3D <1000>;
+			polling-delay-passive =3D <250>;
+			thermal-sensors =3D <&lvts MT8186_BIG_CPU0>;
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
+			thermal-sensors =3D <&lvts MT8186_BIG_CPU1>;
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
+	};
 };
--=20
2.44.0


