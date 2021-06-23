Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA32C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57901611C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57901611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01L0y5kiD+A55NE7WUp17tImJxX+yNURbGKKyZs3NcE=; b=FIesaxX4p8R5nm
	98ZWgQapfdhEnkRXTIjKsnGJERo8f4yatt9FxGftnUpy4H9wk/ox484lSotagVUkaisbhz3z1GUjc
	JJQ9M+jugDk4ErSiIktKUl6pudx62d0pZKzYl3ToHUyu2+rj5JsWS0ZHOlpto3gkZOfKIhC0vgL4W
	fjF++10fuoEAoeHY/2w6HSMEfY2XRDbXNVKIS2Yk8EPZnDPeV/CvZ6LmWe3us1jQwW/noOcsv+yW2
	oVTH48Eq6yKl8VzRJ4YQiW8ZcL2SWMBA3m2wSs0dnl2fOoHFr4JmRa1xIJvK1zN2dRl2aJsX5D5HW
	9cqc4j/MSWfzUn3p6Uww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxac-009qS1-Cs; Wed, 23 Jun 2021 07:46:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxaE-009qO8-4v; Wed, 23 Jun 2021 07:46:03 +0000
X-UUID: fb6a31455e4c436b8886b5d1882f8436-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4DVVN6+1UOabBinx6x9QrITXqx85BNtb+TLb68tjcNI=; 
 b=bbXDKmBlvfep2bce82Hzfac97DQEt2mhgkXG+767cT8zCYImj0tyATbj3q9lwD0meQ/lTi81aJJ0hM9ci0r23VDVcwbsaO4nNQsn4cfrHGSxlkxpr0cHPLoB42/eeh5lL+J1fSa9SSV1Mp+jVK0Ifu1zKPkSDoCbr+EijXc8yBo=;
X-UUID: fb6a31455e4c436b8886b5d1882f8436-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2023718009; Wed, 23 Jun 2021 00:45:59 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:35:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 15:35:57 +0800
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
Subject: [RFC PATCH V0 07/10] media: mtk-mdp3: Fix unpaired settings
Date: Wed, 23 Jun 2021 15:35:46 +0800
Message-ID: <20210623073549.24170-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_004602_243575_F054D756 
X-CRM114-Status: GOOD (  20.03  )
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

Fix unpaired settings about:
1. clk on/off.
2. CMDQ packet kzalloc/kfree.
3. MDP job_count increase/decrease.

Also revise the redundant log.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 97 ++++++++++++-------
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  4 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  2 +-
 3 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index a1bdf92d45f7..eac10944283a 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include "mtk-mdp3-cmdq.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-core.h"
@@ -230,6 +231,25 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 	return 0;
 }
 
+static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
+{
+	const struct img_config *config = path->config;
+	int index, ret;
+
+	if (config->num_components < 1)
+	    return -EINVAL;
+
+	for (index = 0; index < config->num_components; index++) {
+		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
+					&config->components[index],
+					path->param);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mdp_path_config_subfrm(struct mdp_cmd *cmd, struct mdp_path *path,
 				  u32 count)
 {
@@ -297,14 +317,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmd *cmd,
 	struct mdp_comp_ctx *ctx;
 	int index, count, ret;
 
-	for (index = 0; index < config->num_components; index++) {
-		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
-					&config->components[index],
-					path->param);
-		if (ret)
-			return ret;
-	}
-
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < config->num_components; index++) {
@@ -410,6 +422,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 {
 	struct mdp_cmd cmd;
 	struct mdp_path path;
+	struct mdp_cmdq_cb_param *cb_param = NULL;
+	struct mdp_comp *comps = NULL;
 	int i, ret;
 
 	if (atomic_read(&mdp->suspended))
@@ -438,16 +452,23 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		path.composes[i] = param->composes[i] ?
 			param->composes[i] : &path.bounds[i];
 	}
+
+	ret = mdp_path_ctx_init(mdp, &path);
+	if (ret) {
+		pr_info("%s mdp_path_ctx_init error\n", __func__);
+		goto err_destory_pkt;
+	}
+
+	for (i = 0; i < param->config->num_components; i++)
+			mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
+
 	ret = mdp_path_config(mdp, &cmd, &path);
 	if (ret) {
-		atomic_dec(&mdp->job_count);
-		wake_up(&mdp->callback_wq);
-		return ret;
+		pr_info("%s mdp_path_config error\n", __func__);
+		goto err_destory_pkt;
 	}
 
 	if (param->wait) {
-		for (i = 0; i < param->config->num_components; i++)
-			mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
 		ret = cmdq_pkt_flush(cmd.pkt);
 #ifdef MDP_DEBUG
 		if (ret) {
@@ -461,25 +482,20 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 			if (param->mdp_ctx)
 				mdp_m2m_job_finish(param->mdp_ctx);
 		}
-		cmdq_pkt_destroy(cmd.pkt);
-		for (i = 0; i < param->config->num_components; i++)
-			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
-
-		atomic_dec(&mdp->job_count);
-		wake_up(&mdp->callback_wq);
+		goto err_clock_off;
 	} else {
-		struct mdp_cmdq_cb_param *cb_param;
-		struct mdp_comp *comps;
-
 		cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
-		if (!cb_param)
-			return -ENOMEM;
+		if (!cb_param) {
+			ret = -ENOMEM;
+			goto err_destory_pkt;
+		}
+
 		comps = kcalloc(param->config->num_components, sizeof(*comps),
 				GFP_KERNEL);
 		if (!comps) {
-			kfree(cb_param);
 			mdp_err("%s:comps alloc fail!\n", __func__);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_destory_pkt;
 		}
 
 		for (i = 0; i < param->config->num_components; i++)
@@ -493,20 +509,35 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		cb_param->num_comps = param->config->num_components;
 		cb_param->mdp_ctx = param->mdp_ctx;
 
-		mdp_comp_clocks_on(&mdp->pdev->dev, cb_param->comps,
-				   cb_param->num_comps);
-
+		cmdq_pkt_finalize(cmd.pkt);
 		ret = cmdq_pkt_flush_async(cmd.pkt,
 					   mdp_handle_cmdq_callback,
 					   (void *)cb_param);
 		if (ret) {
 			mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func__);
-			mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
-					    cb_param->num_comps);
-			kfree(cb_param);
-			kfree(comps);
+			goto err_clock_off;
 		}
 	}
+	return 0;
+
+err_clock_off:
+	if (param->wait) {
+		for (i = 0; i < param->config->num_components; i++)
+			mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
+	} else {
+		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
+					    cb_param->num_comps);
+	}
+err_destory_pkt:
+	cmdq_pkt_destroy(cmd.pkt);
+	atomic_dec(&mdp->job_count);
+	if (param->wait)
+		wake_up(&mdp->callback_wq);
+	if (comps)
+		kfree(comps);
+	if (cb_param)
+		kfree(cb_param);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 98cf54b1d92b..19f46da487aa 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -64,12 +64,12 @@ extern int mtk_mdp_debug;
 #define mdp_dbg(level, fmt, ...)\
 	do {\
 		if (mtk_mdp_debug >= (level))\
-			pr_info("[MTK-MDP3] %d %s:%d: " fmt "\n",\
+			pr_info("[MTK-MDP3] %d %s:%d: " fmt,\
 				level, __func__, __LINE__, ##__VA_ARGS__);\
 	} while (0)
 
 #define mdp_err(fmt, ...)\
-	pr_err("[MTK-MDP3][ERR] %s:%d: " fmt "\n", __func__, __LINE__,\
+	pr_err("[MTK-MDP3][ERR] %s:%d: " fmt, __func__, __LINE__,\
 		##__VA_ARGS__)
 
 #else
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 1ae499f6c84b..ff80f01be82f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -133,7 +133,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	task.config = ctx->vpu.config;
 	task.param = &param;
 	task.composes[0] = &frame->compose;
-	task.wait = 1;
+	task.wait = 0;
 	task.cmdq_cb = NULL;
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
