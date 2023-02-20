Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14076C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNVO6dxZsFTFHP8DSGcnfpsjgH3e2ABf4OyjoAueySo=; b=q2VCVr+HXyhH1cC//yVx/X7/eK
	Kq7e5WldZ7AlZufGcRvmxnk/VXf2q9Z97ggBLG2YorMTzIlRzdXS/cNchWsmEz7klLdRyFbw+BAR1
	dLMMf+Le+gqlIP/NeWpuSe8h3d+RykAFgUX6l3Ui5JuPrSmd5VSJel5aJr7NliGRV05bAZsjCMicO
	ITQEGbh4/OA0TwxwEHMvPtY4u24yjtgRczxo9BXCYQlpgQJbHaMjC++qZcstNrjAbUMY1BgKEmIwB
	NyPO02Sp55oR8Z+MqUmp/vB1Nfy1CG4JpGeikrHKkLVrqr4v4MKNB5LOfKJ2MVI9x+GWdPdFBpfZo
	7tn97FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8JJ-004hrF-7A; Mon, 20 Feb 2023 15:42:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7gV-004NwM-Ux; Mon, 20 Feb 2023 15:02:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 78B23660216A;
	Mon, 20 Feb 2023 15:02:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905350;
	bh=xEzNnjlrGCa8nDnkjYmWB7XHA1caeWO11UfF0hFXRg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWovtCCRi06sL5fIm5639Dw16mBs8mH8fSte1LynwbJu4Tad7oP/fmdgnf2z6avWX
	 SAGCGk3ty7SU7tjwb/1mYJ7HAwhyVvWLRAFvjFTwxyKrHVxgUpOsLMSjUmr5Wvj4SJ
	 28eHvUTS/SHrH9MnPRN79btSbmdoLuXmyriVR+Li2ZD3EhAEYAbqEgf6bQyd2pE/Pc
	 IndX9wVzPM8QaG4vkdxoysmsbbNnAbrcvKO7RObtt1f+3hvw2hy8u5pwN+ZtWEEe/8
	 lkBFyaqjhwlB1SrPX6mPQA3s6M+GtaPJ6kr3H9OE7eWrcpjC4ig/M86PMkFUBq/KcN
	 89IA7XYACZ4CQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 53/55] clk: mediatek: mt8135: Join root_clk_alias and top_divs arrays
Date: Mon, 20 Feb 2023 16:01:09 +0100
Message-Id: <20230220150111.77897-54-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070232_214739_5164330E 
X-CRM114-Status: UNSURE (   9.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for converting this driver to the common simple probe
mechanism, join the root_clk_alias and top_divs mtk_fixed_factor
arrays.

This commit brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8135.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 1c76c0003f99..8785d58cb3a5 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (c) 2014 MediaTek Inc.
  * Author: James Liao <jamesjj.liao@mediatek.com>
- * Copyright (c) 2023 Collabora, Ltd.
- *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include <linux/clk.h>
@@ -19,14 +17,12 @@
 
 static DEFINE_SPINLOCK(mt8135_clk_lock);
 
-static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
+static const struct mtk_fixed_factor top_divs[] __initconst = {
 	FACTOR(CLK_TOP_DSI0_LNTC_DSICLK, "dsi0_lntc_dsiclk", "clk_null", 1, 1),
 	FACTOR(CLK_TOP_HDMITX_CLKDIG_CTS, "hdmitx_clkdig_cts", "clk_null", 1, 1),
 	FACTOR(CLK_TOP_CLKPH_MCK, "clkph_mck", "clk_null", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "clk_null", 1, 1),
-};
 
-static const struct mtk_fixed_factor top_divs[] __initconst = {
 	FACTOR(CLK_TOP_MAINPLL_806M, "mainpll_806m", "mainpll", 1, 2),
 	FACTOR(CLK_TOP_MAINPLL_537P3M, "mainpll_537p3m", "mainpll", 1, 3),
 	FACTOR(CLK_TOP_MAINPLL_322P4M, "mainpll_322p4m", "mainpll", 1, 5),
@@ -534,7 +530,6 @@ static void __init mtk_topckgen_init(struct device_node *node)
 
 	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
 
-	mtk_clk_register_factors(root_clk_alias, ARRAY_SIZE(root_clk_alias), clk_data);
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
 	mtk_clk_register_composites(NULL, top_muxes,
 				    ARRAY_SIZE(top_muxes), base,
-- 
2.39.1


