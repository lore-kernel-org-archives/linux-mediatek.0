Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6556AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302E160E53
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 302E160E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bOMPSmu6g2rDVIWJrVkmfnDIz2CgV4NyLfhOzgydPk=; b=ke/6Lx6q1jB1rV
	TPflyZQ2OmsmGCR9q/2tebFoCk2HWP5MKZyHnIgiSXorf+dCgiDkrfxxK5/pD5GUecohcxBXPZTHv
	LB7hAA2gVMujT6BM5PtiEt4ZYGYlfjZ8ahsPJxEVyHXP86ntAr3WXlzPYFrRSLqgglYAU39OMAhe0
	4CYwqoCfhllVYxA+GTHNy4cZ1KzqZQiE8v19niO460Ixd0yPiEN5dVBQENyZTwGD47+OQwAiVEMt3
	OJWBfqcxIShqZoCJUS/tWIU0mDC6eoM41wa921z/hunhIsDhiAs1o6fXrzinyEQ9GoAEhjbc7f+Xx
	SVDl6lJR0/+r8xr69Jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdCi-0015Nx-6h; Thu, 07 Oct 2021 23:53:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdCV-0015E0-1K
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:53:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B33261029;
 Thu,  7 Oct 2021 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650802;
 bh=hkB4BEfXrWvXzGMtu+X+7bqUSgo9sLVy1s0KrXgVH2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eX5Sgmoot9rVguCk4g/W1O5qMtTOuj831qunmbRk5J06aH9ctP1lgeojU0WNt7aU+
 vKGuRxbDd7v5zHjQGwM2Sv+10MePrhlauARhQiHfQ2sQHIwJghKJrC1jFqhYTCIcfi
 wScYKfgZOmk/oxvZODwRWDo4UoDEyl7FzZ1mlcEx4uZOBiKKhy1vXvpqrL8kG7DN8e
 93pzeUuoQQYNE/klrMtoKzSRYaLWhdmygL+VHH+Xh375pS8fy/eawadQ5YEUAhcVZA
 Ka97RHYARPoMF3GHQZHhK6a2eGq+FMfgtVNPaNPe49EHWRNhumstgrKGdVCk3zJK+S
 vR2MGOWEljqrw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 3/5] Revert "drm/mediatek: Detect CMDQ execution timeout"
Date: Fri,  8 Oct 2021 07:53:08 +0800
Message-Id: <20211007235310.14626-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165324_241063_5D131669 
X-CRM114-Status: GOOD (  11.63  )
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

This reverts commit 8cdcb365342402fdeb664479b0a04e9debef8efb.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 697c4dec1890..0cd5b9ed8956 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -55,7 +55,6 @@ struct mtk_drm_crtc {
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
-	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -270,7 +269,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
-	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
@@ -526,11 +524,6 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
-		/*
-		 * CMDQ command should execute in next vblank,
-		 * If it fail to execute in next 2 vblank, timeout happen.
-		 */
-		mtk_crtc->cmdq_vblank_cnt = 2;
 		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
 	}
@@ -547,14 +540,11 @@ static void mtk_crtc_ddp_irq(void *data)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
-		mtk_crtc_ddp_config(crtc, NULL);
-	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
-		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
-			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
-		mtk_crtc_ddp_config(crtc, NULL);
 #endif
+		mtk_crtc_ddp_config(crtc, NULL);
+
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
