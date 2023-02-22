Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71640C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+F9muR85DBjtC5voFuGRCL9N4IZZIo/p0YS5CZYPE2c=; b=F5s4k5vuqObghE+cMF3OQZbDaz
	43+GtHG0xiKN4WqE8WFblm9tV2vvU3FvzSlr5i8xQE8EnINiyEdVbFNwkvCYP1jSyIiL5C+bWxsf/
	FJX6cz9BR/vic/xOQ1kueYI8lOvw+30hCDHRAoiOcwgZhn/VA7OM0cKyqXerjnnd61MFDH1vlDx44
	jGoiZ3bATYGP1N3zZmkB037FUq3Jq1Ofqb3ngyS5u2OfgtGfJ5CEOqDbj4rW8Eq8l6iv1pnQzGkI9
	sDP0HGLbAzQX4Kt9px9Urbqa1Qdx+5rSO1+gDKD/FQ/CtxyfEzWT5vNWn0jQ1KAz/Brk5d5L9Xlc+
	1j48x5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlU7-00BT0M-DA; Wed, 22 Feb 2023 09:32:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlO6-00BPnL-Ml; Wed, 22 Feb 2023 09:26:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6012A66021D4;
	Wed, 22 Feb 2023 09:26:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677057969;
	bh=NtmeE+eeh8ruhnGAQGPiV2EGNcavUpCXpCbwzrlNZiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgTDBwyNT7/IrMndAnJVdhiepkF+PG6jaOYSBcuImKv9l4ZlKZKV4Q6yWe62Iys/N
	 bHQMbQ2rhXcIrpvS1R/y2HPrc37MLpO1E1yh/BUJvYfI6GoVN+3IPREMwpt9FGjpvj
	 4DwMaEPfcjEo7ZMIzdZ3GzqF8mWS8EO+anrsUBZab7zJwKF2M1p3TuqFvFlJJfUC3G
	 ksFt4aIC5LClXSejDeNRjHx7V0VYfJ26R294Ci8P0YQeZDWy7LGFXcAqv2G5Z2EMOY
	 DhYRRdSzi1M/k1kIDUSbDcMLWxfSx/j/fEBn91MH22qMZf362WdIQPkx5wxehLpYpp
	 3ErQ9XztyyFSA==
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
Subject: [PATCH v5 10/54] clk: mediatek: mt2712: Change to use module_platform_driver macro
Date: Wed, 22 Feb 2023 10:24:59 +0100
Message-Id: <20230222092543.19187-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012610_910392_552DD1DB 
X-CRM114-Status: GOOD (  12.80  )
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


