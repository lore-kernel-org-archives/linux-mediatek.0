Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF1CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=; b=2J+pApExleJCwnhhfePoLL8Yj9
	82wTobg9F2eDHYt4Dl1EctwU6UZ4Z3s5JNBEqFxAsZwNhs2s9+5u7Y2aTm0UqD4oOW1hGVayPIgyF
	F8MPHYeavkM3DsvuRPQDADIhVxrnV+2JR+P8Y0gqfmURYjdV+VHTrSJ3A+XOvy5F9oEjwZghyPyB8
	KiLdQ3FX+xSxmFEdY6we+zcub9ZiZFnKU3/AoABmE6TZ9PAVVc5M/OfIkxtyNbItvRbFM+Qc3LYJh
	OSUBOHDOG9iR21DJZ7iF9dgCfQlcmYAwDdj93FMgb1nvzbywoIyZT6vp/pDnZTXojctuEXywOilL8
	gdH12VEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJb-0000000DIdh-28Hb;
	Tue, 13 Oct 2026 15:21:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ1-0000000DI6N-06bY
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=; b=SmSDxK4RsTis7E+HSMuEZ/hV88
	u7LSUphd4rv/waB1f0yInNNDrJQdPHam5GHvClfeOjOcpUIC5Ij7yH4qbteQw5JFz8agPXVml70V2
	+0UkjXlcpUyFiBWX0ajnkLyYkkIzYZ2xRZXn0ttGLFiStO2rYD6FceNVdbo9SUNb4lHvWAs1OpSa6
	9AsLx67wU7sMmHH6F7nUDGJk7aYRqA5z1h88qc2Nzw7fjsNLv7QYqOvr0KYL9ZmLCV/SqbpqZAYPj
	tk7RlKHui9Liox64MxqF93Ktr6lfP7zJ/Dk1E2OOfLgkw26kyaFOB08oNoxmiA868RH6Xr56xe1BT
	2cyiNinA==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeIw-0000000Fhey-1mUW
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:40 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1208573a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904836; x=1792509636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=VFGRAZFRplismkFkBqaTeC6al84sugMvyaY+6n9epK5acsjR0sgpFGnJaYg3Ox0mXy
         WCZLEHaR4tWX3EcATJ0mKZaQ6MTxeqM79oIvOsez6IPCg70Zwddr15rH2PJ2nJ20h3Ay
         ck1owWj+ohPtI6oVercrxlFxLOi+muiFSnOlWw85UC3tmSwhMIps8apPeSP3GmtnnKvK
         x1elFnZ4LSV7eNQl9Gg2nJ7GM8uSaA1t72xU5Wve+yYDRxsFGvgFCxbb4dvhxiwT3UjL
         32jHaOVMMg2T4h427er9mZZbRwESbi+L77KRtasNt4gsRhQyfGv67qPh8T9rDwHRfhNg
         PEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904836; x=1792509636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=qxrrMZxsyh92lsMJiZNFx/B2L2gDD25LhS6XVpz6xnyuNYIJ9Ohtb8VR73PSSdrrCg
         S6BiifrSlaA/0krHjjYyUP3TQIkPvQfoPDivVx42EizqiBkE0H3amIxIIUtMAHnzKoET
         N9RXBt+ZA7ZDTF53T5iUxy/v44tcgYhkilzNrz+7l3n2suwOqhvF+XO2qrrDC4Z7WaeL
         K5F/Nf6ZcRxlVezgqFrcyetHrnKz2uafvdKSutdyo2XC7OhAvIOIWcBVN7tlqmFkv+LU
         QkfbeqMsH6KqxdUS9mhCfi/MswKE264OwUNSjUy7WEoNmaoAf1D9RnfSe2raphF+/vOT
         E9ig==
X-Forwarded-Encrypted: i=1; AKwUvByddgf+8UV3z8nFjg9ZTIIm4QVqBiLZey1dx9mpG/pV+vcH0dLjKgCO4CJoI6tpNNLF/7Op+esC+Ekg5OhxJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLNwKE4Fn4o1P+UdXTTK3sTGnEWqlor+Oud6yHVgEaqADqEDcyj
	7TwYpA2DcC2agjFNd6F0lTviRbBsKd3miEXeUrb63x2tKiWsBHlDiBEP
X-Gm-Gg: AYBFou1VH9vVTVvFdv4LVTiwYYKSlj74lT21Pt6azMK5fJJO09k9KMPvKW+Y+N6zP4Y
	Oapbfz1GGnh5pAXuTGRped/GbkqNDpfByVWM/HsB5WD6z8N1rJYcb7qDUGzfY7MjaR0QarOf36i
	vjwechIUIjYvXauv5FNaYEwqhaRQL4I1otW01niQ1ii93nJWKrOW2+zf12nl0IaUWVAqkttUkvY
	IRNLmArAPd3BpOdf6CUIZ/b1NzsxwpbbPEtXxUaDnJ9SLtY0GbionzlE6ZDahRFF3w4fZuZl4sk
	a0aUT7qej3gUj+yOdAT9/8xAyNBulLIQBcLPCCx9lUH2CT7cMcSEjIyKtkegdKmOCeoelUXmQge
	B9fGqkNk/d40siP/yU7h9PEkEb5YOSIOLK+ZQK7YnGfJedf+hmItHtK2aqYX/IJKqDDcJI2WuIK
	klTr8ye4Vl2F3/Aod8YmOqH9Ld55COTS6isLHXLNKYsNz6IgizpYBy7Lz6LNZ9KskoLVdMqA/kb
	fcaOm6as86C381aKdLPeLQ/HJGW
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr10510529a91.19.1791904835959;
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
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
Subject: [PATCH v2 27/35] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:26 +0900
Message-ID: <20261013151734.3177690-28-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162038_561636_50013C93 
X-CRM114-Status: GOOD (  17.52  )
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

The MT8167 apmixedsys driver used a custom probe to register PLLs and
divider clocks but had no remove callback. With PLL registration now
supported alongside the existing divider-clock support,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Add missing `.data = &apmixed_desc` entry to the OF match table.
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 58 ++++++--------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..aba33e5aafe6 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -89,59 +89,33 @@ static const struct mtk_clk_divider adj_divs[] = {
 		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
 };
 
-static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
-					&mt8167_apmixed_clk_lock, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	return 0;
-
-unregister_dividers:
-	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.divider_clks = adj_divs,
+	.num_divider_clks = ARRAY_SIZE(adj_divs),
+	.clk_lock = &mt8167_apmixed_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
-	{ .compatible = "mediatek,mt8167-apmixedsys" },
-	{ /* sentinel */ }
+	{
+		.compatible = "mediatek,mt8167-apmixedsys",
+		.data = &apmixed_desc,
+	}, {
+		/* sentinel */
+	},
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
-	.probe = clk_mt8167_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8167_apmixed_drv)
+module_platform_driver(clk_mt8167_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8167 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


