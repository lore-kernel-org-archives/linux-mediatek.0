Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9365C47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LQ4ImjzjK8ZTAlmP+wrgMb7Xtb7eat0Xo8zSIFqCBoY=; b=FPIlNOtuFw9CJdp6g3B1vU/VSi
	GY82FRdNS8Tf3GyQq8wLeEeYTL5x/sxTGJAIbu94Q84eMgmgYx4o/8aUjzMew36Blg90zP1n+aLAv
	5Zw5xbdXNZEVV0CeHVe73EDPB1kgtLOwbXztuDiVvbjLIi9q3lIfYHkCb5zEpTJWJ72f7nMHF0AuF
	gtn5vAGpSCyDVDGvBD5rBQlDGx70gniqcY5mvkQ70yB8xeJi6dxb67L87SH1QMQtFne1gGhxhyl0U
	4vhOQNyWJz4e6OEPinL2NJAlSgjojhrjuy6yIpwanGQAEWthddP0SvO1/FKippbafr9J5TCjYowJ7
	S/GsAADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMOGm-002cSE-1z;
	Sun, 07 Jan 2024 08:12:32 +0000
Received: from smtp-13.smtpout.orange.fr ([80.12.242.13] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMOGi-002cRR-1I
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jan 2024 08:12:30 +0000
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id MOGZrUCWm9dP0MOGZraHLC; Sun, 07 Jan 2024 09:12:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704615141;
	bh=LQ4ImjzjK8ZTAlmP+wrgMb7Xtb7eat0Xo8zSIFqCBoY=;
	h=From:To:Cc:Subject:Date;
	b=Vg/znhKaeNOWrDwuXPv738I/Rd4tsXNsB3ybHAJAn6l8HG91aqtwLldsMS0hRsI1p
	 oAlIJ0RAtQTEuavoIU0CR7c7E+FUUAqs1mVBt1a796Ht7OqizuXE+UTKrGT53ksWKC
	 qmjLawYBogHzgJGYEuVGVNVisyMxvujp8vtTrCRqqDUjB6Xg5T3yuoyJYJHsRCcVl3
	 LOS1VvOOPunuuAZLgbygiLQVHKAX27sNG9/FapW/BqSWzGPnKFske0RmZWBhVwVz2F
	 nHUIYZrl5cPJzgK5BOIm1tBt63CRf+klN3R+35nqVDQ18EDz1O3j7ixB1LvvKMCoHO
	 tM1uqfXx9MzAQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jan 2024 09:12:21 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt8135: Fix an error handling path in clk_mt8135_apmixed_probe()
Date: Sun,  7 Jan 2024 09:12:17 +0100
Message-Id: <6cd6af61e5a91598068227f1f68cfcfde1507453.1704615011.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_001228_851707_36BE6425 
X-CRM114-Status: UNSURE (   9.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If an error occurs after mtk_alloc_clk_data(), mtk_free_clk_data() should
be called, as already done in the remove function.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index d1239b4b3db7..41bb2d2e2ea7 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -59,7 +59,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 
 	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	if (ret)
-		return ret;
+		goto free_clk_data;
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (ret)
@@ -69,6 +69,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 
 unregister_plls:
 	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
 
 	return ret;
 }
-- 
2.34.1


