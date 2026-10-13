Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AD0CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWoddL2aeqwWck75D7tYMRLTpBryElggLirImAgRC5s=; b=c5nTsC3z4xymJ1vCHzsVqa48ss
	8fxbspNWSXgLRMdOPUdQFw+AskfPi5SM+qo+Bz6QCH6Gql9reBG54jlQ9inHol3c3588/B8kptMNP
	v2oOUp0V5JHU8r1zL+JN/li80ap/V1fHSnr0qsgNINN1aUywMQNf3haqGHs314YazfZBXD/6Kuvdn
	xClOsm274ySvjz3PIabvGMnEabH6G1r0tixrzJkW/QLkg7vHjxDQPyi9iBcPKfqggqbPMojEnB2fX
	AzbA105BX8QD9PGKmyTjx93hIG0ep2V0klaqoUa1veeATcT0kS5JwrinHx4lg5w5o+KuF6wrHbqtk
	g5PXeh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKd-0000000DJLT-3foH;
	Tue, 13 Oct 2026 15:22:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJT-0000000DIXa-0Zmj
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:24 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8819033dbadso1898962b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904870; x=1792509670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWoddL2aeqwWck75D7tYMRLTpBryElggLirImAgRC5s=;
        b=s8UMY9JwFEMq715+1K+QFVmv0yycI23sZEQpoZPpB1yTXq8Fa/bmALPwkU2IBSU9vJ
         9+yMDIQI01wYjnR406kLlBBkqeR53cj5ylO+SD448WBoYgyMJ0McROetwaPlx/UtgNQ0
         4GOWJgin6A2K9bjpDbtBMfqbojfj71rQeGo5qduQKPzslrmX1KvQS/GIMkYTpJy5cn/n
         bSN3WI3I98CgnbH8pfI4VjJD010zQfYM56Q5dagCLnrSn0aaGw7R7zpAH+fCAyHiuMO1
         xxXLN9xBTHF5OR0p3xZPkgbupeg8m47CkigKF/uduwTcqGvjGWFziGYMNxLWrY1vR8QN
         65pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904870; x=1792509670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWoddL2aeqwWck75D7tYMRLTpBryElggLirImAgRC5s=;
        b=TanP5igAsyFtLdfKTkF8uB63rl4exf+661rhKW9I5DlYdbE/g8ZagSlojZeORLUH0A
         yer4H/oyzHYg86YZkFOQtb3Fq+znxyhlvtDyYLyFu9nvmaM871ObMO5XhBOuprFiZDi4
         u9W4BcEgbyyv1Y45t2nA5VWsgc1qr5DywimEGHTEDz5MPEsUZKom4MmM+2HoWqSexns4
         0ZiIQeYWF8c2S6drafuIDcrhkkRRtSUsQHVsV8jvNaOHHmJZde32T3KTXKB/utUsKPfu
         oC4wOu6bmbA6t0zGhT2oed+JoQ7SnGUhyPJbiZtxGo/6QjJVcfHgJTJDKeWrxjYyx0rF
         o/HA==
X-Forwarded-Encrypted: i=1; AKwUvBxbw5HV3B7q/mFNgtD2PvbVfT8z68erEUsh3rGOL8RinoLx11TylwKWN26rRhLZ2Bp6VZ8Y5VKmYpowHh55OQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIFS+mIk7316GGVBEFebCve1kBiyXeylg/L+/SpYquPbHMpE5gI
	xKVmLmRZA7b6QTJpof467ebc3bsL2cW4B7kb/CHb26FK843ysel4QZwv
X-Gm-Gg: AYBFou3pbJf+nkEU0xAuifkJHTsIM+YcPUFNyS3yPijN4tXyWzRaMwHkr3kRmGCIG1Y
	PuYt+OkYYCG6b7aDjcz8DlsKACcgii9oLekFwq2i1zNUecFZHqLmUB8hH9xAvhdt91J4Llqak3u
	HBiXHiSjq6P9T/e39diuec91EE64bIM5TW9dDN7ofYCqx2Rjw+Lzg3aRVj71l6Kh+iMfr5xDFR9
	yQx95p6uzGkg3s/O7s6c5vu8A36Bn/ucMnBsDFdxdZVqpHQevY2B3Q1LFKB18FU3dCWPKuevlnQ
	7C0vKls2ZHDVEHSDwHJYCFJd0VN29MnGRi9mSUX1PPbTZRjnxU84lz1x6hTvuoQ0uGWQ/nMnNQT
	oZ+PP6aigLG8b3KhlvixOe5XHEMN+4we7LDXDf34a5XFoW9dkshHGZYQJPpuJuvQgEBOBdYEBPG
	7VPVABVgepv4hjt7Q3X2nUHchj6pxb93p/Crii0YNHXti9tEIrPeaLNP/u8ZQPCyNXzQyCgZLVO
	DnBca+HdC/94Sa4yiVdHCaFsGn0
X-Received: by 2002:a05:6a21:329a:b0:3e0:df21:9df1 with SMTP id adf61e73a8af0-3e16be5f9e4mr10904187637.45.1791904870106;
        Tue, 13 Oct 2026 08:21:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:09 -0700 (PDT)
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
Subject: [PATCH v2 33/35] clk: mediatek: mt8195: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:32 +0900
Message-ID: <20261013151734.3177690-34-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082111_334037_81137BC8 
X-CRM114-Status: GOOD (  19.12  )
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

The MT8195 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL and register/unregister FHCTL clocks.
The apusys_pll driver also needed custom callbacks to register and
unregister regular PLLs. With FHCTL and PLL registration supported
by the common helpers, both drivers can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Note that the topckgen driver is excluded from this conversion because
it requires devm_mtk_clk_mux_notifier_register(), which is not
currently supported by the common simple probe helper.

Enable module builds by changing the Kconfig setting to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Add missing `.data = &apmixed_desc` entry to the OF match table.
---
 drivers/clk/mediatek/Kconfig                 | 12 ++--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 75 +++++---------------
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 49 ++-----------
 3 files changed, 31 insertions(+), 105 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 54ecf2692607..2a25cf6991fc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -919,13 +919,13 @@ config COMMON_CLK_MT8192_VENCSYS
 	  This driver supports MediaTek MT8192 vencsys clocks.
 
 config COMMON_CLK_MT8195
-        bool "Clock driver for MediaTek MT8195"
-        depends on ARM64 || COMPILE_TEST
-        select COMMON_CLK_MEDIATEK
+	tristate "Clock driver for MediaTek MT8195"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
-        default ARCH_MEDIATEK
-        help
-          This driver supports MediaTek MT8195 clocks.
+	default ARCH_MEDIATEK
+	help
+	  This driver supports MediaTek MT8195 clocks.
 
 config COMMON_CLK_MT8195_APUSYS
 	tristate "Clock driver for MediaTek MT8195 apusys"
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index a120c3305547..b79a423d25f8 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -161,68 +161,29 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_TVDPLL2, FH_TVDPLL1, 0x154),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8195-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8195_apmixed[] = {
-	{ .compatible = "mediatek,mt8195-apmixedsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8195-apmixedsys",
+		.data = &apmixed_desc,
+	}, {
+		/* sentinel */
+	},
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apmixed);
 
-static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8195-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8195_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8195_apmixed_drv = {
-	.probe = clk_mt8195_apmixed_probe,
-	.remove = clk_mt8195_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-apmixed",
 		.of_match_table = of_match_clk_mt8195_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index a2d98ed58e34..36d358141ecb 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -56,55 +56,20 @@ static const struct mtk_pll_data apusys_plls[] = {
 	PLL(CLK_APUSYS_PLL_APUPLL2, "apusys_pll_apupll2", 0x038, 0x044, 0x03c, 0x03c),
 };
 
-static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APUSYS_PLL_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, apusys_plls,
-				  ARRAY_SIZE(apusys_plls), clk_data);
-	if (r)
-		goto free_apusys_pll_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-free_apusys_pll_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8195_apusys_pll_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apu_pll_desc = {
+	.plls = apusys_plls,
+	.num_plls = ARRAY_SIZE(apusys_plls),
+};
 
 static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
-	{ .compatible = "mediatek,mt8195-apusys_pll", },
+	{ .compatible = "mediatek,mt8195-apusys_pll", .data = &apu_pll_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apusys_pll);
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
-	.probe = clk_mt8195_apusys_pll_probe,
-	.remove = clk_mt8195_apusys_pll_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-apusys_pll",
 		.of_match_table = of_match_clk_mt8195_apusys_pll,
-- 
2.56.0


