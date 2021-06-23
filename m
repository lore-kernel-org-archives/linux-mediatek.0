Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F11DC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCCD61350
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCCD61350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skMFTFWTPCwiokzM/CvwmH9KjK/0WQNWhWen9j01gps=; b=34kpQ4LcuyXBpQ
	AC7DaJcAgkJHYSdiJbEIiePPHcwaea+1GK4oR1Ic9uiqctcVPCEkPed8P0h984VNS+pXbE5OFWqVB
	TKIfp2egabvHBrGHtKoArjWh+Rsy5p3KCeosGR7gmOg9V5AWyHi+1iMTPeew7pUi1erv/zLFYGB+h
	XZ6q1HYSmGp+UbNn/zfuhhIrIrh+l81OlfipZr+12ltewgPzKqbf3d0wSKi6t4Bj5mwZUrbgXg91D
	LYDyz3pJa7ykcfQ9DIoWnn5NTylkGSHlYD/GwtKE7lhdtx0c9RLrapiwJlv5w9cm+yqtVxevhZlNA
	7uLuA4tRZuUE2LkXeqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxao-009qVY-2H; Wed, 23 Jun 2021 07:46:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxaE-009qNg-RF; Wed, 23 Jun 2021 07:46:04 +0000
X-UUID: 702d71922c7a47309af58384a546e8bb-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0pCHcYmfpF9JhROwaQAuFrGjlvzOs8zF5+JOmGLafrA=; 
 b=WYKvqAyGITcLurDcr/dcxka1YeR+fBrGiuISoIkbJ28OQPTFRBM9Haw2dwme3USCYSrX3LoxdJxNr5FTM+TunHz1i5y4FHiR5l5+s0f7PX6Q1qXdIgCyVoJeN/kPuy2FiL8kLzhYC4anzGcRY99PKE053kpbOe++FTrjx1wuQrs=;
X-UUID: 702d71922c7a47309af58384a546e8bb-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1586528108; Wed, 23 Jun 2021 00:45:59 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 15:35:56 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
 <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 03/10] media: mtk-mdp3: revise suspend strategy
Date: Wed, 23 Jun 2021 15:35:42 +0800
Message-ID: <20210623073549.24170-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_004602_919882_5C732824 
X-CRM114-Status: GOOD (  21.22  )
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

From: daoyuan huang <daoyuan.huang@mediatek.com>

1.The wait queue check for incomplete running task
  should be put in mdp_suspend instead of mdp_pm_suspend;
  Due to mdp_suspend could be called while task is running;
  Add error return value in suspend fail situation.
2.modify dma modules' power control from larb device to modules'
  device self;
  For support real mdp_pm_suspend callback.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 36 ++++++++-----------
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 34 +++++-------------
 3 files changed, 23 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 3033cd32340c..23dd413f3423 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1039,8 +1039,8 @@ void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 {
 	int i, err;
 
-	if (comp->larb_dev) {
-		err = pm_runtime_get_sync(comp->larb_dev);
+	if (comp->comp_dev) {
+		err = pm_runtime_get_sync(comp->comp_dev);
 		if (err < 0)
 			dev_err(dev,
 				"Failed to get larb, err %d. type:%d id:%d\n",
@@ -1068,8 +1068,8 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 		clk_disable_unprepare(comp->clks[i]);
 	}
 
-	if (comp->larb_dev)
-		pm_runtime_put(comp->larb_dev);
+	if (comp->comp_dev)
+		pm_runtime_put(comp->comp_dev);
 }
 
 static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
@@ -1153,8 +1153,7 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 			 struct device_node *node, struct mdp_comp *comp,
 			 enum mdp_comp_id id)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
+	struct platform_device *pdev;
 	int i;
 
 	if (id < 0 || id >= MDP_MAX_COMP_COUNT) {
@@ -1176,29 +1175,22 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 
 	mdp_get_subsys_id(dev, node, comp);
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
+	/* Only DMA capable components need the pm control */
+	comp->comp_dev = NULL;
 	if (comp->type != MDP_COMP_TYPE_RDMA &&
 	    comp->type != MDP_COMP_TYPE_WROT &&
 		comp->type != MDP_COMP_TYPE_WDMA)
 		return 0;
 
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev, "Missing mediatek,larb phandle in %pOF node\n",
-			node);
-		return -EINVAL;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		return -EPROBE_DEFER;
+	pdev = of_find_device_by_node(node);
+	if (!pdev) {
+		dev_warn(dev, "can't find platform device of node:%s\n",
+			 node->name);
+		return -ENODEV;
 	}
-	of_node_put(larb_node);
 
-	comp->larb_dev = &larb_pdev->dev;
+	comp->comp_dev = &pdev->dev;
+	pm_runtime_enable(comp->comp_dev);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 77d2c3e989c4..27d58dc51dce 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -113,7 +113,7 @@ struct mdp_comp {
 	phys_addr_t			reg_base;
 	u8				subsys_id;
 	struct clk			*clks[2];
-	struct device			*larb_dev;
+	struct device			*comp_dev;
 	enum mdp_comp_type		type;
 	enum mdp_comp_id		id;
 	u32				alias_id;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 4a59dec8cfd9..eaf5b07e720f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -152,7 +152,6 @@ static int mdp_probe(struct platform_device *pdev)
 #endif
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-	pm_runtime_enable(dev);
 
 	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
 	if (ret) {
@@ -212,7 +211,7 @@ static int mdp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mdp_pm_suspend(struct device *dev)
+static int __maybe_unused mdp_suspend(struct device *dev)
 {
 	struct mdp_dev *mdp = dev_get_drvdata(dev);
 	int ret;
@@ -222,19 +221,19 @@ static int __maybe_unused mdp_pm_suspend(struct device *dev)
 	if (atomic_read(&mdp->job_count)) {
 		ret = wait_event_timeout(mdp->callback_wq,
 					 !atomic_read(&mdp->job_count),
-					 HZ);
-		if (ret == 0)
+					 2 * HZ);
+		if (ret == 0) {
 			dev_err(dev,
-				"%s:flushed cmdq task incomplete\n",
-				__func__);
-		else//need to remove
-			pr_err("%s:ret=%d\n", __func__, ret);
+				"%s:flushed cmdq task incomplete, count=%d\n",
+				__func__, atomic_read(&mdp->job_count));
+			return -EBUSY;
+		}
 	}
 
 	return 0;
 }
 
-static int __maybe_unused mdp_pm_resume(struct device *dev)
+static int __maybe_unused mdp_resume(struct device *dev)
 {
 	struct mdp_dev *mdp = dev_get_drvdata(dev);
 
@@ -243,25 +242,8 @@ static int __maybe_unused mdp_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mdp_suspend(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return mdp_pm_suspend(dev);
-}
-
-static int __maybe_unused mdp_resume(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return mdp_pm_resume(dev);
-}
-
 static const struct dev_pm_ops mdp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mdp_suspend, mdp_resume)
-	SET_RUNTIME_PM_OPS(mdp_pm_suspend, mdp_pm_resume, NULL)
 };
 
 static struct platform_driver mdp_driver = {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
