Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HuFjPtosHNnYwGAIu1d+fgFffb5m0z+fODcbMrKtqw=; b=liqC/9A37tId82
	wqZgr/psCshyjY/vw7Anel3/mYX+y5wkd0X/QCAgDER+i21NyjiNwJ0kpvEz7d8RHq22YLl9Zxezo
	64Qm4MIQ8kE2QE04w9/6MjsliShLDbwSx/7tjoH/22UzP65id74SgYET8ujr4TEOTvHJLf7HzKyRy
	dn53QJTkrP4F3dvOiw0RVqL/xLyW1lk+Au1wlajhnZIGDqtze+bwujyBOuDwG6mqatNo0dKDy4LCk
	ibu4aGEhiQApDMUVZPt3t+VovPlZ4VzsH/8WeagVGTGZLSFlV/bVGVIT6BZg4xS/ptRIjtzAcuIYP
	WCw/Xry8aLgtK3hixNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPyM-00DscS-3m; Tue, 08 Feb 2022 12:51:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoJ-00DnZT-FQ
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id e28so18650524pfj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eHwaFCxTmQBqke38QY+U5TZZstQq9O/KJJL77r3W7Ws=;
 b=nvJ9cLw2nqPy00A1rg0QyEIyTWd8T9dpFDluSxKOq9Tn01B1Y1MbhjQSTCkrI27lra
 TPGEARXZUBxH7ykfmmOa39dR6Oy6acq0JeHZz8WIgow8M1VrhGsVwV07krTMrsDqoSNI
 XG0NVawmgtjcczlzwoL1Zq8zDR39B0P7nUe1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHwaFCxTmQBqke38QY+U5TZZstQq9O/KJJL77r3W7Ws=;
 b=XZ4m/HFox7osCTwovzJ5dL5xGXct86Wu36+FKj2gaoyavoR7/Rzl/IGpBehV0XJdoi
 PI/iPLLOEoElcMfaR4UW/jpR/vRF6AFxsPS/09kiUN7aPUuUUB/kEDFrk8TueMIWEkDs
 /gBGlMDYMRbs5zIFWEOOCgJricwM5duH/Z7vv0mOT59/4cDIRCWefIW7e/aa53dEt6ge
 sUZGRpuWgK4JMY1wV3QnNinKGeOWUgh7bUaREfbEIIv96LrwDVSbYJEp8W2bZc1zavb6
 cV/BSTlnJpxOPITcVpQL1DyfbQypeSBTHZRIEVMDISZZYbfKws9DA/Iga3O3Iw2enI1W
 r2Yw==
X-Gm-Message-State: AOAM532YGH2tUxIvpKgquR7vcnKaCQyuU6aucaznE+NRU2JNMnNQSo1I
 whWyQvZMlmDsm0bF9Yg5zpTmYg==
X-Google-Smtp-Source: ABdhPJyYdWVRlyhjrE40StYyFinJI1sYaLoiAb4EohqiUabCdb/YfzS2WfyZVC3UGTCq7xluaPc2Xw==
X-Received: by 2002:a63:8142:: with SMTP id t63mr3362355pgd.256.1644324090238; 
 Tue, 08 Feb 2022 04:41:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Date: Tue,  8 Feb 2022 20:40:22 +0800
Message-Id: <20220208124034.414635-20-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044131_594634_0A6592A8 
X-CRM114-Status: GOOD (  12.30  )
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

In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
simplify clock providers"), a generic probe function was added to
simplify clk drivers that only needed to support clk gates. However due
to the lack of unregister APIs, a corresponding remove function was not
added.

Now that the unregister APIs have been implemented, add aforementioned
remove function to make it complete.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 869e6ae55c82..f108786caeda 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -374,6 +374,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (r)
 		goto free_data;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 free_data:
@@ -381,4 +383,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	return r;
 }
 
+int mtk_clk_simple_remove(struct platform_device *pdev)
+{
+	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 3c3a934f53cd..4fa658f5d934 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -202,5 +202,6 @@ struct mtk_clk_desc {
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
+int mtk_clk_simple_remove(struct platform_device *pdev);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
