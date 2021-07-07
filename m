Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1244C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:36:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E9861CAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E9861CAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQUyeo3G3+odFs5lbHrKRv/Agj5XmsaKAI5bkko82ns=; b=B/PnxgL0YdqSZE
	Atf8clmqyvHsugyDQ+0QZYhtZxEZ+G6gcyRJ3gMUg58eZeIY0QeC8ZDm9r/CzjHCJcTHHJFEXGnzQ
	E+0plBy6Nbe+lYzd5FT2MKhTDKJmZsUJywf6iMIMsv8N2sKnWJ2jUcJOiPRJINAzQOQbEP6ERVWST
	e2vi7Z20a2S3pZkBuvyGuDoTVU+iIkNiil9KO4WB1kfqZHddbELYDEehF5Sd+plVfGOdwgrscGD0K
	U4Wad3u2z443ZRATkTWeA7jUtYEXzAVFED929yN1Xpco1HjlYhg881X360LzXziYgX5bAUQjk4QlP
	Stf3AdeBh1ZhzSn9WIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1266-00Dr4r-QV; Wed, 07 Jul 2021 07:35:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m125O-00Dqd3-CV
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 07:35:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so3169439pjs.2
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cz5Yf26hS0mQEs4OKDDFPHwtGleZDBuXb5hOWYwdOV4=;
 b=cf/lds2uXZML++gxAnlsKaNN9m0W9hvYqI8NMIfH7HW/ri1D+YjOSJ8H8329TEDwCM
 f0EPCHqhkbD0TD/R7ETL+mS9V0EUq/8uJQM59sU8wqqG9ZB2lWxEA8Aqi++WraUAKdh/
 1DwfBbbfvdpYzYXxTAZeEhSDFBGaFTP6Zwq6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cz5Yf26hS0mQEs4OKDDFPHwtGleZDBuXb5hOWYwdOV4=;
 b=XVlCKfAYW8+FZFcvq6FivOUUU/CoW07xFaIdzNtu7Qbdxj42IBAJYvJAPH5OjmvJC3
 W2OwnBzAYGdbeGul8TaMqM5x3Vm8jc/F4NS9fH/i/pbmZOgixoPtQ1iTnWqt5frAay2M
 c2rU5tGYTXdxgRo2IN5jiwXEDSAF5l+yorZhPsKi3wmQOUHr1TWfdep2ZelI9zoW4vfh
 mN1Wfn/K9ALM8MHzhMwaoByTZrko3z2p7iS6b7SQy1noFRAIGBUhd8JjvUg6bBkd7kYg
 F8+9iCGkRXxq400REgi75bIlmle6Le7ms5err8DKHVnHQpH71PJ26f8e9QP57XIwRl9F
 wStQ==
X-Gm-Message-State: AOAM531BrXfC24APXdFCLqM13Lvyw4nXrKdh8Vgf+Ho9P4joweSBmruw
 cpQX6/zcwjyOaeyH8znd5rv5aw==
X-Google-Smtp-Source: ABdhPJwgYAgzSOqCb9aR3c1XJWh5okmVPcJwiT7+q7wrJLwi8pWgTbku9wDoDhB2jXjVxJc29ywabw==
X-Received: by 2002:a17:90b:4b82:: with SMTP id
 lr2mr16752540pjb.111.1625643307806; 
 Wed, 07 Jul 2021 00:35:07 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
 by smtp.gmail.com with UTF8SMTPSA id m10sm19087343pff.215.2021.07.07.00.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:35:07 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com, wenst@chromium.org,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 5/8] media: mtk-mdp: search for vpu node instead of linking
 it to a property
Date: Wed,  7 Jul 2021 17:34:07 +1000
Message-Id: <20210707173108.v4.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210707073410.999625-1-eizan@chromium.org>
References: <20210707073410.999625-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_003510_466595_BA3B62BE 
X-CRM114-Status: GOOD (  15.05  )
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
