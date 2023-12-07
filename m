Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6450C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgillZWrA7vt8a6pmQfddFuFmoP+nyHnZN1/c6c2sus=; b=L9Ued26fSf1QMmCsQNw0x8reZ9
	bowZgjBp5dDyH1WJnKkWLzq/KdsawI6TEl+RwA/u368DeGRmIdF7mKjPCe8Zgxwc889dZQj9WCots
	3zO17Gch70vMWZ1rDw1u1N13LbHLj2ReMxY0t+dvbGHoOwf3jFgt2NU3TrF4MnaPpaEFEz3kqADt0
	MUgO/c3U6TG9gZ2k+FIHZ+Mr8ldn4VD6OJyCmK3OnPyecuB/SaqMc/kaxVmyYfcqKeQDn07cRA3LC
	x7bTGIckEDZ8omkoSc+2Jco/3S5H7qfRdxJP0JZfhBdBERQ5Bf342qbqwCwjpf5H2OTz0nL8nsf0U
	M2VNhy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9O8-00CA4W-2K;
	Thu, 07 Dec 2023 08:05:40 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9O4-00CA1x-35;
	Thu, 07 Dec 2023 08:05:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54cff638658so819692a12.1;
        Thu, 07 Dec 2023 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701936332; x=1702541132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgillZWrA7vt8a6pmQfddFuFmoP+nyHnZN1/c6c2sus=;
        b=Mz1XuPMjZowgQdc6kI9wjNwb80ASXwzeM3nLH2hwj8n7ong3n1VwJx4k8erTaVpoL1
         om+a9tB1Nao0POvJUcc0ZHKpY61uRwqVAR0ESeWA7Pda/4YgQTC/M146lxf6WuRQR/rb
         FSC/XskkD1cYs9oXrSJe3My2uWPiQyhW/ShT3MFzab2qn/JmKQBXW//wkWNSr5GhyMyO
         tU3Un/On073DYiztb1yvKtz4c8FJyz0i0d/5HV+10WGKNi2pZnrIuS2QnV0KHlOifx3p
         AdqctapGIgyhY3PCO/dWelljZbnCHKywdw5poQhOcKuUFNdxUE8ckdkYjH7Ns9SYiCET
         yTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701936332; x=1702541132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgillZWrA7vt8a6pmQfddFuFmoP+nyHnZN1/c6c2sus=;
        b=SxeZ4YUdzteltNoX+gwS7hyneaPYX94ioPpnOfqFMw+XN8dKuE/9zNrNFGqXgmWoNn
         qBFcfOM9hoYy2+J//lf46mHcVWut/3WOWB4W+qQQFAgii7sqzvMWHRhYH8HAq6u+yd+E
         EYo8b66su8G4sBuaKpCdUQ3WMt5+ORJAd6uJJvLFnAMF0EDiTCY+K7NsLnywVD7aNiNF
         fvS/kS6lvbeGySlg0sy7ovaGyFdrcbFok+EE7BJEhG5CvIlp/JFixnGkWTzQbqyHLP+k
         IlmfLajgznJom94Xg6VG7r9UZLdx5oadk4NRPm5Y45yFx2Gd3fvRmZMTKqZ86Dzh429h
         p7ew==
X-Gm-Message-State: AOJu0YzaREQCcKThmJYXFDaymjFjPxuXJWyoQ8Ra2H4Zb3vgh6QeghjK
	NgGiO77OpF0XgVJZz1CXMxQ=
X-Google-Smtp-Source: AGHT+IFSwlSzYNIy6ro/6tNl8l8sOeEANd6aC8pAkJX8RPqWGLllR+BCgKoqgBer6Ucxhw6HABYKGw==
X-Received: by 2002:a05:6402:5147:b0:54c:4837:81e6 with SMTP id n7-20020a056402514700b0054c483781e6mr1103399edd.55.1701936332511;
        Thu, 07 Dec 2023 00:05:32 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a509b5c000000b0054db2b5cd30sm480133edj.38.2023.12.07.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:05:32 -0800 (PST)
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
Subject: [PATCH V3 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
Date: Thu,  7 Dec 2023 09:05:12 +0100
Message-Id: <20231207080512.3688-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231207080512.3688-1-zajec5@gmail.com>
References: <20231207080512.3688-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_000536_999193_FDEC4528 
X-CRM114-Status: GOOD (  15.30  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
V2: Update coding style to follow:
    [PATCH v4] docs: dt-bindings: add DTS Coding Style document
V3: Add missing semicolon (I forgot to amend my local V2 change, sorry!)
    Drop unused "partitions" label

 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
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
index 000000000000..08b3b0827436
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -0,0 +1,173 @@
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
+	compatible = "acelink,ew-7886cax", "mediatek,mt7986a";
+	model = "Acelink EW-7886CAX";
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
+&crypto {
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
+&pcie_phy {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <52000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x100000>;
+				label = "bootloader";
+				read-only;
+			};
+
+			partition@100000 {
+				reg = <0x100000 0x80000>;
+				label = "u-boot-env";
+			};
+
+			partition@180000 {
+				compatible = "nvmem-cells";
+				reg = <0x180000 0x200000>;
+				label = "factory";
+				read-only;
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
+				reg = <0x380000 0x200000>;
+				label = "fip";
+			};
+
+			partition@580000 {
+				reg = <0x580000 0x4000000>;
+				label = "ubi";
+			};
+		};
+	};
+};
+
+&trng {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	nvmem-cells = <&eeprom>;
+	nvmem-cell-names = "eeprom";
+	status = "okay";
+};
-- 
2.35.3


