Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9PkH0cr/HLBFAjh8DQxgTca8HrbDzDv20n0tAB2jdU=; b=FT5H9DK++NN4iR
	MmauLNX+2yjaaXW81AUKbriOg5qrZbun/RmHo2LTtlXqkWWPcjWNNO2o6r6ijgL0zk8Z3VzDcorW+
	gRIjmPL8UlGFxreXb1rPXUz7fJHhnYKOkLPQkvHyInUIMSQ6F55vL/ysdUeC/BFbGbyb3O66ZXfJk
	tE/TzSTxepTNxshop/h4KmjjtFFNVvAD50JUIFwr4Pph5rd1mNZKH26THbcnffn5T1ZqQJjJakiHu
	ih8AdJcgZ7Eb9OGHC9/d2sgVccd9ZiXqPnHUM7IbclsXLB0eCsWUov7VfXd9+hJ5/5TbXV4BtVU8K
	RkNb/Ooqz0zpKM7jXoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnHK-008JKc-9Y; Mon, 28 Mar 2022 11:11:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnGx-008JCb-SQ; Mon, 28 Mar 2022 11:10:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3A2661F4088D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648465853;
 bh=deTkHQpKA18AAAHiDk9+8wmr9h/b1KiUBqAtpnciiDM=;
 h=From:To:Cc:Subject:Date:From;
 b=hXKySC9QHhKT7sSldZtyDiX1Op63uGr0fTT6MEXaGAN5SRqZ7LRaBPLaJ/NTBinOf
 TgEVNXob5plGTIfNiJuLNw4D+slDko0wRiNEA1qgMejd2no2GR62QPm4fEbIfk3675
 lqJmjYpASqlYHTNJ1YNwyw+CA1iUOEAPIlaoUXUN6UsVwNG1wfx3KjQIE9w1SF7a2Z
 5Op4c1R0bKX8C+wcWXJa1DhzRXNvy5lf1ACfzdXYogC2lTmhd5Tu/FcprurV3gD+9Z
 KSFUdpEGCNo++YrLUqlBtTlI1Ri0MjVpP3vd/GJ7dsWyY39ze/UpSziCZApvdNmg/u
 0054dM3QeNuqg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] phy: mediatek: phy-mtk-hdmi: Simplify with dev_err_probe()
Date: Mon, 28 Mar 2022 13:10:46 +0200
Message-Id: <20220328111046.210736-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_041056_135856_3ABACE26 
X-CRM114-Status: UNSURE (   9.19  )
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
index 5fb4217fb8e0..d4bd419abc3c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -120,20 +120,16 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(hdmi_phy->regs);
 
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
@@ -141,25 +137,19 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
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
@@ -168,17 +158,15 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
