Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCFEC49361
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:55:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A54306109E
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A54306109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6lmDoQAisE3HPrnlh684+g3iCvCXPo7PUv/2OqN9OQ=; b=YUvDORWXoc98Mr
	BRlw50eyBK9cbO+qyICb7qPYsLcZRk2mNjfAwo+i6M+0XO27wjIyYc94VF/I7ce0CJ8WArlkIb5j1
	vXEemchMCXvuhiJbNnstI5IdVSCH6XRJk+qsNuxKmdCtzslUUDnrCbpg0uMn4jcIHSph8PXgrlj0Q
	lSjD4ypCJMzH9GttgAsQ0srPHVCvEWpnpcrq4ggRlPa4n1bl0KkKChwIkjETtmufMh7G/KuXNuzw5
	GiN2FNm/BAvklj4JtvmfKXwPeJUEc4lBwIMCXfT8VG1eSZv+tHnIsfrEa14iuZIrfR/EW9qmMQC7W
	nCEtQ5s1LzN9de8Ag2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9LF-00D9yC-MM; Fri, 18 Jun 2021 07:55:05 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9JM-00D8u0-37
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 07:53:10 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i34so1511137pgl.9
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Jun 2021 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WdNBOi2CRzcMwfkWOhSgCoOP3Vokmi/ubivKIIfWV4=;
 b=nPM/mSoLkOb7jxUW1U6aUEsxAvzYTAHcgaqqQUU4apMu2WUeaTHwmeg4gvb3KfKvOx
 oWxliSD/lUeB6I2UERNfWtOlmAhiLMfCyJ2y9crzA6o+scRziwFkuspOstZ28QGOxvfx
 mBYvfmhJ7Q0OAYfXsEehDfd7C+Wrx1MdSGdFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WdNBOi2CRzcMwfkWOhSgCoOP3Vokmi/ubivKIIfWV4=;
 b=sC8QOPkh5r1suHGHxkLpgpZTidQLEb+e+Qd+1CWEe1hjABRkB3p3HzOBjCKm8OxMBZ
 p7PygYtd8a7jERzOl1nb32mPxBT/p7zmZTnFHpPjERu7XZrVG8ry/X/Ux24c6YT2YOTQ
 ZsnbAjWgwULvrAmgAtj9cPyajtj2wqswi7lHGtWr93eCIquXeUoO0YJEThDomZ/2dE1k
 x5V9In4+50j6Vl+pAkE0Eb0rGuiEX4pNVQ13WzV/0HR2rSCBpjY0Gm2W/FHtaTKzwk33
 YKlcsZIQjqWoMHzUob+RNnoe8W0ju7zLm5thz0+H6YEqiqULwUw6Tbnifrymn3u+xvG8
 FT3w==
X-Gm-Message-State: AOAM531tsRNyx3nZBaDrsDghPIXtbkvcrs+V4M/6Jc8Xl7pDKNvEzgYv
 CozJHGQVMZAa4dGCPHwjUQ4qTg==
X-Google-Smtp-Source: ABdhPJz5w3n9T0DDlIwIibuX3J5tf5A0ASPaGhUurb8lFnwAGINIl6YWOcGgOTNdUVkLQWYxq69Zrg==
X-Received: by 2002:a63:494:: with SMTP id 142mr5826039pge.146.1624002787654; 
 Fri, 18 Jun 2021 00:53:07 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
 by smtp.gmail.com with UTF8SMTPSA id r14sm2615450pgu.18.2021.06.18.00.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:53:07 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: yong.wu@mediatek.com, houlong.wei@mediatek.com,
 enric.balletbo@collabora.com, chunkuang.hu@kernel.org, wenst@chromium.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 6/8] media: mtk-mdp: propagate errors better in
 pm_suspend/resume
Date: Fri, 18 Jun 2021 17:52:07 +1000
Message-Id: <20210618175059.v3.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005308_219482_96C7E192 
X-CRM114-Status: GOOD (  18.69  )
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

Up until this change, many errors were logged but ignored when powering
on clocks and calling pm_runtime_get/put() inside mtk_mdp_core. This
change tries to do a better job at propagating errors back to the power
management framework.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 62 ++++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 57 +++++++++++++----
 3 files changed, 99 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 3d9bb7265159..59911ee063c1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -53,39 +53,81 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int err;
+	int status, err;
 
 	err = pm_runtime_get_sync(comp->dev);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
+		return err;
+	}
+
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err) {
+		dev_err(comp->dev, "failed to turn on clock. err=%d", err);
+		status = err;
+		goto err_mtk_mdp_comp_clock_on;
+	}
+
+	return err;
+
+err_mtk_mdp_comp_clock_on:
+	err = pm_runtime_put_sync(comp->dev);
+	if (err)
+		dev_err(comp->dev, "failed to runtime put in cleanup. err=%d", err);
 
-	mtk_mdp_comp_clock_on(comp);
+	return status;
 }
 
-void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
 {
-	int err;
+	int status, err;
 
 	mtk_mdp_comp_clock_off(comp);
 
 	err = pm_runtime_put_sync(comp->dev);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
+		status = err;
+		goto err_pm_runtime_put_sync;
+	}
+
+	return 0;
+
+err_pm_runtime_put_sync:
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err)
+		dev_err(comp->dev, "failed to turn on clock in cleanup. err=%d", err);
+
+	return status;
 }
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int i, err, status;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
-		if (err)
+		if (err) {
+			status = err;
 			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);
+			goto err_clk_prepare_enable;
+		}
+	}
+
+	return 0;
+
+err_clk_prepare_enable:
+	for (--i; i >= 0; i--) {
+		if (IS_ERR(comp->clk[i]))
+			continue;
+		clk_disable_unprepare(comp->clk[i]);
 	}
+
+	return status;
 }
 
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 7ad9b06bb11b..2bd229cc7eae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,10 +21,10 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 48e9a557c446..523e3c2798e1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -49,8 +49,9 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
-static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
+	int err, status;
 	struct mtk_mdp_comp *comp_node;
 
 	/*
@@ -58,18 +59,41 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
 	 * have mtk_mdp_comp_power_on called on it.
 	 */
-	mtk_mdp_comp_clock_on(&mdp->comp_self);
+	err = mtk_mdp_comp_clock_on(&mdp->comp_self);
+	if (err)
+		return err;
+
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_on(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_on;
+		}
+	}
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_power_on(comp_node);
+	return 0;
+
+err_mtk_mdp_comp_power_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power off after error. err=%d", err);
+	}
+	return status;
 }
 
-static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
+	int status, err;
 	struct mtk_mdp_comp *comp_node;
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_power_off(comp_node);
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_off;
+		}
+	}
 
 	/*
 	 * The master / rdma0 component will have pm_runtime_put called
@@ -77,6 +101,17 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 	 * have mtk_mdp_comp_power_off called on it.
 	 */
 	mtk_mdp_comp_clock_off(&mdp->comp_self);
+
+	return 0;
+
+err_mtk_mdp_comp_power_off:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_on(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power on after error. err=%d", err);
+	}
+
+	return status;
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
@@ -317,18 +352,14 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_off(mdp);
-
-	return 0;
+	return mtk_mdp_clock_off(mdp);
 }
 
 static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_on(mdp);
-
-	return 0;
+	return mtk_mdp_clock_on(mdp);
 }
 
 static int __maybe_unused mtk_mdp_suspend(struct device *dev)
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
