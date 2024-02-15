Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2309C48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiK58UkVAOSUSedMUddKNEDSO0SoHFEJlFLbMNmUzdQ=; b=gl/eeqyURHRvA49xM9yifyqmqP
	XzwgC6Xgo8dJfbjqJkSBUlnR+AgYaOnFC9fBJRsThy/KrS5Q9Sv3GbFgQ3phCrM4oAy2lPrcwHM/x
	lriZ0gH7y10e9GCSpSg6S/fryhujhqnc0yNr4jCSONdFHDBpCtj3mesdHGwarrJHD8enwTbUsJlVW
	/QrGBatmNAmXEt4/mujLcdLUWtvi8qSbiuA0n7/ojKPePLa4m+Z4Pvn5N7olkiYFz/X5YW1MXZCn6
	PvwUlZ0WtbwO2bO5dLwinx6OzqT4iCXf7QIpGPV+jDg5C6GJrq4IPWic4Id+34VPqooyO0kbdW9UX
	3oMs46dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxi-0000000EhZc-3tSM;
	Thu, 15 Feb 2024 00:50:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxG-0000000EhBm-3wRU;
	Thu, 15 Feb 2024 00:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3216ECE2448;
	Thu, 15 Feb 2024 00:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB44C433C7;
	Thu, 15 Feb 2024 00:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958220;
	bh=xJOjG1xcF7TMBorsm4SdyXtFrb+p13IDHenhHoOED0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pply8qtyHCycTwTDcxWtAAj78lAggMF7xQxPbnGPKhOJDJL3X9lm/72ENeLwGlGnW
	 T2W/JeE7YzAU0dT31xlYfp72sH+kiZn+jTo8fCVrEoy/+qPKUlwaipZ83ib/JrWplc
	 2RxsQYT3X1WZmgLNUOOVs574uLaigErmr8ERocCsy5AqwKnVS+Oji0zrBzRbzQuFGx
	 TH0gfJDOGvrFRC6rMAP9phcHjoOvbUTGBNf+X38JVfYzPaVR6NYL5CE9FCVEol5WlY
	 MKy1BuKRI5AQuxoOwm3HiVSYhZl0oix/MVP479BLS/FsyLA8nPxmY0EyW9TI0q3Vs4
	 shE9D8xkp/bpA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 8/9] drm/mediatek: Do not store struct cmdq_client in struct cmdq_pkt
Date: Thu, 15 Feb 2024 00:49:30 +0000
Message-Id: <20240215004931.3808-9-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165023_312868_7879470A 
X-CRM114-Status: GOOD (  11.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek drm driver has the struct cmdq_client information, so
it's not necessary to store this information in struct cmdq_pkt.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index df693fa268ce..0d54cbefee0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -123,7 +123,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 		return -ENOMEM;
 
 	pkt->buf_size = size;
-	pkt->cl = (void *)client;
 
 	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
@@ -139,10 +138,8 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 	return 0;
 }
 
-static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt)
 {
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
@@ -156,7 +153,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
-- 
2.34.1


