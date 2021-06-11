Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4790EC48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C66361364
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C66361364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO3Zf3JIQRJS0FXQLmpBV7MK67nLMdIRQMlPPCnflY4=; b=ePz4+8T3gYXXYo
	7/nH/Gd2bQi/DQdhhXYVTWxSe0R8Tgfo89YAStrewjub8QpPQ97Wxn1bVtTqgXjee+6OafwhdA2zx
	n5APaaCA42/3Xml6XZDV4IFR3B+us2ug20f9uzJXLjHYOgJQpYQT9odJ5Z83B9J2Zygk7ie/YIY3h
	hqXeKhkmt/eHNHlGyb/f4WXOaDvOX6OBs1cXbGcVvLXrdUbO1sfpHHBtFkcVNK4l21a61+RlYdImQ
	zep2tAY9T7xq86AXmexsamtMjJwvrVceBP0rAjpBloUCMUseQLRiXRQ1W6xQTeGf9/sW8KBf3ygtK
	0M27G/r+MBOIwIuNy6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYNi-003Rgg-6n; Fri, 11 Jun 2021 04:02:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYNV-003RbR-ON
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 04:02:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso5190601pjb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 21:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpuuyZX5Ieel/toEhqaynm1+cB0UGivDIT7WkJ9Wrbs=;
 b=UJOx/qDoUCJiQuVKW4HhgE64kdIaaBumhGmNb/IqxFb/8RJTE/PmuFechrbRkxYw4s
 FurmOw8/eGeyXX6TrsU/oXeEIN/6gZUKv2Ay63XGTzLlehG13PC7eHEzTBN5EkJhqrBt
 oSendpq5KOfCmQd6HXd/iwDdXcawHA3yfHC+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zpuuyZX5Ieel/toEhqaynm1+cB0UGivDIT7WkJ9Wrbs=;
 b=f3kpwGmn1/vKCQ7l1Eo5fCdP1uwF0XS1ususO5G735yaecK4HzBwxkerrmh+FnUncV
 paWHdktRKrT4gA1+9lHaAETHg719Ac93ktXFv6CDoTlBKd1WWNkTyNgbFhGUqU1Tm4jx
 dTlIC8suU6Jpn9reE4XW4tN/XgVq1ozEqzABsppMoaoXAiEb0+S7PZAPrRFxdY3qn1Ha
 DVP3A9q+8lfepwfmiXAkkLqH7e7cFwCNNUV7Rxx0NrDKlCWtkW83XgBC1JYfqdL35YHi
 OBsxm6881atD6R8W3XxD3mWJtByvY9qzcjKp1QWzbtZHiQYsCcBeF18aRurNkY3wMAOM
 iUUw==
X-Gm-Message-State: AOAM533DNDQo046DH5hts2kueAJIw/EA1qc96rMZXlTyu8WlLW+yxc7h
 BAn1kaywRw5oaGBfuBTLZU/Ffw==
X-Google-Smtp-Source: ABdhPJz9UGkfR/m5Tcy+qUD1mlxKWaupak7n44yapumthpB/XHCSLVasmdM/x73NiTdzhzOkN6Q7OQ==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id
 s1-20020a170902b181b02900fcc069865cmr2061779plr.28.1623384161010; 
 Thu, 10 Jun 2021 21:02:41 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
 by smtp.gmail.com with UTF8SMTPSA id v18sm3752881pff.90.2021.06.10.21.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 21:02:40 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/8] media: mtk-mdp: search for vpu node instead of linking
 it to a property
Date: Fri, 11 Jun 2021 14:01:42 +1000
Message-Id: <20210611140124.v2.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_210241_849552_B9B98308 
X-CRM114-Status: GOOD (  14.19  )
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
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
