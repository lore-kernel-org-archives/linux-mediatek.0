Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B47C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9B361245
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 06:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB9B361245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYEGV2DaGO71DSVLs7adMZ9wPjv/cT36hJiKcw0NN9s=; b=liwOLoNyIHVNva
	MHfw+FYnCWalWmeeIv//C9tUzzb1rlynzgcOxFLG+xlyCWeSx7O23KTiRtLek0b/xomhBlI1WQqdl
	O+eJpFe16vflKUd+gvTDQA7m7s9EospuamPnBW0e8HjVIhpwao1AJIsag4UHBc8l/mzCsvd0be3Kx
	WvfgcnrkuuY7saQDSI66gGbgdbDVHZWHgfzbFzIopmu63jvyqBv73kJ5jr+t4+3BhgvQj5Nt71s6X
	BWBvA+nUkIzcg+Hq16FpbDoCrm7mPxDs8htvKN5GbIarTflJm/jeECKp20G1Upzv8P5Bns/lEdf3j
	8S9lf7fo/XAh3ggG9vCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mImUD-005fa2-1W; Wed, 25 Aug 2021 06:34:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mImU1-005fTL-FF
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 06:33:59 +0000
Received: by mail-pl1-x633.google.com with SMTP id a5so13727537plh.5
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 23:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=19laOyRbxi7dNQIHLVJQGG2qtMrhfAARdoeRSPPs6wk=;
 b=nDYrBNEmM/es46/uYQl/3rYZlfTcpxxYP6vnYd2xDkOqUT/fq7z6pG7X2RMioSmq7o
 9R/sGspY+FJdy/JciwBzERjPkueL137nZVW6E9JM0ZLHCScOOfu99+4hVgduEFh5F4yE
 hogeetDjJ9jmbNqmXiUJDcTpz3kmfoU3DqjW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=19laOyRbxi7dNQIHLVJQGG2qtMrhfAARdoeRSPPs6wk=;
 b=BPoFR028utJr6bQULkVnWZpryL5GqnnRZ041CjSb8MdUNJ7DM0dP5uboq/8ZWRTDwH
 9uVRnBm02mMEGchSD0R2wuCpwXv73Bkf+nNFxvqtp83sFj28TroQFirl89W86POz4/nI
 DGj5Ela+iHm/MC55AEj8tJ06CxTqy3+EzWYkyyeLaOCn7MFt36GrmPpgMXrXXXZeVRPC
 ry+5TUOPX/zEBD6EAF0MOVHUj0bRHTeOfE8cWMX+0VeiS9JuwSeMpN57t257gc+LiUtE
 LoltG+WRVh7rX6ZcUECzs4kzk8Ky80TYtrRAOQLGGyq/5cZWdnSlgAwd5Mj/1dpcRHQS
 iWsg==
X-Gm-Message-State: AOAM532RuEtJtyBGyypK4n5x5qmtX0z9pUr50L/8VLjYs7ENtj2iC3I3
 xA6WY3xSRZmz8IJwlrqnPL7SPw==
X-Google-Smtp-Source: ABdhPJyrxFL/qej64mhKdVLkwKxzB+fMwg3yrEloSGDFTMIWcN1QlDmlEtDyecQyZUswOV1dYkg8eQ==
X-Received: by 2002:a17:902:8f97:b0:12f:fff9:bad4 with SMTP id
 z23-20020a1709028f9700b0012ffff9bad4mr26689750plo.65.1629873234821; 
 Tue, 24 Aug 2021 23:33:54 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
 by smtp.gmail.com with UTF8SMTPSA id c15sm20830615pfl.181.2021.08.24.23.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 23:33:54 -0700 (PDT)
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
Subject: [PATCH v7 1/7] mtk-mdp: propagate errors from clock_on
Date: Wed, 25 Aug 2021 16:33:17 +1000
Message-Id: <20210825163247.v7.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_233357_542948_D2246FCC 
X-CRM114-Status: GOOD (  17.43  )
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
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
2.33.0.rc2.250.ged5fa647cd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
