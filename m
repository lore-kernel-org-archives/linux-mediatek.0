Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EB1C6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33nMUvde0X5gEChmfniVXMKf3dzqFgGOXXw1lYOVhHA=; b=WEIx74wcq33d3pF7N2/jExYXO5
	EOUDvGj+vch3oiMuTIqeMbP0cH2IEJiIc3C9X1PLQNo5aKAtSOWTzsSO/IdfIEfJ5b+QPciT5NlZ4
	0IQro2EJPu8RrKVInw9AsApW7szqNJptX5emlycBFxfYHt9ElHwCptUT4nYhSkgAqhHVaGNEez14J
	5a6lNV0eLP27TXziaOtPf0+mHNmT0DommiZRO8tq6V1uVXyBCgIrYCV3GGbQiLYyKI5vwmfoI/wDC
	qSB+s/2+3+YYem2/0rGv7J7lySJnc/IGk9elHhNWd6rjUXOnDdkeV1Jpbof5q72UTy7kM20Et/Q/F
	MmdPcfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7cz-009nfi-6h; Tue, 27 Sep 2022 10:15:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7Z4-009lQ3-Fj; Tue, 27 Sep 2022 10:11:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 551EA660226E;
	Tue, 27 Sep 2022 11:11:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664273505;
	bh=5IWI64htpEUd32LavmbW5vcTEzgbRV3GoZjikO26riQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avjHok5TrFI3/972JFn0CVpzlKvuEqyFdFWvlvd7I+U9ARrLUoA/uhao8tEgHNM0E
	 SwfUKz4UcLFxm4XcH9L4zAheamC218jaUOER+Ixa/5demwgbQN1YOvgtDW5dL2Pmu5
	 Phz3pBPw1Fpj+q6msB0S80OE8PFfg2nSyvGtT0KJbX/Qq2zyhJPjrUD6puh7yOHqFY
	 w46u7ZW+QrIvwUyKEUPc485MWr48eby8CBc/aRS6mqqoQxnsrCsvX2iqhUl783JTzg
	 sEBY1R5p4V7e2uu7T5lCJmBllWttBGqVjGZXLBuFB0W5WJSMFGBHiMi99zLAsydqYb
	 0B9hvheXY2J4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 10/10] clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel
Date: Tue, 27 Sep 2022 12:11:28 +0200
Message-Id: <20220927101128.44758-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_031146_688270_551D3AFD 
X-CRM114-Status: GOOD (  14.28  )
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

Following the changes that were done for mt8183, add a clock notifier
for the GPU PLL selector mux: this allows safe clock rate changes by
temporarily reparenting the GPU to a safe clock (clk26m) while the
MFGPLL is reprogrammed and stabilizes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ebbd2798d9a3..187dbffeb987 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1224,6 +1224,28 @@ static void clk_mt8192_top_init_early(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(mt8192_topckgen, "mediatek,mt8192-topckgen",
 		      clk_mt8192_top_init_early);
 
+/* Register mux notifier for MFG mux */
+static int clk_mt8192_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+	int i;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(top_mtk_muxes); i++)
+		if (top_mtk_muxes[i].id == CLK_TOP_MFG_PLL_SEL)
+			break;
+	if (i == ARRAY_SIZE(top_mtk_muxes))
+		return -EINVAL;
+
+	mfg_mux_nb->ops = top_mtk_muxes[i].ops;
+	mfg_mux_nb->bypass_index = 0; /* Bypass to 26M crystal */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
 static int clk_mt8192_top_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -1247,6 +1269,12 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
+	r = clk_mt8192_reg_mfg_mux_notifier(&pdev->dev,
+					    top_clk_data->hws[CLK_TOP_MFG_PLL_SEL]->clk);
+	if (r)
+		return r;
+
+
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      top_clk_data);
 }
-- 
2.37.2


