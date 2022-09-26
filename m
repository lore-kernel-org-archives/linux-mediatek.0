Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF67DC6FA93
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKF6uDKRpSETCfWZPmnW4TNC2jW6TTo0IYMeEINomJc=; b=ApENiWAs4/fTEn8eOVtvvYvi9b
	vgdJOcP3dDLUZE/CyQfaOLSx7BrMJmmZmo7GY9Nb/8b9KjpBGl9ZNbGtgF6jlfGwa3MiSxpmhB92o
	3/H9Lvbs1yml/8ssYwH83VOYKFVXN1Cx+7FQOXinZq+xcXKH9fj9oM2d3xDnfsOr2EhkOySYDvXbi
	4/lysu6Cs9CNkPOPLzK5meO/e9HLhqO8Z05i1Ca4Ih1vJwi/kJ+1xD2S5fPP/edlrVvxCdb5icbKU
	QSK7tG5Lq3WDI3c2lo5/K4ECix4JysGtmk7EXAfBViniyzLhs2py8KwZjdc76XQdrpHVp56DgqAwN
	JmtDPYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclMh-0046pF-Ej; Mon, 26 Sep 2022 10:29:31 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJJ-0046JV-2w
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:26:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so11915573pja.5
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vKF6uDKRpSETCfWZPmnW4TNC2jW6TTo0IYMeEINomJc=;
        b=EmWu+Hp0mYKEWNIc/wJSX5GWZgtyM4bpkofx1+z7PSCEyK17Zw8lV2mtmVPgPkEPet
         ziEWhQInfBDgILGkuhTb0/Sp2Jh7E/KQ4RaNzR1MQansnDk1amueRD7HT42EeRz2vyZf
         vLrEnd9lWDrZP2P+9+fpx3+9eCmBh197wxnJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vKF6uDKRpSETCfWZPmnW4TNC2jW6TTo0IYMeEINomJc=;
        b=pFpEazK3vXH85yM7RO0A7X5lwrdF7Q3vXjJBnzIQ+KCozWUfyWQeLzMsv9pesMRDlR
         ehRQf4elbQpJr2GtnqjRwR3evYUYzAxUn4dUKhlcpo27AqMJQPrEn4B1QJPfnUKVNOgX
         3O/ttgzjcQcjHHC8252Y5YtFubOFIMNHa308HabXVPctkiZ4ACVdW5wbMIn7J7n9Oiza
         Hggv2rU3PyGX7Hwxkz5DHnibS2U4Ym7cVIkZwmGGrxDkgbhPqKXzTXWt/NoWwcAPStET
         BwWUlfCLlRft6BPtaebAFV4lWx6gUcWigJfExqhnIXR8c5ADda8/+yvRAGjI4g23gFW8
         ZEqg==
X-Gm-Message-State: ACrzQf1JeG/OJ5HqX0zLZTk0QzylYHC2E3hszqHyx8zZ0my3GQR8FJMN
	tPBjVHkpjiym1EBKeECfUfYWmg==
X-Google-Smtp-Source: AMsMyM4RmFhd4z51ZSDU0ZsE7JaNNUJpRIELJK6UXyR3OrLy0D+s42ZSQWEsKTwERKphV4P1ZC2s3A==
X-Received: by 2002:a17:902:d48e:b0:178:b5d:ab3 with SMTP id c14-20020a170902d48e00b001780b5d0ab3mr20925242plg.22.1664187959096;
        Mon, 26 Sep 2022 03:25:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] clk: mediatek: mt8192: Implement error handling in probe functions
Date: Mon, 26 Sep 2022 18:25:23 +0800
Message-Id: <20220926102523.2367530-7-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032601_218362_5916F395 
X-CRM114-Status: GOOD (  18.11  )
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

This is similar to commit f3e690b00b86 ("clk: mediatek: mt8195:
Implement error handling in probe functions").

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of the probe functions for the mt8192 clk drivers
to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192-aud.c | 15 ++++-
 drivers/clk/mediatek/clk-mt8192-mm.c  | 17 +++++-
 drivers/clk/mediatek/clk-mt8192.c     | 83 +++++++++++++++++++++------
 3 files changed, 93 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index 8c989bffd8c7..825b80fc403d 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -89,15 +89,24 @@ static int clk_mt8192_aud_probe(struct platform_device *pdev)
 
 	r = mtk_clk_register_gates(node, aud_clks, ARRAY_SIZE(aud_clks), clk_data);
 	if (r)
-		return r;
+		goto free_data;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		return r;
+		goto unregister_gates;
 
 	r = devm_of_platform_populate(&pdev->dev);
 	if (r)
-		of_clk_del_provider(node);
+		goto remove_provider;
+
+	return 0;
+
+remove_provider:
+	of_clk_del_provider(node);
+unregister_gates:
+	mtk_clk_unregister_gates(aud_clks, ARRAY_SIZE(aud_clks), clk_data);
+free_data:
+	mtk_free_clk_data(clk_data);
 
 	return r;
 }
diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
index 1be3ff4d407d..4c90e0cd9f7c 100644
--- a/drivers/clk/mediatek/clk-mt8192-mm.c
+++ b/drivers/clk/mediatek/clk-mt8192-mm.c
@@ -93,9 +93,22 @@ static int clk_mt8192_mm_probe(struct platform_device *pdev)
 
 	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 	if (r)
-		return r;
+		goto free_clk_data;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		goto unregister_gates;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return 0;
+
+unregister_gates:
+	mtk_clk_unregister_gates(mm_clks, ARRAY_SIZE(mm_clks), clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+
+	return r;
 }
 
 static struct platform_driver clk_mt8192_mm_drv = {
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index d3f57fb73c49..94aab61193a0 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1078,26 +1078,64 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
-			       top_clk_data);
-	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
-				    top_clk_data);
-	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
-				    top_clk_data);
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 	if (r)
 		return r;
 
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8192_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
+					top_clk_data);
+	if (r)
+		goto unregister_mtk_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8192_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_adj_divs;
+
 	/*
 	 * Remove clock provider set in clk_mt8192_top_init_early() first
 	 * to avoid duplicate entry, and re-add it so the OF related code
 	 * gets run again with the full set of clocks.
 	 */
 	of_clk_del_provider(node);
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				      top_clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
+	if (r)
+		goto unregister_gates;
+
+	return 0;
+
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_adj_divs:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+unregister_mtk_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_fixed:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	/*
+	 * top_clk_data is not freed, as it is not allocated by the probe
+	 * function, and it is potentially still used through the
+	 * of_clk_add_hw_provider() call in clk_mt8192_top_init_early().
+	 */
+
+	return r;
 }
 
 static int clk_mt8192_infra_probe(struct platform_device *pdev)
@@ -1116,14 +1154,16 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 
 	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -1145,10 +1185,12 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
@@ -1164,17 +1206,24 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	if (r)
 		goto free_clk_data;
 
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		goto unregister_plls;
+
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto free_clk_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.37.3.998.g577e59143f-goog


