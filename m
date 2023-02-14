Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4458C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfkyL35Q87avz+YthEsjK3kkTCX1OXcSswA6mNUoIxY=; b=pQdUYdnfvcegci1pbBMXAkaaf4
	f7edS/ztElWaj5zzF9iRzyxis702kyMw8PBzXkBlPOVznv88pxfJmoDWRfRmjBjqaVUaj+HACpvH8
	6BY1IkocBs6EO09ncl3QTLgSgmdrZJQAai/rmhp3tkm67hM5wNI5YCvRJDx+SvjgF+Fg7MSlHITVn
	WZ425ScIGT8wo/46yMwGFNk5tBetf3jaEAbz7dxrDuA+DlU0L2QOJV/pcDTxAbFwYMZtvbJSam1dk
	/jqN82gS9cLXLaXgKc30xMFVMr6fwziKQMUHoHEEUvaL0x8qmw2OW+QE3Au3Os/L+8ZIfIF8sNqGi
	jh/7g7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvw4-001yMk-DI; Tue, 14 Feb 2023 14:05:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZi-001luL-TV; Tue, 14 Feb 2023 13:42:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A7CF660216D;
	Tue, 14 Feb 2023 13:42:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382145;
	bh=CLknQX9SFUtoj2mggvrjYiI8IwHCqlwdtblptlQ1mvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bkkyxXUAHf240CD5sveUJDrpTcPBN7PfFNzCoYtbG+PsrtUCWuqdcYMaJAilJPhq4
	 mbe97bC0NaZbR5JHLmNDlp3AMJeRBt5wBv9jpoCltE7sfCLY06VYwwtUdQ0duZOrNV
	 KZa8TiqqNimpnucYyJvd6yV16OMZNOMk4EllGKtmDun0+DUxFlhEqXLF/AeTHk7Abl
	 hepzKobZy2/zJpQl+NC7akG1Od8BhefkJ/sAK5ouCo/VKxP5e66wdAxTfLtLqp5asX
	 ZdnVHQn8jW/irlUx1MbWB0BDq6YMlGV/io//e9/5y8fa0Ro4+eI8aXGN6qrZSdzMyS
	 jq1I0L8Byv1VQ==
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
Subject: [PATCH v2 33/47] clk: mediatek: mt8186-mcu: Migrate to common probe mechanism
Date: Tue, 14 Feb 2023 14:41:13 +0100
Message-Id: <20230214134127.59273-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054227_118488_ACBE4DD7 
X-CRM114-Status: GOOD (  12.13  )
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

Convert MT8186 MCUSYS clocks to the common mtk_clk_simple_probe().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-mcu.c | 68 +++++----------------------
 1 file changed, 13 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
index e52a2d986c99..895856df95df 100644
--- a/drivers/clk/mediatek/clk-mt8186-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -43,67 +43,25 @@ static struct mtk_composite mcu_muxes[] = {
 	MUX(CLK_MCU_ARMPLL_BUS_SEL, "mcu_armpll_bus_sel", mcu_armpll_bus_parents, 0x2E0, 9, 2),
 };
 
-static const struct of_device_id of_match_clk_mt8186_mcu[] = {
-	{ .compatible = "mediatek,mt8186-mcusys", },
-	{}
+static const struct mtk_clk_desc mcu_desc = {
+	.composite_clks = mcu_muxes,
+	.num_composite_clks = ARRAY_SIZE(mcu_muxes),
 };
 
-static int clk_mt8186_mcu_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-
-	clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		r = PTR_ERR(base);
-		goto free_mcu_data;
-	}
-
-	r = mtk_clk_register_composites(&pdev->dev, mcu_muxes,
-					ARRAY_SIZE(mcu_muxes), base,
-					NULL, clk_data);
-	if (r)
-		goto free_mcu_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_composite_muxes;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_composite_muxes:
-	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
-free_mcu_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static int clk_mt8186_mcu_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
-	mtk_free_clk_data(clk_data);
-
-	return 0;
-}
+static const struct of_device_id of_match_clk_mt8186_mcu[] = {
+	{ .compatible = "mediatek,mt8186-mcusys", .data = &mcu_desc },
+	{ /* sentinel */}
+};
 
 static struct platform_driver clk_mt8186_mcu_drv = {
-	.probe = clk_mt8186_mcu_probe,
-	.remove = clk_mt8186_mcu_remove,
 	.driver = {
 		.name = "clk-mt8186-mcu",
 		.of_match_table = of_match_clk_mt8186_mcu,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-builtin_platform_driver(clk_mt8186_mcu_drv);
+module_platform_driver(clk_mt8186_mcu_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8186 mcusys clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.1


