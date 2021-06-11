Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EE3C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:09:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95BD61364
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95BD61364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Jkqzen1HSQWvVT4kKQp5r86e28pWozWlUYNP3yvu0g=; b=3t9/qp6d6VQSOA
	8ri1jxybIXTpmjq9rdCq1F9TfVkfBg2npmTZFODnIzVnwPQqhyQSHsCot57xNoprmB0jgIDFjaGzf
	UddTAaK3DiOEQEbWCUm30g8gEmM/1cg37nev23wrEvrh1J6HX8KjsPgXc3vwZ6oPcnAYlhKi8WzbT
	H0uNdZ42ubLFbmyShyz30v+wecC2ZjOLnwgj5XS28yAln7WcbEEJB96YKyRKnCC1wpMxBJMKQHa91
	60T7qTIVEtR9AcUiAJE1klARGLFO3aIW4ZxyOVbWrw7WHihHKfKhTfNagX9xNBCKMF2TcwgY4XgvX
	fq8rhNkTvrJGyVXNfUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYS4-003U3R-94; Fri, 11 Jun 2021 04:07:24 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYOk-003SKT-3U
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 04:03:59 +0000
Received: by mail-pl1-f171.google.com with SMTP id e1so2155452plh.8
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XFKmXX+Z8zBE+LvKxlcbsoweak/MaB5nJN3HXAfDUI=;
 b=TjO2rbze6Hl1C/ma0Cxmypa4hqczGAiGrDGeahbZ8pF58o9czM7knR42g1jTT3WYfW
 5T3rnHte+PlaVAmU9+BSjRwleCx7bY6Ti5WZv/JWrQnPuFSsjOSBtGZ+ZlC4HDYL9w8W
 4B1ZPHiXZRyxGxo9l5zn7GsnlhoPgFKQgxEEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XFKmXX+Z8zBE+LvKxlcbsoweak/MaB5nJN3HXAfDUI=;
 b=ZNbZ0m1TZsMAw2Q3o76AiSseU1E+IlcJ30gQJotpcIuOXtNlHmy27ILDXoam4Jw/PE
 m+Q3iT1f2XstOsHMq1uo7LWApb6LmJ+20c52UDmEYwOwl1PV1Uks3CdVQSaQk0Vs5NZp
 u24smU7VG1v5qVQarGfMg2OBNJK6rISn9irPWmsOelWbTTYh8ca1Mx/ohKZMmg7zZubh
 +KSxmdU+/NSD54ckLJ+ZdCQbDNWyXVx9bL5fBVN1gFMovEhNbaF+GL9DLzCrEFln6KEa
 kFLOSdqNnfNXsv7b1X9ERVMR27RR7XVYTzGMTx5y0Q3LsheGqGzm7zXgIXbkPsIau6XV
 fiCw==
X-Gm-Message-State: AOAM531JNMDf2veQmGj+FIAALQm1CW7m4GLLSU2x2cajW5ux3101aeS0
 r29Q9cERr2uES9x6gHd1gXMJ+w==
X-Google-Smtp-Source: ABdhPJw6JBRfw+XnBfj0SsNQjSFAjC9f3KJYRasmUse4UZLoDYVydM7J7wSRvsMMDZcHIslDqOI+hg==
X-Received: by 2002:a17:90b:d81:: with SMTP id
 bg1mr1055411pjb.112.1623384176460; 
 Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
 by smtp.gmail.com with UTF8SMTPSA id o9sm3945251pfh.217.2021.06.10.21.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
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
Subject: [PATCH v2 7/8] media: mtk-mdp: treat rdma@14001000 specially when
 probing
Date: Fri, 11 Jun 2021 14:01:44 +1000
Message-Id: <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_210358_207394_425B6095 
X-CRM114-Status: GOOD (  23.90  )
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

... Instead of depending on the presence of a mediatek,vpu property in
the device node.

This property was originally added to link to the vpu node so that the
mtk_mdp_core driver could pass the right device to
vpu_wdt_reg_handler(). However in a previous patch in this series,
the driver has been modified to search the device tree for that node
instead.

This property was also used to indicate the primary MDP device, so that
it can be passed to the V4L2 subsystem as well as register it to be
used when setting up queues in the open() callback for the filesystem
device node that is created. In this case, assuming that the primary
MDP device is the one with a specific name at a specific address seems
useable because the alternative is to add a property to the device tree
which doesn't actually represent any facet of hardware (i.e., this
being the primary MDP device is a software decision). In other words,
this solution is equally as arbitrary, but doesn't add a property to
a device node which is unrelated to the hardware present.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 15 ++++-----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 59911ee063c1..77ddc18c90e2 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -146,17 +146,11 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 {
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 	struct mtk_mdp_dev *mdp = data;
-	struct device_node *vpu_node;
 
 	mtk_mdp_register_component(mdp, comp);
 
-	/*
-	 * If this component has a "mediatek-vpu" property, it is responsible for
-	 * notifying the mdp master driver about it so it can be further initialized
-	 * later.
-	 */
-	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
-	if (vpu_node) {
+	if (strcmp(dev->of_node->full_name, "rdma@14001000") == 0) {
+		/* This is the primary MDP device node. */
 		int ret;
 
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
@@ -172,9 +166,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 		}
 
 		/*
-		 * presence of the "mediatek,vpu" property in a device node
-		 * indicates that it is the primary MDP rdma device and MDP DMA
-		 * ops should be handled by its DMA callbacks.
+		 * MDP DMA ops will be handled by the DMA callbacks associated with this
+		 * device;
 		 */
 		mdp->rdma_dev = dev;
 	}
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 523e3c2798e1..be7d35b3e3ff 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -157,6 +157,12 @@ static int mtk_mdp_master_bind(struct device *dev)
 		goto err_component_bind_all;
 	}
 
+	if (mdp->rdma_dev == NULL) {
+		dev_err(dev, "Primary MDP device not found");
+		status = -ENODEV;
+		goto err_component_bind_all;
+	}
+
 	vpu_node = of_find_node_by_name(NULL, "vpu");
 	if (!vpu_node) {
 		dev_err(dev, "unable to find vpu node");
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
