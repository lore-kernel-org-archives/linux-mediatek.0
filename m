Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF92C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58DF60E53
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D58DF60E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB2Jfihtvm0swUyWOkuxFGZ2loqnRpm0as/8nJoopUU=; b=r3vE+5HL8UlpXT
	xIC7G5XAwJ9MA+Mvw//yYeeGI0Pq/yC+HvPYtmiNdyIj3gLa7nXrqgfzTKlvObuanZT8LvJHH4rTp
	EQlabpGvPGMp6jVodsDzuHRwQo06/Rhj39xReH0nn/+kucLWLJS+6H9+z7wiG9ctiswelXYQbPpt/
	BsEOhNFQac3BRgBCPVoURZpRrYoSoOPYHDrit5cVBc4oIxEippco8wxcpRWO9Ad8SBS7PflvBQwBa
	ZldnYoYcvD+x/qhlj+/22UuH/G1/MhzGAhnDrQaP0ud7xjQrrk9P4rKmEYR4/8RgjkKtV7ayLnu5b
	noecQslasIhmwnjG/wNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYdCm-0015Ro-Op; Thu, 07 Oct 2021 23:53:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYdCY-0015GQ-Kb
 for linux-mediatek@lists.infradead.org; Thu, 07 Oct 2021 23:53:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE4A360F46;
 Thu,  7 Oct 2021 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650806;
 bh=zY4CHOcf904wGrBQIxRY3emDUZoEa9VuYr4ZkjX6geQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ohu/VgY0pgkqa/F631/k3noWQLk9VGF0KDNVP41JOic2ahGX3nNV7lL7ooeb114kP
 RIOaRgYG2rkLeFEj8JjMczdSALZPkh+XivrJmeShhEPENiHVz9vGKgnHdzzjEqTndO
 DhQRTDJlXeG4Ie5+fP1IYgC8IrmYTNzmxBRgXX/eMowLTQt0kxbBj6GY5YTR3Hgv3+
 V+cAIed/0S9UwfVbahJBXX/gEB2CrI9iAWsbyu6dqiv5sH62SUx+qPfu9QxwJwzPEz
 4rtT+s5Z5AEXRCdS2pnuW3s8fpN0OyhfLkbUOR3sF858WTX4FYxAZrH54MOs1ZwoPb
 biZ6TIMNwqNAw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 5/5] Revert "drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb"
Date: Fri,  8 Oct 2021 07:53:10 +0800
Message-Id: <20211007235310.14626-6-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_165326_817170_27A3CF68 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

This reverts commit c1ec54b7b5af25c779192253f5a9f05e95cb43d7.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3f9802d21bf0..a4e80e499674 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -4,8 +4,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/dma-mapping.h>
-#include <linux/mailbox_controller.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -224,11 +222,9 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
+static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
-	struct cmdq_cb_data *data = mssg;
-
-	cmdq_pkt_destroy(data->pkt);
+	cmdq_pkt_destroy(data.data);
 }
 #endif
 
@@ -479,12 +475,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
-		dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->mbox->dev,
-					    cmdq_handle->pa_base,
-					    cmdq_handle->cmd_buf_size,
-					    DMA_TO_DEVICE);
-		mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handle);
-		mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
+		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -848,7 +839,6 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client) {
-		mtk_crtc->cmdq_client->client.rx_callback = ddp_cmdq_cb;
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 drm_crtc_index(&mtk_crtc->base),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
