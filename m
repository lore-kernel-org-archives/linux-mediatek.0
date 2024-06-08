Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8B9C25B76
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COBqnfw9jmd19Qe8P9hzoCORT/LkJpn4G+nYf3HB3Xk=; b=JGzcOkQF/ZkFEH
	VkyDlOiLkguzIkAxSET4hH0tQ8rmzSAly3irKkrQKhNrPgkTOASZqM2RzGAudSo0leNpS/AAp87bT
	9TtuAFLhx+mT0QTf7aN+vZBUnJVdzdgUiMnOmA8rVk+1StR6G3lluk+J5T/Tb+sNDgu7843dIg0yy
	HuO/LIolHycTZqRQBAbFOUD0so9DO5+PCWPBV1TJY0CZeFRZkrteXWvao2Kt77/lLmCu90/0W4auU
	xsW96C9ECm2lWEJYfrdLJLtzgXJX+Pm111XiusFyj3BOWrmBNTD1GrWupBrgbjl875pWYJIbpPijF
	bOeRuq9H0yIGQ4yEK1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5K-0000000Gutw-2JO7;
	Sat, 08 Jun 2024 08:05:58 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5F-0000000GusT-34CG;
	Sat, 08 Jun 2024 08:05:55 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id A141F601D3;
	Sat,  8 Jun 2024 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1717833951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COBqnfw9jmd19Qe8P9hzoCORT/LkJpn4G+nYf3HB3Xk=;
	b=fAggY7pv+SXUz/Qh75i6O6aIBroOhGi+H1zgEjYVfOhB8vshCA6ZZXuosdug81T7JDkpNr
	F3/wd83pLAnPB3DM/EAFRb63WmV7f0uKq3xvlxUciChKXSaZe7CtzsQQmDuooOGAsSplUC
	zdQznpXiUbyLnPE4VZlcYbvL9JX2V3s=
Received: from frank-G5.. (fttx-pool-217.61.155.199.bambit.de [217.61.155.199])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id CCC398010F;
	Sat,  8 Jun 2024 08:05:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
Date: Sat,  8 Jun 2024 10:05:30 +0200
Message-Id: <20240608080530.9436-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608080530.9436-1-linux@fw-web.de>
References: <20240608080530.9436-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d825f04a-d61b-4af0-a7c3-99149f58adbc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_010553_942366_F54204D7 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Bananapi R3 has a Power socket entended for using external SATA drives.
This Socket is off by default but can be switched with gpio 8.

Add an overlay to activate it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- make sata overlay better readable
v2:
- rebase on the patch "add dtbs with applied overlays for bpi-r3"
- add sata-overlay to the full dtbs
---
 arch/arm64/boot/dts/mediatek/Makefile         | 13 ++++---
 .../mt7986a-bananapi-bpi-r3-sata.dtso         | 35 +++++++++++++++++++
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 0ec5b904d35d..ac0af5ffe97d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -14,26 +14,31 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
 mt7986a-bananapi-bpi-r3-emmc-nand-dtbs := \
 	mt7986a-bananapi-bpi-r3.dtb \
 	mt7986a-bananapi-bpi-r3-emmc.dtbo \
-	mt7986a-bananapi-bpi-r3-nand.dtbo
+	mt7986a-bananapi-bpi-r3-nand.dtbo \
+	mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nand.dtb
 mt7986a-bananapi-bpi-r3-emmc-nor-dtbs := \
 	mt7986a-bananapi-bpi-r3.dtb \
 	mt7986a-bananapi-bpi-r3-emmc.dtbo \
-	mt7986a-bananapi-bpi-r3-nor.dtbo
+	mt7986a-bananapi-bpi-r3-nor.dtbo \
+	mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nor.dtb
 mt7986a-bananapi-bpi-r3-sd-nand-dtbs := \
 	mt7986a-bananapi-bpi-r3.dtb \
 	mt7986a-bananapi-bpi-r3-sd.dtbo \
-	mt7986a-bananapi-bpi-r3-nand.dtbo
+	mt7986a-bananapi-bpi-r3-nand.dtbo \
+	mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
 mt7986a-bananapi-bpi-r3-sd-nor-dtbs := \
 	mt7986a-bananapi-bpi-r3.dtb \
 	mt7986a-bananapi-bpi-r3-sd.dtbo \
-	mt7986a-bananapi-bpi-r3-nor.dtbo
+	mt7986a-bananapi-bpi-r3-nor.dtbo \
+	mt7986a-bananapi-bpi-r3-sata.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nor.dtb
 
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
new file mode 100644
index 000000000000..17659545470e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
+
+	reg_sata12v: regulator-sata12v {
+		compatible = "regulator-fixed";
+		regulator-name = "sata12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&pio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_sata5v: regulator-sata5v {
+		compatible = "regulator-fixed";
+		regulator-name = "sata5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata12v>;
+	};
+
+};
+
-- 
2.34.1


