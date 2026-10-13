Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB12ECC6B12
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUpTUbfD+2scLh9HkHFYG3goitYB98PYr2syh1m4TII=; b=2kIiPya6Fcb9XIHVWUHUseWrhI
	mihHtaq53OkHt5M7zJ/55myC7/m6pfE0saP2j3+A4uvxeuq3u54x34JqvGTK3ajXwrNVaA3NLKRWX
	oiD1BhcfJVFdbxVhWoVmk2PhFmQzIeKR1AUOiEmF6X7OIJGav3eq6yOFsxSYoFL2RhfXQzK1sXtSa
	CW8WpEo+LvC5Exi1VVIA/TGmc6Aser3tc5aJkdGyaKcFJsrGuSmFpl6YeXK/g+ThyzFOthBQKPI6H
	bh7AtB0l2UkkXh5CFV27Jgecxj/xGVsAYxivGz4wZ3ik0qAaFMemmTr7dTKrvE7+784Cd+8p6CmEj
	yufgbQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIa-0000000DHrG-188P;
	Tue, 13 Oct 2026 15:20:16 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIN-0000000DHZA-3RnL
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:10 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89d4030cc57so228521b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904803; x=1792509603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUpTUbfD+2scLh9HkHFYG3goitYB98PYr2syh1m4TII=;
        b=oneL0Rv3D5KUsEkyxYMWza9WKbv8o2/hSVkWqCti39sSAg2sWM6Td2kVBwotHea05z
         jEjGTxs4p2siakZFBpRFFBu14QwKeBAqScy2GeUPyr3Xi42z+Opft78nDs+xAwlyfrtS
         X39/lqg2J1zq+4T6CM0sftp30KyzJUAVjz5rxH/gXjo9QYCr6MFWqQz9zn+TdyUMhnpi
         Aro+44TT2P4B9gbQfX0RhEgRr+/7/yaD/v5ZwKf7EeC+h20TiC/Tg0DhBoHhaibzTo37
         lozOBdNtceHt7aNNNOssdIt9RFLfqu9RBJWQ+vx7ANMM2Nu1RDFSUar3ls6rNzGZ7tUT
         gO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904803; x=1792509603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hUpTUbfD+2scLh9HkHFYG3goitYB98PYr2syh1m4TII=;
        b=KFQubvsfY0Es967meLkpr+w3CxHMLalnB345DhjNzaUgihcIUqiW3BKb+W82O1FgLh
         Nx1uKZbcY8cKXt/fgIDGOxqAiaej6ZlyteyOBkVwG4JyBtYgaVqblDnvn7pYvNBK2ljn
         6/J05dmJor3YcK4i/RsAc5EkYhU+5ElqMXr2SwrBLK3lvJht//cGQju+satEhiZABakc
         5HJWrJohFSd/nVtdhwV/hxmQIAE44olbzyh4GWHzEFvJpJYlieaZi+6F0r91u/LqNkNd
         l3nvdfnzwe+Zj5bTeuCqTXvLOcLEmoeRQnA/cizvpxycgdOUCwoOnBapG7dmjqnI0Hik
         0ICA==
X-Forwarded-Encrypted: i=1; AKwUvBxeqrpUEpP/Jmf1ZavdbtbpVqMv1G1xKym0iIzs5ycKebuwhmFid7pVOiPvaBfwtJfZCsJW1XDyLdIUwbuW/w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJvA1X4uAZTzhiifwpYF+oJA5XleBJENTuWk056kygK7B52BSnD
	XcB0TvjukNvNQAsWtzhIZfA8KooncWkuRSj+U4ofiWZHnEF6oAv9L6R9
X-Gm-Gg: AYBFou2vewJMsUuJis9YH84RIds1P/yB5v0VpwTUsQmzumSMiPwju5l/Lr914y/ds9/
	ZsNzivnRW/Joaz71eQZhSorirkGnJMceyJcuz5vXshxytj1WT2qsKuxcYA93Bfs1kj88pvWbJOK
	TVX0arHfRHkISTZoS15X7UIW5hEsQKuM2iYVEk2SEwlJkqJsUMNVVTa6UuJwCXWlNM+H41dnaLM
	t6CS9HgpO6F6XScuT5wJyG3nnZBrNWu5t4/FlF8XGe9kuN6va2zYYFzqxDzi/jrUthAw1nT/OSF
	eu2+iPx74b+3IoGzvnuIqZpB2utbj2q60dpCnm/2oBr6xcFVjWYJtgL4dfW+RGfVJOLTldrGqtW
	FA5fSLfEIbUINFjeAFCMCiFlSsM7L3rEr+Fi+mnX3EXAi9/tTp/yK+x2Vz8z1zwVUWmyW0Vatog
	2yIVPB+UU5e92ULCRmTUjcjCoSNHxzQg5qijzPJl+fqufxQsQ0yKpAJxdRCZ8GQc+oGwxxuT6g8
	mLWxMezWM2yXivDRS+9kXbe15mq
X-Received: by 2002:a05:6372:a759:10b0:3e1:703b:2fdb with SMTP id adf61e73a8af0-3e1703b3d81mr6678938637.37.1791904802652;
        Tue, 13 Oct 2026 08:20:02 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:02 -0700 (PDT)
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
Subject: [PATCH v2 21/35] clk: mediatek: mt6797: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:20 +0900
Message-ID: <20261013151734.3177690-22-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082003_889153_2FF45225 
X-CRM114-Status: GOOD (  18.62  )
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

The MT6797 topckgen and infracfg drivers use clock types already
supported by the common helpers. The apmixedsys driver can also use
them now that PLL registration and unregistration are supported.

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Enable module builds by changing the Kconfig setting to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/Kconfig      |   2 +-
 drivers/clk/mediatek/clk-mt6797.c | 140 +++++-------------------------
 2 files changed, 24 insertions(+), 118 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 486024be26a6..be522c43fa42 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -342,7 +342,7 @@ config COMMON_CLK_MT6795_VENCSYS
 	  This driver supports MediaTek MT6795 vencsys clocks.
 
 config COMMON_CLK_MT6797
-	bool "Clock driver for MediaTek MT6797"
+	tristate "Clock driver for MediaTek MT6797"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index ebf850ac57f5..1934420375e8 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -379,29 +379,13 @@ static const struct mtk_composite top_muxes[] = {
 	    0x0104, 1, 2),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
-				 clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt6797_clk_lock, clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc topckgen_desc = {
+	.factor_clks = top_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(top_fixed_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clk_lock = &mt6797_clk_lock,
+};
 
 static const struct mtk_gate_regs infra0_cg_regs = {
 	.set_ofs = 0x0080,
@@ -539,58 +523,12 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 	FACTOR(CLK_INFRA_13M, "clk13m", "clk26m", 1, 2),
 };
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
-static void mtk_infrasys_init_early(struct device_node *node)
-{
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return;
-
-		for (i = 0; i < CLK_INFRA_NR; i++)
-			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-	}
-
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-				 infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-}
-
-CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt6797-infracfg",
-		      mtk_infrasys_init_early);
-
-static int mtk_infrasys_init(struct platform_device *pdev)
-{
-	int i;
-	struct device_node *node = pdev->dev.of_node;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR; i++) {
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-		}
-	}
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), infra_clk_data);
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-				 infra_clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				      infra_clk_data);
-}
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_fixed_divs),
+};
 
 #define MT6797_PLL_FMAX		(3000UL * MHZ)
 
@@ -646,68 +584,36 @@ static const struct mtk_pll_data plls[] = {
 	    0x2B4, 4, 0x2BC, 0x2B8, 0),
 };
 
-static int mtk_apmixedsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc apmixedsys_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt6797[] = {
 	{
 		.compatible = "mediatek,mt6797-topckgen",
-		.data = mtk_topckgen_init,
+		.data = &topckgen_desc,
 	}, {
 		.compatible = "mediatek,mt6797-infracfg",
-		.data = mtk_infrasys_init,
+		.data = &infracfg_desc,
 	}, {
 		.compatible = "mediatek,mt6797-apmixedsys",
-		.data = mtk_apmixedsys_init,
+		.data = &apmixedsys_desc,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6797);
 
-static int clk_mt6797_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt6797_drv = {
-	.probe = clk_mt6797_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797",
 		.of_match_table = of_match_clk_mt6797,
 	},
 };
-
-static int __init clk_mt6797_init(void)
-{
-	return platform_driver_register(&clk_mt6797_drv);
-}
-
-arch_initcall(clk_mt6797_init);
+module_platform_driver(clk_mt6797_drv);
 
 MODULE_DESCRIPTION("MediaTek MT6797 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


