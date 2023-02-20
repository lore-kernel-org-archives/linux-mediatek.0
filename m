Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07271C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oG2odSgD/IIZfJukt8IL0cPhHJ061lOLrthjgl99LzQ=; b=nzVhjvasqo2Bil16V9FYUJhE4e
	iB9W4Gr0h4SmvDZZuYYY7U1yPPsiJKHMemuALH7TpD5t4olHP2l3d6Eb0uQ3u5Y9R3j/JLXYWv8qs
	Snetoegg2J0MWcBAwRnVlmQKvidRi4lYvBxz82zPQKsvMgZBgMOs4ESDu7dpBPuc3HzUpjI+xsNoQ
	gQCldUuXGy/MVXaVRqaC8e38IzEpvle7vCGyi5GSDoRwfLYk3LXrD6DEHtMnbsBpVDh1iIzTWQ3xG
	Ctxk969b0n6ryWMnKMd+qU5OEiDcUoJazI51unJenXYiqF2BG/HjqRdTZUd+PJZIdxAYYClyZTJJu
	1nBZHHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU826-004ZGP-5l; Mon, 20 Feb 2023 15:24:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7g0-004NZ9-Ss; Mon, 20 Feb 2023 15:02:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 848276602168;
	Mon, 20 Feb 2023 15:01:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905319;
	bh=ZplN2YRj3Q1FQDaVBRSPFITk+c8951vtcnNlTkqRLoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNja5X8I2Xa0vjCsknaEVkaWxsXlak9965fMGPxempAmDxaNRS6NW5+art/yCM4Gx
	 LstgMSiIfJUReqFl4TeFXFdfgZg+TPBQgsi+XDr6J1P66A0w2XSl1+F0srPj/B/iA+
	 awn/0cZ4VEXdCZwRVtuXz7Ju0Zg477OcLxHhxkvV9sLZ31vZIcMmyXENpsLbAUtVtv
	 n7Z4jNadSjXKM+VSHMqMHA4QsBtus4SGaRMVkBjAbPoc5kvKyiucMhKWxaiAVih1d1
	 TllgIVd+Ak8iavgXkq1YIJqq13RDV+a8itDi3bV7JmFbPkFXeDl5nyJdZdaRvzTo5u
	 S3gxaTYfo7YAg==
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
Subject: [PATCH v3 31/55] clk: mediatek: Propagate struct device with mtk_clk_register_dividers()
Date: Mon, 20 Feb 2023 16:00:47 +0100
Message-Id: <20230220150111.77897-32-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070201_240984_30D71F80 
X-CRM114-Status: GOOD (  12.95  )
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
index 39bd360aa0c9..7013340e116e 100644
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
2.39.1


