Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB8C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKG38xF1lrSRsztBtgckRg1My5/PsZzH6804zj43Yg0=; b=rgjSydcb55EEhd1fFdSmkkckqU
	Vk0dmraSoLIDoEQw4rPQXP/QxlTFGK0wsiqYIiIHEa5SheHOfcY7aGX05egj1kUm8eij1Ceaa836N
	0pQPeVcHCuV/feynaKpwG1gOr9Jwz3thobwKZVj0wDYPIJp3X0NMUaiaNVAadu1r8YNoV7eXcD2Ph
	yIzwYKHGuvHTiv6QYUcmfJKia2R6Rajb5FVVkOdJxwI0l34RY/t0vhBknfyVBiC8IOPz9ydPnJPlt
	kIk/J44qCHU6ET2aWbO8zoaYL8cEtSmOTDEAC/h82COgK/246b2uqq6hkZ+s9Q4fnAs65bbiAYoff
	gJ4WhpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q29X5-00GYc5-1a;
	Thu, 25 May 2023 11:53:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wl-00GYPe-3A;
	Thu, 25 May 2023 11:53:09 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E43E966059A5;
	Thu, 25 May 2023 12:53:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685015585;
	bh=WbEXo3O6eq8DNbznstqMaJK9I2AdQzGF7reesP/HlpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ObeEAKew/EV4k/4CVn0x6SQOFrwwbDVAZ+FzbB0+wvCKGDBeg/9srQrx0mOXI+ckk
	 5POE11Zgw03CbyOWK3pRg5RpWyU0uLBALigsVQ1Dr63r8pCbG24+5HACVAyjRiKwWa
	 +6XxDcIxkgnIEvkLe3u4APBEPIjTaaF8CPTnFkEAyTOt1dbh0AWwOfFjGuWDwpDlNi
	 8aKtkrokLq701yCDGSKAV79QoO9IlZcGaFEBUFZP1hqLz8ETJvLP7vV+NyJtVRryUX
	 4J6axsXdvNOStwOzSEONcc3M9M6ulB/qPzNREHy4RS5DMc9BRehDp5DE674Q6skiHT
	 UWM7nCvMnHhuQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/3] phy: mediatek: mipi-dsi: Use devm variant for of_clk_add_hw_provider()
Date: Thu, 25 May 2023 13:52:57 +0200
Message-Id: <20230525115258.90091-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_045308_157489_C4C1ACDD 
X-CRM114-Status: GOOD (  11.08  )
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

Switch to devm_of_clk_add_hw_provider() in the probe function: this
also allows to entirely remove the .remove_new() callback, as its
only task was to unregister the clock provider.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 362145198ff5..4e75c34c819b 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -176,12 +176,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mtk_mipi_tx_get_calibration_datal(mipi_tx);
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, &mipi_tx->pll_hw);
-}
-
-static void mtk_mipi_tx_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mipi_tx->pll_hw);
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
@@ -197,7 +192,6 @@ MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
 static struct platform_driver mtk_mipi_tx_driver = {
 	.probe = mtk_mipi_tx_probe,
-	.remove_new = mtk_mipi_tx_remove,
 	.driver = {
 		.name = "mediatek-mipi-tx",
 		.of_match_table = mtk_mipi_tx_match,
-- 
2.40.1


