Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB2EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YF46pDrSb00t2g87J8RuBgAgqJ2ayw6d6d0khg8VAJ8=; b=tAtykshtemQSRG
	GhRD0hkuJ694s6Sem9ftsbotOnvaRhllg91TlHfKPkOw1q9yMMbkwD9ASgVdyHA6Cav24Cxj6fV2D
	9A+ECi87/bUEu0nKmdhYVGtEjI/7BIvR48dZbobRKbg6T8P/YZyNSvsO0AXuktAF75I0rQ9+5g4Jr
	/UN0V61BeuOrRtWCStmmUJx5p/Qzu+wubwNEkO49dspNnPivgzpTycoPipZHSyVEtJJ6IlVA3TZLP
	Go8FfGgaY0Tf5pYwluXzKbNpJCguU5dMr6NYyb+KT3swb6X4hTHpNmZW8U3scI7pHL4jIK3jSX1ze
	pyCbj48Dumq7PJyHFAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msfms-00B7Wy-No; Thu, 02 Dec 2021 06:41:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msfmE-00B7Hp-Az; Thu, 02 Dec 2021 06:41:07 +0000
X-UUID: d9157ece28f8487f9a9ebd0709b59d45-20211201
X-UUID: d9157ece28f8487f9a9ebd0709b59d45-20211201
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1945794270; Wed, 01 Dec 2021 23:41:01 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 22:41:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 14:40:59 +0800
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
Subject: [PATCH v4 1/2] drm/mediatek: add wait_for_event for crtc disable by
 cmdq
Date: Thu, 2 Dec 2021 14:40:38 +0800
Message-ID: <20211202064039.20797-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_224106_402132_07BBAF27 
X-CRM114-Status: GOOD (  12.90  )
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

mtk_drm_crtc_atomic_disable will send an async cmd to cmdq driver,
so it may not finish when cmdq_suspend is called sometimes.

Add wait_for_event after sending async disable plane cmd to make
sure the lastest cmd is done before cmdq_suspend.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 62529a954b62..0b4012335e7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -56,6 +56,7 @@ struct mtk_drm_crtc {
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
+	wait_queue_head_t		cb_blocking_queue;
 #endif
 
 	struct device			*mmsys_dev;
@@ -314,6 +315,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
+	wake_up(&mtk_crtc->cb_blocking_queue);
 }
 #endif
 
@@ -700,6 +702,13 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->pending_planes = true;
 
 	mtk_drm_crtc_update_config(mtk_crtc, false);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* Wait for planes to be disabled by cmdq */
+	if (mtk_crtc->cmdq_client.chan)
+		wait_event_timeout(mtk_crtc->cb_blocking_queue,
+				   mtk_crtc->cmdq_vblank_cnt == 0,
+				   msecs_to_jiffies(500));
+#endif
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
 
@@ -980,6 +989,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				mtk_crtc->cmdq_client.chan = NULL;
 			}
 		}
+
+		/* for sending blocking cmd in crtc disable */
+		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
 #endif
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
