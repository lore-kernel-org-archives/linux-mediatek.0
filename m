Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8A2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU/UHfChjozGS9aYb66puSLM1gs/fe8H5Kk7e5cMh0Y=; b=tlsYePHtZGXs1P07xJSZXSZXo7
	13sVdXL96T1KRATPzul/pDUizEzcuR7Ps6yEEnHxZ3wrcp7y1sdBYYDLu4fPLEL4qJAr8C+yJvzN1
	g+hFIh5uZTp8y0jrcpzltQYp7BbpUoGlW90wlv0nNzMeNonCUw08+vV4AQFBahC1meLwyPqLtTgaL
	FhqVic889pGtIeSUwhDsHs+DYc1rCKPJY6hTJkQnoAzA1YZwwLhzeRlcVQr9wvcDT6Ui6iHSa+TBl
	GOQRF+BnRtDa16IhGpZTdvFMOgGWtowwcPTS5MCuY9h3hlJd+0dA3hniS0jJu3VkZxAmRJV5F1T3k
	5AGam5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlnt-00Bdbf-SP; Wed, 22 Feb 2023 09:52:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOX-00BQ6R-RM; Wed, 22 Feb 2023 09:26:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 807D566021D6;
	Wed, 22 Feb 2023 09:26:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677057996;
	bh=EZux4XvozxTfT1MBJdYQDdAaJ/Fvo9KrYOjbKQf5sXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jS/OPzQ4l+bmTRkjtjsY0frzzik5nWYkxodTlOb6Bai0UGc91nHhgmoCSnFdnt7BK
	 VekIOX7sIM4A+YfPthPHe7EQTotiiH4mHuLREvai+L+J693o4QcWaSySJWf/DsiC3H
	 v/l3pCMaUBDiJiMSWMv3b3IyTTtFsRQaGLH+jUqHTIZeA8sCOT/5nYCylHMdrbgUZs
	 aHY+eYV4/1LwoiLus0npTQwhAnM6Akxkz1IcfYYEO3XHtN4i0R04Q9P39Ap24P0WR0
	 9w9fB7gMmfDhy/VN4c+u/hrnx72KDkMamAV50WD25+HuEnaQV7Hby2TEtSUEbenB36
	 5qwPN640J4q3w==
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
Subject: [PATCH v5 31/54] clk: mediatek: Propagate struct device with mtk_clk_register_dividers()
Date: Wed, 22 Feb 2023 10:25:20 +0100
Message-Id: <20230222092543.19187-32-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012638_189952_DA47304F 
X-CRM114-Status: GOOD (  12.99  )
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

Propagate struct device for divider clocks registered through clk-mtk
helpers to be able to get runtime PM support for MTK clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2701.c            | 2 +-
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mtk.c               | 8 +++++---
 drivers/clk/mediatek/clk-mtk.h               | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index dfe328f7a44b..e9c27b1364b6 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -681,7 +681,7 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 				    ARRAY_SIZE(top_muxes), base,
 				    &mt2701_clk_lock, clk_data);
 
-	mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
+	mtk_clk_register_dividers(&pdev->dev, top_adj_divs, ARRAY_SIZE(top_adj_divs),
 				base, &mt2701_clk_lock, clk_data);
 
 	mtk_clk_register_gates(&pdev->dev, node, top_clks,
diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index ebd90365be5f..27597fdeb6e9 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -109,7 +109,7 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = mtk_clk_register_dividers(adj_divs, ARRAY_SIZE(adj_divs), base,
+	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
 					&mt8167_apmixed_clk_lock, clk_data);
 	if (ret)
 		goto unregister_plls;
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 01224cfbcc79..fd2214c3242f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -393,7 +393,8 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
 
-int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+int mtk_clk_register_dividers(struct device *dev,
+			      const struct mtk_clk_divider *mcds, int num,
 			      void __iomem *base, spinlock_t *lock,
 			      struct clk_hw_onecell_data *clk_data)
 {
@@ -412,7 +413,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 			continue;
 		}
 
-		hw = clk_hw_register_divider(NULL, mcd->name, mcd->parent_name,
+		hw = clk_hw_register_divider(dev, mcd->name, mcd->parent_name,
 			mcd->flags, base +  mcd->div_reg, mcd->div_shift,
 			mcd->div_width, mcd->clk_divider_flags, lock);
 
@@ -535,7 +536,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	if (mcd->divider_clks) {
-		r = mtk_clk_register_dividers(mcd->divider_clks,
+		r = mtk_clk_register_dividers(&pdev->dev,
+					      mcd->divider_clks,
 					      mcd->num_divider_clks,
 					      base, mcd->clk_lock, clk_data);
 		if (r)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 554aecdc1015..b7a751861fce 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -202,7 +202,8 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+int mtk_clk_register_dividers(struct device *dev,
+			      const struct mtk_clk_divider *mcds, int num,
 			      void __iomem *base, spinlock_t *lock,
 			      struct clk_hw_onecell_data *clk_data);
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
-- 
2.39.2


