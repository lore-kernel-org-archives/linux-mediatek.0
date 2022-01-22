Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B956C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1dMLlQCcmPgQH7lNhxQd0DIpIywQ7QH9oczTNHMTNg=; b=doDgN3JKEo8AP8
	fJyWvIsSj722pl5YC+VRIdTjzuiIfKdQtjw9Gi7kijkWMLtnVjAnL5kqMd1gTlhvTdCcEOc1JSVmV
	CSRaOIZRtMpTINAOBLYSY2Cr3tLgVS61xFvH6Q7yh07HBt5KwXRtCD5DXbgFCvQ+gYL4ndYxFy5Jp
	GTIejL2b+zuObaj+yYkzkc92u/goWdxmmkxbvsVGXYc2dq6qWD+fkwvDtCVbxRLnS2diB/xyHd/6y
	6/i8PoNcknR3T1X69IQOJsvRIuL3b5zWkY61bGoq8D988qwmWlQannzyXK3jXzDVrg8CDzA2C/EY9
	KAPDo8uSrbmvqpGLDOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCeI-00Gv55-MN; Sat, 22 Jan 2022 09:25:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXI-00GraU-FI
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:18 +0000
Received: by mail-pg1-x531.google.com with SMTP id h23so10224862pgk.11
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Kc6foonKZ2qx7qyPXvjxQG3lzal7VzJVK7KIYAvJnU=;
 b=RHT7W3/ZsxsUmr+8O1nsTAlt6tlW1+Dhp4h5kBzotqI3R6YbBJVuKnijdIFU9OMx6M
 UX3bVws4jV0tIF5PgNS580YUHpdXwlzudiOHTYlMouBxtGezlIsxaT7N1ttLXEh3UOsw
 Y9XYHMLApFpuxg98NlVVPZjBGx8Db/2LkavQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Kc6foonKZ2qx7qyPXvjxQG3lzal7VzJVK7KIYAvJnU=;
 b=sr5v4WsrOHArJ3tr7+rZ0EnqEsb9wVy5F6vUV10VH/kjcQrYKk0QQvqTB3+rLhKlbD
 xhmvYWeaGdGfXqzJVjxinyaKDjWJcuCm08WPobQfSsGmbNuETggekP/+2b7ApGLAWaaS
 ucHDLsmi/ylGp6KcZmLPRof7hyRdTWiQqncjOWpJlTHR3pa5jHDrwJjlmL+5NG/3K0DV
 7PcfWSGSmPN9UUQ6Izz4ykRWaS1megCFr+QyCrKD1f4er/Vmo4wAuuYJOQFKygSCaVJD
 9XP1TspmCA8po6H6INp+zA/twCY18FkoigS7yJEv+5hvL46ryvWcRN694kyHN0eqn57u
 mgTQ==
X-Gm-Message-State: AOAM533zg0+2k4Esav6/ap7U0VppTxgSbmpnnCOfDC2AqSatEAu2IY2G
 jsBTjrDUvIYiGRYNow1h0T0NvA==
X-Google-Smtp-Source: ABdhPJy8nbK4n66ql++9II+COsZy//czwDilD2Qwh2Dtb/rurvA7kS9mqeUDD4jcA4hNweQ1+uLf7Q==
X-Received: by 2002:a63:6b42:: with SMTP id g63mr5394978pgc.345.1642843095714; 
 Sat, 22 Jan 2022 01:18:15 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:15 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 14/31] clk: mediatek: pll: Clean up included headers
Date: Sat, 22 Jan 2022 17:17:14 +0800
Message-Id: <20220122091731.283592-15-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011816_619028_5409009D 
X-CRM114-Status: GOOD (  11.50  )
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

Some included headers aren't actually used anywhere, while other headers
with the declaration of functions and structures aren't directly
included.

Get rid of the unused ones, and add the ones that should be included
directly.

Also, expand the MHZ macro with spelled-out "1000 * 1000" to be able
to not include clk-mtk.h. The existing ternary operator is rewritten
in a shortened form to accommodate the expanded macro.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 081e0df8203e..9698d1c97cd6 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -4,15 +4,15 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
-#include <linux/clkdev.h>
-#include <linux/delay.h>
 
-#include "clk-mtk.h"
 #include "clk-pll.h"
 
 #define REG_CON0		0
@@ -162,7 +162,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
 		u32 freq, u32 fin)
 {
-	unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
+	unsigned long fmin = pll->data->fmin ?: (1000 * 1000 * 1000);
 	const struct mtk_pll_div_table *div_table = pll->data->div_table;
 	u64 _pcw;
 	int ibits;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
