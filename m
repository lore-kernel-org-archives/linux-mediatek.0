Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7714FC47077
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xNB8eseBc6is+G1DowRroY47UdkWdAr6xj971vFYoJE=; b=pz1uRXP/lzE8SWQXr2gKlmdkQy
	KAiX5DOA3hJFns4ZcTDO2lKVBuY57zef9wEK08SUB9p1v15rsWmmXGK9dRNmiIFT9gCz5W+PfHcVv
	ssvUqDsA+DROQIm1URDCu8VgINTCoL+nZ/FpsKRk15FC6ZqMHH9A0TnQjgaBpax9RwXMT/BaQToHF
	gmv1yGm5+lQDkJ83bAbBCUNPFtHNvJlVv61H9Fww53T395Mm1uq2s8Tde1xQirixDkcskuU28JikR
	0SRqBwnpfmekCE0zjrRznyXOM5VjLOdzpiP8b9fj9+ffFHQ7NQyeZ5HFe5HLOLDPkZ0pp+0iq2nc6
	PlILMZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkqN-004H0B-1j;
	Mon, 08 Jan 2024 08:18:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkqJ-004GxT-38
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jan 2024 08:18:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d41bb4da91so2731675ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jan 2024 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704701920; x=1705306720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNB8eseBc6is+G1DowRroY47UdkWdAr6xj971vFYoJE=;
        b=bAfmx+qdZVCqkeJPsE+hKYB/skWrZoe/VtFGEfQfwz/azmsg0Fc7GX49k/erxo4oti
         x6n63l31VkiOIEoJy6HcpeIFIlIQQPhuRApzmesfdF0yH60yxa89E7ZfZviK7jOkIOUh
         /xYu3k6AsJbxZ2BCl9LEc9dp5btK1wBCXOnuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704701920; x=1705306720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNB8eseBc6is+G1DowRroY47UdkWdAr6xj971vFYoJE=;
        b=Y00Y8FhpzInYalnlH4FzfDddjaTutVOwOArUidbZzejeoayruzOJqdw6xE9naL3QAC
         Go9OPi2rtZJ4rRYyU8G/4IIcNiJJ7dZF3bWPTDDJozMzpQgO1uhEmIRpubh5UDhLBKfS
         xLzJDVAkmn1I2zXuGGUGDxA1MRHH13F/qlFMb9+c/q3arbSUymAWEP2pEQMR+IwZ+wXT
         mnhcZ1yZfTwaVGcu0JA/yw/9pa3HRa7nrVhW++27PPyUBsaItdy3Jcu5A7ETZzGAvyUQ
         FTpiJZ2LJwuO9ASBVJTEPq/WqZ8lb5Hl8dj4flqCDNJlBYZLCyRZlGBzqdmd/oTNBdxu
         ryZg==
X-Gm-Message-State: AOJu0YyOOC7T8MEjUfATRTDIBSLwXWm/5Par2RIcf7Y7uJ1uHrW0XEi7
	SxLhwIClBYEO8m2lNn0pDDUeVfh0pU33
X-Google-Smtp-Source: AGHT+IE0thN83ywdJrPNf/EGvsxE+uqGedDoJv4f+6m5lRBkmlTLbuqE5qHl18jLTcqMCayCTdhYxQ==
X-Received: by 2002:a17:902:8a88:b0:1d4:be64:263f with SMTP id p8-20020a1709028a8800b001d4be64263fmr1076115plo.120.1704701920600;
        Mon, 08 Jan 2024 00:18:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:6859:f8da:3370:7a74])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001d078445059sm5672513plb.143.2024.01.08.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:18:40 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
Date: Mon,  8 Jan 2024 16:18:15 +0800
Message-ID: <20240108081834.408403-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_001844_006989_31F5C160 
X-CRM114-Status: GOOD (  15.88  )
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

Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
this clock controller needs runtime PM for its operations.
Also do a runtime PM get on the clock controller during the
probing stage to workaround a possible deadlock.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- Update the commit message and the comments before runtime PM call

Changes in v2:
- Fix the order of error handling
- Update the commit message and add a comment before the runtime PM call

 drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2e55368dc4d8..ba1d1c495bc2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
 	}
 
+
+	if (mcd->need_runtime_pm) {
+		devm_pm_runtime_enable(&pdev->dev);
+		/*
+		 * Do a pm_runtime_resume_and_get() to workaround a possible
+		 * deadlock between clk_register() and the genpd framework.
+		 */
+		r = pm_runtime_resume_and_get(&pdev->dev);
+		if (r)
+			return r;
+	}
+
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
@@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
+
 	return r;
 
 unregister_clks:
@@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
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


