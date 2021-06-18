Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7EEC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E00861396
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E00861396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+D90TQyhgA++3WI09m+CwzY7EdtL7uEcD0mXd5MlpU=; b=GlM2SB7wD7nbBU
	DIpfiXmCKaq2PKBuiz0++WVRbjWtdLNVyq3SW6hCGIPkz+gzAuCemUyiuEGJmzerZXGUip+AH90fj
	lFYophbQGTuCMFznVstYw625bSkvwrYCUC4/2MO794tbVgvqgsjpNFKikAX9D0hWHK1114kv+4bLb
	/y/k9NIVEd+3FOMyMwyKtP6NqfSfxpGWKQG0VWwupHxix7BkPUagO1FJvtz28NNankishFiWIxIrJ
	1YjZdhVOYHo/ZESNuKIN94KWXS+alKDhBYy+QglpgvKTlgyYQCZ3mqLf35na6n4JmghIfrQx0Jdmd
	78ak3f8IJ783L3YMlwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9LB-00D9vg-8S; Fri, 18 Jun 2021 07:55:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9JF-00D8qD-EX
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 07:53:04 +0000
Received: by mail-pg1-x52e.google.com with SMTP id u190so3300969pgd.8
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Jun 2021 00:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zi7IELJ4JOaUAbM1DjeUA9NzNlwKb+WJHoeuipTJh1o=;
 b=btun3AMrfxJb7yR0q11FW27P6OLfmnJTdE6FEJ/f7vf4QAzRSqgVq9YBsqGk3LsxAC
 Bdk376B3bKNBrW3bVAsxL9TlUyX6u8I7afAdAxb0lASCoBaj+uXQa2I8yZbVUZIOKuKr
 bjxB7Dz6DtX4UnCd+U/Thfo2RNRkYuOpEwn/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zi7IELJ4JOaUAbM1DjeUA9NzNlwKb+WJHoeuipTJh1o=;
 b=WUR+pejcjKyll+Bc9eXJABJERFRSy04JppDdQiC9uDMKWFeM1p5ogNS3qbwq/bhXS2
 CCioFh3x6ffB4Fp0SlWbutnUG3s5nnn/JyrhaEgbX8/G/A+gM+NpkbZ2kF6BpG4Omfut
 wv/PY3B2IclL00NERSQIlcMuWAzK1nFARX3m1Ep0RvtYCbAj0Dx5EfWvEr5GppF+2lsn
 eBQJqp0+4nFzZiVftFw4Gfav5YkI380qwbxrwUVMFODiFKPSBEgFh0kT0Hk3GOdOqvcA
 Wu9Rb3akCSdfp0Fg6lmefZV7Y32/STrzvj69srxodqD+niL1CCe6jmWxUmv6hvcoTSCu
 CPKw==
X-Gm-Message-State: AOAM5333UIpeeJPOdwJi4+rNnGIzXuIXZVkD5J9lzDqRHwMJyQ7vClzd
 mMYisIRhDY6zx5ObAme+SDy0LQ==
X-Google-Smtp-Source: ABdhPJxa7CNGQV+VGHu0qk8bwyODWGiB22Nh05T+9OsCTnJPABe3ZeRm9xUbIr969bdeqTnXDCO7RA==
X-Received: by 2002:a05:6a00:1629:b029:2ef:f4de:244f with SMTP id
 e9-20020a056a001629b02902eff4de244fmr3894275pfc.6.1624002780347; 
 Fri, 18 Jun 2021 00:53:00 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
 by smtp.gmail.com with UTF8SMTPSA id 35sm6706429pjo.16.2021.06.18.00.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:53:00 -0700 (PDT)
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
Subject: [PATCH v3 5/8] media: mtk-mdp: search for vpu node instead of linking
 it to a property
Date: Fri, 18 Jun 2021 17:52:06 +1000
Message-Id: <20210618175059.v3.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005301_581607_38EBCC25 
X-CRM114-Status: GOOD (  14.30  )
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

Since there is only one vpu node, it suffices to search for it instead
of having a link coded into the primary mdp device node.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 ----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 28 +++++++++++++------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index fdbb46a5330a..3d9bb7265159 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -117,12 +117,6 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 	if (vpu_node) {
 		int ret;
 
-		mdp->vpu_dev = of_find_device_by_node(vpu_node);
-		if (WARN_ON(!mdp->vpu_dev)) {
-			dev_err(dev, "vpu pdev failed\n");
-			of_node_put(vpu_node);
-		}
-
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
 		if (ret) {
 			dev_err(dev, "Failed to register v4l2 device\n");
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 267e4cb4bf32..48e9a557c446 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -113,6 +113,7 @@ static void release_of(struct device *dev, void *data)
 static int mtk_mdp_master_bind(struct device *dev)
 {
 	int status;
+	struct device_node *vpu_node;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
 	status = component_bind_all(dev, mdp);
@@ -121,15 +122,24 @@ static int mtk_mdp_master_bind(struct device *dev)
 		goto err_component_bind_all;
 	}
 
-	if (mdp->vpu_dev) {
-		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
-					  VPU_RST_MDP);
-		if (ret) {
-			dev_err(dev, "Failed to register reset handler\n");
-			goto err_wdt_reg;
-		}
-	} else {
-		dev_err(dev, "no vpu_dev found\n");
+	vpu_node = of_find_node_by_name(NULL, "vpu");
+	if (!vpu_node) {
+		dev_err(dev, "unable to find vpu node");
+		status = -ENODEV;
+		goto err_wdt_reg;
+	}
+
+	mdp->vpu_dev = of_find_device_by_node(vpu_node);
+	if (!mdp->vpu_dev) {
+		dev_err(dev, "unable to find vpu device");
+		status = -ENODEV;
+		goto err_wdt_reg;
+	}
+
+	status = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
+	if (status) {
+		dev_err(dev, "Failed to register reset handler\n");
+		goto err_wdt_reg;
 	}
 
 	status = mtk_mdp_register_m2m_device(mdp);
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
