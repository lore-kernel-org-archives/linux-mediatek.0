Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA49C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39P+RjortWOVFz9ynTB4fEoB3TRNicn/WbIapoTBl4w=; b=Rblk9rNLRPqFXLOMENae19Q6rl
	Q+/XD3eXVISZdKFMpeF5d4AdcT7mqYQG3JeWo/VQJoR47J8seIfu6U5ArVmQLwVD/kwMNLatZu3ud
	e2jUQLTGMIILXLOkovoEUfjlo7Ltq4biQVnhwD3xwUTENdTgQaecdb70G1sm8Dz5OyUPAbELo8RTx
	rOJcxX35rN3V7bldxc6AaWTSREFivhKi3bBgtmwndQKlxgHNDIuaMdNyX55PFBO+ZxjjessIGo/K/
	eUu4wHacGNbcHB4oEUeg3qJ335yTM2Geh3eeOfW3Thkr/2IBRrBgKz37Q+NJeqlgKAmux8r665FBH
	5RZKeqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVG-0000000HLNb-3Sv2;
	Mon, 03 Aug 2026 14:18:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVB-0000000HLGr-2HIB
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3238783a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766729; x=1786371529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39P+RjortWOVFz9ynTB4fEoB3TRNicn/WbIapoTBl4w=;
        b=IygZrn4QXDs6cnqClshd6C6zAEo53jW4CvQaeXYimBrjAUOha/dfq41KKMYIhb/LsU
         qeVs8GLxvKDPG4AEI/UI9JRmtxWc+JKQmCbR5QGV33d2jkP0kmnk/wUWofHgqNep8uFf
         TL5kDvXv4L04kLUOKrnpQaiX85r7RkoR9c+akFiYaYxbt91XBUzZ1K9uJPTnjssJK+dE
         kL1OIXJqixarP2azSGQEGNPhL3uaw9pK1lWlSG1jtbWrKv/uvkT52EAYfG4Izics/F/I
         p0f/DDNjG0xsAUrSkYMmqANkxY8ufvlfX7C57PG8ItUxhcYUeY8SJw03dn3ZhXibH0sn
         XC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766729; x=1786371529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39P+RjortWOVFz9ynTB4fEoB3TRNicn/WbIapoTBl4w=;
        b=cPXT0xg/845P9bUlAU9L0qnjgajY7FgQDc4I58/QQ4JPZj6jm2gYm3gTF/nKamLxy2
         znXypkgyomDuCMzY+TgmrkihhniNRCQD3WDpaFOqjf92k6dhvx9mqmUUOjtV4WmSleVr
         37FqXrExiLZfZFVRxCwY3/H3h6Lk0kUqhxkWI9gKAZeVN+/iWqOlWb+BniCN40iF6Q3C
         nO45LsDQlElxob6Ztwe42Pyg8RrlFmRVyi1zi7y63Pe5Cjsyf7wyQbw+qn7+UulQ8xrB
         f4hwjDLlvvW1gDxoxtiJZdtsMK+rOV9TFrg3pg+iWmPyJDMr+qL3j4/JQd2ZqFYuUosn
         /rrA==
X-Forwarded-Encrypted: i=1; AHgh+RojUipZAFKe9nTzKRGGqVOnr27qc9aJSrmPDeydn85CYYmfRYKoreBonP3YSd+AAiM17GW4eqRBEzaaq15bGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvlifoI3I2aI3ZML06F9pnpv46sGAM9RvLBozQ/35ggRLJBV/k
	u9X20JhFLV8WoiEHVR8j5zZr9HCGW8v/TA+EtzXxC0pXIWwCzp3npbLF
X-Gm-Gg: AR+sD128yt55TnGHoFO4Y68QN34rSxcWO2JZ1L3O1o0Fvfa+Q78PZSTB8YjnfraA1Rg
	2WSle6YLvilc3OBRxhoxt5pT9qtHOrn4kHgV4KbIjAL4zAoEOi2FreVQruPGRTC+frtcMqgtmLW
	dA4aVmzV+x4SN0ag+YKnmvMKWWD2RBy/QHXZL9QJXyY/icEIHSGyiBhonyrppoJHd/X+26gKnws
	6tr4aJBhpdgDBrbKlGBQdRTpo//YT05hxRIBh2ez7JX6R4qPd9PfTb2SqdA7fzJ4GKqXLklfU/T
	rZ+dx1vpxg94x8wISRjbErV2CjLbUE9tQ9/mPLvU1iuzDGJ+bciwqRcOsgW9SB0c1kS7u8x4jQp
	wS2zVcOygbYN2Anu0Mdy213e90ZkW8Od+cgOuok3g/VFsgkBuvydcHWspUES503uSoiGnE6xqAL
	Ko5NKd5NatVeEUqD/wU8kwQNSRcVx3a1Ol412p1gevQ8mY+TocgGxeSRQvFVJ6kRh0ScnQcux2v
	l+AVHNM6juGMjBVk7mo
X-Received: by 2002:a17:90b:57ec:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38fbc4ae59bmr10160754a91.21.1785766728867;
        Mon, 03 Aug 2026 07:18:48 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:48 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 18/32] clk: mediatek: mt6797: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:45 +0900
Message-ID: <20260803141659.559129-19-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071849_617614_628AEF52 
X-CRM114-Status: GOOD (  17.69  )
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

The MT6797 clock drivers can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Since all MT6797 clock drivers can now be built as modules,
change Kconfig setting to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig      |   2 +-
 drivers/clk/mediatek/clk-mt6797.c | 140 +++++-------------------------
 2 files changed, 24 insertions(+), 118 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b58656a7e8c3..f5460ce3ffba 100644
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
2.55.0


