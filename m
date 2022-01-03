Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01318C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bH0Etc72j1nZgqO2R+a6SDDkdAiicdtQwq/BXIuTWoQ=; b=0ByWnlHkLe+qdZ
	Gevgs8QorC4gQAkgWNe1jIgnJ+l3+gv8/8UDy9KKcNCRthx3CEpcvoSH6AnSRZyiCLrBwuXqIz7+d
	vpXPbRiLCDtT/zHeuN069qKoEKSynF0UJb49FXZ+WI2Azg73Lqrdc3jrjvXQ2wMmOQNkSpcQi97aZ
	w5hMHRel1cfNjudyrncAvDwg5mk7EAMzxVNuqOWeHh92puXrFGQbB6skSGhNVXpo4YM4rYtD5DbR2
	aUvqRPCB6GdtrXLvDdi7WBNIEgPpc3uq51xGqq0Q+na9IfhIhMHqGV1YPdXaPn0n4IDMD3TrMsLVr
	mohY2nBKAl0GTcLizxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Oiu-009Fc7-Sm; Mon, 03 Jan 2022 14:54:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OiK-009FOl-OD; Mon, 03 Jan 2022 14:53:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 104261F403D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641221611;
 bh=4lRW2VG+0+p2tLc6QpXE9I8vDpcPYutZzSZUO5j1/bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mrOCpcBLKjsqok0PsMFVOHn/BGN16+E8tu3N8vBfD7RjPeL4wc5C3kJjEzJnOtMFa
 37N2jIHf9SQpwDIiR1SizFv2aQdZbmxKgkejdYfedoGI00DQxCdj5kYf/mSZme6qHj
 zIShumWfhKpqzdC/4YRHcixNVkM/0QMGo0pk1CyCy5C7/72AlsuJ28z8+XPBFcAUPD
 txzAaBvpsKWDz4NO/lq+Fz65SURLkOZ9YCHPD5Qnf+xq/7pXCOJXOz9rlcs/bz1VRh
 +sr4L1FYTrtkyR1IM0aKIvikuusdgjbpESNBQKj76p6Ti8xEn4ECbAKxr+XP1yQ0Cf
 SJaB49QgLJEfQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
Date: Mon,  3 Jan 2022 15:53:24 +0100
Message-Id: <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_065332_941620_4788478E 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 29 +++++++++----------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 6f7425b0bf5b..4b77508f5241 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -148,11 +148,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return PTR_ERR(mipi_tx->regmap);
 
 	ref_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ref_clk)) {
-		ret = PTR_ERR(ref_clk);
-		dev_err(dev, "Failed to get reference clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
+				     "Failed to get reference clock\n");
 
 	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
 				   &mipi_tx->mipitx_drive);
@@ -172,27 +170,20 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	ret = of_property_read_string(dev->of_node, "clock-output-names",
 				      &clk_init.name);
-	if (ret < 0) {
-		dev_err(dev, "Failed to read clock-output-names: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read clock-output-names\n");
 
 	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
 
 	mipi_tx->pll_hw.init = &clk_init;
 	mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
-	if (IS_ERR(mipi_tx->pll)) {
-		ret = PTR_ERR(mipi_tx->pll);
-		dev_err(dev, "Failed to register PLL: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(mipi_tx->pll))
+		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll), "Cannot register PLL\n");
 
 	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create MIPI D-PHY\n");
+
 	phy_set_drvdata(phy, mipi_tx);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
