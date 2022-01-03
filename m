Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aIw/rEYSi4si0VYXYPcmcKeQESvo9rV/4QOl7FYh/Qc=; b=YKYT4kcpJGcDr6
	hKCMFwCFwWH83O9yaVPpfVdVpoa3MPm1pwb6msISnyJuLBrZRcTiyD2z4Y9aIuWQy0n0my2oWiAS6
	q1yvfl5Oq1oxSevlU864qS8XVKXkBG9G0PP1SfghpbAnwDG9rtc0jtO+ABXBjg8It2nOd9OPFLMgP
	30rvnbXtUJwbmA4hu49oep8hRKyKcetJyf0dhsKFd59+Q4Wg5EMobqLYIFNj6a/yjkMiAU2eLg1l4
	WPPxSpw7HTG97sSMhOZjNR8GWFBKfLX00CDKHZgAIUCYtq7Wdyn5H3fMd/ucCCs7NRBxJpxuhZl9c
	zazqzYD0aPURBbEtnQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4OT3-009CvX-FL; Mon, 03 Jan 2022 14:37:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OSi-009Cru-0k; Mon, 03 Jan 2022 14:37:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F2CF71F41FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641220641;
 bh=qSvITlSu/EuyG+NjQRmV2sMPNmQCjRo2UzY7HOf2Nho=;
 h=From:To:Cc:Subject:Date:From;
 b=f/uhrvzMZjOrwsczlBf18PrfUJE/YL1OYGyZTyvSisSGMvRgJDPZJ+jnilDvi+vGG
 b59GQfaZ6JKukfLnVudHm0Vw27rDee2Jy4JzP7ywCDXovQNUkkVTJBccjBiHAp+DEE
 CaziJL8QXJcnqKd+au8Dx9HklGAe5rS6d82IQWjoSU3xcIiD0yhHSVts6vpvmBsoFi
 GZMtEsK7f6qisXmc+cyBwhJE6LVTJiHH54tDYNObW2o7w3L6XidoufnrP27X4KSRpc
 Q/c3OuxBOJmSYNZu91PYCI2/7OGaWfh1cUgWt3Y+kk3l7p9crtBvruF7UwtXiX8ywZ
 pH34lc3lUc7oQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, miles.chen@mediatek.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH 1/2] clk: mediatek: clk-gate: Shrink by adding clockgating bit
 check helper
Date: Mon,  3 Jan 2022 15:37:11 +0100
Message-Id: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_063724_264254_AF44A81A 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

Add a clockgating bit check helper and use it in functions
mtk_cg_bit_is_cleared(), mtk_cg_bit_is_set() to shrink the
file size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index b02d2f74dd0d..957fa1d68f07 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -16,28 +16,24 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
-static int mtk_cg_bit_is_cleared(struct clk_hw *hw)
+static u32 mtk_get_clockgating(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 	u32 val;
 
 	regmap_read(cg->regmap, cg->sta_ofs, &val);
 
-	val &= BIT(cg->bit);
+	return val & BIT(cg->bit);
+}
 
-	return val == 0;
+static int mtk_cg_bit_is_cleared(struct clk_hw *hw)
+{
+	return mtk_get_clockgating(hw) == 0;
 }
 
 static int mtk_cg_bit_is_set(struct clk_hw *hw)
 {
-	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
-	u32 val;
-
-	regmap_read(cg->regmap, cg->sta_ofs, &val);
-
-	val &= BIT(cg->bit);
-
-	return val != 0;
+	return mtk_get_clockgating(hw) != 0;
 }
 
 static void mtk_cg_set_bit(struct clk_hw *hw)
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
