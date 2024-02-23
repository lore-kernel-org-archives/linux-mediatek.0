Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B193BC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDnyKS3QNE5QbkDew8ZYn7NVYP9CWlivkQitTepgpqI=; b=S/4FGFWGJ6nU2MGj3muDoIKQPB
	E1MqT8I1mzv2iO+byC1MqRKyLlJNzy8kIzuYVWwe6xoHH/ANi65AAH1ja6ZDwVFfUvB2/PPayzx3v
	pMlXajrD1eBZ49+ONAAGOwIioxr+odobBdb+QDOnYeQQQm4KRCZvjAgSlYB5jzoZ0WlDfqo2HDr6R
	rkhAY/CLBSb3IIlh0tYjdsEUeA+6X9qTEHBxy5aeD+XaGgyY/HhalXocM7fZgVFT+qd/tFg40SNLj
	Ajo4m98w8GYfT3BnkmNymw9mppZjJ1hfEGZ5o/XCXkH2FdzE1kcFklgQl/h2RgLwv0LDHYhRoubKm
	pJ8c+Arg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdB-00000008rrN-3w3x;
	Fri, 23 Feb 2024 10:18:13 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScV-00000008raU-1Rpv;
	Fri, 23 Feb 2024 10:17:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a3e891b5e4eso74029266b.0;
        Fri, 23 Feb 2024 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708683445; x=1709288245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDnyKS3QNE5QbkDew8ZYn7NVYP9CWlivkQitTepgpqI=;
        b=LF+22XXOgHuW20nb1L6VKkf801IePq6jVylPb1J5bGwBp5yRgbwcoK5K0jYuOmMS6K
         ZfXEmod4quby7ptukzzyF0OVfpIEmqrSCazbJcVNk84p+P+jxs6F6KaCoGSiz6TlajgM
         MC+A/9YSz3vH1esf+zayaR9rrzdjSAkP/5o9Qn+7az568fMrp9w8CyR1oc9HqyYPY80R
         WBIkMtOuhxB4eHwIIMgiLcmHbxNPZ+PxaXywfC0VTrxWT+dLQM08LB6HwbQOssd/yjSn
         QPgiET+bSXqNQbkUVfl3Wlo0UxB7qsySTziBRF2IE5WkvGM+5sqJnPn1w8VcvvD3gdPH
         fVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683445; x=1709288245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDnyKS3QNE5QbkDew8ZYn7NVYP9CWlivkQitTepgpqI=;
        b=Cur/xZ0P6MPB+w59+Q30zzIc9aW0MYhpv7bLl8TtLYJLUJeYMzOHm/9ZaV2X3A8oAh
         wmgJpqnoV13VSAfWyejkrRIfCXZZTIEuzHjX/ymCR24V78gO5FmrjWvG21bAuX3kBtU2
         k5bRKZjMgbsWJghG/YBTEN6ipnZvNzQChntqysOVCGFbeDxckEPVNUsc2yivBTFCXlmy
         YcSkbv3ZeSuvKkexxGYnr0IbeDyif5UukeI5vu62jQFiDNGE89mc0EDDBVLOC/2d6C59
         BdrGCoi9rLga8ZQiLd0XitYa3zt6j5NSLdFHlYmgu+lni2jr+oVbvi1BiaaPp04b7vqT
         56sA==
X-Forwarded-Encrypted: i=1; AJvYcCWrlOGN6Ed23dRZ8GflXdsofWESNUtgryQFXgiLfP4H4457HXyl56qqq89oejXy8UujSbhrh02XuYOqzUyMVwb47CvWgj02NVoWJvcePOrz1g+jHTf37PBqsxD8ZtGB3ccOgs4r+ZK5sLEHMzx3mOt+hZ/U/zbS+SY=
X-Gm-Message-State: AOJu0Yz0etuWkDym0WE1veB6A5/HAMAWgNSp0MfuAlcVumCtWr8G7rkx
	vBKLENb90p0xH4xhwAnTJnwFcxLh64NKosJJ86yEJdR8xp8uz7kL
X-Google-Smtp-Source: AGHT+IGLzGErmk49F6mmcrzLRayF6ZuwlDFpL6n1RrViLMs4HRmJNjhxukyy2BSZR9VhdOsfsPpDqw==
X-Received: by 2002:a17:906:2844:b0:a3e:792f:3955 with SMTP id s4-20020a170906284400b00a3e792f3955mr972977ejc.62.1708683445424;
        Fri, 23 Feb 2024 02:17:25 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3d99dc3f3asm6667250ejc.67.2024.02.23.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:17:25 -0800 (PST)
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
Subject: [PATCH V2 4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
Date: Fri, 23 Feb 2024 11:17:09 +0100
Message-Id: <20240223101709.30072-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223101709.30072-1-zajec5@gmail.com>
References: <20240223101709.30072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021731_528132_D7BD5A33 
X-CRM114-Status: GOOD (  15.69  )
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

There is one slightly uncommon LED with a label of globe icon described
in the Quick Installation Guide as having 2 meanings:
1. "Not connected to the Internet"
2. "Connected to the Internet"

Vendor designed it to light up when some Internet-accessible IP can be
reached. This change will be follow by an attempt to define some
predefined FUNCTION for it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Reorder properties
    Describe online LED

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
index 000000000000..2a988218039c
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
+			function = "wan-online";
+			gpios = <&pio 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.35.3


