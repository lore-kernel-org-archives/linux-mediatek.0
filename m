Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDE7C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBEk+SrEniPMiMBs48OQrG0D9r0+OwZwJA5qxwpLKpk=; b=4irM+LzGCEetBZOazS68WHrPqk
	2fjF1BBtvM2nv3JMA6Fd0uLbfLOz1pOwMiD1wJau8WPlDESopT343jDlEAnk+dq1i1dgrPDdAxTY2
	sD4sBEZ3McaimWIHGfYhvvmfk9qkvLiTrIQQy7bTCkxwkGzetlkcx9hbaGvLGFptSlzJXEvkb0IC1
	BUPA+lc2XfB8vph4F0bvf1gOUFIywIOiP0ljmIvqqf1hexQCsiasSoX9xSJ+tvzj8MYOPI5jrNmMu
	dD71KSwxbAdl9as+4wrEVDHwUKfELIvx+Unc0oUqLrC63JRp9HlKy2bGyh0L6iKILFRtMVjV+6xJk
	QrXZJq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFGI-005WId-1S;
	Mon, 04 Dec 2023 20:09:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFGD-005WFh-0b;
	Mon, 04 Dec 2023 20:09:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332d5c852a0so3770707f8f.3;
        Mon, 04 Dec 2023 12:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701720581; x=1702325381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBEk+SrEniPMiMBs48OQrG0D9r0+OwZwJA5qxwpLKpk=;
        b=JYC59LTt8H5T1jV40ryDYyPVxKI0zIB+Al0lAuApCxvwaBFM7mIiEGPdHgM1Vwg6IX
         2c8z20wQaUNd14nCSOEx3InaA+mLxa1Fe8kSk0GYgr7uN64V2230UDYzY3KYxHL2c2DJ
         aJk2okYRcHol54aSNaI+aJsN/++I+nVqa7BLbFQasLthmy9JsKUpe1CIE4xjpzcY/ukB
         TkiOMND7C+SZzfFeSOc56cVBPJRJH4AR5D2Hy5y2JroGL/iLTc7HvNOSY0jxGdRbEViU
         re/S17hmoBK+CJBkpUZ4VfRXQMzNMETMijwOCS9inaw6kGq7SZ9wQhKY0cBN1M4i+jhf
         udYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701720581; x=1702325381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBEk+SrEniPMiMBs48OQrG0D9r0+OwZwJA5qxwpLKpk=;
        b=UXIK5UxK6FWJmbU42q4D544IQRWMx2MzuqaD5yFbUJLdqPOcQvhNpoKt3lE+nTleis
         Ee19FpHZIoyjWZotCdhc+oUJ9zihNuvfuQg7MWZhSo+eWsit0HQR35lKOfwkOG0fFnIs
         ODGPOHPyDvWtuS4go03UFfKg1mgCdyThgVUSOpGZZHM7WoTA84gNjaIrhLeDYfpzavXW
         OleB6+vgDyETXT+9iA195QkiYRBi1kGClRpcDMxzc3qiaNSBD5lA1hVY6PY9W967yUdY
         rX1wedKVrDCLEpxmDXyFvN1RfQB3nB/3dbsfe0NQ3DhTKTGIr3X32SjXSaWKpIMMrC4a
         U5+w==
X-Gm-Message-State: AOJu0YxWyO/qJir7wVTRS2rYSckj0SqvJgatoYyWizCYrZcr9/cVZAJo
	Qp/FpdFC/yJ8k6ehOXyhnp0=
X-Google-Smtp-Source: AGHT+IFQZiRyXeVUFQs2wW3mcbwymak5WY3aZwJzl0a6NwdhjrsYeU/Rz4kpEcLT1rWGrBsGgb6zjQ==
X-Received: by 2002:a5d:4291:0:b0:332:f910:50c1 with SMTP id k17-20020a5d4291000000b00332f91050c1mr4229457wrq.62.1701720581226;
        Mon, 04 Dec 2023 12:09:41 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lt12-20020a170906fa8c00b00a0290da4a50sm5620666ejb.186.2023.12.04.12.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:09:40 -0800 (PST)
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
Subject: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
Date: Mon,  4 Dec 2023 21:09:07 +0100
Message-Id: <20231204200907.5687-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231204200907.5687-1-zajec5@gmail.com>
References: <20231204200907.5687-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_120945_251137_971D5790 
X-CRM114-Status: GOOD (  15.10  )
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
V2: Update coding style to follow:
    [PATCH v4] docs: dt-bindings: add DTS Coding Style document

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
index 000000000000..93b71465bbdf
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
+		#size-cells = <1>
+		spi-max-frequency = <52000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+
+		partitions: partitions {
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


