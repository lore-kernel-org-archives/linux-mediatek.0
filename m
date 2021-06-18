Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4DAC48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A936101A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 07:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A936101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=116p6ggL8yvIyPKMdRD662Iz1Li5CT2ORriChBN7bYI=; b=NGxhbPBZjysGp5
	GKHRmzci+YJZ6tVA8ef5OnzCkrJoB80h6UnbiSRnWSNLW4/MC36w2MM+xTou3v2i52cYDqPTAJYlL
	ZAfdVAYZqP4sCJRIG4yZFM9ousAqXW1aRRHv6vS93HI8dBlBcKjE4hi0wHnlGnZyGQ3RiKNbGYRuh
	RMZvEmYopok/61AhdXJscuhs0DKlWlztA7HPbqJuIGF1aex2gAiK498mKxXf/tk1aS7yrIt0j+3DZ
	X/Yksqp3xjnBYXn2eVIx7iDIO2yYSghzwc0xeITGk6Bwr6ttfKmRbDV0tI8Q3UhPLV+t7uFT21VYw
	xHaeCl27GmfhFmQ02ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9MZ-00DAh3-5C; Fri, 18 Jun 2021 07:56:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9JT-00D8yb-O7
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 07:53:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id h12so7093163pfe.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Jun 2021 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fuQHQTUFu0ITvsFzkeR6cqKiaBR9rEE8G0yVPHcvTZQ=;
 b=HYeWOMVAjk9vA6oXy4YeoHfzm9VgoY1EfBNkbUzeZ1bi+CcyhYhCdz5nch//gJ0AT5
 ygxHHJ0SVJo9HH9vfAUjMTPEgel4viwiBhuGmWSanIzFyap7epHiin/riZFeFJpFxENn
 RjlWRYbNCwSFQgMHbQ6b32ddNzP4zp9KdqlxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fuQHQTUFu0ITvsFzkeR6cqKiaBR9rEE8G0yVPHcvTZQ=;
 b=V/kOvnCJvReTtFSlLHFPIdnAjXmCQ7voAul9pZwr08MAx10ZiB0RT/YGynpNzJQygE
 LOq6er3o4KHT761pkVceGEvMG7kk/RAWCwenwQNHrOH3+F0O1dWoua0thOWzULnhqbbd
 6V7++GbJ9uG7nvH1Ze0WiAIQsYpzzGhq8a5tmM2VGjK4r7r6lrDLtDRDNW9bQK7BJDj8
 +E04r7W5Cdyp1EHLpb1wwSRHES933kptsgBBgmqMqpL7LUcDeMmG+JYGd2WGvRCljpVH
 EuOl9W+3KL8VD8Xd5dCtW7rNhLO3YgpuaRCCvoegL+1HdmOxK5Je9VE5O4Wq6K3qiQZG
 SQwQ==
X-Gm-Message-State: AOAM5327NK89qbFSA8c8Hog5OCau3qU6Q1MELOMExb8pr7P53pDyBcIv
 vtm8wRuJrF6X3pdGbhwXAjyBgA==
X-Google-Smtp-Source: ABdhPJyBeVVeweGBr4QQORF7SlgVzJMdMAcqnaFfn77opkCAqoRSj12QI9zWicniMiWzgqn0gNu/Og==
X-Received: by 2002:a63:2151:: with SMTP id s17mr8686226pgm.432.1624002795102; 
 Fri, 18 Jun 2021 00:53:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
 by smtp.gmail.com with UTF8SMTPSA id 201sm2777642pfz.150.2021.06.18.00.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:53:14 -0700 (PDT)
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
Subject: [PATCH v3 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to MDP
 master
Date: Fri, 18 Jun 2021 17:52:08 +1000
Message-Id: <20210618175059.v3.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005315_839744_E5789358 
X-CRM114-Status: GOOD (  26.49  )
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

That property was originally added to link to the vpu node so that the
mtk_mdp_core driver could pass the right device to
vpu_wdt_reg_handler(). However in a previous patch in this series,
the driver has been modified to search the device tree for that node
instead.

That property was also used to indicate the primary MDP device, so that
it can be passed to the V4L2 subsystem as well as register it to be
used when setting up queues in the open() callback for the filesystem
device node that is created. In this case, assuming that the primary
MDP device is the one with a specific alias seems useable because the
alternative is to add a property to the device tree which doesn't
actually represent any facet of hardware (i.e., this being the primary
MDP device is a software decision). In other words, this solution is
equally as arbitrary, but at least it doesn't add a property to a
device node where said property is unrelated to the hardware present.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 +++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 59911ee063c1..2a71c582d8b1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -141,22 +141,48 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 	}
 }
 
+/*
+ * The MDP master device node is identified by the device tree alias
+ * "mdp-rdma0".
+ */
+static int is_mdp_master(struct device *dev)
+{
+	struct device_node *aliases, *mdp_rdma0_node;
+	const char *mdp_rdma0_path;
+
+	if (!dev->of_node)
+		return 0;
+
+	aliases = of_find_node_by_path("/aliases");
+	if (!aliases) {
+		dev_err(dev, "no aliases found for mdp-rdma0");
+		return 0;
+	}
+
+	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
+	if (!mdp_rdma0_path) {
+		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
+		return 0;
+	}
+
+	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
+	if (!mdp_rdma0_node) {
+		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
+		return 0;
+	}
+
+	return dev->of_node == mdp_rdma0_node;
+}
+
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 			void *data)
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
+	if (is_mdp_master(dev)) {
 		int ret;
 
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
@@ -172,9 +198,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
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
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
