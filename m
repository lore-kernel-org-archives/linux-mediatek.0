Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E1C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7EPf/bu/wWvAfxwWOvitKGpOVpu+iOkwmV/eQCMYP8=; b=l6JC8DyqQYoBRh+3bbQC1J5WBY
	jvmxcM8uu9RqluTnWmBWZm3jZyGUS6kS1cTcYDqkV0PgOeXNBO49qFTE2L5ImkXRrZQsh0ZqXD9AW
	5UXpDIjYKrxS20ZLvGEO+ngnMtpMB1Rl0C8OSaVZNN3pKva2mI+8SbqAjs+TUPdturGB85jbZiCqk
	M0vqvIL8tPzHzNAsBdD6hek5teQ7FSqxoiTDuRydiTdsw0z8f7KycrjOCcXZafqmG65HEjmAcrfYw
	Zd4OLxGFTF2qHpfQzuSgaphG/Yvnb8wMXVpXsIZj1FDCzrZnFj6InzZikd1jXWVkQs3qtnQYBWgFo
	fROsssoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7jd-004PhY-GQ; Mon, 20 Feb 2023 15:05:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fW-004NFt-53; Mon, 20 Feb 2023 15:01:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B3B946602176;
	Mon, 20 Feb 2023 15:01:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905288;
	bh=1HjfxwBN9RMNJRVz4a+nf3R3egMM6Q1nEwSqqRs4zLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8jz3DF7JRSNqwlW0P6Qkg172fLy3cQRNCIhmLdsgg5oRi4wXUsxUZK97lBLE2ZMQ
	 +FUsZuFVRoRl3aHgFYbl1j48qYx4FgBViu08oYHjzh6U+f5TAKUEdwGnn8xmpbLhgz
	 otYwtMb/nnVy50Z+fWgTApME6HxWeUkff4XZ+Yi19MtStO4yHcy/ItU1KVj3njiaag
	 /fSt3DXsv7jMUT047dC+vpRyn94Vrn2ryD92vn+xhQyBTjRmGJgoNgx5TQ7ZqUYdqQ
	 ZOW35mSeJj5VzRhSoK2Lg2sE4mGyLNLzifA7KBkg1HwYoUnvoUw9B5P1D7KZ0S7gmh
	 nD2CEe+qQZCkw==
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
Subject: [PATCH v3 09/55] clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build
Date: Mon, 20 Feb 2023 16:00:25 +0100
Message-Id: <20230220150111.77897-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070130_366281_872197B9 
X-CRM114-Status: GOOD (  14.21  )
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
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 1e1a8272a4ac..2f4061c9a59e 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -138,6 +138,18 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt2712_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
 	{ .compatible = "mediatek,mt2712-apmixedsys" },
 	{ /* sentinel */ }
@@ -145,9 +157,10 @@ static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
 	.probe = clk_mt2712_apmixed_probe,
+	.remove = clk_mt2712_apmixed_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt2712_apmixed_drv)
+module_platform_driver(clk_mt2712_apmixed_drv)
-- 
2.39.1


