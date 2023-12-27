Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC2CC46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh+MDHeylaYTMq4wSIWSzHh+ySX+XFDhtKTfmG0mb0s=; b=tbAl2GBoNetytvXONiBnKun3DO
	ZKbHMdzta6+nqTiA38blGtmoHxwgxex6EN9MbLs3TWRRoSfEq683DDqp3dh1hQLbk/idH2sTGs08C
	JspQl1Pk9gUcu/xNH1B9yH8jcOrtJKVIbJTZwjgZ0diKVpWQIyztKhMjQyy0sU2pQDig1r/ua248/
	nB/1mrZLjD/XJKYFuZIm3wCjdh1Mdhk9Zag4lMcF1dfRVHXdvVWy1BRIsXJFnNht9sAhNjzzBlP8a
	yPOvB8j/ta+cgt9OqvkNWPXvPTQw3lZIe9LaNhDchMJBrPD8AILEpqA5Rvd9babrGJGW3UxQ+K820
	d0PnvCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIPqd-00EGDS-0U;
	Wed, 27 Dec 2023 09:05:07 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIPqa-00EGAI-0y
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Dec 2023 09:05:05 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bb968c02baso2090556b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Dec 2023 01:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703667902; x=1704272702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh+MDHeylaYTMq4wSIWSzHh+ySX+XFDhtKTfmG0mb0s=;
        b=e7Ah8of1CGLJak347o+k116P5cWTQJW/zZv8+lBSSjJPCiFDfoH4MPaxCmfZpJlIUC
         PYFMIk33kiZtNUec0Fu7JU0sLaVO+xNaT1aK3DClF3pI6GANFn1jTuhwrAYOR/sHruzb
         PzB7uBQ3mDxpRswyhwcjd3KHQgY7gK0ydXOuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703667902; x=1704272702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh+MDHeylaYTMq4wSIWSzHh+ySX+XFDhtKTfmG0mb0s=;
        b=aVNZ2IvIgJnmo02dFF8d67KubxfNrxgHQdEj7aNUtW5iTz1fy5z7Ev/IipY9Ziunpc
         sUs0W9S8uY2FZE3znKPlIB4iBMiHSisySxyavw1tujn0XzyDRGuAgOYv7fCH21OIMYv3
         wZqM384wDstrmHwTH8UNwU3P8kqcCSZvyJgi8DH7+7uNUidjduszh0Q1TlyCHogEoC5f
         6uAx4SS45xPZEy1KB26Xo3/66xmFuJ8pnOOXnQYnAD+f7M5wgPmPtYF3RAtW6c45pVwN
         H6bWPIrHZFZ4h+NJrNJJTTmJc4bhwNcfXt9OqR7XoG2urmTwtvEDVjx5McVUxlyipmAh
         rWQw==
X-Gm-Message-State: AOJu0YxsxyoLF5Nu9v1aTShNcZW3OhJZlQ0Ye83GEaUCG1+dULNHyE6k
	R2rG9gdroVHr7mxSlQrrz1QUfh1WvR1pWsD8PPe9ZIAhww==
X-Google-Smtp-Source: AGHT+IEvFbvN8XZ+7Xuic2F6Oo0sX73+MllnmuNUGzdCdDkF8mQnilbwHK5GFTMLGOBSORX4KEJC3w==
X-Received: by 2002:a05:6358:4309:b0:173:24:b26b with SMTP id r9-20020a056358430900b001730024b26bmr4007487rwc.25.1703667902493;
        Wed, 27 Dec 2023 01:05:02 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:18d2:7869:e8b9:f4e4])
        by smtp.gmail.com with ESMTPSA id v22-20020a056a00149600b006d9b65d1a8esm5347701pfu.28.2023.12.27.01.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:05:02 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
Date: Wed, 27 Dec 2023 17:04:42 +0800
Message-ID: <20231227090448.2216295-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_010504_358896_24E091A2 
X-CRM114-Status: GOOD (  11.95  )
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

Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate this
clock needs a runtime PM get during the probing stage.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2e55368dc4d8..c31e535909c8 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
 	}
 
+
+	if (mcd->need_runtime_pm) {
+		devm_pm_runtime_enable(&pdev->dev);
+		r = pm_runtime_resume_and_get(&pdev->dev);
+		if (r)
+			return r;
+	}
+
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
@@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
+
 	return r;
 
 unregister_clks:
@@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 free_base:
 	if (mcd->shared_io && base)
 		iounmap(base);
+
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
 	return r;
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 22096501a60a..c17fe1c2d732 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -237,6 +237,8 @@ struct mtk_clk_desc {
 
 	int (*clk_notifier_func)(struct device *dev, struct clk *clk);
 	unsigned int mfg_clk_idx;
+
+	bool need_runtime_pm;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.43.0.472.g3155946c3a-goog


