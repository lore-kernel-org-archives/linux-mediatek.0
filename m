Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8DFC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+F9muR85DBjtC5voFuGRCL9N4IZZIo/p0YS5CZYPE2c=; b=3ChVDFwjiIZq/FOKDeaOYvK5Ek
	lU8PT6IuAWPAPNRSTRwEE/UCeRmLy2Lwg+LRng9j3PS7+WWghGJkdHfjr9ugMWtPPE1fXzyFSECM9
	uKv/EK7gdIRc4cITqkdBEARJCesGtVqggsOiP0PyW48TBWFKacH3E23Y5bQ9T25JDgtJVtEWcbHpp
	8uCdaU/+PamJMpozY3k5qernjBuR2DtkUAJb3OawVPs+jPdTJQZxDA3lrxom4hnO65dGNrYS0cime
	tQqQ7XlCHop4lzEYr+5slUOsjoAi0Y6I33wEYvl+xPpoKlY+MXg6OE7w45kBb6X0m7PDn42EP8iMN
	XAS8tKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBYT-00D6ZO-98; Mon, 06 Mar 2023 14:11:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBTZ-00D3Ug-B2; Mon, 06 Mar 2023 14:06:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CDEED6602FA2;
	Mon,  6 Mar 2023 14:06:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111564;
	bh=NtmeE+eeh8ruhnGAQGPiV2EGNcavUpCXpCbwzrlNZiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRL2dSR7IDSYt/yrrk8G3El46IRx+po6ec3c6HXjD2iMP0JNLGquv8QO8p+enmAO2
	 ndFNas7+XfoBUxMAxyOosic1C+hIrd3ec7kF6zoi8yAX4Jzo6DFudD0dFKkLVpSmJQ
	 dOaBVMylaF56py55B+J7QapWISlY9c/j2f+fyTQowz1qmfW2LjBE1bkYMULQuzesEj
	 Cf0WDaZQ9ABgpi47BpPXmZGiXw3EoOmDST14IB6PBLzASgeXiBbsqfX5wQ9pDLV7eX
	 V1biF1LYOvFREcy75F/k9/1ZtaGAzxnw8Y5sEZAYTOqgPvLxquXobniGlt7zwYyInx
	 d1tYLImkZZLaQ==
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
Subject: [PATCH v6 10/54] clk: mediatek: mt2712: Change to use module_platform_driver macro
Date: Mon,  6 Mar 2023 15:04:59 +0100
Message-Id: <20230306140543.1813621-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060605_548739_2A8A208C 
X-CRM114-Status: GOOD (  12.07  )
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

Now that all of the clocks in clk-mt2712.c are using the common
mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
to module_platform_driver.
While at it, also drop all references to `simple` in the specific
context of mt2712 as that was used in the past only to allow us
to have two platform_driver(s) in one file.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt2712.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index c5fd76d1b9df..937c370d6765 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1020,7 +1020,7 @@ static const struct mtk_clk_desc peri_desc = {
 	.rst_desc = &clk_rst_desc[1],
 };
 
-static const struct of_device_id of_match_clk_mt2712_simple[] = {
+static const struct of_device_id of_match_clk_mt2712[] = {
 	{ .compatible = "mediatek,mt2712-infracfg", .data = &infra_desc },
 	{ .compatible = "mediatek,mt2712-mcucfg", .data = &mcu_desc },
 	{ .compatible = "mediatek,mt2712-pericfg", .data = &peri_desc, },
@@ -1028,18 +1028,12 @@ static const struct of_device_id of_match_clk_mt2712_simple[] = {
 	{ /* sentinel */ }
 };
 
-static struct platform_driver clk_mt2712_simple_drv = {
+static struct platform_driver clk_mt2712_drv = {
 	.probe = mtk_clk_simple_probe,
 	.remove = mtk_clk_simple_remove,
 	.driver = {
-		.name = "clk-mt2712-simple",
-		.of_match_table = of_match_clk_mt2712_simple,
+		.name = "clk-mt2712",
+		.of_match_table = of_match_clk_mt2712,
 	},
 };
-
-static int __init clk_mt2712_init(void)
-{
-	return platform_driver_register(&clk_mt2712_simple_drv);
-}
-
-arch_initcall(clk_mt2712_init);
+module_platform_driver(clk_mt2712_drv);
-- 
2.39.2


