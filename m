Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB652C07E96
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CB56145C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4CB56145C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtiDndp2X/HpQ75UlpMBRC4Cm0UytXOYciiYBtgXUeY=; b=TARkXcOpGLVUF5
	7HoIHJodH64+rPomOi3BeLji/kvkJTxdfVX//BrFxJq6PdM7FkNh9zLIS0ChsZvgWHdzt+3BKjItz
	XG32TNcsUKgSVx8Chfzr0EwCxg1kp4iDEAbHJJxlE/UNOwjlNh7IKbjw0WCC/JacI012oerY6PxLG
	ZtaSQR8z/jLTWrobTsWdOynbbhZwTJI84KT7zFDWng99km4FUwNPlmzaaOubGeNE0jTtOMlpp6vmN
	wAJ0ctiYvcyVv7CHI5jQBgmbIrdnNTxsFMrjy3oAsj+qcHn6rIF6fU7okM4UBs7GGNggtk7OiGn5o
	8x0jMyrOkLmmy7c8+hiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1gCF-000Zih-OL; Fri, 09 Jul 2021 02:24:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1gBE-000Z9N-Hj
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 02:23:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id j199so7356196pfd.7
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 19:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3PbmVcTpze3gwdTv7DQDH8U+vHuO9NjQ57GmGzSR5k=;
 b=fKISDI2CZvoPa9D7Tu7CBPZuMeyZFHBtoW2slWybkcwEHtyDLRM/zxOmr4TDlcvUmf
 3k7RYvR/wl4+9i5yGop34x0oy9pXRzVf5Ahe0huT+oVyCbnDrmTs0vu3s51RHNlkmOPB
 JjztqCAYEz/EqYrxChDldCLYOmJUs271gVdhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3PbmVcTpze3gwdTv7DQDH8U+vHuO9NjQ57GmGzSR5k=;
 b=V1/a2EEMW4WWRvGms5L+ZB4gfJ8q849tJoDHbHIlH95Fk2L8wKFjqEPqeT24gEBYYe
 NL44nIVt6WBNItgqJDmBgvZ9HV7v4nPNUqTXWCWWQtUTKiIgwVrq79EVT71i1U09Jg8B
 bL4gsK1vO9vbj9eK7AkjbNPLPCKRB8eWh3iNxyozaQj5cKB7QaCgbX3sorHlKc+dPAZN
 W4RE5aI7w19DgxzekBSp2ThkAjkG9HSKsS3EhpDsq7MqpfrnH6g4Do7jmf9RqGE+Mi98
 KmTpiu9OUluMsoGWlm0VpO3mY2el7zZmtgueyA3Mh8yI/u+9aKBopsm7w1vvtemBtCyV
 doZg==
X-Gm-Message-State: AOAM531MsFIiYgTjienDFikgnyf9DMksjT0TX39HMNFmmEmHWJqaZGHw
 XGF+dXHkZQZA6oDA8TcUYG4RfQ==
X-Google-Smtp-Source: ABdhPJwYhF3W1z8oL2pREMtTo3eAZTmKvQs3c7w/YVWrPWhPxSeYu7ytQs8I3JtSAqyJlZM7zPjfpA==
X-Received: by 2002:a63:e841:: with SMTP id a1mr35114724pgk.197.1625797431737; 
 Thu, 08 Jul 2021 19:23:51 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
 by smtp.gmail.com with UTF8SMTPSA id c7sm4747596pgq.22.2021.07.08.19.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 19:23:51 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, houlong.wei@mediatek.com,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 2/8] mtk-mdp: use pm_runtime in MDP component driver
Date: Fri,  9 Jul 2021 12:23:18 +1000
Message-Id: <20210709122040.v5.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709022324.1607884-1-eizan@chromium.org>
References: <20210709022324.1607884-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_192352_717971_FF7BE5E6 
X-CRM114-Status: GOOD (  23.38  )
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

Without this change, the MDP components are not fully integrated into
the runtime power management subsystem, and the MDP driver does not
work.

For each of the component device drivers to be able to call
pm_runtime_get/put_sync() a pointer to the component's device struct
had to be added to struct mtk_mdp_comp, set by mtk_mdp_comp_init().

Note that the dev argument to mtk_mdp_comp_clock_on/off() has been
removed. Those functions used to be called from the "master" mdp driver
in mtk_mdp_core.c, but the component's device pointer no longer
corresponds to the mdp master device pointer, which is not the right
device to pass to pm_runtime_put/get_sync() which we had to add to get
the driver to work properly.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 20 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  8 +++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index aec1cb5c4261..8b6158379f41 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -14,6 +14,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <soc/mediatek/smi.h>
+#include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
@@ -52,7 +53,7 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
 	int i, err;
 
@@ -63,18 +64,22 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 				"failed to get larb, err %d.\n", err);
 	}
 
+	err = pm_runtime_get_sync(comp->dev);
+	if (err < 0)
+		dev_err(comp->dev,
+			"failed to runtime get, err %d.\n",
+			err);
+
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
 		if (err)
-			dev_err(dev,
-				"failed to enable clock, err %d. i:%d\n",
-				err, i);
+			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);
 	}
 }
 
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -86,6 +91,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 
 	if (comp->larb_dev)
 		mtk_smi_larb_put(comp->larb_dev);
+
+	pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
@@ -95,6 +102,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 
 	mtk_mdp_register_component(mdp, comp);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
@@ -105,6 +113,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 
+	pm_runtime_disable(dev);
 	mtk_mdp_unregister_component(mdp, comp);
 }
 
@@ -124,6 +133,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&comp->node);
+	comp->dev = dev;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index b5a18fe567aa..5e2ee94a1b37 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -12,17 +12,19 @@
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
  * @larb_dev:	SMI device required for component
+ * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
-	struct device		*larb_dev;
+	struct device           *larb_dev;
+	struct device		*dev;
 };
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index aca236dbd348..78c40a61df1d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -52,20 +52,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
 static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(dev, comp_node);
+		mtk_mdp_comp_clock_on(comp_node);
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(dev, comp_node);
+		mtk_mdp_comp_clock_off(comp_node);
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
