Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FE0C4724C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972A92073A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 08:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAb/GOCe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PgHEbJzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972A92073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc82qMxMIU1THESOTE5w+XDYVsvb9ulco8wcnxuQM9E=; b=BAb/GOCeRQRZSr
	M3JPdIAivATcvi2e9YEtDrYDai/vZNhdb8XVSHYFgvISWBi4tuVYaZtVNYtB2v5FRSb+ZhgMZyqXN
	nfok1SdBn11PFvj9unrWJE7m6DUdFxwBYQqer9KERwhJWhEtdcWCngCVFTBX6lRdi24v1u3FYH3Em
	/+DZFIVOwWfWhy+1yCdPjDGfWIp9/kM3neabNAjUj+HFXNyOl/7Wq1q/TPeNiZOajv/U9yvpC6JMO
	B40oKP15ohwXHsgcOFrWOUB9N2cdlxcKosS1MbTZ1mFGvk+FD8V7d2cgp4PiFMafFJVcya9Ka12aF
	v8Sq4DL7nVBBIetnoVkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFd3-00045h-0N; Wed, 06 May 2020 08:42:09 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFcQ-0003R4-V5
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 08:41:32 +0000
Received: by mail-pj1-x1044.google.com with SMTP id e6so510103pjt.4
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9oU+2xjh6A5rfwnEHfgImGeehUIEI1anqo7jHx1yxlM=;
 b=PgHEbJzZnqIODMC59fiZfIp7HHPEvd+jYOcTpax+wc5wBLewywHGLrlGe85NSxZLLV
 zQVYLShifq82eHjHbEJsNur10gdvoZUOUgILT1rCLY4MNAANOip2RdNe0Op47bhtH7Z1
 C6YqgmNYjHdh7pskfIup83Qm41rH2+J1fMpag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9oU+2xjh6A5rfwnEHfgImGeehUIEI1anqo7jHx1yxlM=;
 b=SDz62uS+yGG7JIjhkdyJBBy0ee5sG91IC6SL/jq9Ym9vnB5x/REThHBBAbDhcpI1f7
 6TxcuUie7xuK6uyIdhkF4jRuNwYGMfqDiHlwJ9wibWM4L1ib8v6czv2JYo1GBF1s6kJ9
 gOAu21kprUq6vKmx72L0U/9LXE3NdvzJF+s/mr4NO9t6lSo7ZwUI3tQf0gt7KmQzkRex
 RTB5LiKZ2AV65OBu+5tQKp442Pank0z/GaQY6Ei0nmzpgkBQVMnfRGjz0Q0xkCmzRK/6
 NAVgYwDZDXBVaPIJvJolQVteGVT6pEGX/55qyMy+ft5r0KjNeUAeKRPSEWy+tRgXY5z3
 5wjA==
X-Gm-Message-State: AGi0PuYCuCAQg9YHcwOWf05Bjz91ggKduS4CSoAK1n4M2Urzcsnlt3GS
 lITCLuM+2Lx6ToAU24iVMukyKQ==
X-Google-Smtp-Source: APiQypIyK6tkxRLNQCh0M3pL3mSBYDWHoAe/oDkleeplbXW9ygqR/QRSVTYPc0qIo5kngPJGmWsfow==
X-Received: by 2002:a17:902:8ec1:: with SMTP id
 x1mr6743715plo.325.1588754488855; 
 Wed, 06 May 2020 01:41:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id o63sm4297749pjb.40.2020.05.06.01.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 01:41:28 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] [media] mtk-mdp: use pm_runtime in MDP component driver
Date: Wed,  6 May 2020 18:40:39 +1000
Message-Id: <20200506184018.v2.2.I87cf35a058328c780bd3b8b2191209a5011b7016@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200506084039.249977-1-eizan@chromium.org>
References: <20200506084039.249977-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_014131_055325_2624FEFD 
X-CRM114-Status: GOOD (  16.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Changes in v2:
- remove empty mtk_mdp_comp_init
- update documentation for enum mtk_mdp_comp_type
- remove comma after last element of mtk_mdp_comp_driver_dt_match

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 22 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +++--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++---
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 5b4d482df778..228c58f92c8c 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -15,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <soc/mediatek/smi.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
@@ -53,7 +54,7 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
 	int i, err;
 
@@ -62,25 +63,31 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		if (err) {
 			enum mtk_mdp_comp_type comp_type =
 				(enum mtk_mdp_comp_type)
-				of_device_get_match_data(dev);
-			dev_err(dev,
+				of_device_get_match_data(comp->dev);
+			dev_err(comp->dev,
 				"failed to get larb, err %d. type:%d\n",
 				err, comp_type);
 		}
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
+			dev_err(comp->dev,
 				"failed to enable clock, err %d. i:%d\n",
 				err, i);
 	}
 }
 
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -92,6 +99,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 
 	if (comp->larb_dev)
 		mtk_smi_larb_put(comp->larb_dev);
+
+	pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
@@ -101,6 +110,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 
 	mtk_mdp_register_component(mdp, comp);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
@@ -111,6 +121,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 
+	pm_runtime_disable(dev);
 	mtk_mdp_unregister_component(mdp, comp);
 }
 
@@ -129,6 +140,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&comp->node);
+	comp->dev = dev;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index b5a18fe567aa..de158d3712f6 100644
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
 	struct device		*larb_dev;
+	struct device		*dev;
 };
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 539a7942e3cb..133d107aa4e6 100644
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
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
