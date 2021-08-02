Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A16FC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C07E60FC2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 12:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C07E60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gopVemWkjviC0F7On/BnbrAa31JESuc/cDKmkH1yvYQ=; b=GUjkS2HnAhaJyd
	Nu8uKl3T7dmhxEBHfR893JvgsLmcNDQwfMJljoGHCwJjGpNBsdVwfYCEAYGwIG03WmDm8fQpZKBnV
	0Blmm08++QPwyTWIxstYqHWFCRgR7TfI0OQNqL4pEwzVdSn+wUT6ixOq4mK/QIa2l4qVcpj02cgM6
	gPF5LBXnu97Q6gMxAQKrj8P72u2PtRHgNb077mVn1hwqvLZ1RKx15e6I2/+xDM18NRbAPwmNnx6K7
	XIq7Mxv2uf6YL+9e8fzP7j5W4BXdzARc8y1piXiiXn0Z3CN4OGIGRzAu3bw4TNkw0+HIcR2HP8gYV
	haJW9RxrvB3tV5Wl2Cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAWoL-00G7mZ-4I; Mon, 02 Aug 2021 12:12:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAWoA-00G7g1-0d
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 12:12:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d1so19403111pll.1
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZviZKKS5zt5VRJZud/1hXXwMNiDi17ry2eyhIG3EEHA=;
 b=eLK7SeiVe0xtM1i3VwFTzL+lvc07HgEwOf/UxdpuKGWXrPufUHub2C+iAvFg3iAAaj
 e48gy8OAJo/pPUK6JNmRbtBYLqUq+3FvM7sNw4jmDslD8Wt0n/3HVANJTy8Zgzt3mmKH
 SuHWI4FX6sgetm8GJSOkmvYZWpjGJdcpK/TD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZviZKKS5zt5VRJZud/1hXXwMNiDi17ry2eyhIG3EEHA=;
 b=NpvQbStoUew3lrGvnSNhzxMAk6KA7PnJqilC7yeF8RwJ1/NtgalRPqn0wykIs6DOKW
 kpVjYbABDxbxklUwZG+tkb8VqgoaNPydV7ikscCjtw6DtgJk9gzuUvGXHjj6sLAm2P7I
 lwnHncs/TEXg5DlMyDUdIECx4yrNMoxQI5ULU5CQXSGIFAq9eCS+oupzYqUJM0WzyMBw
 6i6kgUykeMpwUiMyn0P5mk/a+BJJxyjllPIBRD+X9Jqtz8v4VixPpxuHt/5K/mLurtUU
 LMiI1bf8M1NKi3H6PRJ6c8M4FxGZlHH6XieKfCL0oXA0FWC+gPAa0Q0w7kR3j3ZdwGVL
 Icig==
X-Gm-Message-State: AOAM532sBjahULyypLH3D3Xx7ZmNvsAPsmeMNtZxr8rvPqW1T0eiLqg8
 /ykNizIPiOG3EtGgRFfLC1/ETw==
X-Google-Smtp-Source: ABdhPJzufei59mRMqQWISJty4OzpCb27BEq+4Hyc8ne/YBqVK51kUqGp4k9uK7LYhl4yBPjLoUVu5w==
X-Received: by 2002:a65:6243:: with SMTP id q3mr681044pgv.297.1627906355381;
 Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
 by smtp.gmail.com with UTF8SMTPSA id j5sm7603827pjv.56.2021.08.02.05.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
Date: Mon,  2 Aug 2021 22:12:07 +1000
Message-Id: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_051238_083146_46550EF9 
X-CRM114-Status: GOOD (  17.53  )
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
on clocks inside mtk_mdp_core. This change tries to do a better job at
propagating errors back to the power management framework.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 25 ++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 27 ++++++++++++++-----
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index b3426a551bea..76e295c8d9bc 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,10 +13,9 @@
 
 #include "mtk_mdp_comp.h"
 
-
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int i, err, status;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
@@ -30,11 +29,23 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
-		if (err)
-			dev_err(dev,
-			"failed to enable clock, err %d. type:%d i:%d\n",
-				err, comp->type, i);
+		if (err) {
+			status = err;
+			dev_err(dev, "failed to enable clock, err %d. i:%d\n", err, i);
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
 
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 7897766c96bb..92ab5249bcad 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -41,7 +41,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_mdp_comp *comp,
 		      enum mtk_mdp_comp_type comp_type);
 void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
 
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..412bbec0f735 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -52,13 +52,28 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
-static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
+	int status;
+	struct device *dev = &mdp->pdev->dev;
+	int err;
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(dev, comp_node);
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_clock_on(dev, comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_clock_on;
+		}
+	}
+
+	return 0;
+
+err_mtk_mdp_comp_clock_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
+		mtk_mdp_comp_clock_off(dev, comp_node);
+
+	return status;
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
@@ -274,9 +289,7 @@ static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_on(mdp);
-
-	return 0;
+	return mtk_mdp_clock_on(mdp);
 }
 
 static int __maybe_unused mtk_mdp_suspend(struct device *dev)
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
