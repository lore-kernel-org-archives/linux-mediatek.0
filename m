Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D1EC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV5eRz6WuCMtouVV++EUgssRVFovzuPzfprpSFBP8os=; b=hFngYxbg6oAwIdtdInGsF4zs14
	rXQq6MltuNgv1D0iBLSnEfAE+o+I//zjKKc1R2JiLejDtrIfta2up1JXhLkd2Do4ohhH83hAZTAAP
	8HzE0yZyQKO43IxFmu+44gGZ5hPuTMJCu5X784mofeJR5aLblIOB+1IjiM9eOkjCDm1ggpqEE2Qz+
	wDlFtZ6bKoMFcaV10NRhCGjybIe77FZ0kf3X7pV6anY+6HSL5G3oHUdNCC+SGl9MTk4Jlt4JBRjHk
	hDLNK2seShHCSAImn/r6Q3nmn4CSqXGorJXe8QnvCXcqZSEikRmP6Z1248KBuMdlNzShMbkYTpvWn
	FU6opgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlgj-00BZjw-Uu; Wed, 22 Feb 2023 09:45:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOQ-00BQ0V-5p; Wed, 22 Feb 2023 09:26:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C01E866021BA;
	Wed, 22 Feb 2023 09:26:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677057988;
	bh=kTtACXAEbNAgNCZdigRxep+XT4EJ4BHRbcIY5vyvaqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLIK1Lplh62JGI2J0W+p96ybN3rDJUEZsw0Ht8TwnUVSRX6+YsU320e/lYfYF9stm
	 QzBYP8jjJmNBgh92do6muZ+vnrl6PG/fTgl7al/HjevpKJ9e0IwIr8lFWkr84G4SyR
	 Y5Oskai0eJ3pROA/fcw+UDJ+L+uPUzHyRODgCbBn9YRhusBYL8gf7uxAqQgMcdf5ln
	 NJWnSLap6/bEV2Xo0rJhE2M0QRas++baa32elny12fDADcbK0Qf4UcTaZIuLrdRLBk
	 Ps9E6Au0iSrxZG9WSbuYv0EJnVH2QMISZnpTmrH01pD83hC2ESzcEsCCYheKkdjcTb
	 FYqmDYsxXelkQ==
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
Subject: [PATCH v5 25/54] clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build
Date: Wed, 22 Feb 2023 10:25:14 +0100
Message-Id: <20230222092543.19187-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012630_389101_EA44B136 
X-CRM114-Status: GOOD (  14.44  )
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

Add a .remove() callback to the apmixedsys driver to allow full module
build; while at it, also change the usage of builtin_platform_driver()
to module_platform_driver() to actually make use of the new callback.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 497fada797b9..a9f3057d7080 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -119,6 +119,19 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int clk_mt7622_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
 	{ .compatible = "mediatek,mt7622-apmixedsys" },
 	{ /* sentinel */ }
@@ -126,12 +139,13 @@ static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
 
 static struct platform_driver clk_mt7622_apmixed_drv = {
 	.probe = clk_mt7622_apmixed_probe,
+	.remove = clk_mt7622_apmixed_remove,
 	.driver = {
 		.name = "clk-mt7622-apmixed",
 		.of_match_table = of_match_clk_mt7622_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7622_apmixed_drv)
+module_platform_driver(clk_mt7622_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT7622 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.39.2


