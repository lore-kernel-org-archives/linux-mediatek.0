Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDFCC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIUe/urSrw8UKNlFpYwM/jHzYq59djlpkvIdsXh3rRU=; b=ktQsV69YDtqmfxaDiEDtI6Ns3m
	T/+pEeCkzdqpWH3GYsXYJepywqE1xetAKYMuTQzMz7q2j06FtueTnUEecqnx2FKxtamcC8lUeoHRA
	uioVvRy+j+FljP7gqZICeIcyhIu57X8MMLRpmx26C5LvZefmuvxqx2s7SeEVcHVo2B38v6CcRAmUd
	l5w5TclmupEFM5Qai/2OgbqaFraAN+zAkgrLgyK075DioDkNr7oIaImm2es8uG8kQucYacg9cYl/z
	PCOk17W9Ep0MHiIlvjuACFn6pRnFpQS9f46HJRMxV7sverQI9qQLjcRF/NggWS8jTXcrqBfupu6Gv
	bZq23YQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZQ-001li1-62; Tue, 14 Feb 2023 13:42:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZ5-001lYi-IY; Tue, 14 Feb 2023 13:41:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7F926602170;
	Tue, 14 Feb 2023 13:41:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382104;
	bh=iO2EFs+uVUr3LJJKJ1mXQIFQpij+PavyEEfSYdwBwPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPIWO89k/2kYKJUXPh17FLmvFbvjlNqcB+IuvcaLUepBCh6imvMNWTAkrqxhL3K7I
	 frtTsdisQ7tyCj8oaKKtRrTVqYLn1FaXpIZiBpC55kSgl0sWyHz6QHStJ3Wxe5IjnH
	 J6lpqSSV6MOs/+DfOzYCdzt9FMoTXk5KnnQRhF8jdxvTmy3hctyf7hbDeLQfvS/ncO
	 hM2l9jE2BjEZ5ESTcNaWHhq0VZrGWd9F6f6J9WatpxNdypyVUmniX+KWkt4y6L1kHs
	 ImdoJVKpF/47owNk2p6XVKZVOqd7bCXBbC21rL7oSXZjf+eWe7dQlpOFkPqjQH0kZK
	 ERzQgh13nc5Ng==
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
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 02/47] clk: mediatek: clk-mtk: Introduce clk_mtk_pdev_{probe,remove}()
Date: Tue, 14 Feb 2023 14:40:42 +0100
Message-Id: <20230214134127.59273-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054147_897453_6DE34957 
X-CRM114-Status: GOOD (  15.75  )
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

Introduce functions clk_mtk_pdev_probe() and clk_mtk_pdev_remove():
these will be useful to commonize the probe and remove handlers for
multimedia (clk-mtxxxx-mm) drivers as these are registered by the
mtk-mmsys driver instead of having their own devicetree compatible.

In order to do this, the main logic of clk_mtk_simple{probe,remove}()
was moved to new static __clk_mtk_simple_{probe,remove}() functions
that take as parameter a pointer to struct device_node because when
registering the clocks from mtk-mmsys we want to pass a pointer to
the clock driver's parent (which is, obviously, mtk-mmsys) struct
device_node instead.

As for the clock driver's platform data: for the devicetree case, we
keep using the standard match_data mechanism, else we retrieve it
from an id_table.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 54 +++++++++++++++++++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 71eb591cd00c..a69d3f0a38c7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -462,17 +462,25 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
-int mtk_clk_simple_probe(struct platform_device *pdev)
+static int __mtk_clk_simple_probe(struct platform_device *pdev,
+				  struct device_node *node)
 {
+	const struct platform_device_id *id;
 	const struct mtk_clk_desc *mcd;
 	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
 	void __iomem *base;
 	int num_clks, r;
 
 	mcd = device_get_match_data(&pdev->dev);
-	if (!mcd)
-		return -EINVAL;
+	if (!mcd) {
+		/* Clock driver wasn't registered from devicetree */
+		id = platform_get_device_id(pdev);
+		if (id)
+			mcd = (const struct mtk_clk_desc *)id->driver_data;
+
+		if (!mcd)
+			return -EINVAL;
+	}
 
 	/* Composite clocks needs us to pass iomem pointer */
 	if (mcd->composite_clks) {
@@ -581,13 +589,12 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 		iounmap(base);
 	return r;
 }
-EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
-int mtk_clk_simple_remove(struct platform_device *pdev)
+static int __mtk_clk_simple_remove(struct platform_device *pdev,
+				   struct device_node *node)
 {
-	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
+	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 
 	of_clk_del_provider(node);
 	if (mcd->clks)
@@ -608,6 +615,37 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+
+int mtk_clk_pdev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+
+	return __mtk_clk_simple_probe(pdev, node);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_pdev_probe);
+
+int mtk_clk_simple_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+
+	return __mtk_clk_simple_probe(pdev, node);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
+
+int mtk_clk_pdev_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+
+	return __mtk_clk_simple_remove(pdev, node);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_pdev_remove);
+
+int mtk_clk_simple_remove(struct platform_device *pdev)
+{
+	return __mtk_clk_simple_remove(pdev, pdev->dev.of_node);
+}
 EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 41f4fa3b0c21..b8e0ff8f52fa 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -236,6 +236,8 @@ struct mtk_clk_desc {
 	unsigned int mfg_clk_idx;
 };
 
+int mtk_clk_pdev_probe(struct platform_device *pdev);
+int mtk_clk_pdev_remove(struct platform_device *pdev);
 int mtk_clk_simple_probe(struct platform_device *pdev);
 int mtk_clk_simple_remove(struct platform_device *pdev);
 
-- 
2.39.1


