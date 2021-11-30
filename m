Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCanHOw2z36sFuOj6EQJnh2gm4Neytx+m2QDm2Vty0s=; b=ywpQiScAS7inK2
	yq8bUNvI89yJwu+Y4iHbpzbhKUsck4YOo+oeBCbSbVeM7SnE/Pf7sGdzMgcw3br8gb8GwaHYobC6K
	R33HoLggPqYp1IbDUcYjhqdUveA0cyheFmJCU1wtl9/wBxuUsYe5FSuW0vPig3DCCYalzHrgSfAt3
	eYqinCg3NN21h5YMoBhxnzxT61I/9IdrI/bxDAml/QMYz6W7X44UrmD/77QIShvVEzk/g+czdEQ2E
	DXrC2T502yY36gmJAId3b/aCBU5i6joMGzxq1UKameY8+gcgNT1k+VYbgqdzVY3LeOiz9VHcxW+Bj
	PL3NrkrzzMX6X23udiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6u4-006Iuf-LE; Tue, 30 Nov 2021 17:26:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6ti-006Ips-Vu; Tue, 30 Nov 2021 17:26:32 +0000
X-UUID: 7291b87e4e8b4cf58e91357a422b543d-20211130
X-UUID: 7291b87e4e8b4cf58e91357a422b543d-20211130
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1303647350; Tue, 30 Nov 2021 10:26:26 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 09:26:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Dec 2021 01:26:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 01:26:17 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, jason-jh.lin <jason-jh.lin@mediatek.com>
Subject: [PATCH v2 1/2] drm/mediatek: add blocking config mode for crtc
 disable flow
Date: Wed, 1 Dec 2021 01:26:15 +0800
Message-ID: <20211130172616.9127-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211130172616.9127-1-jason-jh.lin@mediatek.com>
References: <20211130172616.9127-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_092631_045238_51D34DAF 
X-CRM114-Status: GOOD (  13.57  )
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

Change async cmd to blocking cmd for mtk_drm_crtc_atomic_disable
to make sure the lastest cmd is done before cmdq_suspend.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 62529a954b62..e886d299813c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -56,6 +56,8 @@ struct mtk_drm_crtc {
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
+	bool				blocking_config;
+	struct completion		cmplt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -584,8 +586,16 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 3;
 
+		if (mtk_crtc->blocking_config)
+			init_completion(&mtk_crtc->cmplt);
+
 		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
+
+		if (mtk_crtc->blocking_config) {
+			wait_for_completion(&mtk_crtc->cmplt);
+			mtk_crtc->blocking_config = false;
+		}
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -698,7 +708,9 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		plane_state->pending.config = true;
 	}
 	mtk_crtc->pending_planes = true;
-
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc->blocking_config = true;
+#endif
 	mtk_drm_crtc_update_config(mtk_crtc, false);
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
