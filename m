Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE20C07E96
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2348E6145E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2348E6145E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77lMPV6CFG4WJfQb5qimjIN6wCywIgX+gHbMTEg0I1w=; b=IGugU++eusPuJb
	Gf+PSOjk9k5JHmz7vXbLu9cM8F5SAsj9cqGVHffnVfSOKqlzzc1VksRaZxovljrsNg7rBZQaq5sRQ
	NcXlQggnHTmF5Qmq8ZFgB4Ls43dxrMCq1GidX9vQOvjKc2I11XCNQFuJdJqgpYCWt39LWPcsvArWI
	PXQ23Zou2EW55LAmPKnySOe4Tw6w+0Eue86uWws3lG2fGP9DqQNGRt0kHUikLeYb6OfmXksuZZ+k7
	uYcl9rC5ezdmLtjE+s1TApA7ghhficUs+c7GY09nXW7VH967Q7JImPe76zWuMQ03v8KqQxZf3Q/QM
	wC4BAV3TRdPPrIJjXpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1gEI-000as7-43; Fri, 09 Jul 2021 02:27:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1gBo-000ZTh-OZ
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 02:24:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id b5so4241086plg.2
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 19:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yy3Oct9A9WErk0mmVC/ltaAK4Ui6hpVOSI3ft7mId8M=;
 b=MBJjndII9RSzdAmXPewLWBwxTR4Ubq3cHz+sZN63Su+9L3sTjeGBr9dYcIpGF9vmpv
 2ov47gob3vf2AmitKMc9GiGBKKmsIrLH3/BdHaMBSAFaGZ4QvSBeUKiaeQ813jwW6AhS
 m4TtUXyIO1/XsLVBOqXZBxQTxozAKNJswsf04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yy3Oct9A9WErk0mmVC/ltaAK4Ui6hpVOSI3ft7mId8M=;
 b=J9vwKSaQlhLeu8cOcJHftZSuu5Tte7DIadgE1KoiOtL6Jc2H7J4b4r6z4WfP9rqVM2
 6BPq346rBeINReuCHLIYMwIvnMI/S3pzzjJwGB+rWGsFmGCzORQak/5KrYWo5TsT4mys
 x1W2iU6VXW7+rRSwi/Djs3Z4ZxDbESo9nAujjr2L3Sb+jkTdzJE5tIZWKcDFFspCuzkV
 tN5GtmwOBmwMNvyRlaO9BhBU2uWjmbJbF6zwpKZB2Z43T5kHMPwRb0d1q2+0mHffmTJK
 FqGxoUS3GwA6cDN0w7stOTl2zST+7jJJ91k4HbkQ3SAWdM/q/GntC9klC/sFnaHyEVvi
 47ww==
X-Gm-Message-State: AOAM5300slIVZhJw2V8e7KLYJsqFNaUkjHmuy3tRDEA4shDXJcBwIhEg
 HeqhmMeTvjBT5jM7EBqxRg/kEA==
X-Google-Smtp-Source: ABdhPJwrPoeT1worVig+mEWOrxVrOttPMio1WiqwFIggheuAML3w9AWKKeZYM9c66qmbAY7ZGocPHQ==
X-Received: by 2002:a17:90a:5306:: with SMTP id
 x6mr34578229pjh.59.1625797468220; 
 Thu, 08 Jul 2021 19:24:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
 by smtp.gmail.com with UTF8SMTPSA id d19sm3742267pjx.57.2021.07.08.19.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 19:24:27 -0700 (PDT)
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
Subject: [PATCH v5 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to MDP
 master
Date: Fri,  9 Jul 2021 12:23:23 +1000
Message-Id: <20210709122040.v5.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709022324.1607884-1-eizan@chromium.org>
References: <20210709022324.1607884-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_192428_861916_9D4F5F64 
X-CRM114-Status: GOOD (  26.68  )
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
index 87e3f72ff02b..de2d425efdd1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -151,22 +151,48 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 		mtk_smi_larb_put(comp->larb_dev);
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
@@ -182,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
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
index b45d588d2659..e1fb39231248 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -158,6 +158,12 @@ static int mtk_mdp_master_bind(struct device *dev)
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
