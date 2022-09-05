Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A278ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU04sl6BYnVhhtvS46Oq0Umw3lLntsxJGwq3IOJh7s4=; b=h7DdzhDKAVfXgq7Qo1cPlozwi0
	bC6mkgugjWDYJZ3ybWNpr742NiqHGhMMYuBUeESlKbZl8aODpG6z9zCerQLkUYC4df0FQmK5NOF22
	/0H4elLt3cDM5oqjhR1z+8bnzWNhHQhtqvsEIDZ6SEvBrq2vX4HdsHkjhf0AmB61PX/2GxHg6/Ibd
	140RzDjdBw80H9nB0rQxsXYbw2iUfS1QEaznaEp4WJ8X8mOOQB6q45fvbHGZnFsAJ+XPxZduAuBgt
	+eM4VzdSHQ3gIuIKl4TaNaBqjfLBR9O5vnNNG9f8BCrQ4UxGm4evmtnMMoubSzpxaIwY9cLHDhk0u
	HkJuG41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA6p-001284-7O; Mon, 05 Sep 2022 11:17:43 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yG-00HIFV-JS; Mon, 05 Sep 2022 10:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fU04sl6BYnVhhtvS46Oq0Umw3lLntsxJGwq3IOJh7s4=; b=UnZtwcAGhXw5HHg0v5uTm6C//5
	Qz49teKg1UN053QgY1F50SBG5pl8BQjLXtKp+7Y3X+8EZbDN2dzRmI+scYDVSQIffesuGacB1HDeY
	xac3z5ik3ePeMgONDntihce7GBB/1muhR2ZkZLDkD/mijakGsuddgnIGE2DKlCYT15gtjKOJ6Ih7k
	tIRpiPsxYx8vTKghqllmaWWA8SsQqwSAV3oZzwNTWG73ypVYAhq+pVz8ptIfq7JTLZD71vKJX0CWK
	4ftmZVjwokzcEHAwcJE5eEDgkhkUAJ2LbZgEcH3RdsX5Qvuw6JsE0lNdyTJDnV83q2F/yug003PNJ
	HkLuZSUw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yD-009NGe-9M; Mon, 05 Sep 2022 10:04:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A6836601F3A;
	Mon,  5 Sep 2022 11:04:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662372280;
	bh=6GKwElOpPO/EzvphH5H6i47s+zy8VO878SMP2y1sjwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RuL182S0xoyK8tsGbzDbCL5ATeQHaM/fnHLfZfRK6jsNEq8D0ezrBJAJ3xQrPTQhv
	 lrF2A5jv5mrX/dzmjY6D/AeiWIukHVruY18FGOkk5WN6MZU2Vt2nhqT9m48+0JuRsm
	 uiAbCA9Tx4ENtOqkUEthQoIiuScY5h3FzeOAiIMRXD2g09QnrTVC+bRPRxOFz/Bhn2
	 H8KOnqW1pHWMN+YkhoSKQiSoXZ0jSk5oMNwmIRS/2wXQXJEVHxsBwljhbgegL+EieV
	 XCkYN9Je6UZLlLEY3H9MMdMbetbREgalVV1ajxkn25NHK2hJpl/X4ogtAWZlK+Mvlh
	 +tW7+4th8Ew/A==
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
Subject: [PATCH 10/10] clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel
Date: Mon,  5 Sep 2022 12:04:16 +0200
Message-Id: <20220905100416.42421-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_110445_394524_E5BA4126 
X-CRM114-Status: GOOD (  11.77  )
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


