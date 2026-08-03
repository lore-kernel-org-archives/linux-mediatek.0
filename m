Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14274C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBoJSR+t4o6rLEYzXc6evi5ADYig1EhmcESvsg7Klw8=; b=TTRQS5l2NdD6s81yUheN+9G4Vr
	oxhVzntdYaYdJxz0MpTpQ9tOiO08lNPe0ZCRAep/dQKiPtlhFtp213gMOE6RbV4ZuXdLJt+FO7Bsz
	AGoddAM3CNIQ4fa6XhiGLIhU8mIXef0D9Eej57DsWdSslq2xIvBNTMDS/Zc1OF5zdyTcm+nhV4YLG
	anGy5xEc+vyqu79iaSkaTR0cEq4AZADF/mXqXK1OPXRQ6anjJTEy7li6c4TrrDdGxxyj8M57l8scQ
	m/bVy26pXj7L/wypEV6TAUzU4DuUZ3XMjuSeoIUAH3yUbelff+coY+25nJRGf81KPRsXdv1xNQ8Ax
	tbi2Tzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV7-0000000HLAJ-0TkK;
	Mon, 03 Aug 2026 14:18:45 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV2-0000000HL3y-1fUV
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2237001a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766720; x=1786371520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBoJSR+t4o6rLEYzXc6evi5ADYig1EhmcESvsg7Klw8=;
        b=Y+yfZj8Q5r3i5UesB7SBnyZOeeefz8L0RbWQJyv/PJMgNXmJ8RI5KCgWo3GgiXPYrP
         N2cynqOI27iY+vJ7khHnrwnAUICDjrb0RrXQhCGuFSt+tsDB7Bf6DG1oM9wJrvryqMqn
         90bfdiyYA9QbdW9fXjQOaxJKFy6Kzy12SS9vXkkGS8isqElphqb+OL2VteaXXIZ/rwZd
         mflzNRi7QuDAnAES6CAY4kseAmWVQQzivfMUN51EjFqwUYjn5lujt3VFRw8Z3+m7A2p2
         BGEycB9pLurEGHBlTPnrmB2UM40zGf24TMrI9VtmQazi4P4M1EwsLqd9D385WFUN4Y6+
         8ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766720; x=1786371520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBoJSR+t4o6rLEYzXc6evi5ADYig1EhmcESvsg7Klw8=;
        b=ji1SFlo9g1J9mhcUlwQoO9ygKK4QaXVp7wLOdW7BDVLQIwJQWQlCnSe75u8fKkS4sB
         sRrJDxCMIKkCh7jIbBb/NVpVvwv9/mZd622v7AKphYwQLT6yibZxzsBmuG2AcMjvjNew
         l9KwwSSAf6dtHa6Nhv9fpxGCdmAWi9ESDdK3OzRn2URjEZyQQH0/MR+YpIQdQWkpW4Rq
         TkYcfmZHkQTE15sDw6zI19wyjaNVm3y+OS2coEFVgxd6uhpDzeRvzMnXhajRYn2rbypx
         qUP4cjGB5ELI3PUGPEqNpxpMjSKlr8DJFZkowUO0VhqQFb/GUTw97AdLsRD/YTwwbktD
         UqEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHk2DsAG8wAp/h3aPJNI8HplyW5AS/ESR9dTa7ivUl7UjyJHuFASNGsnpSjy5fLFfK9ZungJtavJa76UlXEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHWUjqgxe8nTvpHOLuSGz+Bd8AJVUUGZV78YX2kzsq4aB5iOk0
	8QB4gSl7Ydw0yXcHqGjUP4ofRFUMPhuI+d16teaWoPCvfM9uQKXawyN/
X-Gm-Gg: AR+sD125+7QIvBoEVw+ni2xf5zOib+1fW5dmSNADvcvJf/JhzDfWQcv62NimJb5Yr/C
	X4g+tca7HDgUU7fdNu0fKcynsy+hz9/MUT97WZqO8X+wG9u73fTnGaxHEDialqQKaif07iuO38y
	8StSUw6VKmvPMV21KU9eKPVSXZEpIScVzdkLpHZasqvUoDbX4os3Dhy37b7Tbh4dmWr/YLTqK5k
	re3cYYSqILVkU+C+HdAvuZY14SpmBThLYDkfS+boxBjzgLJhCavWfZJ22PFyeLtxNVsoyXBniWv
	wA6P7g4bmGtOD7d1soOPfQtaDXItgIfntprlkwh1FDri2G9XDT7vOGN4gLyLL/j5/zH1D1k3lFH
	hrzo8zdZEwpkFMNPZfbQ+od7X+97st3YODULbBIGMiUfN3GKrjGKE/C5G6awK/jl03COfA7ODAw
	8eWmXXNJ+9sigGqZPSO0FKjpsAyXaTizuuTBvI4ybh1yP+eDBFnj0mQHXPcaYdS/HP0luqaubuN
	7tDfRly2XAHyQW33BzjNkceOd9O1PI=
X-Received: by 2002:a17:90b:57cd:b0:38f:1a80:d1e7 with SMTP id 98e67ed59e1d1-38fbc437c4cmr9229318a91.13.1785766719653;
        Mon, 03 Aug 2026 07:18:39 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:39 -0700 (PDT)
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
Subject: [PATCH 16/32] clk: mediatek: mt6779: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:43 +0900
Message-ID: <20260803141659.559129-17-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071840_445157_B9FF5BE4 
X-CRM114-Status: GOOD (  16.40  )
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

The MT6779 main clock driver can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Additionally, merge the separate infracfg and other drivers into
a single platform driver, and add support for the apmixed and
topckgen clock controllers using the consolidated of_match_table.
Finally, replace the custom arch_initcall() initialization loop with
the module_platform_driver() macro.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6779.c | 124 ++++++------------------------
 1 file changed, 22 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 4b9dcb910b03..a806789ae27c 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -808,7 +808,7 @@ static const char * const i2s5_m_ck_parents[] = {
 	"aud_2_sel"
 };
 
-static const struct mtk_composite top_aud_muxes[] = {
+static const struct mtk_composite top_aud_muxes_divs[] = {
 	MUX(CLK_TOP_I2S0_M_SEL, "i2s0_m_ck_sel", i2s0_m_ck_parents,
 	    0x320, 8, 1),
 	MUX(CLK_TOP_I2S1_M_SEL, "i2s1_m_ck_sel", i2s1_m_ck_parents,
@@ -821,9 +821,7 @@ static const struct mtk_composite top_aud_muxes[] = {
 	    0x320, 12, 1),
 	MUX(CLK_TOP_I2S5_M_SEL, "i2s5_m_ck_sel", i2s5_m_ck_parents,
 	    0x328, 20, 1),
-};
 
-static struct mtk_composite top_aud_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "i2s0_m_ck_sel",
 		 0x320, 2, 0x324, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "i2s1_m_ck_sel",
@@ -1211,125 +1209,47 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 8, 0x02D4, 1, 0, 0x14, 1, 0x02D8, 0, 0x02D4),
 };
 
-static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-			       ARRAY_SIZE(apmixed_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static int clk_mt6779_top_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-
-	mtk_clk_register_muxes(&pdev->dev, top_muxes,
-			       ARRAY_SIZE(top_muxes), node,
-			       &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_muxes,
-				    ARRAY_SIZE(top_aud_muxes), base,
-				    &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_divs,
-				    ARRAY_SIZE(top_aud_divs), base,
-				    &mt6779_clk_lock, clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static const struct of_device_id of_match_clk_mt6779[] = {
-	{
-		.compatible = "mediatek,mt6779-apmixed",
-		.data = clk_mt6779_apmixed_probe,
-	}, {
-		.compatible = "mediatek,mt6779-topckgen",
-		.data = clk_mt6779_top_probe,
-	}, {
-		/* sentinel */
-	}
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
 };
 
-static int clk_mt6779_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *pdev);
-	int r;
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	r = clk_probe(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.composite_clks = top_aud_muxes_divs,
+	.num_composite_clks = ARRAY_SIZE(top_aud_muxes_divs),
+	.clk_lock = &mt6779_clk_lock,
+};
 
 static const struct mtk_clk_desc infra_desc = {
 	.clks = infra_clks,
 	.num_clks = ARRAY_SIZE(infra_clks),
 };
 
-static const struct of_device_id of_match_clk_mt6779_infra[] = {
+static const struct of_device_id of_match_clk_mt6779[] = {
+	{ .compatible = "mediatek,mt6779-apmixed", .data = &apmixed_desc },
+	{ .compatible = "mediatek,mt6779-topckgen", .data = &topck_desc },
 	{ .compatible = "mediatek,mt6779-infracfg_ao", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6779);
 
-static struct platform_driver clk_mt6779_infra_drv  = {
+static struct platform_driver clk_mt6779_drv  = {
 	.probe = mtk_clk_simple_probe,
 	.remove = mtk_clk_simple_remove,
-	.driver = {
-		.name = "clk-mt6779-infra",
-		.of_match_table = of_match_clk_mt6779_infra,
-	},
-};
-
-static struct platform_driver clk_mt6779_drv = {
-	.probe = clk_mt6779_probe,
 	.driver = {
 		.name = "clk-mt6779",
 		.of_match_table = of_match_clk_mt6779,
 	},
 };
-
-static int __init clk_mt6779_init(void)
-{
-	int ret = platform_driver_register(&clk_mt6779_drv);
-
-	if (ret)
-		return ret;
-	return platform_driver_register(&clk_mt6779_infra_drv);
-}
-
-arch_initcall(clk_mt6779_init);
+module_platform_driver(clk_mt6779_drv);
 
 MODULE_DESCRIPTION("MediaTek MT6779 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


