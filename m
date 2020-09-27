Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7D7C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 23:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E76E2389F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 23:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYKik1pI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0JG8El3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E76E2389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcvOZ0Et1yrrH2oX+/Uqgq8seabZ7RQOzURZbSJTccQ=; b=SYKik1pIjLOyEw4E2APcYHJsbo
	1/iaK56MJnh0fDh4LIQd2XbzdJ6FYLnqLlAkiC+ZJbsrzL83uddh1Lbl3TxrBxco1I4ERm1L4lxRF
	g29hvNrlPFPMZ/6e57NMiXQjne1DmiX7J8k/z6aykPwXhK5AquWtRe2uyivaOZu+kWtWGSwwmxegY
	s8YqbBsnpplQh3C936u8hcBJBaAT+uKAgk7rGsJZEdj+uh8wCXn5d/myyZqfca4zYcdTsjeUXvZqa
	7ODSMUuBUjqbucnp6ge9CtrAB/yiR/mR2aLYG1RK/M2sKjUWn2LrMG9DXEUV5akKAYXg/0dSZawo7
	+T0j2YTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMfj8-0006dK-Ag; Sun, 27 Sep 2020 23:05:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMfii-0006Ux-U6; Sun, 27 Sep 2020 23:04:44 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA77223998;
 Sun, 27 Sep 2020 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601247880;
 bh=nQke9MOov7c5mbpzrlTleJeouUlfSQN45atI9kVqkwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0JG8El3REpYx4bww5AJjWCe/7Mw5hIn48fZbiIl9YscTE57ap9cSmUyrC7y4O2IOW
 +y0V5cWQuxZKc1I+dl0tpIRmLe2q7xE9IPTV3hxC2+FLDF32vN4oey3ma4oFJep3D+
 oN0OluLv5mJQ1nmszLj3C1GZcDcyoz1ybof02hDU=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/4] drm/mediatek: Detect CMDQ execution timeout
Date: Mon, 28 Sep 2020 07:04:22 +0800
Message-Id: <20200927230422.11610-5-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927230422.11610-1-chunkuang.hu@kernel.org>
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_190441_112707_0A36D2BD 
X-CRM114-Status: GOOD (  14.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CMDQ is used to update display register in vblank period, so
it should be execute in next vblank. If it fail to execute
in next 2 vblank, tiemout happen.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index f99c9d2032b8..71f770e25ad2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -52,6 +52,7 @@ struct mtk_drm_crtc {
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
+	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -244,6 +245,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
+	mtk_crtc->cmdq_vblank_cnt = 0;
 	cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
@@ -494,6 +496,11 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 					   cmdq_handle->pa_base,
 					   cmdq_handle->cmd_buf_size,
 					   DMA_TO_DEVICE);
+		/*
+		 * CMDQ command should execute in next vblank,
+		 * If it fail to execute in next 2 vblank, timeout happen.
+		 */
+		mtk_crtc->cmdq_vblank_cnt = 2;
 		cmdq_pkt_flush_async(mtk_crtc->cmdq_chan, cmdq_handle);
 	}
 #endif
@@ -674,10 +681,14 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
+		mtk_crtc_ddp_config(crtc, NULL);
+	else if (mtk_crtc->cmdq_vblank_cnt && --mtk_crtc->cmdq_vblank_cnt == 0)
+		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
+			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
-#endif
 		mtk_crtc_ddp_config(crtc, NULL);
+#endif
 
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
