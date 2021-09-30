Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:47:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E98617E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 02:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8E98617E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SemQMjLgHDILPvhB7c7uy5yCAaVGPaXN51YUQ9GdaHg=; b=KsJmPuoWF+kiI1
	Q/HjRDvgzu5AfboQ/uMB8YbiRCTwckB2ERPmrFcX4Tcy1UTbRQHGipUg8aqYLBo0cZqa2WqwTNtPG
	AWTihSUS1RuIDI/DGiGY8vtR9cm0uf2Kh6SrKkgX5Nloh3K05SArzTBZcy4hWUSN8dRRvOF/w/v4x
	btWNGkZrLYBqGKsjN+qhWuuQEwXmOhAajB3SP/eI4Hndy6mRUKfnyNL/iaoYqWUtKffgC9FJHVJpW
	9Go4YzzEogjVmG6fmiU6EodmwLOccgLyZflTtkjwTNR6aF8h3MTVfCaR9GADwWLl1Jt6YMzyJbk6s
	scWDL/AE4hewvNkIvaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVm6p-00CoAS-A9; Thu, 30 Sep 2021 02:47:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVm6N-00Co2B-EX; Thu, 30 Sep 2021 02:47:17 +0000
X-UUID: 49fee7e02b524e7591af2cb4b6020778-20210929
X-UUID: 49fee7e02b524e7591af2cb4b6020778-20210929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2057081484; Wed, 29 Sep 2021 19:47:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 19:47:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Sep 2021 10:47:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Sep 2021 10:47:06 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias
 Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Subject: [v2 PATCH 2/3] drm/mediatek: Fix pkt buf alloc once but free many
 times
Date: Thu, 30 Sep 2021 10:47:03 +0800
Message-ID: <20210930024704.6966-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_194715_556007_1A1F2153 
X-CRM114-Status: GOOD (  12.33  )
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

Because mtk_drm_crt_cmdq_pkt_create is called once
in mtk_drm_crtc_create, the pkt should not be destroy
at ddp_cmdq_cb.

So move mtk_drm_crtc_pkt_destroy to mtk_drm_crtc_destroy.

Fixes: bc9241be73d9 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 411d99fcbb8f..274e5c67507d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -108,12 +108,30 @@ static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
+
+	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
+			 DMA_TO_DEVICE);
+	kfree(pkt->va_base);
+	kfree(pkt);
+}
+#endif
+
 static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 
 	mtk_mutex_put(mtk_crtc->mutex);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 
+	if (mtk_crtc->cmdq_client.chan)
+		mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				  mtk_crtc->cmdq_client.chan = NULL;
+#endif
 	drm_crtc_cleanup(crtc);
 }
 
@@ -255,16 +273,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
 	return 0;
 }
 
-static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	kfree(pkt);
-}
-
 static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
@@ -302,7 +310,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
-	mtk_drm_cmdq_pkt_destroy(data->pkt);
 }
 #endif
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
