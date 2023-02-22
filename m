Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB8C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oi480Wr2F+Qm8aJ+0uCKY5md0bJBmSdDs9J1iRloDM=; b=XwHpw/UDuLErKWgF28qpzIBQ1Z
	klqY5w8cZK5BtjI8Cqj7sIDO5/YgFp+1grpYF8O+iojEZyX3HEVB4anrnDdG/nMViYa+RxuVaACow
	oDtZmlscvVYSKk5l5r6BS4NSLCnC+rRZcGnaO1JSkJ4POKczx3fq2pEFFyP2ET1b+pU++ELMpe3cE
	NvAEYZP2IXnrT36KNzCNbea93isSG4T1rx3+1nxHBuz70MojuIv9OuSnNA7qzHblza277JJ1gWNWP
	0cJpEeZd/hglAL+4rIzsDwsErSa16Us9WjhekInHvlyqiKONdrgGO+ZP97NG967TPMPzp38KFuTJe
	mKQu1GIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtZ6-00DNfC-De; Wed, 22 Feb 2023 18:10:04 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtYv-00DNYP-Fw; Wed, 22 Feb 2023 18:09:55 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUtYu-0008Kw-0b;
	Wed, 22 Feb 2023 19:09:52 +0100
Date: Wed, 22 Feb 2023 18:09:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH RFC 3/4] dt-bindings: clock: break out
 mediatek,filogic-apmixed
Message-ID: <177707569882ff308d375aae3e2936a60ea483c7.1677089171.git.daniel@makrotopia.org>
References: <cover.1677089171.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677089171.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_100953_587414_7B9E7B86 
X-CRM114-Status: GOOD (  17.07  )
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

The apmixed clocks of MT7981 and MT7986 are identical. In order to
de-duplicate both clock drivers, start with putting apmixed into a
header files of its own, so it can be used by both SoCs.
Propagate this change also to mt7986a.dtsi which is the only user.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  1 +
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |  2 +-
 .../clock/mediatek,filogic-apmixed.h          | 21 +++++++++++++++++++
 .../dt-bindings/clock/mediatek,mt7981-clk.h   | 10 ---------
 .../dt-bindings/clock/mediatek,mt7986-clk.h   | 11 ----------
 5 files changed, 23 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,filogic-apmixed.h

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 5159ff8673501..051a3e95f3141 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt7986-clk.h>
 #include <dt-bindings/clock/mediatek,ethsys.h>
+#include <dt-bindings/clock/mediatek,filogic-apmixed.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 6767e9c438866..89112c1c476e1 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -16,7 +16,7 @@
 #include "clk-mux.h"
 #include "clk-pll.h"
 
-#include <dt-bindings/clock/mt7986-clk.h>
+#include <dt-bindings/clock/mediatek,filogic-apmixed.h>
 #include <linux/clk.h>
 
 #define MT7986_PLL_FMAX (2500UL * MHZ)
diff --git a/include/dt-bindings/clock/mediatek,filogic-apmixed.h b/include/dt-bindings/clock/mediatek,filogic-apmixed.h
new file mode 100644
index 0000000000000..459a402c76f66
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,filogic-apmixed.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Sam Shih <sam.shih@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MEDIATEK_FILOGIC_APMIXED_H
+#define _DT_BINDINGS_CLK_MEDIATEK_FILOGIC_APMIXED_H
+
+/* APMIXEDSYS */
+
+#define CLK_APMIXED_ARMPLL		0
+#define CLK_APMIXED_NET2PLL		1
+#define CLK_APMIXED_MMPLL		2
+#define CLK_APMIXED_SGMPLL		3
+#define CLK_APMIXED_WEDMCUPLL		4
+#define CLK_APMIXED_NET1PLL		5
+#define CLK_APMIXED_MPLL		6
+#define CLK_APMIXED_APLL2		7
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt7981-clk.h b/include/dt-bindings/clock/mediatek,mt7981-clk.h
index 8f39248dcd34d..c3546daae7717 100644
--- a/include/dt-bindings/clock/mediatek,mt7981-clk.h
+++ b/include/dt-bindings/clock/mediatek,mt7981-clk.h
@@ -184,14 +184,4 @@
 #define CLK_INFRA_IPCIER_CK		59
 #define CLK_INFRA_IPCIEB_CK		60
 
-/* APMIXEDSYS */
-#define CLK_APMIXED_ARMPLL		0
-#define CLK_APMIXED_NET2PLL		1
-#define CLK_APMIXED_MMPLL		2
-#define CLK_APMIXED_SGMPLL		3
-#define CLK_APMIXED_WEDMCUPLL		4
-#define CLK_APMIXED_NET1PLL		5
-#define CLK_APMIXED_MPLL		6
-#define CLK_APMIXED_APLL2		7
-
 #endif /* _DT_BINDINGS_CLK_MT7981_H */
diff --git a/include/dt-bindings/clock/mediatek,mt7986-clk.h b/include/dt-bindings/clock/mediatek,mt7986-clk.h
index 67179a18589a9..a307ae4960077 100644
--- a/include/dt-bindings/clock/mediatek,mt7986-clk.h
+++ b/include/dt-bindings/clock/mediatek,mt7986-clk.h
@@ -7,17 +7,6 @@
 #ifndef _DT_BINDINGS_CLK_MT7986_H
 #define _DT_BINDINGS_CLK_MT7986_H
 
-/* APMIXEDSYS */
-
-#define CLK_APMIXED_ARMPLL		0
-#define CLK_APMIXED_NET2PLL		1
-#define CLK_APMIXED_MMPLL		2
-#define CLK_APMIXED_SGMPLL		3
-#define CLK_APMIXED_WEDMCUPLL		4
-#define CLK_APMIXED_NET1PLL		5
-#define CLK_APMIXED_MPLL		6
-#define CLK_APMIXED_APLL2		7
-
 /* TOPCKGEN */
 
 #define CLK_TOP_XTAL			0
-- 
2.39.2


