Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D193C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ3+Bck9CdXc48N2tcvwnMfepyRrmJsNT3BHHA0ynmw=; b=y2Msxtj3VXeVo3kFozmtCVrsAH
	ec5sI2c0XgaXsWYGKB25lP1qA3B1BG1V335eGlGWapvSjvAzXkdClVOuepJy6NA7ZcJ+Ezwngkit7
	G4tWoCUqhCPbx14IWFh8y0YgAiyUOiskQIZa4cdxu5SXxKv4P4A0I3nspzWFbpN2DCx2hzMYG+1ry
	UAV1i9f68+x/DaNXPYoCIR9pIMd0dMv/WHFL7GCZOtI5MKEIAEZtDHiLHgNf7xJvlUAMSHYpz3Q4V
	7FeG8HyeAwS+AEtGFGdyhIZFrXIkOLyban301o5MplN8GuRn8sCpyMFl/B9T2YkU44gA/NU4Hf7al
	L/qUShvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7I0T-005Sh6-Nm; Fri, 01 Jul 2022 14:52:29 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzp-005SMx-8P
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 14:51:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id e132so2606704pgc.5
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZ3+Bck9CdXc48N2tcvwnMfepyRrmJsNT3BHHA0ynmw=;
        b=YnrGgqbg/4gNKd22gWIv7j8U6S1n+vomvkRInLzCjH1SphTbCWlZIr9IqjUEyBg+TP
         gwPqLwnFV1J+c+8ipFwtbJQ1wp8mVdHR2CzHjcepnzKYavtoyP1t2X9F319qsaL+yvln
         q/Fl5k320kUEnSwsN7O8SAS0LQ/Q0el9nM16g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZ3+Bck9CdXc48N2tcvwnMfepyRrmJsNT3BHHA0ynmw=;
        b=FiAaRDbZvUBzSIKZJpqG4o8NwSRT71dXcmFdqStsEaBDU7SuDHMsfdzIeqa63KCajD
         Mx5PVPYnFTwV/yADKp9XOuvvPGQrMfCUc8/OPvA0r01ow8/W/EQvJWzpzANh+yrPBh8B
         PvGgPgkH0wuLCmF78R5pWTEYpWm+DQuchMOLuYFbrMyBZRBwVDAeB0+SXG5xZpmMuwej
         Gbl1z8ldWBn3pxhd0rUfQywydyOBReyLcg4WzWc1XyYpK6u2Ze2B1jdD5eMZLKlLGMv9
         MgEwd8j+tnzxlkA5LccW3wnskMzwJW+U4NLzdRq/lys6XoTNmsmCaHYWP2v7G5GI2kcr
         KmAQ==
X-Gm-Message-State: AJIora/yQvWK9fEbBy+jkEOLsl3Y7DwuSFIiP+K/gxRtmObn73uGKlmE
	KYzWF7UBx9PDFfR8lt/NMiDLRJ8BErm2PQ==
X-Google-Smtp-Source: AGRyM1ti6dDLLmN4VHYASn13hEQLd6Lj+xpLHhnpmLhsbZQx47SR/6ELsciEy4txopZlULG/rZJxWQ==
X-Received: by 2002:a63:3184:0:b0:40d:7801:e7e with SMTP id x126-20020a633184000000b0040d78010e7emr12640506pgx.333.1656687106684;
        Fri, 01 Jul 2022 07:51:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: mediatek: mt8183-mfgcfg: Simplify with mtk_clk_simple_*()
Date: Fri,  1 Jul 2022 22:51:33 +0800
Message-Id: <20220701145133.1152387-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701145133.1152387-1-wenst@chromium.org>
References: <20220701145133.1152387-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_075149_342093_D6014D54 
X-CRM114-Status: GOOD (  16.64  )
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

mtk_clk_simple_*() was added after the MT8183 clock drivers were merged.
They provide shared boiler plate for clock providers that only have
clock gates.

Since the MFGCFG block needs its power domain enabled, it can't be
completely converted to using the functions.

Simplify the MT8183 mfgcfg clock driver using mtk_clk_simple_*(),
enabling runtime PM at the same time as before. This also adds proper
driver removal support.

Since the mtk_clk_simple_probe() function allocates the clk_hw pointer
array based on .num_clks given, it effectively requires there are no
holes in the clock ID map. Check that the size of the array matches
the number of clocks with a static assertion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..61a3d02e44f5 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -26,28 +26,31 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
 };
 
-static int clk_mt8183_mfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(mfg_clks) == CLK_MFG_NR_CLK);
 
-	pm_runtime_enable(&pdev->dev);
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
 
-	clk_data = mtk_alloc_clk_data(CLK_MFG_NR_CLK);
+static int clk_mt8183_mfg_probe(struct platform_device *pdev)
+{
+	int ret = devm_pm_runtime_enable(&pdev->dev);
 
-	mtk_clk_register_gates_with_dev(node, mfg_clks, ARRAY_SIZE(mfg_clks),
-			clk_data, &pdev->dev);
+	if (ret)
+		return ret;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	return mtk_clk_simple_probe(pdev);
 }
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-	{ .compatible = "mediatek,mt8183-mfgcfg", },
+	{ .compatible = "mediatek,mt8183-mfgcfg", .data = &mfg_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_mfg_drv = {
 	.probe = clk_mt8183_mfg_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-mfg",
 		.of_match_table = of_match_clk_mt8183_mfg,
-- 
2.37.0.rc0.161.g10f37bed90-goog


