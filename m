Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EBCC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkGuWwe0VnRQscTkwXdvT/A5rmI1XUwt+CNwMhJrmBo=; b=r8XhzDMYcd4cGenu9i0tqdCYFy
	lfcGUegi+zfCyAK/L5FKsc6FPqgHeUSz22TJmkVmpUBaKBPoYsKLe3c2iUXM/dBPy0KbmJB0BEevM
	SFt+T9QVKpROKazxeFsYx7KpI/vrmpsTnGr5trLaD5qaE90ZdH/zYHmtcltfr2n2vEDUheUspRVz/
	oT04FA+wQzAf+tPCX5MSD1wYrKmaHGvmwhMSbH1V9LnaV+TipswLvitTnJYJSSn8AtAGPjvBJlmnS
	hAfMKD2Z1wEGY8wY0IQ8oijDB/WFd3orvb5bEZ/S2IhHKSCMGjJn1Rc/h8661t6bcpp9krfcdBvcC
	xlsYSV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNXx-004CKN-K0; Fri, 29 Jul 2022 10:48:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUO-004A2K-BJ; Fri, 29 Jul 2022 10:45:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CA486601B6D;
	Fri, 29 Jul 2022 11:45:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091503;
	bh=0QqxLKrVrFujWkJ9DfNf1cxn6EG01MDTs5MXelKFVVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iT15RnhyxjpR5pnSE8GfqFPQeCidfxclnzPstf+2HMcwDU+HEh4piDVGsrFFs0G6z
	 ozGBSuXB2g0umlDpsGVJEJi6TPMaFd83jzq1RoEQzJ6NVjIZLTulf5yy/Cg7hty7h4
	 GHAj+MJogHlxXjOgzo01tWd70HybWQysIvjXKbRDXPaP6JLMCm/+doqK5ba0a2Ckw3
	 e2Bq1imDDPkNTXAoUGS+aXAy0ASA4VpxHwVAiXmMoh+kSFTgkD5d5r525AYkW2SdKQ
	 xI9zObLHtfrk03u7CGLsw/NwJCh6ICzAJrwSGm/VjxUh44D+v65v7LznhJAKH9hdZ9
	 AVkcOaCuHP64g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 8/8] arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 smartphone
Date: Fri, 29 Jul 2022 12:44:41 +0200
Message-Id: <20220729104441.39177-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034504_528870_18FEF15F 
X-CRM114-Status: GOOD (  13.56  )
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

Add a basic support for the Sony Xperia M5 (codename "Holly")
smartphone, powered by a MediaTek Helio X10 SoC.

This achieves a console boot.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index af362a085a02..72fd683c9264 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
new file mode 100644
index 000000000000..94d011c4126c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, Collabora Ltd
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+/dts-v1/;
+#include "mt6795.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Sony Xperia M5";
+	compatible = "sony,xperia-m5", "mediatek,mt6795";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x1E800000>;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_reserved: secmon@43000000 {
+			no-map;
+			reg = <0 0x43000000 0 0x30000>;
+		};
+
+		/* preloader and bootloader regions cannot be touched */
+		preloader-region@44800000 {
+			no-map;
+			reg = <0 0x44800000 0 0x100000>;
+		};
+
+		bootloader-region@46000000 {
+			no-map;
+			reg = <0 0x46000000 0 0x400000>;
+		};
+	};
+};
+
+&pio {
+	uart0_pins: uart0-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO113__FUNC_URXD0>;
+			bias-pull-up;
+			input-enable;
+		};
+		pins-tx {
+			pinmux = <PINMUX_GPIO114__FUNC_UTXD0>;
+			output-high;
+		};
+	};
+
+	uart2_pins: uart2-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO31__FUNC_URXD2>;
+			bias-pull-up;
+			input-enable;
+		};
+		pins-tx {
+			pinmux = <PINMUX_GPIO32__FUNC_UTXD2>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
-- 
2.35.1


