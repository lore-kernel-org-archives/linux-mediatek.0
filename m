Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB9C64EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7oHQW1C6Q04x2ozX62zrdjbI1NJq03U2/y8RJDligQ=; b=2S2OniuDLyxLKjB9s1pHFdBKdQ
	6bl5p27RnMTW6Hrij00JAZKi30v9evjSXWzbssiIoz7Ju9xxvzoqB7MEUVA2YZx1uHtcACxLQv4eF
	FFg5V+JBdmZ3hq7XHUECgDZ6621i2rZ0PRstpWxy0mmXlDnUBahVv9iqxehPEHwO3nar3qdt4U4eG
	xGjr1llzGk2D/jHJcQ9JjpDYYiwNeNy3Y+zlSHwrM6VpPa2ZEBoI+T1S29Fb+0HPWoPmc6PSn8DuQ
	0a4DhtIVGslc4OFUtcdwp7FqTHkRQBH7KASgz+aztqBT4/olPfOWJV68z3av4A4qqhWD5fzyZG0Fv
	3WXpQ9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7g2-004Nb3-OD; Mon, 20 Feb 2023 15:02:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fP-004NCS-1J; Mon, 20 Feb 2023 15:01:26 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6628660216A;
	Mon, 20 Feb 2023 15:01:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676905281;
	bh=OUjfvjH+xela87xq+mZBbq7prhZGbEBP6ki4p+S2LtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6aw+B3/fUi/jCcCD66fPPzxu3BDYMORkI9dk4mFLYheFXVX9JJ2yT0PP2tYBIz2g
	 hpmbH+IhN0860H2CIXlLxjtFFPScYnP8ZxqftOJjD7bcz6hI+3mJ9FLwA3HUCNdjzz
	 om4ZA8ggQXNqG5kcM93La4JPdrBiD1hTSWw43tEtIE18PLDTu0Pc5wTLjaWwZ/Neir
	 bMUDK2KWTJk97vEUpZ5aZzkV3hUFhQ8SG8FrtDSugXALEDSSRN2sUC0ldxzr+dYGSY
	 Dq6hmoouUM/wDf4re6URRXDunN0R7MTI2ZbXP56SqyrWpBL55NhDHkX2qshOM0u7uJ
	 cyR/IuEKmLbgQ==
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
Subject: [PATCH v3 04/55] clk: mediatek: Add divider clocks to mtk_clk_simple_{probe,remove}()
Date: Mon, 20 Feb 2023 16:00:20 +0100
Message-Id: <20230220150111.77897-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070123_459967_C02CE3F4 
X-CRM114-Status: GOOD (  13.33  )
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

Add support for divider clocks register/unregister in the common
mtk_clk_simple_probe() and mtk_clk_simple_remove() functions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++--
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index a69d3f0a38c7..39bd360aa0c9 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -496,7 +496,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
-	num_clks += mcd->num_mux_clks;
+	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data)
@@ -534,11 +534,19 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_muxes;
 	}
 
+	if (mcd->divider_clks) {
+		r = mtk_clk_register_dividers(mcd->divider_clks,
+					      mcd->num_divider_clks,
+					      base, mcd->clk_lock, clk_data);
+		if (r)
+			goto unregister_composites;
+	}
+
 	if (mcd->clks) {
 		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
 					   mcd->num_clks, clk_data);
 		if (r)
-			goto unregister_composites;
+			goto unregister_dividers;
 	}
 
 	if (mcd->clk_notifier_func) {
@@ -567,6 +575,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 unregister_clks:
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+unregister_dividers:
+	if (mcd->divider_clks)
+		mtk_clk_unregister_dividers(mcd->divider_clks,
+					    mcd->num_divider_clks, clk_data);
 unregister_composites:
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
@@ -599,6 +611,9 @@ static int __mtk_clk_simple_remove(struct platform_device *pdev,
 	of_clk_del_provider(node);
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	if (mcd->divider_clks)
+		mtk_clk_unregister_dividers(mcd->divider_clks,
+					    mcd->num_divider_clks, clk_data);
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index b8e0ff8f52fa..554aecdc1015 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -222,6 +222,8 @@ struct mtk_clk_desc {
 	size_t num_clks;
 	const struct mtk_composite *composite_clks;
 	size_t num_composite_clks;
+	const struct mtk_clk_divider *divider_clks;
+	size_t num_divider_clks;
 	const struct mtk_fixed_clk *fixed_clks;
 	size_t num_fixed_clks;
 	const struct mtk_fixed_factor *factor_clks;
-- 
2.39.1


