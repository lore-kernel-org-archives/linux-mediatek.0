Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A256C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOIDNWrvLuzXO/s8AOThCUhkQmtWjdE1KvUgoN/WDQU=; b=OT9gRzyEpFz5IonH5Q43wRarIp
	/upymQCRaiA2V3nhMwySiFWPQjB0jgImxPeo8swO7LxUPfWW+k1f6d2ZNAZC1GCXrI8136gNozm6D
	R7SXoateNmmtjGa0ydWzWhWYkcl0nX7/JzXUWuDyFfRt9ECHyR06SdSAIbHXpWv0MIBleho5GWx7H
	MD8h3U8hFxcuMaFodsOwQOzPLuOUj0beZWB67DUSvKEAarUff9qSyc5V6H8TDR60HbIszonRbCyzu
	aBrvp47nfKz0zCyfqOXvWYGLc/koV5dsxzrUnPR006a9mNsWa/npvl96DPr6bxEiC1ZlBAYQyppMC
	RcgNtB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnSa-009ERZ-Bf; Sat, 11 Feb 2023 10:50:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnSN-009EPT-UV; Sat, 11 Feb 2023 10:50:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id lu11so21606640ejb.3;
        Sat, 11 Feb 2023 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOIDNWrvLuzXO/s8AOThCUhkQmtWjdE1KvUgoN/WDQU=;
        b=ZAS1zc1RtMcqfpooZhzkwkU/m608/vSGtEQhWwvr4lDHM/QuQhcAPD5NFRvmG9Id6r
         gGkbCxINd9cFwGsHSqrNw7Po2Vb8QuOJ4EHlJnf5qQxJoQ9KzRAb7tgjmSqBytqLeqzf
         WGO2qQmQjgudaIwaQ3d7FfwudvNgj4dncaeMjhilAYY6t4jHd8bUcUzJwO0GpkG2/zhj
         g6gAld8rStNeax0TTYSWItQWISYpol+d4StFl2ncDumt4LcUW3qR8m7WVPx+uYoL9lxT
         0GwZTjJjcET87CvPc12n3yEhv3uQ9kIFU3G9yoNms/JlWLeRFO1xM3/pRMDwrRRCkJwp
         n2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOIDNWrvLuzXO/s8AOThCUhkQmtWjdE1KvUgoN/WDQU=;
        b=CoIfb2RmUA5e5kvBFzIICkff/buPmduMW7LY/T4CGPuFJYIy71v2cLSTC+PE44SG/d
         4W8kMbJAQ4Ds1akTrrVgax9ZR+uKh1yzR/D5NJFu3XxkHxmUDNQHqMhyAIefZrb3w5aV
         6x9rUM4lXKpFVgDfSMmQnzvHNmvv/XQEWlT0ZuMSylfpVX8E2Si+HtLHnQW2JSrtbyIS
         E1QmI78x28TqDqeKPPEHlSIdq0OT5PARyqFHoBOuJHdeUeY9U0C2/0HLHvPM6QSj+on9
         6UXXHf+opts83H6D2IUofdClm/dNoT1KFGfPqYlUP/9IMJIjJJ5NC2FJCfWlPpryAIDm
         4Aww==
X-Gm-Message-State: AO0yUKWQifokSfJug1FbRz1+6v2qax/Hjsgy+OKZrAL3NFqokmUkFi2D
	W+2YiufgnXVW4S5xQse8A7Y=
X-Google-Smtp-Source: AK7set/6Uv4EZ38y8b1ogJQDw5brhIFv3zO5QJAKoNcZhB2A9/JK1h+P7pkxX1u6hbiTdIx6tlJXeg==
X-Received: by 2002:a17:906:49c6:b0:844:d342:3566 with SMTP id w6-20020a17090649c600b00844d3423566mr17952957ejv.22.1676112609434;
        Sat, 11 Feb 2023 02:50:09 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id cb10-20020a0564020b6a00b004ac54d4da22sm1597911edb.71.2023.02.11.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 02:50:09 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH 1/2] mips: dts: align LED node names with dtschema
Date: Sat, 11 Feb 2023 13:49:14 +0300
Message-Id: <20230211104915.116253-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_025012_060001_A91B17E4 
X-CRM114-Status: GOOD (  11.22  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The node names should be generic and DT schema expects certain pattern:

  mt7621-gnubee-gb-pc1.dtb: gpio-leds: 'power', 'system' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../dts/cavium-octeon/dlink_dsr-1000n.dts     | 10 ++++-----
 .../boot/dts/cavium-octeon/dlink_dsr-500n.dts |  6 ++---
 arch/mips/boot/dts/ingenic/ci20.dts           |  8 +++----
 arch/mips/boot/dts/pic32/pic32mzda_sk.dts     |  6 ++---
 .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  8 +++----
 .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  8 +++----
 arch/mips/boot/dts/qca/ar9331_omega.dts       |  2 +-
 arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  8 +++----
 .../ralink/gardena_smart_gateway_mt7688.dts   | 22 +++++++++----------
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  4 ++--
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 12 +++++-----
 11 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
index 2fdb4baad19c..cb460eaf8835 100644
--- a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
+++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
@@ -20,27 +20,27 @@ uart0: serial@1180000000800 {
 	leds {
 		compatible = "gpio-leds";
 
-		usb1 {
+		led-usb1 {
 			label = "usb1";
 			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
 		};
 
-		usb2 {
+		led-usb2 {
 			label = "usb2";
 			gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		led-wps {
 			label = "wps";
 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 		};
 
-		wireless1 {
+		led-wireless1 {
 			label = "5g";
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
 		};
 
-		wireless2 {
+		led-wireless2 {
 			label = "2.4g";
 			gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
index e04237281b41..c55845fd84ca 100644
--- a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
+++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-500n.dts
@@ -21,15 +21,15 @@ uart0: serial@1180000000800 {
 	leds {
 		compatible = "gpio-leds";
 
-		usb {
+		led-usb {
 			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
 		};
 
-		wps {
+		led-wps {
 			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 		};
 
-		wireless {
+		led-wireless {
 			label = "2.4g";
 			gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index f38c39572a9e..3483ae0c05f5 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -42,25 +42,25 @@ switch {
 	leds {
 		compatible = "gpio-leds";
 
-		led0 {
+		led-0 {
 			label = "ci20:red:led0";
 			gpios = <&gpc 3 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "none";
 		};
 
-		led1 {
+		led-1 {
 			label = "ci20:red:led1";
 			gpios = <&gpc 2 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "nand-disk";
 		};
 
-		led2 {
+		led-2 {
 			label = "ci20:red:led2";
 			gpios = <&gpc 1 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu1";
 		};
 
-		led3 {
+		led-3 {
 			label = "ci20:red:led3";
 			gpios = <&gpc 0 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "cpu0";
diff --git a/arch/mips/boot/dts/pic32/pic32mzda_sk.dts b/arch/mips/boot/dts/pic32/pic32mzda_sk.dts
index ab70637bbec5..b1c5ffdb33fc 100644
--- a/arch/mips/boot/dts/pic32/pic32mzda_sk.dts
+++ b/arch/mips/boot/dts/pic32/pic32mzda_sk.dts
@@ -28,19 +28,19 @@ leds0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_leds_s0>;
 
-		led@1 {
+		led-1 {
 			label = "pic32mzda_sk:red:led1";
 			gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		led@2 {
+		led-2 {
 			label = "pic32mzda_sk:yellow:led2";
 			gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
 		};
 
-		led@3 {
+		led-3 {
 			label = "pic32mzda_sk:green:led3";
 			gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index f3dff4009ab5..f894fe17816b 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -41,23 +41,23 @@ button-1 {
 
 	leds {
 		compatible = "gpio-leds";
-		led@0 {
+		led-0 {
 			label = "tp-link:green:usb";
 			gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 		};
 
-		led@1 {
+		led-1 {
 			label = "tp-link:green:system";
 			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		led@2 {
+		led-2 {
 			label = "tp-link:green:qss";
 			gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
 		};
 
-		led@3 {
+		led-3 {
 			label = "tp-link:green:wlan";
 			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
index 40e4c5da0e65..7affa58d4fa6 100644
--- a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
+++ b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
@@ -22,25 +22,25 @@ memory@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		wlan {
+		led-wlan {
 			label = "dragino2:red:wlan";
 			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		lan {
+		led-lan {
 			label = "dragino2:red:lan";
 			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
-		wan {
+		led-wan {
 			label = "dragino2:red:wan";
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
-		system {
+		led-system {
 			label = "dragino2:red:system";
 			gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/mips/boot/dts/qca/ar9331_omega.dts b/arch/mips/boot/dts/qca/ar9331_omega.dts
index ed184d861d5f..8904aa917a6e 100644
--- a/arch/mips/boot/dts/qca/ar9331_omega.dts
+++ b/arch/mips/boot/dts/qca/ar9331_omega.dts
@@ -22,7 +22,7 @@ memory@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		system {
+		led-system {
 			label = "onion:amber:system";
 			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
 			default-state = "off";
diff --git a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
index 5f424c2cd781..10b9759228b7 100644
--- a/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
+++ b/arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts
@@ -22,25 +22,25 @@ memory@0 {
 	leds {
 		compatible = "gpio-leds";
 
-		wlan {
+		led-wlan {
 			label = "tp-link:green:wlan";
 			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		lan {
+		led-lan {
 			label = "tp-link:green:lan";
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
-		wps {
+		led-wps {
 			label = "tp-link:green:wps";
 			gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
-		led3g {
+		led-led3g {
 			label = "tp-link:green:3g";
 			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
 			default-state = "off";
diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 179558161f85..18107ca0a06b 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -47,67 +47,67 @@ leds {
 		 * (see below). So we can't include it in this LED node.
 		 */
 
-		power_blue {
+		led-power-blue {
 			label = "smartgw:power:blue";
 			gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		power_green {
+		led-power-green {
 			label = "smartgw:power:green";
 			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		power_red {
+		led-power-red {
 			label = "smartgw:power:red";
 			gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		radio_blue {
+		led-radio-blue {
 			label = "smartgw:radio:blue";
 			gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		radio_green {
+		led-radio-green {
 			label = "smartgw:radio:green";
 			gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		radio_red {
+		led-radio-red {
 			label = "smartgw:radio:red";
 			gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		internet_blue {
+		led-internet-blue {
 			label = "smartgw:internet:blue";
 			gpios = <&gpio 26 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		internet_green {
+		led-internet-green {
 			label = "smartgw:internet:green";
 			gpios = <&gpio 27 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		internet_red {
+		led-internet-red {
 			label = "smartgw:internet:red";
 			gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		ethernet_link {
+		led-ethernet-link {
 			label = "smartgw:eth:link";
 			gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "netdev";
 		};
 
-		ethernet_activity {
+		led-ethernet-activity {
 			label = "smartgw:eth:act";
 			gpios = <&gpio 43 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "netdev";
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 0128bd8fa7ed..4314aee97e18 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -33,13 +33,13 @@ key-reset {
 	gpio-leds {
 		compatible = "gpio-leds";
 
-		power {
+		led-power {
 			label = "green:power";
 			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-on";
 		};
 
-		system {
+		led-system {
 			label = "green:system";
 			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "disk-activity";
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index e31417569e09..3ebbf933f644 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -33,33 +33,33 @@ key-reset {
 	gpio-leds {
 		compatible = "gpio-leds";
 
-		ethblack-green {
+		led-ethblack-green {
 			label = "green:ethblack";
 			gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
 		};
 
-		ethblue-green {
+		led-ethblue-green {
 			label = "green:ethblue";
 			gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
 		};
 
-		ethyellow-green {
+		led-ethyellow-green {
 			label = "green:ethyellow";
 			gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
 		};
 
-		ethyellow-orange {
+		led-ethyellow-orange {
 			label = "orange:ethyellow";
 			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
 		};
 
-		power {
+		led-power {
 			label = "green:power";
 			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "default-on";
 		};
 
-		system {
+		led-system {
 			label = "green:system";
 			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "disk-activity";
-- 
2.37.2


