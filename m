Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E129C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCHbid1ecGDCGEXBltzdI6M1fmgwciOel2p07kKVbRg=; b=2gxxX6VHZsU3Mq6gyvp2z9CS3d
	XI3GXcCvyjxfdG4GzUWtikiVugC8i1LezSA+pv39YQ9EQ3oygnx4mPOq2jgO8+anw1Th56WwgmoRs
	m0DsUPTbz28zHrbao0Qk5v79Fo4xENr3cS72pr2rhl6jXiiZp4fUSRt4nBQXmt4xJRTJJj9THHecc
	DcvdDZV0ZVAc3U6qzXuKr5Q/EY8NmFPpfuOb95WIQUyGH71plDixwR21Q4S579Jgvr8neRFwe4ZTC
	RC2um0W0jZY4KSIi9ME4e51UOjSFb1fE8GT0LJLwkD3vaMQq8WgWklzQc6pSY41WFti6/EEHCh7um
	on3JdOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURLu-007mpJ-Ia; Tue, 21 Feb 2023 12:02:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURFi-007jdX-2G; Tue, 21 Feb 2023 11:56:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BEE7A66021CD;
	Tue, 21 Feb 2023 11:56:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980568;
	bh=Jd0WSEgoMoiyLJ/JPwWzI6i2w8ARgz466SU1nHCnAdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3tnF3baCgW4SVj3GBw9hxjAJkiCcbUar2S7vEvGk0FoeK3ktsPG7Bfp3mGqcipvm
	 VJH4tL0CRDid/k/sIAF1/Ob52ZnXNlXYlQjU3UmsNOXj0aSlfoo2oF10eyD4wdvwRV
	 tHF3teRa1L2xj/Agdr/wmN/0aKO41xJM65s5m61sgpdsCeRXDEiUPUsHmfMoFE88oq
	 nzzDw/1Z8D3BdYnN2beVup3Xj06jn0ZDJ2/1ks6h9yuv5MCTa+CFDyOfhekpsvzkva
	 3LHR7PrFx0UANuIP3vjlyvNxldqOdh/mwR7rC4ZJUO4yvA7EXNJD2EYUBcediLELN3
	 guD+xrzS10vSg==
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
Subject: [PATCH v4 10/54] clk: mediatek: mt2712: Change to use module_platform_driver macro
Date: Tue, 21 Feb 2023 12:55:05 +0100
Message-Id: <20230221115549.360132-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035610_262122_C877F96A 
X-CRM114-Status: GOOD (  12.93  )
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
2.39.1


