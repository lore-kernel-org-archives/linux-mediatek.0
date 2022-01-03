Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BC5C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHOJzjlOoOmk21prv5MXXV8uBa5bHdEn4VlcB1R8hFs=; b=mkx/hn6dcOKsN3
	ISXOeAYavCjEiYpkzGR5Im0UNE3TC0up9HW/wOeU1fVnDhzt3mhwphYhse0ylxdc8BgqPZiz3D6Q+
	alquuTqhdgadfqNvlUaABls6OLzjPTiBO76e84zLGlyQZL2Hn9LSMmbnHR+hX41u2RtxxwYQKgeqf
	3uUUT7oB/HyXe/H8e1brPkHts7MAfK+qHHxC5bxbQrqnd1zU5vhta7Lt36w468hcRZISRLGG9TrYS
	pI0B/2jbOPfD03VmE94/0EXfW72c64gC4MmVu0VVqrajixQICB5+Cnki7/Cp+vLDn7KSttX7FwJpk
	XPlXzaaDf9RAOrLnWa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PJo-009La8-92; Mon, 03 Jan 2022 15:32:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PIe-009L3H-3v; Mon, 03 Jan 2022 15:31:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 54E5B1F42558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223863;
 bh=iVgZxVqC2T4q/YntLy6VYveQGVZXE87ejYYsVcnDTVo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fir+ujfJNM05YaXg9OVuXrjYsLYFWjcKntoB2ehQIIVsZVcVvTixYQhHYdMcCPd3o
 pGtSFthvJDCddnv1LQHqYQuMx3UoOC1XxDunBT58INR3fxfvsdZ+UsSwY2wGhcqKpk
 hcFEomrqtwycnN2JZ8UQcyvOVTg/f6+JUQJgWF2yXGXyQGjnEIZKo7taa9zvyuR0dg
 9Tnkbq+KjiTxIZcCBHY7BUoj2utD4tUWbMSu1l15B1kagsMnOqAX5SWXYn2QmIGquD
 JwYDjJq/guagELnXkvTJ7Es1Ke7mDHVN62es6uF+O1UXpfkD6le76NKZFpuWw4MQzO
 FGi3fvaxMrcNw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/4] phy: mediatek: phy-mtk-hdmi: Simplify with dev_err_probe()
Date: Mon,  3 Jan 2022 16:30:55 +0100
Message-Id: <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_073104_331356_42B36F30 
X-CRM114-Status: UNSURE (   9.76  )
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
 drivers/phy/mediatek/phy-mtk-hdmi.c | 50 +++++++++++------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index e037fa89696c..4f40a6eea004 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -104,20 +104,16 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(hdmi_phy->regmap);
 
 	ref_clk = devm_clk_get(dev, "pll_ref");
-	if (IS_ERR(ref_clk)) {
-		ret = PTR_ERR(ref_clk);
-		dev_err(&pdev->dev, "Failed to get PLL reference clock: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
+				     "Failed to get PLL reference clock\n");
+
 	ref_clk_name = __clk_get_name(ref_clk);
 
 	ret = of_property_read_string(dev->of_node, "clock-output-names",
 				      &clk_init.name);
-	if (ret < 0) {
-		dev_err(dev, "Failed to read clock-output-names: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read clock-output-names\n");
 
 	hdmi_phy->dev = dev;
 	hdmi_phy->conf =
@@ -125,25 +121,19 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	mtk_hdmi_phy_clk_get_data(hdmi_phy, &clk_init);
 	hdmi_phy->pll_hw.init = &clk_init;
 	hdmi_phy->pll = devm_clk_register(dev, &hdmi_phy->pll_hw);
-	if (IS_ERR(hdmi_phy->pll)) {
-		ret = PTR_ERR(hdmi_phy->pll);
-		dev_err(dev, "Failed to register PLL: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(hdmi_phy->pll))
+		return dev_err_probe(dev, PTR_ERR(hdmi_phy->pll),
+				    "Failed to register PLL\n");
 
 	ret = of_property_read_u32(dev->of_node, "mediatek,ibias",
 				   &hdmi_phy->ibias);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get ibias: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get ibias\n");
 
 	ret = of_property_read_u32(dev->of_node, "mediatek,ibias_up",
 				   &hdmi_phy->ibias_up);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get ibias up: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get ibias_up\n");
 
 	dev_info(dev, "Using default TX DRV impedance: 4.2k/36\n");
 	hdmi_phy->drv_imp_clk = 0x30;
@@ -152,17 +142,15 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	hdmi_phy->drv_imp_d0 = 0x30;
 
 	phy = devm_phy_create(dev, NULL, mtk_hdmi_phy_dev_get_ops(hdmi_phy));
-	if (IS_ERR(phy)) {
-		dev_err(dev, "Failed to create HDMI PHY\n");
-		return PTR_ERR(phy);
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Cannot create HDMI PHY\n");
+
 	phy_set_drvdata(phy, hdmi_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider)) {
-		dev_err(dev, "Failed to register HDMI PHY\n");
-		return PTR_ERR(phy_provider);
-	}
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(dev, PTR_ERR(phy_provider),
+				     "Failed to register HDMI PHY\n");
 
 	if (hdmi_phy->conf->pll_default_off)
 		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
