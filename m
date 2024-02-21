Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9B4C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbLgMoZR4t08q5k+O843alwk/f3OePOmG2WLruO1CqU=; b=wm6dZACxr9quSV1DFr+BM2hHjt
	xcRBEkpbXqHn5uWPVmnAst25PiG9FaWVPMeTeCVDcFfkde+Ljwy7zSxYl9mDZ3O10LUWST9QtQUI8
	MhG/9sl5R9QwFVcucO2zwHNRXYvCL/6P2NRMYfjUNQcvGC8nb8tPHgL9jiIN5XC7Zvqxg8ETMBHWE
	jqzEKBUYRd5/ORs/VWrjUFRLWAGrtgYBr8Mke/WnVnGdZusxtnX6I/mTQZeJVYM/I8DhIEQLtrlOW
	mzdN8rGBrMsgUnR1wu0dR5s/msFvfuE0GtQheAfwTffe3zgRG7QphJt5d3oiOUNqoQSW6On93iZHj
	EDgmVwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9p-0000000HW1j-4Aa4;
	Wed, 21 Feb 2024 07:36:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9H-0000000HVeC-42rC;
	Wed, 21 Feb 2024 07:36:13 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d228a132acso54348091fa.0;
        Tue, 20 Feb 2024 23:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500970; x=1709105770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbLgMoZR4t08q5k+O843alwk/f3OePOmG2WLruO1CqU=;
        b=j4mDRYRQWAUH6W+hKt8K1dr8QNluvAV8lSS5dfvKp9Atj0m86SqfAhZi6kMIQ+dG0t
         7nDAPVYUKX1jsy9ndNR4dtEVbCu3lQ0uYKV/3JEISfJSWezAOjA4PNDPkrBt+xKqUN5a
         nba6FaY35dVc3SAMz8Hy+caYqYBXYn2SYpDsYgtxPscLzQywBVte29NaT4MAhMEtcoUS
         l4JMUmxL2YtSQQGsbXDhPwgMB+V25rlPKhvc9kJLO/opEAU9RYcpfGDkQV/LNpNKVsWc
         hkgVQXUSlxlpXKB6VKUjd/QweFKlKndZd+yWh6vEZVRk5mq24n42J9RyTdYz5jkTLS46
         luUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500970; x=1709105770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbLgMoZR4t08q5k+O843alwk/f3OePOmG2WLruO1CqU=;
        b=b2U5SBc5F/sy7pRHgrtPJqL/1FCyEduNbLht3lWoIL6+kgdNjzTx/qUzR4MtZEkTTQ
         2IP3Aum2oEdRgw9aa+EhBV2+0Bxbs3KFOVRVXAmRYq486/H2dy5oijeDlHs5hBpEoCl4
         zT5/mPI8XoAsnDgHGhYbcRRQcA48VM9vhl6cxn2SNtqVSx6ZDkAn59NUlf7QJ+1vPWvy
         h7fpFPJUKHMiZaX4bqqeqgE6wMDD2/eaNfRfdGnmr8sN7KXR0E9M0dB24jdR8JpeOUpn
         glhURmLqksp0hrI3bPBcPMVVgPzy0qBZ7w/QAK8EUmCfk7kwKarTCG5D8SGHNfCiZBiV
         yJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWva0ht1tI0epdKlyiu3SS9hsCbl6s+RFoqLkorQbUKKixpupcgqGsOS7UZMPmFVr8zmDawa0pcQQe7HKg5c60XU+9UHKQXRBdECdOGc6ch8ay6JfWaUggvAWRJi4xeSRLpF6vx9qEIJx7MUSgpiD0QSAxo92zRRQY=
X-Gm-Message-State: AOJu0Yx+WrkBR4d76/b7NQQ3g9PHItbZ7UmvAANElJEWgRXuR8E/4Hbs
	M58tgeL2FnfXYnqVh+wJyC2l1+Fb38vxwCB20nIIJEpzVOtD3n+j
X-Google-Smtp-Source: AGHT+IGbhTXvfJwY454gP9jL76eAJGY29TsXCEdiPrgqL7hjr4TGYQ2YlFcD/47YCPPm1w0ctPzyyA==
X-Received: by 2002:a2e:c49:0:b0:2d2:40cb:8182 with SMTP id o9-20020a2e0c49000000b002d240cb8182mr3976818ljd.49.1708500970465;
        Tue, 20 Feb 2024 23:36:10 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z3-20020a2e7e03000000b002d0f99a7fc4sm1722330ljc.79.2024.02.20.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:36:10 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
Date: Wed, 21 Feb 2024 08:35:24 +0100
Message-Id: <20240221073524.20947-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221073524.20947-1-zajec5@gmail.com>
References: <20240221073524.20947-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_233612_037979_F951E1D7 
X-CRM114-Status: GOOD (  15.38  )
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
index 000000000000..cb36a089518a
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
+			function = LED_FUNCTION_WAN;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			function = LED_FUNCTION_WLAN_2GHZ;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			function = LED_FUNCTION_WLAN_5GHZ;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 10 GPIO_ACTIVE_LOW>;
+		};
+
+		led-5 {
+			function = "online";
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.35.3


