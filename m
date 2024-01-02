Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1651AC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ewhpw6ZAnNzCIn1VG/yRZaJv/xa5pFyIuSfBXvMExEo=; b=eTdKbSvvTn4CieLME+cZVhxp6V
	VbfvOWzzleuV30dzdJrho9ZX02IeOylT+AgZPHkOGIkTJoSnqfE4KZ1oOI/Ktl/W7v0zhASpOOlRD
	ihdd6OZY7R+8ygB6mlTal3WhnmsqsHtTQmh8qMRo9HCt1Hbf0ita81lSVaGYCPSvBjsxHlprGVm19
	Miy2RdNvJ1Ts7pcB2egBnQtWd9KkGjuTIULgxCikwZgtPjtVX3FLKQmYpKEeJRsPPUHzC7q2F+VWC
	uf/O0t4rgU2C3GExxKSNRWH4e0Y7S91fIX/eWUlVLusD07v0N2wd0cT9g+FYDR+gqk4rNgRkHTpeX
	f+tRG5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZul-007JhR-06;
	Tue, 02 Jan 2024 08:14:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZuh-007Jf0-35
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 08:14:17 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28c7c422ad9so4097924a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jan 2024 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704183252; x=1704788052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewhpw6ZAnNzCIn1VG/yRZaJv/xa5pFyIuSfBXvMExEo=;
        b=QDHmm4O9M/0yzH+hB20g0pIgiUk6gOwmvHYGZyJgHJa1wQyqVL72T7TFeilJmBQABU
         I3OjjL6MbI1mvS0oWFW82WFiawopxR/7J3l+SCtPhTYyA8zApcT4vYPXMLSiyMSNmiwb
         5056F4VnrboY7Gg7UIHuomf+i5q358dvajJ1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704183252; x=1704788052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ewhpw6ZAnNzCIn1VG/yRZaJv/xa5pFyIuSfBXvMExEo=;
        b=XqpEe/bIMpf8DyteuaBEcz2BYpBWVkRuNRXan5v5WrJO+xV2SlqM0+fEu8ALa7xoXI
         gj2D0h5JLYrLND1w4TAk11qQ5bqvf2AkaUokuz5vaTw0iLgemdo/hiJn7fdGfdfFbGUg
         euQ+N7Uhj5PPWNV3+viLwDgwl7F4g1h+lbgUTEspxc9oX2kH1fWzjY/kbc0B+qowrswt
         SSCAV3k1E0ZIdU6cWdUvcTsRqSRFD+58goF6LHLUeOql0yykeV0ykefOuEeMRI7wcNLq
         XAjV+PixxyRv+AL2ptU9mLwEVa8llqTCFAyxzpxxm8SR0/XsbIxExIq4kRnH2F/bQP6m
         T62A==
X-Gm-Message-State: AOJu0YwSdf8kOTeVYLB7tMUzmbwWBCWwouLIZ5nZYTNvpGyo22e1cCP2
	ILDFZH8x96rPauCMVZS0SJpihDLo1PKd
X-Google-Smtp-Source: AGHT+IEZy7xdt3Zuu7m2G7MMoLHQEboW6KOxEkZD0l5bHyMFOempt/8HuzkEt7JOM2A6v2c4UhVBmQ==
X-Received: by 2002:a17:90a:7023:b0:28b:96ba:806a with SMTP id f32-20020a17090a702300b0028b96ba806amr7610238pjk.88.1704183252177;
        Tue, 02 Jan 2024 00:14:12 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:232c:f04:85bb:a34c])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a638300b0028c8149ac6esm12640074pjj.42.2024.01.02.00.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:14:11 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
Date: Tue,  2 Jan 2024 16:12:52 +0800
Message-ID: <20240102081402.1226795-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_001416_016105_CE7BED36 
X-CRM114-Status: GOOD (  15.60  )
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
this clock needs a runtime PM get on the clock controller during the
probing stage.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- Fix the order of error handling
- Update the commit message and add a comment before the runtime PM call

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


