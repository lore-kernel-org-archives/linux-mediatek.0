Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF35DC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7707F611AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7707F611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYtNHYK3qcF3EM9KnkTOf3x6Ti0xkyrxjkZlUjtp1Dw=; b=dH1y/8knezdS8y
	kkk6uV6dRJccOj0lmxptZ9yKew0RWIu7Hc8MpGH3qPBmYvCMNYI/J7YC0Yttgwo5uuJbqQNg1Gf3W
	UuwSJBziCVlSc5aEK4DS+2boTUwqHHTKT9DWTZ93CV0vVJjm+B41w8qWWj3Chorl7rkeubhcQF5Kt
	DYN9hp1EhAu3M+RMX8U0IaAErbpkasZ3rFu+sbhd/Iu7quT83qlZdPalqE3vYxl89FR2BtSUAcPfQ
	5hNZBIvovNEzQVP5iOnjwkBrBsxViVobkNYGilquqWMy5aMzQPCaABtYMbl/wMozEzGQZrfJI1To8
	MgvV7IIIVFI1s7yDicbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxRV-009nYi-Ox; Wed, 23 Jun 2021 07:37:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxQd-009n8l-SO; Wed, 23 Jun 2021 07:36:09 +0000
X-UUID: f0e23e9dbaf54a6e931a29f015b1caf5-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RBA3EWg4H8NDUJ3Of9WK6FiQoRxcZY3C8FlXOPRLHf0=; 
 b=sQS+vp//mjni7vGhG3LSjc/HxohU4hxOZhBaPeRDyvIy0ZmsXe3SmDowgG57o0ilHKg7SZtGA7AcFY4C1Bu/Y88bQR5fkHVBzFkCXcw9R8yR9VcyyvIFwQEhK4dQhreJuHydyYQf39mLJd9qyljFX+dpnbM3v8hual9F9J8FxN4=;
X-UUID: f0e23e9dbaf54a6e931a29f015b1caf5-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1654757668; Wed, 23 Jun 2021 00:35:59 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
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
Subject: [RFC PATCH V0 04/10] media: mtk-mdp3: add error handling in error
 return
Date: Wed, 23 Jun 2021 15:35:43 +0800
Message-ID: <20210623073549.24170-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_003607_977511_AB8ADFDB 
X-CRM114-Status: GOOD (  14.04  )
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

add error handling in missed places.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c | 14 +++++++++++++-
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c | 16 ++++++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h |  2 ++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index f8bf8fde599c..42a51061677a 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -398,7 +398,17 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 
 	cmdq_pkt_destroy(cb_param->pkt);
 	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
-	queue_work(mdp->clock_wq, &cb_param->auto_release_work);
+	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
+		mdp_err("%s:queue_work fail!\n", __func__);
+		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+				    cb_param->num_comps);
+
+		kfree(cb_param->comps);
+		kfree(cb_param);
+
+		atomic_dec(&mdp->job_count);
+		wake_up(&mdp->callback_wq);
+	}
 }
 
 int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
@@ -495,6 +505,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 					   (void *)cb_param);
 		if (ret) {
 			mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
+			mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+					    cb_param->num_comps);
 			kfree(cb_param);
 			kfree(comps);
 		}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 23dd413f3423..157ef9408ed3 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1072,6 +1072,22 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 		pm_runtime_put(comp->comp_dev);
 }
 
+void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		mdp_comp_clock_on(dev, &comps[i]);
+}
+
+void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++)
+		mdp_comp_clock_off(dev, &comps[i]);
+}
+
 static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
 			     struct mdp_comp *comp)
 {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 27d58dc51dce..f201bced3c06 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -147,6 +147,8 @@ int mdp_component_init(struct mdp_dev *mdp);
 void mdp_component_deinit(struct mdp_dev *mdp);
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
 void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp);
+void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num);
+void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
 int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
 	const struct img_ipi_frameparam *frame);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
