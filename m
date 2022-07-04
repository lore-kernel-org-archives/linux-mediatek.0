Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PM0l1KsY4K4wEw+WB7LzhCSGxMwlPOvM05khi3mtMY=; b=1InN6422guXB5DjkHzyyB+AmdJ
	DvzZvvjrH8ENScmB+acbl6XXt8o4BWkRrd8mdQstewlDN4hjlot1ssYy8mdJRUJJ9jcysr8Laxpap
	j+qXGLS23JAUIiJJrSi6AjMWS68p4YxQKRTAeHwgTLm0oeerja9kWL31uia8kDyGi6taCKbsa+L+i
	yMLt7CBBO+1Ic5noG6HIU4cfHN75p3WWlfp35C6n+/La9g5WEuulpZfQP7LRUafKXFkgocw2ZMK5s
	7zXuIQ++l3CIWi5QIBgdMVZvxkjGM9JgZ107nw64g2g8NA+1gWF957IYdldUgT0KpbLXSNg8FMWFu
	tWGDvKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JB0-006toH-9P; Mon, 04 Jul 2022 10:19:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5P-006pcV-AV; Mon, 04 Jul 2022 10:13:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E3996601986;
	Mon,  4 Jul 2022 11:13:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929610;
	bh=MZXqAw3inkd2Bf7UjSU992h3+DyFZZUUFlEaEabCqU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmANSMatG2H0ioFo3PQRwGwn8mfwgia6TsA46ZeprjEJd85P0X2lIeGVYoRO5IRaK
	 AzmGAPi+f6U3VrAgxc21C0EjyXx1olG93oWzEGioNQy9lH35VWQk7zvC5H9hLzGvqf
	 bwM/d1B1nyf6EN9Y6X8r+lJrhcytkjRK9t6LhE505PPVTDLOQA4DKxq2EBoBT8PKq+
	 W1V/E5Kac1qArLV6GrmAux0if1MN7s5nZI6dU7kGm9tcGGkOHyT+/FcyzrwAIS+oK9
	 4YQVlG/Vap9ecFeXRXbcQujGCGqGaODdH7sxdDviLPRqWCHQkAvWeL4UFaURObiuIK
	 NZibRMwziq6nQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
Date: Mon,  4 Jul 2022 12:13:12 +0200
Message-Id: <20220704101321.44835-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031347_676758_CBB2EF7F 
X-CRM114-Status: GOOD (  14.23  )
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

Introduce the MT8195 Cherry Chromebook platform, including three
revisions of Cherry Tomato boards.

This basic configuration allows to boot Linux on all board revisions
and get a serial console from a ramdisk.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 50a2c58c5f56..0b12035a4f08 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -39,6 +39,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r2.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
new file mode 100644
index 000000000000..7ca344ccc225
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "Acer Tomato (rev1) board";
+	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
new file mode 100644
index 000000000000..38c27d704ccc
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "Acer Tomato (rev2) board";
+	compatible = "google,tomato-rev2", "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
new file mode 100644
index 000000000000..6ecde88c30ef
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8195-cherry.dtsi"
+
+/ {
+	model = "Acer Tomato (rev3 - 4) board";
+	compatible = "google,tomato-rev4", "google,tomato-rev3",
+		     "google,tomato", "mediatek,mt8195";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
new file mode 100644
index 000000000000..7406d7bbf725
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "mt8195.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.35.1


