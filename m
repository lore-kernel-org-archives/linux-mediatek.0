Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF2C07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 23:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17486115B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 23:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17486115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmYNUSYE+8IiXGc9XeTtyjP2p1kyNEJZXxlEhW+YDqo=; b=rvMNWufhbYcank
	87/H64SaD8tvm2G1zP1jXK67Tw9aX/nTGHOagK69FSevIzyiD/7IXNBk5CpGYVUbRgWEypcJeRoOZ
	ZBzFf77k/f7C28xk2e2R60+3YXRgz3UybiYrYowdtrI3fMU4JuxXBwtqWcyzOamJipd1duUF7X5FL
	UXJLbWCjJgfvxASpgEmaedNrWche1xHvEkK4cRFMvaRGSUMrQe2D1XFGxr8U5NgVD1ylhoSUadIU/
	zPD5tlWFx04loEh01BKxgqL+JdSD7HeqncRsYxVahjLDB54A4T0/eps3Ll97+gf2GJk4wU6OUJQCC
	L1qSiYR2WTWSbkUMM36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m35gw-008ltj-9r; Mon, 12 Jul 2021 23:50:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m35gu-008lsc-7q
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 23:50:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C72B61166;
 Mon, 12 Jul 2021 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626133823;
 bh=/wtDrP5iuggwVl9aJiLqEemxJKIrDTTzHICklU/8cNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmXjkn9yq14A9eZAjz7KlsaFQQRUZzzbXhWEsLhg/z6lHlqB9oxBVRuz2mAAroh7u
 n6WLrbqK2eZpM3LfRzjimGYo/z8n9y+r8Bhh8+iqSbadNCY1mPBkPtkqpxj+Xozd2r
 /+aaDyfXFj42b6fWx2lQgnio1jZseRwryBsrxq2/CK/XB1HGAUBilQd3aJdixrB0Ii
 O2qK6uKXKCPO7fqtCvquQmePb5vc02YR7TPrK4pGoiwAm5G/FBPuagaxSP7zn8N236
 axLNuzi23W44pr/NiI8rREAuXvVO45E+8tjCrZRvfHwieKKVr0evrD4xgygtxC12Q9
 f77nooBUjjk4w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/4] drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb
Date: Tue, 13 Jul 2021 07:50:11 +0800
Message-Id: <20210712235014.42673-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712235014.42673-1-chunkuang.hu@kernel.org>
References: <20210712235014.42673-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_165024_337943_C408CC6F 
X-CRM114-Status: GOOD (  10.94  )
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

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 474efb844249..cac8fe219c95 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -222,9 +224,11 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static void ddp_cmdq_cb(struct cmdq_cb_data data)
+static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
-	cmdq_pkt_destroy(data.data);
+	struct cmdq_cb_data *data = mssg;
+
+	cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
@@ -475,7 +479,12 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
+		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
+					    cmdq_handle->pa_base,
+					    cmdq_handle->cmd_buf_size,
+					    DMA_TO_DEVICE);
+		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
+		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -842,6 +851,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client) {
+		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
