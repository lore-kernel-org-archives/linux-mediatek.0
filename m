Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF48AC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QxNvAdBgAMQdvpKI1GM9shXDCJ+gMP7loa4UaiuKm4A=; b=I3v94w13yiXkddA6g/hyXHu3LB
	uYJnjyehmEFAkFY63v6o6ulTyuLF0bWs8Y7Swjh1UGtlKqKKxL7tedWXX2qYekWQkxxgHROLhFk5g
	B3dABN8Cx2L3EU349hKTCb67Fvs0WX00sw5DVg4anKnZBlsiOUUBQNT38zI63GZf/EKnpmGpLep1t
	3mGsUeLouWU4X6/t/mSEWsuti7qpwLqFkeiX5h48gOoAFI2GNrxRakPjX0qvboBBLqAwMuhemjbgg
	4m1wmkZmmBsZk6zsiBeTgKpCZlqGGyILvYg2a6GxH+BpwPItkYPaBw9MOqGHwOC7KCnMRA1vZ17D8
	OjASW5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjBY-0000000GQrf-0w7H;
	Thu, 13 Jun 2024 12:04:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHjBV-0000000GQol-1jJ1
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 12:04:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f8395a530dso9203185ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718280242; x=1718885042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxNvAdBgAMQdvpKI1GM9shXDCJ+gMP7loa4UaiuKm4A=;
        b=II08+zUGja4gDgIinD6lFnuJcf4VAu2pv2LGvFdKW9dEoegdCQZWna2CQWc41d+be+
         wgwFp9docW2AlSpibIPcvSeEl5AdVGJ5EfieRN6lswgc3omOTOlEYetzCZ4GSbMtvqtQ
         Z//RCGlTQI+7h2URCEs1C7I0OducSDjM/5ABo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280242; x=1718885042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxNvAdBgAMQdvpKI1GM9shXDCJ+gMP7loa4UaiuKm4A=;
        b=fZy+8zWuFf/lR3GjUFjD8JqFY1mk8myul3D7vwT2u3OYvRgxuykkqzgHwc/qV1hzNQ
         cwLLQ2FlbuaUvWzRMRva6W93w68ii2tAN8O369jPc7V7fx7+ItmHvboBoggbUbpqo+ON
         0D8MDu4pyhi64zHF2OJSd9WpqRfCyhqHNmhz9AlSehJ9DJXllQtaTsdJB/aZzR8DsbR/
         0riC6LJo/ETtWXVM6fqDi1jDcifJF1UgyiEE6OQ5msBH6XD8+/1mOsUhy3JbO2UzE0XB
         CF0+RyWv/3Aoy9lOkp6PQDCk/vLwp07YypciTqJ3J6CHyYANdpV560HhdBLRgfGoPlP3
         YPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK5CQ2jrmzJNvT0ZBdihbYVS/iA6QrRTKi1VbXEBa2uyUdEyPa1h5894ROKbt9fpdJrtQQieaI1U+tK3/UEWSDL8BFR15Gg8xxvWIAyYgnqJ2i
X-Gm-Message-State: AOJu0YyjVfRMsmHbtHOtbViuP1RPG7dgKrPW1G7zed9VChDCJRlWQ71d
	yy+9jorKhKd4yKiozpRaXtQgmZgDBeTlPeMLgr3jkTclx1jcMNP8buTM55qQRA==
X-Google-Smtp-Source: AGHT+IG7JmmQJ1D22RvlI2mag+I47j5v8zkLdt6T5ia98XKZPueFumCinSH/YrV+4xJ3M0w9ZvXmvQ==
X-Received: by 2002:a17:902:d4cb:b0:1f7:3763:5ffb with SMTP id d9443c01a7336-1f83b74d134mr48485165ad.59.1718280242316;
        Thu, 13 Jun 2024 05:04:02 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:f133:ea93:c14c:93d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f4ad2bsm12163295ad.285.2024.06.13.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:04:01 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
Date: Thu, 13 Jun 2024 20:02:28 +0800
Message-ID: <20240613120357.1043342-1-treapking@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_050405_551598_CBE4041B 
X-CRM114-Status: GOOD (  19.17  )
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

Commit 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers
during probe") enabled runtime PM for all mediatek clock controllers,
but this introduced an issue on the resume path.

If a device resumes earlier than the clock controller and calls
clk_prepare() when runtime PM is enabled on the controller, it will end
up calling clk_pm_runtime_get(). But the subsequent
pm_runtime_resume_and_get() call will fail because the runtime PM is
temporarily disabled during suspend.

To workaround this, introduce a need_runtime_pm flag and only enable it
on mt8183-mfgcfg, which is the driver that observed deadlock previously.
Hopefully mt8183-cfgcfg won't run into the issue at the resume stage
because the GPU should have stopped rendering before the system calls
suspend.

Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  1 +
 drivers/clk/mediatek/clk-mtk.c           | 24 ++++++++++++++----------
 drivers/clk/mediatek/clk-mtk.h           |  2 ++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index c89c3d58fedc..b1e802bbfaef 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index bd37ab4d1a9b..ba1d1c495bc2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -496,14 +496,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 
-	devm_pm_runtime_enable(&pdev->dev);
-	/*
-	 * Do a pm_runtime_resume_and_get() to workaround a possible
-	 * deadlock between clk_register() and the genpd framework.
-	 */
-	r = pm_runtime_resume_and_get(&pdev->dev);
-	if (r)
-		return r;
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
 
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
@@ -585,7 +587,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
-	pm_runtime_put(&pdev->dev);
+	if (mcd->need_runtime_pm)
+		pm_runtime_put(&pdev->dev);
 
 	return r;
 
@@ -618,7 +621,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->shared_io && base)
 		iounmap(base);
 
-	pm_runtime_put(&pdev->dev);
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
2.45.2.505.gda0bf45e8d-goog


