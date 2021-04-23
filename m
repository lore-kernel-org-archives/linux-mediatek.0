Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30775C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:03:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940A061404
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940A061404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxsRAkXmBG9vBwRu9DaOfYX006HVNFgGU0kHvthLxnU=; b=jtHbSqjSUfPL6LrZ0BPgBK9f9
	jFx+9kcwllHtehmakE+L/IXOMmXnhhuzRgfCR6J89cEDWSomHgKlkPLsECmFYwot/8nGAn/QjZOUd
	ud+18Mg872uIHPNhBkV7ZPTp6/+7Zqc372ILiINkIinNNbf/fi89bkTkUg1n1FO083wA0MjeO6ORw
	e4lkcFkXnHA2a7v5PReZ0xXMrpgvPRoUAZbK7Zoo851HRqonz9ZwQ4448P5+3VPtiLg5AuX/h7Tb2
	dHYFloBl1pg8PnyAh8CzHMP4xebslRHJd2jQGfI/YAlnAnD0o/9U3JD3OfiLt4pajHqWDSIGqSYtl
	4Rfe/VFGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZou2-000nNb-GD; Fri, 23 Apr 2021 06:02:58 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZorT-000n7l-Hl
 for linux-mediatek@lists.infradead.org; Fri, 23 Apr 2021 06:00:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id c3so14592406pfo.3
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Apr 2021 23:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClClMMPQd5llgvCW5e48aFgqR6QpKZqnffvVViwFOAk=;
 b=UXdaegl95comyYbgpDWdVughU2GDaTO9EqsItbp29Ru9gz/EtAs0NMPjdiGH6aqzA1
 el3PPqdR/B/lvCW9G3pPfFwxVflEAp6Uc43i0QbG4LS9vC1gBTijiTpfUE89ZOygsSaI
 n6x1dm3+HGmvlWYev3lzpv9KqnkpLqSCCFFjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClClMMPQd5llgvCW5e48aFgqR6QpKZqnffvVViwFOAk=;
 b=jlFdtKnPtfcjPLV3o5F4a07Ctd0xlQ/0Rdh4pyJ75BzNTo3nOgoh7fk8M2Z71x4rC6
 EU2p5hn67x2SAquDkkVrzxOoY18bP5ZYJiuqaANv29LEAZLoERMy7SCPQsmIGnpeHmPR
 EKcXeauLDSVJK3OAmcseibKFCQy5EBaTkueXwtEum3sHIwLmEWaJNvCwKnGi0cLxVn67
 TvMp8QmCDJam9R7U8sY5zUiFiAS0SpYIj6LW4IDFv+rchtddsQRKDNAO63Xdutzv+d4/
 RzH678eO1qzYW/ZcF7ZBcvptKEC381BHGvZFr7475DhG/6nPEDKl9qc1a0kFxoQa8sxd
 deJw==
X-Gm-Message-State: AOAM5317ii3Gkm81G4PZnTzai41B9JHiB+9pGo4YxlQRCfVzLRVFkv/u
 v0UGyTAKv7vWg2ThqIuW37XuXg==
X-Google-Smtp-Source: ABdhPJwxGEgFd/VAicrMilXCvY+Sxm9dITxRAirtC5a8Tz9kl7N6sb4CQtkqLXA/FQF2+h+ydDVw0Q==
X-Received: by 2002:a63:4c4b:: with SMTP id m11mr2227290pgl.245.1619157550902; 
 Thu, 22 Apr 2021 22:59:10 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:308c:235d:f7a2:53a1])
 by smtp.gmail.com with UTF8SMTPSA id i22sm3924003pgj.90.2021.04.22.22.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 22:59:10 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: enric.balletbo@collabora.com, chunkuang.hu@kernel.org,
 yong.wu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/4] media: mtk-mdp: don't pm_run_time_get/put for master
 comp in clock_on
Date: Fri, 23 Apr 2021 15:58:40 +1000
Message-Id: <20210423155824.v1.3.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423055842.2490679-1-eizan@chromium.org>
References: <20210423055842.2490679-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_070023_853284_B1F8CC58 
X-CRM114-Status: GOOD (  23.22  )
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
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 28 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  3 ++
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 23 ++++++++++-----
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 84f9c529d74a..d447bfaadef4 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -53,15 +53,31 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int err;
 
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0)
-		dev_err(comp->dev,
-			"failed to runtime get, err %d.\n",
-			err);
+		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
+
+	mtk_mdp_comp_clock_on(comp);
+}
+
+void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+{
+	int err;
+
+	mtk_mdp_comp_clock_off(comp);
+
+	err = pm_runtime_put_sync(comp->dev);
+	if (err < 0)
+		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
+}
+
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+{
+	int i, err;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
@@ -83,8 +99,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 355e226d74fe..7ad9b06bb11b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,6 +21,9 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
+void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+
 void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index c55bcfe4cbb7..5e71496e2517 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -53,8 +53,15 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
 	struct mtk_mdp_comp *comp_node;
 
+	/*
+	 * The master / rdma0 component will have pm_runtime_get_sync called
+	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_on called on it.
+	 */
+	mtk_mdp_comp_clock_on(&mdp->comp_self);
+
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(comp_node);
+		mtk_mdp_comp_power_on(comp_node);
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
@@ -62,7 +69,14 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
+		mtk_mdp_comp_power_off(comp_node);
+
+	/*
+	 * The master / rdma0 component will have pm_runtime_put called
+	 * on it through mtk_mdp_m2m_stop_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_off called on it.
+	 */
+	mtk_mdp_comp_clock_off(&mdp->comp_self);
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
@@ -101,8 +115,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	int status;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_register_component(mdp, &mdp->comp_self);
-
 	status = component_bind_all(dev, mdp);
 	if (status) {
 		dev_err(dev, "Failed to bind all components: %d\n", status);
@@ -124,8 +136,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
-
 	return status;
 }
 
@@ -136,7 +146,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
 	pm_runtime_disable(dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	component_unbind_all(dev, mdp);
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
 }
 
 static const struct component_master_ops mtk_mdp_com_ops = {
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
