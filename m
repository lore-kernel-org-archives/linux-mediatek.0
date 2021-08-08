Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33E3C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6586B60F0F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 23:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6586B60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdsJTI62qODsCnk73vHthWpjgL3gRN/5Zuf0ksI0Q8Y=; b=jPyJ1UAPKfHLlc
	fAn0LGcwCOhrMj8MAYYENNiRp2WwORsRXTp7KC41dF3p1T3wkccxpKu8zoV6NiluH93N8I8hTcFUm
	7HqjEZQf7rrNWwGcccZrWR9yAuGWf2lLumoQhPqg26a8fvxsH2dxvf2Y8kpTYy30JtmFZ+U3x7y44
	FRYN7Uc78zAIO2bfIS0tzx4yhSKMXnHE7mgADFwJzEtkZu9EU4IYKGGWXwbLDYBIvDNjU0fo1M9gp
	F6bKi+0HEc/2/8+BGdU+BId5eCGVGVBHHG6JTQn1ab4K/pIX17GFgqMCutYrIJJ/FhpJzCOj1d+Y8
	MnmidjIvbCkDgCBfZsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsWk-00GiMi-FZ; Sun, 08 Aug 2021 23:48:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsWI-00GiGO-Gr
 for linux-mediatek@lists.infradead.org; Sun, 08 Aug 2021 23:47:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B964F60F0F;
 Sun,  8 Aug 2021 23:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628466474;
 bh=ikmC57xWW8Emw+SnefdLIObzwt1WuO4pE6M/lSUjq+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X8zWZ1dC1hha+Zj1l23AtXXF1rkOrr6nAX8Rlz7MptZLwHjeVjS8d+iZtgp11zq/W
 TPFPFxgVMEdeRGV/v/dQFNHj7o1w8o+a/LKPEXRC8oZAmAHdQig+cEaryIMROFi2mj
 S7JDm0V45U27LHNlH5cYMgLvK8O/ai/oc3j+uo18HQU+Do4tk2qLbq5wNpUypfqWO0
 6oEs7wBN7YDO/OaD3hnkTmsoDvFRazTbX8m5JUXCKFYHBNldF0f+MOdM/WeSOD77r7
 NUyUIj3/33m9FuuB9CggVIhB4qZu2cHv9TaJh9kMTzHNw66q2aCmAXPCYGZPzjwDyZ
 vLlQvsQGxeSKw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 3/4] drm/mediatek: Detect CMDQ execution timeout
Date: Mon,  9 Aug 2021 07:47:32 +0800
Message-Id: <20210808234733.14782-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808234733.14782-1-chunkuang.hu@kernel.org>
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_164754_615561_8825FDF5 
X-CRM114-Status: GOOD (  12.05  )
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

CMDQ is used to update display register in vblank period, so
it should be execute in next vblank. If it fail to execute
in next 2 vblank, tiemout happen.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index da92a3fedd0a..ad4c1a3a9294 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -55,6 +55,7 @@ struct mtk_drm_crtc {
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
+	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -269,6 +270,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
+	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
@@ -524,6 +526,11 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
+		/*
+		 * CMDQ command should execute in next vblank,
+		 * If it fail to execute in next 2 vblank, timeout happen.
+		 */
+		mtk_crtc->cmdq_vblank_cnt = 2;
 		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
 	}
@@ -540,11 +547,14 @@ static void mtk_crtc_ddp_irq(void *data)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+		mtk_crtc_ddp_config(crtc, NULL);
+	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
+		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
-#endif
 		mtk_crtc_ddp_config(crtc, NULL);
-
+#endif
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
