Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B3CC6B1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=; b=aZBkwcvhY5Z90554YdjHI+IawK
	cjqrREVedU7omSS8sAtqHVcWCakk0fLzIWAXBQPq8p9ALICpW5ICp+6aaDzOxrutYy2oxe0faVMf3
	r1E3/fgbRX2eaQQb1Dlwkl/Xe9SciPzqw+zUFbukCrzstE53IuWQLXQGqMl78+1A/t6IMV8EiDeLd
	N0qdinUq+CyZlnKrPgENOxVCZxjeGq8soY6gaFofZnICIiomDylyf2LVe89+HMNxWZi1llP0vrojy
	mcTT98Yb90ETo61JuR9xq7SWx1LUlOn4k1vSZlRWidGOAH2zxmG1Z5KkVMyTUrltO9VDSAztJfbs8
	8g0vKjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeKc-0000000DJJ7-26md;
	Tue, 13 Oct 2026 15:22:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJd-0000000DIeV-3GAV
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=; b=C7Wm4C+8KjYKBN4Kp8bwN7VY7K
	Dd70D75K1y/M1d0qa0RVI9RJxDdamfoYz15wI75/dHtsbMOtkAO+tABrbbwdNi5dd5eeHNN7jhVlb
	mcB8wSE4g9WkXZAOz+ywuY5o/J3KdpRYjy/v5Jp//eAytdConwFUr8OL2mMblFF6zU6kcMMgCzWKc
	NuIHcziG89xf0ZWsnnBAg0TNb5G9GhHLUneIP02E+g59TQFlb/Gn7KpdsB7K5aPVcKCzjju5fq0qh
	mi3opM3FOdHmWojd7DmMV0wjwVJK0ePO1M08uo3J9NX2A/rHdtB+HF5uykcyq7kHVbe8Y1sE6gUI5
	ELyKUMbQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeJZ-0000000FhlL-37fd
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:21:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-88a627ce016so985268b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904876; x=1792509676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=;
        b=c714JptzZ+VhGVcgEbe75IdaefjtWLAequM3XZLDUaaUPYkgQz2kOckp+n5eLy9BXt
         /r8/4KonmXA8gI1Xbh1CvnwcUSKixX3bVjHPl8th3xcANBH6BRIOowvscYq0PqXwANxB
         FXw35pwxzYrHTkIBjuclm4ZLoXZfASdGUWkGi244ZMJTVLsA9N/96ULGaDQqKMrBKH/k
         6JJWm95y0LUvdZ+soquiGhAf10pK2gO5ZF7bQr69ZqnVcsfdXNQso467LXDfuY11uSjl
         dh4P2KrWcVQtGPWFx545RmEcomwcbB9PMXl+xadbolMU2ZEi0x9XLcBWMLA+y6gJiqKj
         nZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904876; x=1792509676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=;
        b=zgPkiCnT1iQuSlXoUz6EoD5Mh8lm4pG51E0VEVx9xPLG9SzogafeLOaz+T6I0XTBh8
         47K9BBYUm97R3sMUUx8QoUXtUnaXUYgSHTepjS63oSX9Oya5CNpvMpq3OSx/LMQ87QwJ
         F7hlKpb4/i3pDGBtphQq8hkAziEum7t/ENvdbgvqpyn0aelCzANa/hQDi5PMZSQkSzrM
         K4diUY6BL4Kb2WB6hH8bEgWqKpu5uKpn1U8QRugRPBhd1FU0+JqBkmCKG3HIAGxD7yYV
         xAP5xeBgZ0RTp5h7U08ohQweVR65AT5IU1+pFa4NeveSOfo9vsdsbPMAJvRtJ+CP4ZZg
         ZfSA==
X-Forwarded-Encrypted: i=1; AKwUvBywmRgtMmCPlcTJVmPpRS/Zcj9WzJzbOrGNZfAjtPP0DjKhhUUaEPu4ySEbFK1IwKgVJJZLetfLNj736hnCPA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKumzejOZ1N5SQgWnHAfU2Njr5q9mP2r/X12k0ffwfXEcsjOrEl
	eheFumXQqdhnm3KBO35gyYTbXIqMkCCSKqUB6/DzNRTJ/n8hn4/Kwaql
X-Gm-Gg: AYBFou3EF/CJxA+xBXmmU8b59BHUB20AlolMDnBzP++L8fPW1N42v33Vm8M+mwSGwux
	DHEwUPNYEjMtwECQ8pzPHRUtcRvK2EDxuonAGeVlh8B1qnUnokJE9Sn8wEDRLxfSNIg99BqJJRY
	JFxH9W7mkuidc8/Y+nI/nhQxMDaXS6xubffmTr9fvJ6bv/h8jUKx8z142z++4TJyP331GXXR93q
	+eoMq8CJ096Z4Sv5Pt10FrvisDCbg7/skdDRtNdJ2nG/j0t6T3D1RJWxsqq3mwERIzSCfk0O4K3
	Tb1mfalcAYVIqELXJbmA6imLUZhyCwX5aEXKT927C2yK2vfhOcN9tjoe4AXPApqa+LRuIOooBzO
	ZFP2wBOohLvAPWKYuLJYT4+W1z7K5fN8TSxydbc+9XjWqxAtov8c8jaZL5F0nBGAxMFdVu99Ns9
	x55uyxjOtUB6cBi555MK8yj7JVh8snPYPcuiTp/FUnEorxzCpEjjtzNl78bTPzVg9EhKOY3BTA8
	Wp2V5FyWdFMP5/Z8WJFsD44AJQg
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12161934637.1.1791904875448;
        Tue, 13 Oct 2026 08:21:15 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:15 -0700 (PDT)
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
Subject: [PATCH v2 34/35] clk: mediatek: mt8196: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:33 +0900
Message-ID: <20261013151734.3177690-35-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162119_199579_E71FF607 
X-CRM114-Status: GOOD (  17.11  )
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

The MT8196 apmixedsys, mcusys, and mfg drivers use
MT8196-specific PLL descriptors or pass PLL data directly
as match data, requiring custom probe/remove callbacks.
Represent these PLL configurations using struct mtk_clk_desc
so the drivers can use mtk_clk_simple_probe() and
mtk_clk_simple_remove().

Keep the vlpckgen driver unchanged because its probe callback
also initializes APLL tuner registers, which are not yet
supported by the common helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 67 ++------------
 drivers/clk/mediatek/clk-mt8196-mcu.c        | 96 +++++++-------------
 drivers/clk/mediatek/clk-mt8196-mfg.c        | 84 +++++------------
 3 files changed, 63 insertions(+), 184 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
index c4ebb0170b82..a20fa02070a8 100644
--- a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
@@ -86,11 +86,6 @@
 		.ops = &mtk_pll_fenc_clr_set_ops,		\
 }
 
-struct mtk_pll_desc {
-	const struct mtk_pll_data *clks;
-	size_t num_clks;
-};
-
 static const struct mtk_pll_data apmixed_plls[] = {
 	PLL_FENC(CLK_APMIXED_MAINPLL, "mainpll", MAINPLL_CON0, FENC_STATUS_CON0,
 		 7, PLL_AO, MAINPLL_CON1, 24, MAINPLL_CON1, 0, 22, 0),
@@ -110,9 +105,9 @@ static const struct mtk_pll_data apmixed_plls[] = {
 		 0, 0, SGMIIPLL_CON1, 24, SGMIIPLL_CON1, 0, 22, 7),
 };
 
-static const struct mtk_pll_desc apmixed_desc = {
-	.clks = apmixed_plls,
-	.num_clks = ARRAY_SIZE(apmixed_plls),
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
 };
 
 static const struct mtk_pll_data apmixed2_plls[] = {
@@ -132,57 +127,11 @@ static const struct mtk_pll_data apmixed2_plls[] = {
 		 0, 0, TVDPLL3_CON1, 24, TVDPLL3_CON1, 0, 22, 6),
 };
 
-static const struct mtk_pll_desc apmixed2_desc = {
-	.clks = apmixed2_plls,
-	.num_clks = ARRAY_SIZE(apmixed2_plls),
+static const struct mtk_clk_desc apmixed2_desc = {
+	.plls = apmixed2_plls,
+	.num_plls = ARRAY_SIZE(apmixed2_plls),
 };
 
-static int clk_mt8196_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const struct mtk_pll_desc *mcd;
-	int r;
-
-	mcd = device_get_match_data(&pdev->dev);
-	if (!mcd)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(mcd->num_clks);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, mcd->clks, mcd->num_clks,
-				  clk_data);
-	if (r)
-		goto free_apmixed_data;
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
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8196_apmixed_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_desc *mcd = device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 	{ .compatible = "mediatek,mt8196-apmixedsys", .data = &apmixed_desc },
 	{ .compatible = "mediatek,mt8196-apmixedsys-gp2",
@@ -192,8 +141,8 @@ static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_apmixed);
 
 static struct platform_driver clk_mt8196_apmixed_drv = {
-	.probe = clk_mt8196_apmixed_probe,
-	.remove = clk_mt8196_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-apmixed",
 		.of_match_table = of_match_clk_mt8196_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8196-mcu.c b/drivers/clk/mediatek/clk-mt8196-mcu.c
index 13642fc673c2..e392408c93b2 100644
--- a/drivers/clk/mediatek/clk-mt8196-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8196-mcu.c
@@ -68,29 +68,44 @@
 		.pcwibits = MT8196_INTEGER_BITS,		\
 	}
 
-static const struct mtk_pll_data cpu_bl_plls[] = {
-	PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_bl_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_b_plls[] = {
-	PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
-	    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_b_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
+		    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_ll_plls[] = {
-	PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_ll_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cci_plls[] = {
-	PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+static const struct mtk_clk_desc cci_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data ptp_plls[] = {
-	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+static const struct mtk_clk_desc ptp_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mcu[] = {
@@ -106,56 +121,9 @@ static const struct of_device_id of_match_clk_mt8196_mcu[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mcu);
 
-static int clk_mt8196_mcu_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
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
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mcu_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mcu_drv = {
-	.probe = clk_mt8196_mcu_probe,
-	.remove = clk_mt8196_mcu_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mcu",
 		.of_match_table = of_match_clk_mt8196_mcu,
diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index a317183f1681..a209162f6207 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -61,22 +61,31 @@
 		.parent_name = "mfg_eb",			\
 	}
 
-static const struct mtk_pll_data mfg_ao_plls[] = {
-	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0,
-	    PLL_PARENT_EN, BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
-	    MFGPLL_CON1, 0, 22),
+static const struct mtk_clk_desc mfg_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0,
+		    MFGPLL_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_CON1, 24, 0, 0, 0, MFGPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc0_ao_plls[] = {
-	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
-	    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC0_CON1, 24,
-	    0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc0_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
+		    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC0_CON1, 24, 0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc1_ao_plls[] = {
-	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
-	    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC1_CON1, 24,
-	    0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc1_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
+		    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC1_CON1, 24, 0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
@@ -90,56 +99,9 @@ static const struct of_device_id of_match_clk_mt8196_mfg[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mfg);
 
-static int clk_mt8196_mfg_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
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
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mfg_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mfg_drv = {
-	.probe = clk_mt8196_mfg_probe,
-	.remove = clk_mt8196_mfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mfg",
 		.of_match_table = of_match_clk_mt8196_mfg,
-- 
2.56.0


