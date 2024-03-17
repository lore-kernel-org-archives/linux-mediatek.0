Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957A5C54E68
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQKJEwfEplP6JjgBfQ2Wo7rsgECn3udsg3gjV1fc2yY=; b=yzT/hoajk5KIclBkmHjLSES6nQ
	kvqOTHLNycKFgmfNffzxiPDXFqBzR47uMEDF8/6XshQnzyyfmOVVKKsS9VlFmKDk1A//xe8oi+ibR
	Yrez+gnM9tmQ+yYyx8CsNUyGl4RAmL0rP+jhKIVZlxhbt3IYoXw9Y73F5QrgFaHnvVSZ5KTRWH2iH
	nBtrlyhqfSqm4iClJDQIRAyktTaFCtMCXC6IVQvps3n033bPcN2mpqblOpPb9ePlhAIbzTaJwPrxW
	9lHNfgspVzmOBIdnetuKasUO/q1H9nRlNQ7MWUsTY0AC5l1a6e/wWeN8l0SQASvHCFHPBy47sQvAw
	v4TIXJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3d-00000006el3-3lRB;
	Sun, 17 Mar 2024 22:32:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz3I-00000006eUg-43gF;
	Sun, 17 Mar 2024 22:32:26 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-513e4dd6ca4so737123e87.0;
        Sun, 17 Mar 2024 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710714742; x=1711319542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQKJEwfEplP6JjgBfQ2Wo7rsgECn3udsg3gjV1fc2yY=;
        b=a2B8oVD+T9JEWs8JQvlncb5YIibHlHPvnZ+IAyxPGNiQdCyj6RA5j0Tjr+lQzLTYk8
         f0owasGDuzwA+QMREw7qKQOw2h1M++hWLrwx9ZPRKpcQAsWsCVB7QEG93EXGWOHuu0fa
         AvpEDCsoMCtMuZ/CrDSFrJ7axHYulNNEp5xlqCwgv+kRJNO2Z4dbZBi4xvQMY6YzK8If
         W/Q+YDKvI8xfsKmr5CaAjixLHIRPSNAEAy13cB/6pvFkEQ2p9SM+MLWguTkNZevp+QHY
         ROfPQnq8bgAinTd8v+koVEeBG817uJHQDDOYps+rWKmRA6u/qS8ghM0JYMODopLD1prz
         T7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710714742; x=1711319542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQKJEwfEplP6JjgBfQ2Wo7rsgECn3udsg3gjV1fc2yY=;
        b=ZU0WDSSS/EbvMqU7/QBji+u0jAKWjKVSB0uXQ37DxxRPhiL0+I80QqfCaGXDSF48FR
         S2TPI7FfW7peMmkgzM9gsZ0SAbVbHhw1MpEKaMC4l4qv4Ev0zCl1QwA3yeJ6sRvX1h69
         ztvI1GZlAF7qRw4UD7zTECU0ho2YbYKLpVQV1Bn0Vnqhxf4LKuKeoY3pOFu9IM2u32rC
         GMDpM5mqauXIae3nRqrFT9EjThM5TpvGmwfvaENxQO34GeBsUiLhw0tNOdUjF1Rr+a6t
         DOlLBnAEjnnWSZmN9Iw9qBw7qgEgWaVRGQltGlmD6RCTIq9lgJWh26Fw/OaFWSDwNPUd
         rQpg==
X-Forwarded-Encrypted: i=1; AJvYcCWnWpJHMbMT1fKpPrExC1wZq8Nk+XbFeyROt91gsE+w3PRPmBUAab+z6lL/hzXCMtRSHVBDX69vf1O+Y66SxlTfjLIdD+MUR0WW3PkBFaLcXCXaQp1cYghsjZtVbvmkgPxPuP+D0YIKG9phZIETT0pTd/Zz2suzZ5w=
X-Gm-Message-State: AOJu0Yz3WO9MVQzii7m0NCSpq1vZSRqI1hMy3CrE9MQjivyunPmChAD6
	Bsw6RImQO1SNInwN6WPd/3lqQXMFk+SG20j39HmdVra/c4uKg0cr
X-Google-Smtp-Source: AGHT+IEwNc4ima+GSWJaUtWXJEWy0YYhhPyRNlX/kRbMLWlU4kdKjBgpLrJ6aPAuwYLXcwpcIHprDQ==
X-Received: by 2002:ac2:4992:0:b0:513:d827:89e1 with SMTP id f18-20020ac24992000000b00513d82789e1mr3167796lfl.26.1710714742102;
        Sun, 17 Mar 2024 15:32:22 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x5-20020ac259c5000000b0051322c11100sm1366981lfn.221.2024.03.17.15.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:32:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
Date: Sun, 17 Mar 2024 23:32:06 +0100
Message-Id: <20240317223206.22033-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240317223206.22033-1-zajec5@gmail.com>
References: <20240317223206.22033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_153225_093374_30D44634 
X-CRM114-Status: GOOD (  13.60  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router. It
has 256 MiB of RAM, some LEDs & buttons and (not described yet) 4
Ethernet ports.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Reorder properties
    Describe online LED
V3: Use LED_FUNCTION_WAN_ONLINE (present in torvalds/linux.git)

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 37b4ca3a87c9..96da4ad640aa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
new file mode 100644
index 000000000000..54101cc08a25
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+#include "mt7981b.dtsi"
+
+/ {
+	compatible = "cudy,wr3000-v1", "mediatek,mt7981b";
+	model = "Cudy WR3000 V1";
+
+	memory@40000000 {
+		reg = <0 0x40000000 0 0x10000000>;
+		device_type = "memory";
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-wps {
+			label = "WPS";
+			gpios = <&pio 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WPS_BUTTON>;
+		};
+
+		key-reset {
+			label = "RESET";
+			gpios = <&pio 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_WAN;
+			gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_WLAN_2GHZ;
+			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_WLAN_5GHZ;
+			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
+		};
+
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_WAN_ONLINE;
+			gpios = <&pio 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.35.3


