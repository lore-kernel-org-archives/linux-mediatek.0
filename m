Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6ACCA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ufFwf8zIVi48kXbDMRijqpdVpAj4FM/2/NcJjZVRgrI=; b=Q5qj9riV6RXNOV
	Ki77lcYxbBn27d1kzL84FQTvuMRAe8C4+3OBnKMgUENUIgIknCBr8ORUbHdIq640t/tvrKDLuekdE
	WcGrmCot7VXDrBeH1wVgRfebJ7DPR95MkkAxOVuCVR374QR/4w/cfAb00CcSdy2v2uXOpvRCDQyrh
	9hk9m4KB4RlZY7KmAG/C0dEupDZOVe1vzhlTyeKnUhSRa1GlOWizS0UQxdA13WG7BLhxep4lnvmMC
	RHNiCNgk/TEzwaLgr4fFTmCsxYE+5QgpDfM5cvHnMiQcGthrubeQC/PpSsUz22BTtT8sYQX1QPw3e
	avy2Yd/pB29pdG7LjElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0wA-00GnG3-0L;
	Fri, 01 Sep 2023 09:59:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0w5-00GnES-2E;
	Fri, 01 Sep 2023 09:59:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AFF4BCE2379;
	Fri,  1 Sep 2023 09:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD1DC433C8;
	Fri,  1 Sep 2023 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693562365;
	bh=plaayqcwd0Pw1QVSUvWUHkum1RtiVPbMvX2UxvCAEBg=;
	h=From:To:Cc:Subject:Date:From;
	b=fqo6BnowGrrTIQ/G74gBuald2l0dxpDLr0nl0puQP6QNdZH+Z2RW3YmtyTcZXlt+Z
	 tSq5cG2YmTa0MbYJi9hJap1fvbcdfgo2WaEksdNnocXSRUDrr9G41yQrTkm1aGiUDo
	 GtOWGih0DO0nZ3h0w3DebFG1HqCcpPtw7ifEXRh+rnZd0kFhvHx2EBbWle/SC7CMeX
	 4V2tKNMXkZd6IZboJ/c6HTGUq5iWlto1/E7l8JR/FxXKPWRCYH/89TDvGGhUBg7JBj
	 VRvkPZTvX0FFJ46Wus2YB0x+RbfGB50+gzTKW5pgQUJBPuNGK6/B0Ctd/vMacRL4Zu
	 L5uU0CiGhQgcQ==
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] drm/mediatek: fix kernel oops if no crtc is found
Date: Fri,  1 Sep 2023 11:59:15 +0200
Message-Id: <20230901095916.3599320-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_025929_937434_C591D758 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drm_crtc_from_index(0) might return NULL if there are no CRTCs
registered at all which will lead to a kernel oops in
mtk_drm_crtc_dma_dev_get(). Add the missing return value check.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
v2:
 - collected tags
 - fixed typos
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..2c582498817e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -420,6 +420,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	struct mtk_drm_private *private = drm->dev_private;
 	struct mtk_drm_private *priv_n;
 	struct device *dma_dev = NULL;
+	struct drm_crtc *crtc;
 	int ret, i, j;
 
 	if (drm_firmware_drivers_only())
@@ -494,7 +495,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 
 	/* Use OVL device for all DMA memory allocations */
-	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0));
+	crtc = drm_crtc_from_index(drm, 0);
+	if (crtc)
+		dma_dev = mtk_drm_crtc_dma_dev_get(crtc);
 	if (!dma_dev) {
 		ret = -ENODEV;
 		dev_err(drm->dev, "Need at least one OVL device\n");
-- 
2.39.2


