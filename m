Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6490C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtFS4+K7jouxGDav3aR2hmHwX2xgjAIJeXndSnugS+I=; b=yqA5kD5FAev/FH
	oYVz8iBVPvJAXfUMWjAxNnp4RIBCJNJX29r8ez7moH/lwyWvRwK/Tf1kMDwyhB/InxwzXbg5e3DT6
	fLF4Wwcj/JE2S30rOBK8uVFxoOzMtWSOC/h0y/Z1MmCdsbr1FAESniZ2CatxXG761ORbSNpRTZoC6
	9bWZ1ON0x/0CFzKR2jB7v7/G46g7KhViLmVdnedSj106+S5PveQNFSyoq1FtgwyVrwQLpmft3Hpbr
	9/1pMB4w9b0TQ7MwvnNdlgYHoVUgRwghz7uyNm4/ftF8zKmU9IambB4fBhRWBKZDSPLZY/OxBwfQ0
	JtE37qMEJculKzITMxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCrU-00H0Or-VY; Sat, 22 Jan 2022 09:39:08 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXp-00GrzI-SX
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id h23so10225524pgk.11
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3QnS7kjFfrgTHObfO2/gQR9r9A1MdW1YuvW6hFlmPU=;
 b=OOrn0NajFfioYejG6ULlzdHFsPjRjDyfYd7zw1ryJirM1w1ZAYr6L3IXRn2L7JGr1o
 HJkQpBknQsf89GYlk/gKbk5gsEWH1Vl39Fdu357zOoVxEd1JpHpLA+ycoLftgQionAH1
 8lbvNqtl1RRHj7Z2Xi5f5y6VyFtdf4Ljuy2lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3QnS7kjFfrgTHObfO2/gQR9r9A1MdW1YuvW6hFlmPU=;
 b=M8pm92JSxWupE8mMSwsMFL3IZC24XxVEyKCORub1n6PXsC6LgRjR/lQJ3GnxoaBe3W
 aPuIDHRdSo0ccrD9oHsTweN909QuCGzNeaVewKAtpvCtbN0sJYBiNKyI5i9EHEF+mcL5
 mjxNtMmla3PtqTPHR0Bt7rsivfOyCn7ZegwAEv7njTwOVsUQff4xeBdMs73ZGT7JWr0K
 fGkv9BXdhP7WQl0btskZVRSvNkfKRS11/j3B+ogPxwob9G6536aUhnZkLDLwtDjHw/mr
 qWXsRzfFLiN1wt3cIpqLCMDuv8jd+92R2MIJDOXB2ON/KID4H5X/TWdZtgzPwPdLBhiH
 eALg==
X-Gm-Message-State: AOAM530c77NLFwNXR1XqTa0ZEEQceuamNJg+Fnt3WVNt29z/92klrS+X
 7xiEr3gV9xdsl/HOm3Tl4w/5AA==
X-Google-Smtp-Source: ABdhPJwoZ1uArHfG20JF9aXHV9qAKZo4Nd+NXBHQd93o1IQDmUskgrAp0D7C6MWPy/xOWqDtGvVWWA==
X-Received: by 2002:a63:d314:: with SMTP id b20mr5589874pgg.207.1642843129021; 
 Sat, 22 Jan 2022 01:18:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:48 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 29/31] clk: mediatek: mt8195: Implement error handling in
 probe functions
Date: Sat, 22 Jan 2022 17:17:29 +0800
Message-Id: <20220122091731.283592-30-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011850_019904_67C5B17B 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of the probe functions for the mt8195 clk drivers
to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 13 ++++--
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 11 ++++-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 49 +++++++++++++++-----
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |  4 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |  4 +-
 5 files changed, 63 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 5b1b7dc447eb..af8d80f25f30 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -120,17 +120,24 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	if (r)
 		goto free_apmixed_data;
 
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		goto unregister_plls;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_apmixed_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 free_apmixed_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index db449ff877d7..1fff6f3d2dc7 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -66,13 +66,20 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 	if (r)
 		goto free_apusys_pll_data;
 
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 free_apusys_pll_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 3e2aba9c40bb..3631f49a5e5a 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1239,25 +1239,52 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 		goto free_top_data;
 	}
 
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-			       &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
-				    &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-				    &mt8195_clk_lock, top_clk_data);
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
+					top_clk_data);
 	if (r)
 		goto free_top_data;
 
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed_clks;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_composite_muxes;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_composite_divs;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
 	if (r)
-		goto free_top_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_composite_divs:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_composite_muxes:
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_fixed_clks:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 free_top_data:
 	mtk_free_clk_data(top_clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index f7ff7618c714..af34eb564b1d 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -105,10 +105,12 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo0_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
 free_vdo0_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 03df8eae8838..6b502bbc730c 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -122,10 +122,12 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo1_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
 free_vdo1_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
