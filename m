Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62CCC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iooPnxNCUreiwnxtHYmk6idbQKNNvEUNLwYSBGiCLqo=; b=vtW02jcZvKqEgWmYtVlypBYslt
	F+N8Vrr7yYdqLh3mb8lNvU9k+vfjyT0U//O5MUmnz5fCLsinqawFkxLyYOYWDz14hoIhLBKpUdJeA
	0CWSzM6UK7y8bkRBn2w3cXHbKhJLDFVihhdcWSSlNDjgjKBlA4HxrR/qCjune4mnxmCvfHwI2cybc
	XxZ5+SAoDe688VSKRbGwN1RugNZL3iiCVukuCPH/hrw5G6/HfjqKcwI9zjMF81eA5s7tAUtSvWUvP
	vNpTeRepQm1VlRAZLTwbLcsKd9+tvLLrJSUMBMdTPVtf7xDZNuTpfHpASpeJdspHjezqeX8bCliSt
	HGR1CPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBXE-00D5kY-5a; Mon, 06 Mar 2023 14:09:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBTV-00D3Sp-1S; Mon, 06 Mar 2023 14:06:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E3BE6602F5E;
	Mon,  6 Mar 2023 14:05:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111559;
	bh=PZs5wdP/t1w765jNm6To6HjMlHPQzqqkeY9IbGaKLfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LfI6W/EpTcejsF1FPepNAzwkvjhg7GEGyGcYs0qST032UOAaKyvT6Kz/B4lqLaQp4
	 Ap7Fy1HnASx/W03Zz0n/I+10rT9kn4ikfoyCOZRNnwNklkwlDiOAq6YhuEDEm9xmgu
	 FFAxI3E3lu8VX13045lycp99cJ6R/M8/R3ME7xkUk6qwmaCzXW6BiN0iv3W4604HOB
	 5bEzu+GRyrvz7Ofj/UjzBzU2eJWj4QCEnr8Xmvm8g0RNE1rZkIUKr3ex2eGa/Uv5DL
	 lQr4Nkt/+zBRkOlrer+i9J3AhS6cOHWliRkwR+UfAJGx03ktZWQd9A6aQBphdWSTqx
	 Q9F9sAcNK32BQ==
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
Subject: [PATCH v6 07/54] clk: mediatek: mt2712: Add error handling to clk_mt2712_apmixed_probe()
Date: Mon,  6 Mar 2023 15:04:56 +0100
Message-Id: <20230306140543.1813621-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060601_910010_8ADE1743 
X-CRM114-Status: GOOD (  10.40  )
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

This function was completely missing error handling: add it.

Fixes: e2f744a82d72 ("clk: mediatek: Add MT2712 clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2712.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index ce28ee47f5cf..8aa361f0fa13 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1091,15 +1091,25 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (r)
+		goto free_clk_data;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r) {
+		dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
+		goto unregister_plls;
+	}
 
-	if (r != 0)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
+	return 0;
 
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
 	return r;
 }
 
-- 
2.39.2


