Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4629AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mynt6RbgwdbRIJxOJ5XQ46ujg3ib1TtYrr/2Xb5sZPs=; b=xg8+p2ZXeEwQmu
	ELZQ8ktXJpizpbVYILNI7kNBCeig8eCzr89wguGZfaME276zRElcAbVIXM2JITSbRCaJqafBDUFeO
	VCH6WwFFCtijYbpg1uYnuqUc7o93xGrBRuzQEGNmNbRhLjlyXIZS6W0VvJhKO+RSQWSrvApZLCPUZ
	GDDXfDWTeaJGmN5VFT4EJnrP1+8We82NdE7lk7TiNR20B6vakjTDjC4LWMWD0eTZdEh6nm7N//my1
	gj+xVQyNbGDkJsXmRD718Gcx02QR8TJpUCG4VjM7sL8FLss/79VAoM5D2Jxz8yjNb2166rwnT0eRo
	kouHIITMbQLDKxITODMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCdF-00GucX-At; Sat, 22 Jan 2022 09:24:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXE-00GrY9-6p
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id q63so6684578pja.1
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soaaam3hrgCVzQ6/QI7F3r+P2+uJDpqXG3CI212RPDk=;
 b=QyFbqM44aSrb34eI7sLJhVr+hT9Xtu0lkHQkKLNPHCtf1GU8JFK91tJXqMQ9bei7M7
 QytbwIPkuZ5AVIcsuR/+JT/ECDDm5VWuBZ1Pguckwoh8lDgLYF48js/ARCzFJQk5zOlY
 bwcq6LLeujCAyj+nV3sGiz5Nj1OKxjg1aOlO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soaaam3hrgCVzQ6/QI7F3r+P2+uJDpqXG3CI212RPDk=;
 b=yPTaJgucLnnLLKtuCJ1seZi9sSJ+VPb9MNSpmhAibbyMV/taPUgTN0Qy57EqwVklt8
 PuooF2PJm3vLzH+t/fpIRUqHZroZw3lG6U1fJMpVLB+FeAOXcdk5nc80p1hRzeOXy8Rd
 xIltLBSY3b0X3Ewq+mVXOh+8mdPl6kDAR7DMAL9mdgStkXsvG3Dku+xasyHOmEwAhoXF
 0wlCuxfauQwoAhALpMfkRYFiFkBbRUXVFpq9ddPSMlyRkCcZxRCc6Aml0Lx67a58QtTZ
 69EePOodX3fWbVeSraNniFOtNB8YOjy5t1dsWGoe/mhDZLs36MkCRFtJfQZCUKWV7tVg
 PBAg==
X-Gm-Message-State: AOAM531XxcmxaYTjkzu1/9Hrr5RS6Yn06y/KOQqr8DC7P1ouIrhDmOoT
 mWAXriFyY3pyGKblnAyuqUfdGg==
X-Google-Smtp-Source: ABdhPJzdpROET+8RI0Gyr57GHoVyoxvKKi9vA/0+ao7/0omPPQuT+tNYt69NCwuFKYCBbus3iiVFTg==
X-Received: by 2002:a17:90b:3b88:: with SMTP id
 pc8mr24965pjb.245.1642843091354; 
 Sat, 22 Jan 2022 01:18:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 12/31] clk: mediatek: pll: Split definitions into separate
 header file
Date: Sat, 22 Jan 2022 17:17:12 +0800
Message-Id: <20220122091731.283592-13-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011812_286157_ED9B33A4 
X-CRM114-Status: GOOD (  18.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When the PLL type clk was implemented in the MediaTek clk driver
library, the data structure definitions and function declaration
were put in the common header file.

Since it is its own type of clk, and not all platform clk drivers
utilize it, having the definitions in the common header results
in wasted cycles during compilation.

Split out the related definitions and declarations into its own
header file, and include that only in the platform clk drivers that
need it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2701.c            |  5 +-
 drivers/clk/mediatek/clk-mt2712.c            |  3 +-
 drivers/clk/mediatek/clk-mt6765.c            |  3 +-
 drivers/clk/mediatek/clk-mt6779.c            |  3 +-
 drivers/clk/mediatek/clk-mt6797.c            |  3 +-
 drivers/clk/mediatek/clk-mt7622.c            |  5 +-
 drivers/clk/mediatek/clk-mt7629.c            |  5 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  4 +-
 drivers/clk/mediatek/clk-mt8135.c            |  3 +-
 drivers/clk/mediatek/clk-mt8167.c            |  3 +-
 drivers/clk/mediatek/clk-mt8173.c            |  5 +-
 drivers/clk/mediatek/clk-mt8183.c            |  3 +-
 drivers/clk/mediatek/clk-mt8192.c            |  3 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  1 +
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  1 +
 drivers/clk/mediatek/clk-mt8516.c            |  3 +-
 drivers/clk/mediatek/clk-mtk.h               | 39 --------------
 drivers/clk/mediatek/clk-pll.c               |  1 +
 drivers/clk/mediatek/clk-pll.h               | 55 ++++++++++++++++++++
 19 files changed, 91 insertions(+), 57 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-pll.h

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f77427..1eb3e4563c3f 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -10,9 +10,10 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-mtk.h"
-#include "clk-gate.h"
 #include "clk-cpumux.h"
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt2701-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a3bd9a107209..ff72b9ab945b 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -13,8 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-pll.h"
+#include "clk-mtk.h"
 
 #include <dt-bindings/clock/mt2712-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d77ea5aff292..24829ca3bd1f 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -12,9 +12,10 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
 #include "clk-mux.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt6765-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9825385c9f94..7b61664da18f 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -10,9 +10,10 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+#include "clk-gate.h"
 #include "clk-mtk.h"
 #include "clk-mux.h"
-#include "clk-gate.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt6779-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 428eb24ffec5..02259e81625a 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -9,8 +9,9 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt6797-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index ef5947e15c75..0e1fb30a1e98 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -11,9 +11,10 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-mtk.h"
-#include "clk-gate.h"
 #include "clk-cpumux.h"
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt7622-clk.h>
 #include <linux/clk.h> /* for consumer */
diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index a0ee079670c7..c0e023bf31eb 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -12,9 +12,10 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "clk-mtk.h"
-#include "clk-gate.h"
 #include "clk-cpumux.h"
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index 98ec3887585f..21d4c82e782a 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -10,9 +10,11 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include "clk-mtk.h"
+
 #include "clk-gate.h"
+#include "clk-mtk.h"
 #include "clk-mux.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt7986-clk.h>
 #include <linux/clk.h>
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 9b4b645aea99..09ad272d51f1 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -11,8 +11,9 @@
 #include <linux/mfd/syscon.h>
 #include <dt-bindings/clock/mt8135-clk.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 static DEFINE_SPINLOCK(mt8135_clk_lock);
 
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index e5ea10e31799..812b33a57530 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -12,8 +12,9 @@
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8167-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 8f898ac476c0..46b7655feeaa 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -8,9 +8,10 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
-#include "clk-mtk.h"
-#include "clk-gate.h"
 #include "clk-cpumux.h"
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8173-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 5046852eb0fd..68496554dd3d 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -11,9 +11,10 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "clk-gate.h"
 #include "clk-mtk.h"
 #include "clk-mux.h"
-#include "clk-gate.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8183-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..5f998aab3bfd 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -12,9 +12,10 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "clk-gate.h"
 #include "clk-mtk.h"
 #include "clk-mux.h"
-#include "clk-gate.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8192-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 6156ceeed71e..5b1b7dc447eb 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -5,6 +5,7 @@
 
 #include "clk-gate.h"
 #include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8195-clk.h>
 #include <linux/of_device.h>
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index f1c84186346e..db449ff877d7 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -4,6 +4,7 @@
 // Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
 
 #include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8195-clk.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 9d4261ecc760..a37143f920ce 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -11,8 +11,9 @@
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
 
 #include <dt-bindings/clock/mt8516-clk.h>
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bdec7dc5e07a..168220f85489 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -179,45 +179,6 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
 void mtk_free_clk_data(struct clk_onecell_data *clk_data);
 
-#define HAVE_RST_BAR	BIT(0)
-#define PLL_AO		BIT(1)
-
-struct mtk_pll_div_table {
-	u32 div;
-	unsigned long freq;
-};
-
-struct mtk_pll_data {
-	int id;
-	const char *name;
-	u32 reg;
-	u32 pwr_reg;
-	u32 en_mask;
-	u32 pd_reg;
-	u32 tuner_reg;
-	u32 tuner_en_reg;
-	u8 tuner_en_bit;
-	int pd_shift;
-	unsigned int flags;
-	const struct clk_ops *ops;
-	u32 rst_bar_mask;
-	unsigned long fmin;
-	unsigned long fmax;
-	int pcwbits;
-	int pcwibits;
-	u32 pcw_reg;
-	int pcw_shift;
-	u32 pcw_chg_reg;
-	const struct mtk_pll_div_table *div_table;
-	const char *parent_name;
-	u32 en_reg;
-	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
-};
-
-void mtk_clk_register_plls(struct device_node *node,
-		const struct mtk_pll_data *plls, int num_plls,
-		struct clk_onecell_data *clk_data);
-
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f04f724e12e5..64f59554bc9b 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 
 #include "clk-mtk.h"
+#include "clk-pll.h"
 
 #define REG_CON0		0
 #define REG_CON1		4
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
new file mode 100644
index 000000000000..d01b0c38311d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: James Liao <jamesjj.liao@mediatek.com>
+ */
+
+#ifndef __DRV_CLK_MTK_PLL_H
+#define __DRV_CLK_MTK_PLL_H
+
+#include <linux/types.h>
+
+struct clk_ops;
+struct clk_onecell_data;
+struct device_node;
+
+struct mtk_pll_div_table {
+	u32 div;
+	unsigned long freq;
+};
+
+#define HAVE_RST_BAR	BIT(0)
+#define PLL_AO		BIT(1)
+
+struct mtk_pll_data {
+	int id;
+	const char *name;
+	u32 reg;
+	u32 pwr_reg;
+	u32 en_mask;
+	u32 pd_reg;
+	u32 tuner_reg;
+	u32 tuner_en_reg;
+	u8 tuner_en_bit;
+	int pd_shift;
+	unsigned int flags;
+	const struct clk_ops *ops;
+	u32 rst_bar_mask;
+	unsigned long fmin;
+	unsigned long fmax;
+	int pcwbits;
+	int pcwibits;
+	u32 pcw_reg;
+	int pcw_shift;
+	u32 pcw_chg_reg;
+	const struct mtk_pll_div_table *div_table;
+	const char *parent_name;
+	u32 en_reg;
+	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
+};
+
+void mtk_clk_register_plls(struct device_node *node,
+			   const struct mtk_pll_data *plls, int num_plls,
+			   struct clk_onecell_data *clk_data);
+
+#endif /* __DRV_CLK_MTK_PLL_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
