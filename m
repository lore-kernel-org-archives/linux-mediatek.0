Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE97C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJwUPM11t42UuwpJ89PMtZvipzG7Dwu5AaEmZFANlDM=; b=AZ5wTUQ5HflOec
	bEaRuPr0TKKdIgU86jFFqQN39FHCuLpA59Flf3/2WnTaMxRfsb4jJvtZUvEgRHI/gA4vKU24MTPCg
	0HkS27tPkYZ5VnXrG1WcdHCPhIoDc4GwUsuXJww3WJzYtESFzGGrb1nTH9RdEDj9sAOHYvaGFiGg9
	kY46B5xvkCt34pCKj/XzBPtbGHs7iAzoIg7IpNfqpe2pbBT0gT2y60obfqRkmIUJRC3hjXfQtDamj
	H2WVz/Y0dsQ/mfyuUDeZhKijWay0DgCoXxodxj6n+5Zab8DqQYbWbG6Ox11NFLld3lLH1JgXP9nyy
	qRAWZeVotuTvBt19EqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msfmF-00B7Io-LC; Thu, 02 Dec 2021 06:41:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msfmD-00B7Hf-7z; Thu, 02 Dec 2021 06:41:06 +0000
X-UUID: f88a1012dc9a4b77ab2d593867453504-20211201
X-UUID: f88a1012dc9a4b77ab2d593867453504-20211201
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1462471616; Wed, 01 Dec 2021 23:41:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 22:41:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 14:40:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 14:40:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, jason-jh.lin <jason-jh.lin@mediatek.com>
Subject: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
Date: Thu, 2 Dec 2021 14:40:39 +0800
Message-ID: <20211202064039.20797-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_224105_326194_63FE90B3 
X-CRM114-Status: GOOD (  15.70  )
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

Add devlink to cmdq to make sure the order of suspend and resume
is correct.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 43 ++++++++++++++++++-------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0b4012335e7a..612d1d69c16c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -60,6 +60,7 @@ struct mtk_drm_crtc {
 #endif
 
 	struct device			*mmsys_dev;
+	struct device			*drm_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
@@ -159,6 +160,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 
 	if (mtk_crtc->cmdq_client.chan) {
+		device_link_remove(mtk_crtc->drm_dev, mtk_crtc->cmdq_client.chan->mbox->dev);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
@@ -902,6 +904,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		return -ENOMEM;
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
+	mtk_crtc->drm_dev = priv->dev;
 	mtk_crtc->ddp_comp_nr = path_len;
 	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
 						sizeof(*mtk_crtc->ddp_comp),
@@ -969,6 +972,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	if (mtk_crtc->cmdq_client.chan) {
+		struct device_link *link;
+
+		/* add devlink to cmdq dev to make sure suspend/resume order is correct */
+		link = device_link_add(priv->dev, mtk_crtc->cmdq_client.chan->mbox->dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link) {
+			dev_err(priv->dev, "Unable to link dev=%s\n",
+				dev_name(mtk_crtc->cmdq_client.chan->mbox->dev));
+			ret = -ENODEV;
+			goto cmdq_err;
+		}
+
 		ret = of_property_read_u32_index(priv->mutex_node,
 						 "mediatek,gce-events",
 						 i,
@@ -976,22 +991,26 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		if (ret) {
 			dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
 				drm_crtc_index(&mtk_crtc->base));
-			mbox_free_channel(mtk_crtc->cmdq_client.chan);
-			mtk_crtc->cmdq_client.chan = NULL;
-		} else {
-			ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
-						      &mtk_crtc->cmdq_handle,
-						      PAGE_SIZE);
-			if (ret) {
-				dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
-					drm_crtc_index(&mtk_crtc->base));
-				mbox_free_channel(mtk_crtc->cmdq_client.chan);
-				mtk_crtc->cmdq_client.chan = NULL;
-			}
+			goto cmdq_err;
+		}
+
+		ret = mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
+					      &mtk_crtc->cmdq_handle,
+					      PAGE_SIZE);
+		if (ret) {
+			dev_dbg(dev, "mtk_crtc %d failed to create cmdq packet\n",
+				drm_crtc_index(&mtk_crtc->base));
+			goto cmdq_err;
 		}
 
 		/* for sending blocking cmd in crtc disable */
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
+
+cmdq_err:
+		if (ret) {
+			mbox_free_channel(mtk_crtc->cmdq_client.chan);
+			mtk_crtc->cmdq_client.chan = NULL;
+		}
 	}
 #endif
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
