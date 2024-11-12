Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6CD41D55
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 05:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLuQfhssIlYGR5o1gb9fHia6gSq18YEO9t8QMEHdmVg=; b=NASj8KlR/jR9RnR2CcPhmjwqWn
	NXtLjsGmMQluVZYw5vmfER/oR+uXuBmdSDllV1Y4SV1AIHAksjjno06eH8cJ3iaW9TSheaHKlC6jI
	FbUgV2+LSt0taq5q0+R2Z2ZyCYapYeTHqM3s2kNZ6Ko8s5ZxhloxiJgpoVK7ZvCfyBMDs/hvFaSts
	FzDf6bC7FrqdPK8TNx8ARRooO9B4gtKvzmwekzvJOGmQGy5GodN8EgJYTCSbFcjseWpl59ZIevPCU
	usLv7jGPZN+Ll6zj9df/myWiZsxA8O5MT/Y0GZZJe+5RpKCTrW8+U7cdJNcN92K88rxkzXM05HaTk
	qVQtxSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM7-00000002F5N-18Nd;
	Tue, 12 Nov 2024 05:22:23 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjM1-00000002F2k-3czZ
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 05:22:20 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B80A011401D5;
	Tue, 12 Nov 2024 00:22:15 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-11.internal (MEProxy); Tue, 12 Nov 2024 00:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=2016-12.pbsmtp; t=1731388935;
	 x=1731475335; bh=HLuQfhssIlYGR5o1gb9fHia6gSq18YEO9t8QMEHdmVg=; b=
	2DKJiYYPGmrbtpRKl8RDvFwQ3fw9MeWuIE/dXFaImFBP/HrmwFRSR/Ae81dAJhqF
	taCustXegIQgQKFU8YHksTUcyTz414JQJiC7DZcQefITVLlF8p8rlqpYmmZLeCdO
	50tD1Z+3D8uUns7TbM8hPnTIBByk+RV9++I2iFf8Qgg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1731388935; x=
	1731475335; bh=HLuQfhssIlYGR5o1gb9fHia6gSq18YEO9t8QMEHdmVg=; b=T
	XcYxnI5cthvzdcE/KZOjJqfoBSv4W1lBhsB9LDCiLpUSUOnpfnk8T2JU/1nCmZn2
	AD8e/VrdiLyjApCs7XjivY/jJs96zRvw6NQY7NloTu/Fcv+fvHQdcuSsz7qMir1l
	QPYMMKlLYYsOMJcoLj8Ziv9SR6WAKoS3IWysNzYObPWKa7xXyWaEXy5s6KLlOwVe
	3nzsmh+OLP5MdVH/ixVxr/W2dMm55S0XIpthBZqCxeIMYIVZ5fd1YH+Iomk0sElo
	jDhrfwOjncmysDtHNgu12sK82WLUUWXpgPhZTPj5O57txWiZX5TB8ZqoizUkApiG
	gcL/H5ePXWgk1HfaYHuig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1731388935; x=1731475335; bh=H
	LuQfhssIlYGR5o1gb9fHia6gSq18YEO9t8QMEHdmVg=; b=dZS5LbI1X8hk3kWl4
	2gU5FChpYhO9T6WLBHFIQYVO1wNcqqeXtuqjOv0+2xaMz4IEmifWHkvlKs+q5qXZ
	EHgTWekQDXOpSDyJbI8DKrIMDDl9ADYWTJuqJ4cIdcugjdCMw/lSLB+Ri+XIGse3
	jAa2AZEn3VopOFs1fXMvr0UE+0O8CNjbVViR4LEcSl7rBStCWJyj1IsCBgH4UNlr
	niUA4qBgmP5u0xm2hZx6jPhsbpbGmO/kAq+LBQEueydSF2pZRvHBl7WhoNMVLthd
	DVLMJNuDC07lR0FCHy+iHXIDDt+yW/KWXEDLq8bv20o3WrKISHGDZJbXpUoVntS8
	p0/LA==
X-ME-Sender: <xms:B-YyZyLIB-HcBLC-mdBDF15TDeUmE1pbsVYE9d0PG-pKcPLUif4Zpg>
    <xme:B-YyZ6LebBE7VOo4EfXrEwPWcJ1gcItds7Bke0s897znPS6Hgb1YOnLySUNXLo-NO
    73Lsv9sFm0HkQq5U8s>
X-ME-Received: <xmr:B-YyZyuvGOwJbvxysvMGDai6vMv4teBEb7krXYfXQdsrneYVAb5LQtP3G7sPAhXxI3Zn6VBv7t0iqetRG-e8oPVnYrjmg7eFcdRiG5-mu7E8DcCD3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpedtjeeuieeiheeiueffuddvffelheekleegkedukeef
    fffhudffudegvdetiefhteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprggsrghilhhonhessggrhihlih
    gsrhgvrdgtohhmpdhrtghpthhtohepnhhpihhtrhgvsegsrgihlhhisghrvgdrtghomhdp
    rhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnh
    hivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhpmhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:B-YyZ3ajar4TshDoxtJArRYiwBBem9KICO51ISolLRk7lgYwYeKiOg>
    <xmx:B-YyZ5ZhTyMYwI75HNJ3JhslLZebVvyjupNQ_KcsbhcIXfz5djEEGw>
    <xmx:B-YyZzDtp-Uf45ditY44WFt1xZYyBJpbW-qGaJ7JW-BxzaspSGRnTA>
    <xmx:B-YyZ_audmJjjlvJmBnpF6hstOc-MVjlvVFbSp4SinVEa9VQmCne-A>
    <xmx:B-YyZ7mN55x_kHHLgI_1qAowvGBGVA14JoVer6-hKSx2K89jYYxDIeiv>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 00:22:15 -0500 (EST)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 4AB00ECB803;
	Tue, 12 Nov 2024 00:22:14 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nicolas Pitre <npitre@baylibre.com>,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 5/5] ARM64: mt8195: Use thermal aggregation for big and little cpu
Date: Tue, 12 Nov 2024 00:19:42 -0500
Message-ID: <20241112052211.3087348-6-nico@fluxnic.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112052211.3087348-1-nico@fluxnic.net>
References: <20241112052211.3087348-1-nico@fluxnic.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_212218_246435_5D5BEACC 
X-CRM114-Status: UNSURE (   9.71  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alexandre Bailon <abailon@baylibre.com>

This uses the thermal aggregation for the mt8195 to get the maximal
temperature of big and little cpu clusters.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 210 +++--------------------
 1 file changed, 25 insertions(+), 185 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index e89ba384c4..a75a56f67e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3601,50 +3601,30 @@ dp_tx: dp-tx@1c600000 {
 	};
 
 	thermal_zones: thermal-zones {
-		cpu0-thermal {
+		cpu-little {
 			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>,
+					  <&lvts_mcu MT8195_MCU_LITTLE_CPU1>,
+					  <&lvts_mcu MT8195_MCU_LITTLE_CPU2>,
+					  <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu0_alert: trip-alert {
-					temperature = <85000>;
+				cpu_little_threshold: trip-point {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu0_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu0_alert>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu1-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU1>;
-
-			trips {
-				cpu1_alert: trip-alert {
+				cpu_little_target: target {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu1_crit: trip-crit {
-					temperature = <100000>;
+				cpu_little_soc_max_crit: soc-max-crit {
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3652,7 +3632,7 @@ cpu1_crit: trip-crit {
 
 			cooling-maps {
 				map0 {
-					trip = <&cpu1_alert>;
+					trip = <&cpu_little_target>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -3661,170 +3641,30 @@ map0 {
 			};
 		};
 
-		cpu2-thermal {
+		cpu-big {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU2>;
+			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>,
+					  <&lvts_mcu MT8195_MCU_BIG_CPU1>,
+					  <&lvts_mcu MT8195_MCU_BIG_CPU2>,
+					  <&lvts_mcu MT8195_MCU_BIG_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu2_alert: trip-alert {
-					temperature = <85000>;
+				cpu_big_threshold: trip-point {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu2_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu2_alert>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu3-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
-
-			trips {
-				cpu3_alert: trip-alert {
-					temperature = <85000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu3_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu3_alert>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu4-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>;
-
-			trips {
-				cpu4_alert: trip-alert {
+				cpu_big_target: target {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu4_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu4_alert>;
-					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu5-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU1>;
-
-			trips {
-				cpu5_alert: trip-alert {
-					temperature = <85000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu5_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu5_alert>;
-					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu6-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU2>;
-
-			trips {
-				cpu6_alert: trip-alert {
-					temperature = <85000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu6_crit: trip-crit {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = <&cpu6_alert>;
-					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				};
-			};
-		};
-
-		cpu7-thermal {
-			polling-delay = <1000>;
-			polling-delay-passive = <250>;
-			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU3>;
-
-			trips {
-				cpu7_alert: trip-alert {
-					temperature = <85000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				cpu7_crit: trip-crit {
-					temperature = <100000>;
+				cpu_big_soc_max_crit: soc-max-crit {
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3832,7 +3672,7 @@ cpu7_crit: trip-crit {
 
 			cooling-maps {
 				map0 {
-					trip = <&cpu7_alert>;
+					trip = <&cpu_big_target>;
 					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-- 
2.47.0


