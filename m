Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F93CC6B19
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=; b=PwLEJTgoAiYOo4kjBz5ujBKqNy
	zBsOSn4yJhWzC/iDzJUf3SSdggYnS5o6siG2ggYtuxzApXIKRNKXyQFKm5265DRP544J3d5PJM6wB
	qdCsBo/kGLOePVcN8gdSlWQ8wAeNTuuwKb3sQ9oGnUrWzqVtkdHuLO6OABa9IYqXDHRkCOWEpHptx
	c2/0tmNH/9FFsHwIlTsWjLHuJM0OWoyfrDUq7kPr1C8BMA8nE5BdmX9hUF0AD+hCkcJFUrJzxmTMA
	JMHpiR6atzLs7JBVM8l/3QWIwh3vIEu20LSzmGUKl2Jy7496AdK2hsaeOOUITDtnUD8GDA5I21aQM
	4R4rCZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIF-0000000DHNt-0bzR;
	Tue, 13 Oct 2026 15:19:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHz-0000000DHBX-3zUs
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1239211a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904779; x=1792509579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=XFeAI0j1Rki26V7XHI65t6KgaESnvfS0Mf9Uwf7QaRuRlXKkjk9SP4Xj2nZ3ZEnoGk
         QV93RL3ilHyDTtS0H5yYsIfwuNJD+dVMHN1TKM5Dg8aDcE84qLaGK314m2WceOSu0g8b
         o/YnTEe1hHvl/ulVOTAIC/x9gNAWLmiLXrlzQkE7Shz+XcfHqyvaiLv4snF03Knv7+R5
         r+YOz7KcAXPPttuSVZO0cg3HrypCaApnhbOxY10zQl3S9oehGCjexCD/4RumcLhN0Nk4
         paEhjfw4Z+LhB5mleMfTA1knu3fjj8/L1uiwf7vaT8IlE3WLJ6EZuf/LtkdYzp5GQOLV
         cPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904779; x=1792509579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iS9g8Y0A4CpO36TxjO7PQlqVvMbO+A/66QBST/Ft5vU=;
        b=yVqut6qO158dqxRaYiuREmEXkjWy1xvAPTbr14ylebnG58PkcRxpncBCXEzwNqgUVK
         CpOz/qCM8A0KBF+iDV5SOgNTNC+R1FQ3Z5eYp65vY9/+GO+3YfKppOpKjIzBg/cdpD63
         BGleV5LZZf5aJiGKQDFdDw66wKBFrS2TK4LyMKR8MVjYXjRazh9B+Hkg3mbxwsTkOus0
         +oPAnhGxkgcZopsqbVkmzxqq5EMiU0wZ6qtEdPBbBV9EmTKcfcOczr2ZXiRov05uE77y
         WXX9+JibeztF+Y7iqlVDOlHjQTV2i1E6H7RQenU/3LPD6dBfuLC2gEKsEUVx0mHv36x0
         er2w==
X-Forwarded-Encrypted: i=1; AKwUvBwWA8RdFNDaQhT28f1QlaKthbu50rprAeD+aJNUvG4gvEAKV0MFUMOnHn5582jl1m8jBRfGDKOi0HNzRTngMA==@lists.infradead.org
X-Gm-Message-State: AFq9FYILpqqpdBFqg6cyI9BBNn99Ror52pfkyukKmhHj8KH1SWqh8zX8
	wHkXY09W1qF2GaC6ZS845+4j7LVdBaCmUCA0nHAauMXJsZvj21NIKzSK
X-Gm-Gg: AYBFou3s7lJvJ30dBn+lgrSlmlSkVSHHWcJx1sui6sqGZnDK1ieax/ExbK4d4DNBsDJ
	94t5a3/4Uy5xu0K57XA/XOZnmVcNhsujuiErleGh1+814QbE89EX+6dI7rA6iA2qzw9UJ1dUuwv
	hh926diBenD3uzdkRteOxgxPqJOqIY/Y9fKJLSdU6LXnvrhAPfL8gfulecqbRC+w0uLAi1+2uhd
	NJ/DLEvL24uQvxTD9A2+DavTHPvWILG799l6+7qr5BnUldqUXqOO4vKq3HvZcaE3JfNxO3FMh7N
	pdLhNAqizLdN4czu6yH7ZtoLi5+o2AXObrhnuMQWtKmDLL85DlcSuwwTbYm5g9FW0jfhv8ff9Q2
	5eB2qLlH3xiqIcaCpvBCmEMhFKWq5iVzPJYj6zfCUUQ+DW1U/trTXqGbAGTTUwaGFzGTE8hJGYq
	cwgrcCj+aCYTeq7us0cZqLcdnvZlZ8eutnPyy7Y7eY0RSuVcP8fzALGzzn6uQ3XSWHqH0aS6VnK
	Uqq6n+iAmrg/2X/iFYQ64m8PVEKr2zjYB5I+8Y=
X-Received: by 2002:a05:6a20:c78a:b0:3e1:2881:1c0e with SMTP id adf61e73a8af0-3e16bb06293mr10849435637.2.1791904779265;
        Tue, 13 Oct 2026 08:19:39 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:38 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 17/35] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:16 +0900
Message-ID: <20261013151734.3177690-18-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081940_066618_690AEED0 
X-CRM114-Status: GOOD (  14.87  )
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

The MT2712 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 087cf574bcdc..1e06f87e71d0 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -109,56 +109,20 @@ static const struct mtk_pll_data plls[] = {
 	    0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
 };
 
-static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
-		goto unregister_plls;
-	}
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt2712_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
-	{ .compatible = "mediatek,mt2712-apmixedsys" },
+	{ .compatible = "mediatek,mt2712-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
-	.probe = clk_mt2712_apmixed_probe,
-	.remove = clk_mt2712_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
-- 
2.56.0


