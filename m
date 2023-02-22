Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F7DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azsVNssM4YVIgJkjBhfB+0RW4YebySD+ilpX5G6kaO0=; b=L+3v6GeVclVP4105USpdi1vXDy
	xAUIURRr6LCzecmMz4vdbTZUgs2PCt7kArzgaTj+uioe0Dzj+qGwCrSVBTq07zIoGo4jb0ANiYfZB
	QtbqTopR2BnH+SY87tmTmDIHbB7vlxTJaYtXaWUd3+s1BPucSsrFBOERt1hJ4rHId304YePxxYSIX
	TqPBUmM5ZJl4oB9t9fqBOF4SLYwIUmA5X+UqbT6khpCW9h2OIGsyBZbHSjeiBxlnyVEWw5Mjbj6pS
	ClJhlBYURaXT7/1oECj0d1lG6V+JOzDgelh5kL3v8z86UzUGOcqd0rCR60Bd2hmbBRFqtpOby1hiE
	tFjZ7xeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUm2d-00BlQX-95; Wed, 22 Feb 2023 10:08:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOz-00BQOk-4c; Wed, 22 Feb 2023 09:27:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8013366021E9;
	Wed, 22 Feb 2023 09:27:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058023;
	bh=G39BkrHiy8UDI2+jdX1lg0zn/2dAssLXNfESAl+XYlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5AYqRBygUyPm3Y05igGdToRr37p4+IpDXf98PB3KlWU9jdUfvdQb/P5+RctkLe1c
	 BFhgVuBbjqfmSz1IyC0gkdb09sGuoI1WdbteLL40pSSbmmjh8SsO8uQqL+rNDojvaH
	 v1ISsfV0JTl1oqY5dhRnWFSfHuTI3DE+c6ntv62g+5F8ZUNTymqq1NfIV3siOt2uTD
	 x8c8DhH2nVtVONnvnxReiE3oULewZykP/LCSF7u+WNgwHzix8KgCzsFf8Q8rDOot48
	 9VgE4jZ2HGtyc0RCJ3y/W81Zud+nwzL5cwhszSlc83fhtkcE4Ub/LMvyYf4j9/FvPo
	 cE3JLrg5x3pOQ==
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
Subject: [PATCH v5 52/54] clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module
Date: Wed, 22 Feb 2023 10:25:41 +0100
Message-Id: <20230222092543.19187-53-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012705_362671_39185330 
X-CRM114-Status: GOOD (  16.11  )
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

Convert apmixedsys clocks to be a platform driver; while at it, also
add necessary error handling to the probe function, add a remove
callback and provide a MODULE_DESCRIPTION().

This driver is now compatible with an eventual module build.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 53 ++++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 2b4d379300fc..744aae092281 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -47,16 +47,59 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
 };
 
-static void __init mtk_apmixedsys_init(struct device_node *node)
+static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int ret;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (!clk_data)
-		return;
+		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		goto unregister_plls;
+
+	return 0;
+
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+
+	return ret;
+}
+
+static int clk_mt8135_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
 }
-CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt8135-apmixedsys",
-		mtk_apmixedsys_init);
+
+static const struct of_device_id of_match_clk_mt8135_apmixed[] = {
+	{ .compatible = "mediatek,mt8135-apmixedsys" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8135_apmixed);
+
+static struct platform_driver clk_mt8135_apmixed_drv = {
+	.probe = clk_mt8135_apmixed_probe,
+	.remove = clk_mt8135_apmixed_remove,
+	.driver = {
+		.name = "clk-mt8135-apmixed",
+		.of_match_table = of_match_clk_mt8135_apmixed,
+	},
+};
+module_platform_driver(clk_mt8135_apmixed_drv)
+
+MODULE_DESCRIPTION("MediaTek MT8135 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.39.2


