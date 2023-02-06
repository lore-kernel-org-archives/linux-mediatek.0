Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC9C63797
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV7dmS0A1SuTF2ovOixLewqV0220A/WONbOh27o3v6A=; b=GqAPTngVlrn5uTE4/QkZxEnQQK
	bwMIK5Chfmb8qJ0Zo1TF6piTzlafJZ15PelwW3uH/k3ws5MbQgLbOBRv7oDUjK4xweU/nseFEx/k/
	NAqVNDuKVquRdtVGYXvrCAnXrVaElm+j2iSNoWwCSivliTjMGalKMixc3/MpDlf987KVfiqML9FTb
	zGtiqdIUw29KepmaiOJNN1JgtgPi6sxvQ9KKJJbPhbBLhzbfIFTxbAzoiu4tW+xYS7L4LNVomGCGa
	SOR3jAc6rXDVatGmEkcxoepbTw5bk3eDqzPmR+9evDQRu+u8ITNT73XQEjKq308FLrt455fy3agIX
	Rd2pY39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3U3-008vJ9-Le; Mon, 06 Feb 2023 15:32:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3RN-008tml-DX; Mon, 06 Feb 2023 15:29:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C8E26602F9A;
	Mon,  6 Feb 2023 15:29:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697396;
	bh=z8a6JNOhLbAdbIgrzm/CxvYyQHio+v3E4inzHF3L1Oc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXOLsIlasomzsRwn8JH5nOZRLQFv9jUR/KV4W6n0E01dLkB0xZT12NhzUkUMzROMv
	 5yZLP7s8ipFSH2pPRg2BTe3YuvycKhZuUoxf84iGG71ABcHCRpopK2beC6tt0BEREm
	 +3sxUdaSGT45VXNOjg/NuU0fASIPQ0E+ZuyFO8Jz5v2qsfcnA40m6Pj0xTJwuIJDnS
	 1RRJrKey8kojNp8sJozw1XpeZLDb9iQ93bEWirnA7ya6xx3j7Jw4lLnx3D6EUZLsCt
	 JgJ6m4eT9zS9KBrvQffNUrWSIMvBKDIsTFnKXCYfYbmL5ic/kMbGLLVT3oaRNXE2Ga
	 SD2X7lQQpdmjw==
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
Subject: [PATCH v1 07/45] clk: mediatek: mt2712: Add error handling to clk_mt2712_apmixed_probe()
Date: Mon,  6 Feb 2023 16:28:50 +0100
Message-Id: <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_072957_621422_26B0B80B 
X-CRM114-Status: GOOD (  10.65  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.39.1


