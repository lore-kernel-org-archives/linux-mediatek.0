Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1718BC3DA60
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 08:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mktQDDSOdDvLY8ZQFhdHj5Os6HDFpXTNoyFUdVe5tI=; b=yxns902z3M1V0Xj+Vt5TCf/YiJ
	ldTRyB+7OuK2MaxdbrA3EctULUSxR6NWYsW8ZQsHwQAl6Iv+N57LtcYGqPwsN+ztD8mElpp5A+EpG
	34oX30jCAtKl6T0E2vUx1GwombCn00SQyyBfR+n6eUGn+8ymLu1j/iLNVWx9PgrmeBQpvw7azzZ9q
	7T58VUr3CPj3FygjVyoa2X3EE4u+AWuPl6s63nIe/2jXNIPAwoXhrsnpbWlKO/gubpfrozhgmEhOr
	CjeCh7eicubxns5lFTw+K1/SpH18XkXPxGI/wTAI+4tuorrIQWfNrJW8Lta1ySaxZM6tO53iuzhYj
	lKsn3DVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMRu-0000000GNJQ-26CM;
	Thu, 18 Jul 2024 08:25:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMRY-0000000GNE7-3s6E;
	Thu, 18 Jul 2024 08:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721291089;
	bh=ZgrQFJ7/oULh9Q6A7i2K3WLnjzFHQSZPA2NyP1+Yons=;
	h=From:To:Cc:Subject:Date:From;
	b=dOaL89MtzMwa9QoFcu9LIp6ohBOI59uJ0Gcnsn6uGpM0ub+K2Qf/bnRrW8BiNEG3h
	 QthT0HtMDJ4zlqEjejGxFcmQtbKtg3p18vgfwwUYFY9ExaJj1N2RW1ecY2QlizHcC+
	 MB9FPDZa8ghV1H/eJYnPtH/+bSWILA0mZPOVp7NcAK6kLJyYW0XAuyweFcPifuAyKt
	 K2Q+X2CA/9U5WRU+2lkL7OOFbcBz5HF/ZhFjjeQCZnhFkcARCxjLrIJ9VT/0LqoH2s
	 N5qhU5p6s6Pf4YiLB9W/CZpz8xUVgbcpJtEDr9FjAGN3VCubzJwJE3y9r22kgDBK22
	 Fu7u1o8sxE2mQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BE69D3780EC6;
	Thu, 18 Jul 2024 08:24:48 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] drm/mediatek: Set sensible cursor width/height values to fix crash
Date: Thu, 18 Jul 2024 10:24:10 +0200
Message-ID: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_012453_280122_19B7D75F 
X-CRM114-Status: GOOD (  11.80  )
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

Hardware-speaking, there is no feature-reduced cursor specific
plane, so this driver reserves the last all Overlay plane as a
Cursor plane, but sets the maximum cursor width/height to the
maximum value that the full overlay plane can use.

While this could be ok, it raises issues with common userspace
using libdrm (especially Mutter, but other compositors too) which
will crash upon performing allocations and/or using said cursor
plane.

Reduce the maximum width/height for the cursor to 512x512 pixels,
value taken from IGT's maximum cursor size test, which succeeds.

Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6f0b415a978d..b96763664c4f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 
 	/* IGT will check if the cursor size is configured */
-	drm->mode_config.cursor_width = drm->mode_config.max_width;
-	drm->mode_config.cursor_height = drm->mode_config.max_height;
+	drm->mode_config.cursor_width = 512;
+	drm->mode_config.cursor_height = 512;
 
 	/* Use OVL device for all DMA memory allocations */
 	crtc = drm_crtc_from_index(drm, 0);
-- 
2.45.2


