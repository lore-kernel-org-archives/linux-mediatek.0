Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781B0C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476E8613A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 476E8613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnihZ9zgiiWOBzV4XcJG4uJs4Wf6s61NtdlAmfAVi8Y=; b=QxcOYL9HN0dWMv
	SnGwtpEb3vGmlzrA+MRXYRRnwHmM+lPR+pJbZiXLTa2MCMnp0XOBsgdpllEut2VkcSq1QmaS4Wgjw
	/OQB/ii02ZdhEtbxXlSc/tVvR8d+DekTIImGaGuNKHNEYfNEUJDIfCerLe62TP9cvNtT7CDgGz9hT
	3gStjaI2at11bVtIFtGIW+0Kg/sUkERpv09NnM0t/+X/0KhafokOPwN70Mt2/a4aqY6SG7Lspjzl0
	obGVYgrBWE4YYt2UJ/e81vjz4iuCD2orl3xtvlXS3H71kTRwXZmfPKAR2FXYLwcinrbtWGQA31GXk
	qM/ICEZtoERJcJ6zfFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mImV5-005g20-Ns; Wed, 25 Aug 2021 06:35:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mImUM-005feP-NT
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 06:34:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id fs6so2405846pjb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wU84M23F8XbuzFZjl6FoNSg9wYVt/dBsUxZeJ8oFat8=;
 b=bYEDw0RxGgcZlrM13Ceata/7fdhbDHYjyV8zsCp4r4mM08ie0cMqU9hi456Dhol3U6
 DuQqEoWjxBeDfYQldWNp/cGAH4pW/vfvjisacm1pN/WCiGgIwOMDAltbpssL83NAD1ci
 7EEefWctmRBDeBYTdR1n9qekhpmDgyv723KaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wU84M23F8XbuzFZjl6FoNSg9wYVt/dBsUxZeJ8oFat8=;
 b=Vedm6RVN9OnznF2LcXcuEHxJHZvWvW85CY3nwT21XGNnAiRxkB9AZFAGPPXd4ZVaw7
 mtNBbq+YoSbrWEDRTgDyTCO0wMagemQ4Nu0uMO/51uTUKXRZfCBr4v55E2FE+prCl6t8
 xnj0Li5YukWR4yt36n97oTysnvg/vbQ2LqxDdAFR/BNyZ5zFP240lpXX1rkTZAn1nWF/
 K06nGNzLwid6wt2URJOHSKW34AhDooXwQw6B54l4xiiijVj9QAoy7pMCtJS2seNJxPnM
 I2KkOZwWurZshGuEeWyp4HIt99/ADAFXxcqb4AG8bH6Bb2vapOCM8SkwHGxRJxvca+3H
 o2pw==
X-Gm-Message-State: AOAM533cHoqb7ZiXga6ofbNQra7ttX4X6wXSVTIuV0NVZyyocgp8Wi3e
 d8GNA58rxMkGzPtdS0pEVOY/Mg==
X-Google-Smtp-Source: ABdhPJyQtmmIsrwa9pHU6jG08kEdbztCytln3wA+zf/Te2Uc+eDHVuhe7jDW/F194QiNRnTLYYu+gA==
X-Received: by 2002:a17:90a:c88:: with SMTP id
 v8mr8905665pja.197.1629873257982; 
 Tue, 24 Aug 2021 23:34:17 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
 by smtp.gmail.com with UTF8SMTPSA id r14sm21068943pff.106.2021.08.24.23.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 23:34:17 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, yong.wu@mediatek.com, wenst@chromium.org,
 ck.hu@mediatek.com, houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yongqiang.niu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v7 4/7] media: mtk-mdp: don't pm_run_time_get/put for master
 comp in clock_on
Date: Wed, 25 Aug 2021 16:33:20 +1000
Message-Id: <20210825163247.v7.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_233418_845662_550B004F 
X-CRM114-Status: GOOD (  26.17  )
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

The original intent of commit 86698b9505bbc ("media: mtk-mdp: convert
mtk_mdp_dev.comp array to list") was to create a list to track all the
MDP components that needed to have their clocks enabled/disabled when
calling mtk_mdp_comp_clock_on/off. However, there was a bug inside
mtk_mdp_register_component where the args to a call to list_add were
swapped. The result is that only one component was added to
mtk_mdp_dev.comp_list because comp_list was instead being
repeatedly added to the single element lists headed by each
mtk_mdp_comp.

The order of the args to list_add in mtk_mdp_register_component was
fixed in https://patchwork.kernel.org/patch/11742895/ (Fix Null pointer
dereference when calling list_add).

Then, as a result of https://patchwork.kernel.org/patch/11530769/
(mtk-mdp: use pm_runtime in MDP component driver) if all the components
are added to the component list, the mdp "master" / rdma0 component
ends up having pm_runtime_get_sync() called on it twice recursively:

    rpm_resume+0x694/0x8f8
    __pm_runtime_resume+0x7c/0xa0 ***NOTE***
    mtk_mdp_comp_clock_on+0x48/0x104 [mtk_mdp]
    mtk_mdp_pm_resume+0x2c/0x44 [mtk_mdp]
    pm_generic_runtime_resume+0x34/0x48
    __genpd_runtime_resume+0x6c/0x80
    genpd_runtime_resume+0x104/0x1ac
    __rpm_callback+0x120/0x238
    rpm_callback+0x34/0x8c
    rpm_resume+0x7a0/0x8f8
    __pm_runtime_resume+0x7c/0xa0 ***NOTE***
    mtk_mdp_m2m_start_streaming+0x2c/0x3c [mtk_mdp]

(The calls to pm_runtime_get_sync are inlined and correspond to the
calls to __pm_runtime_resume). It is not correct to have
pm_runtime_get_sync called recursively and the second call will block
indefinitely.

As a result of all that, this change factors mtk_mdp_comp_clock_on/off
into mtk_mdp_comp_power_on/off and moves the calls to
pm_runtime_get/put into the power_on/off functions.

This change then special-cases the master/rdma0 MDP component and does
these things:
- the master/rdma0 component is not added to mtk_mdp_dev.comp_list
- the master/rdma0 component has its clocks (*but not power*) toggled
  by mtk_mpd_comp_clock_on/off inside mtk_mdp_clock_on/off.
- the other components have their clocks *and* power toggled with
  mtk_mdp_comp_power_on/off.

This change introduces the assumption that mtk_mdp_pm_resume will
always be called though a callback from pm_runtime_get_sync made on the
master / rdma0 component.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 57 ++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  5 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++++++++++-----
 3 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 472c261b01e8..7b6c8a3f3455 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -51,9 +51,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int i, err, status;
+	int status, err;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
@@ -63,12 +63,54 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0) {
-		dev_err(comp->dev,
-			"failed to runtime get, err %d.\n",
-			err);
+		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
 		return err;
 	}
 
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err) {
+		dev_err(comp->dev, "failed to turn on clock. err=%d", err);
+		status = err;
+		goto err_mtk_mdp_comp_clock_on;
+	}
+
+	return 0;
+
+err_mtk_mdp_comp_clock_on:
+	err = pm_runtime_put_sync(comp->dev);
+	if (err)
+		dev_err(comp->dev, "failed to runtime put in cleanup. err=%d", err);
+
+	return status;
+}
+
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+{
+	int status, err;
+
+	mtk_mdp_comp_clock_off(comp);
+
+	err = pm_runtime_put_sync(comp->dev);
+	if (err < 0) {
+		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
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
+}
+
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+{
+	int i, err, status;
+
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
@@ -94,7 +136,8 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 	return status;
 }
 
-int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
+
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -106,8 +149,6 @@ int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 
 	if (comp->larb_dev)
 		mtk_smi_larb_put(comp->larb_dev);
-
-	return pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index f2e22e7e7c45..e3d6aef52869 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -23,8 +23,11 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+
 int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
-int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 714154450981..a72a9ba41ea6 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -57,29 +57,64 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 	struct device *dev = &mdp->pdev->dev;
 	int err;
 
+	/*
+	 * The master / rdma0 component will have pm_runtime_get_sync called
+	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_on called on it.
+	 */
+	err = mtk_mdp_comp_clock_on(&mdp->comp_self);
+	if (err)
+		return err;
+
 	list_for_each_entry(comp_node, &mdp->comp_list, node) {
-		err = mtk_mdp_comp_clock_on(comp_node);
+		err = mtk_mdp_comp_power_on(comp_node);
 		if (err) {
 			status = err;
-			goto err_mtk_mdp_comp_clock_on;
+			goto err_mtk_mdp_comp_power_on;
 		}
 	}
 
 	return 0;
 
-err_mtk_mdp_comp_clock_on:
-	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
-
+err_mtk_mdp_comp_power_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power off after error. err=%d", err);
+	}
 	return status;
 }
 
-static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
 	struct mtk_mdp_comp *comp_node;
+	int status, err;
+
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_off;
+		}
+	}
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
+	/*
+	 * The master / rdma0 component will have pm_runtime_put called
+	 * on it through mtk_mdp_m2m_stop_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_off called on it.
+	 */
+	mtk_mdp_comp_clock_off(&mdp->comp_self);
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
@@ -118,8 +153,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	int status;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_register_component(mdp, &mdp->comp_self);
-
 	status = component_bind_all(dev, mdp);
 	if (status) {
 		dev_err(dev, "Failed to bind all components: %d\n", status);
@@ -140,8 +173,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
-
 	return status;
 }
 
@@ -152,7 +183,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
 	pm_runtime_disable(dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	component_unbind_all(dev, mdp);
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
 }
 
 static const struct component_master_ops mtk_mdp_com_ops = {
@@ -337,9 +367,7 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_off(mdp);
-
-	return 0;
+	return mtk_mdp_clock_off(mdp);
 }
 
 static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
-- 
2.33.0.rc2.250.ged5fa647cd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
