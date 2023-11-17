Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583FBC072A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooyyIQaGZItx+Y3pw2HUlw3rSDVkRA/8pscwi3jOIoE=; b=2wzb3+AVWnkqQOL048mnEZVy+H
	mj6NRO4JjA00GL26UCYnmiK+v5qi61bf+Ct74ZO1ESbcfrzL0x3VlxuAMBFZBW/7rfv8gSmjeau6M
	DZMy9piL3xIR64/MCL7or+sPg2pRZOtlPxg8Zyt3YMJA4qkwXqgUI54F1HLJyg47uUbL08rkDFQXj
	RCcGDR9Og0aHyIFK9sunhlCIbgAELsBku4vZFc8i0+M5l7afXXmPreflSZCjQijrM4Dr/3d1hinQA
	PAQ4bi3YH/mAQOw6oi2hLTTj+MXRiWpO3VQ97sCy84v5MFTLVAYXnS0NTZ+nLPx/vOpNm1IytYyVv
	M/31Imhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wK7-006FME-0X;
	Fri, 17 Nov 2023 10:43:43 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3wK3-006FJw-1X;
	Fri, 17 Nov 2023 10:43:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991c786369cso261376266b.1;
        Fri, 17 Nov 2023 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700217817; x=1700822617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooyyIQaGZItx+Y3pw2HUlw3rSDVkRA/8pscwi3jOIoE=;
        b=DJJ2x3raMohzz5j6flecAJP060McbH91B8Ep3zDj/Wx2NYgkhHr2q4jucQHRpnP+TY
         T1PrKWJxrq0fVDPRFaE/NvoezGElWbotBhLxLoPEmQlrBQBm0ZbgPkBfdfQ/zhZJrLYt
         RyNaYn1wYsxcr3/tZXL1MCaQ8x9aQKQE4zzAMwv0l6e38LpERB54dqMBlJ3AyFIgDxGH
         6JsEUaA0KcSpu+hMxMJnsRtTPHDkZAGCtcdFqzf6cgtyw/oxFc5wMx89o2JL5P0FTjqM
         Gn3iLzGYtvJxUK08aTkcMxz2lmzvP7ZWSpBMs5/Stf9Lz23VXGzN4xVQmseCSWCYvrqi
         5NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217817; x=1700822617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooyyIQaGZItx+Y3pw2HUlw3rSDVkRA/8pscwi3jOIoE=;
        b=uhPoN8mr6bm9iIDOjSuvq/Rxi6zLR0a2wWfAZVvsGjj4xlZOC9T5/o8AWWa8cjCcxN
         EYC4ohAnm3M3AgyYflrjkUSP/5/6DfcQbtmyt6zFKdQlwwZLu2FFxjAt8JDSSCRRMzLD
         LWJ8igW/9fByJA/C9iUorTpwtRWpLwwOM4NkAv1jfuIYcQ8Cg/Yjm0VRkmLfdP/JNLHW
         gTQuLfQbZ1ZDKKtBKywI5GJAFlj7dUCFONZFMyPgbY6C5awq97ujWrOsMUEjUAsBTVD9
         IlGQ8dGdkm8V2dHFC+CqnXAWHdb2Duip+Ti0OWlv6z0zXMYsfjH32LbWU1O0H/xXwHka
         Hccg==
X-Gm-Message-State: AOJu0YzAq/yYGAyNVLVAk7hOpg8Uyfb0t32AjgC9UAoNK4VaeFQ8iv0C
	3V/hl2Shy8sW2k13Gb5rW6c=
X-Google-Smtp-Source: AGHT+IFHNNABckS4KZdexH6557tc1JVgzknlX/ePyIGNS7laFQlQXPkQDUkig7L5NjgSksWUF8wzKg==
X-Received: by 2002:a17:906:4c47:b0:9e5:ceb5:ada6 with SMTP id d7-20020a1709064c4700b009e5ceb5ada6mr4357932ejw.75.1700217816975;
        Fri, 17 Nov 2023 02:43:36 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709066b0600b009dd701bb916sm637388ejr.213.2023.11.17.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 02:43:36 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
Date: Fri, 17 Nov 2023 11:43:15 +0100
Message-Id: <20231117104315.9718-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231117104315.9718-2-zajec5@gmail.com>
References: <20231117104315.9718-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_024339_513483_C36DBC7F 
X-CRM114-Status: GOOD (  15.17  )
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

Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
It has 512 MiB of RAM, one 2.5 Gbps PoE (802.3at) Ethernet port and
on-SoC Wi-Fi.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e6e7592a3645..9ff2ab6c5e4d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
new file mode 100644
index 000000000000..18d19281dfdb
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+#include "mt7986a.dtsi"
+
+/ {
+	model = "Acelink EW-7886CAX";
+	compatible = "acelink,ew-7886cax", "mediatek,mt7986a";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		reg = <0 0x40000000 0 0x20000000>;
+		device_type = "memory";
+	};
+
+	keys {
+		compatible = "gpio-keys";
+
+		key-restart {
+			label = "Reset";
+			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pio 18 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&trng {
+	status = "okay";
+};
+
+&crypto {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <52000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partitions: partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bootloader";
+				reg = <0x0 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "u-boot-env";
+				reg = <0x100000 0x80000>;
+			};
+
+			factory: partition@180000 {
+				label = "factory";
+				reg = <0x180000 0x200000>;
+				read-only;
+				compatible = "nvmem-cells";
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					eeprom: eeprom@0 {
+						reg = <0x0 0x1000>;
+					};
+
+					macaddr: macaddr@4 {
+						reg = <0x4 0x6>;
+					};
+				};
+			};
+
+			partition@380000 {
+				label = "fip";
+				reg = <0x380000 0x200000>;
+			};
+
+			partition@580000 {
+				label = "ubi";
+				reg = <0x580000 0x4000000>;
+			};
+		};
+	};
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
+&eth {
+	status = "okay";
+
+	mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "2500base-x";
+		phy-handle = <&phy6>;
+		nvmem-cells = <&macaddr>;
+		nvmem-cell-names = "mac-address";
+	};
+
+	mdio-bus {
+		reset-gpios = <&pio 6 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <50000>;
+		reset-post-delay-us = <20000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy6: phy@6 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			reg = <6>;
+		};
+	};
+};
+
+&wifi {
+	status = "okay";
+	nvmem-cells = <&eeprom>;
+	nvmem-cell-names = "eeprom";
+};
+
-- 
2.35.3


