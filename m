Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEA7CD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYqDsmIdVLvoRCAw+MQ1HCNricx4lrMJNZ1BVwF5Mjg=; b=2A6LIrVqQKAD2YnlIb/l+ZN/UQ
	NEbHJIek4ZqpCdWqwK3hJ143LB/ceeb3Ad+3pEsx5mlhVBz74OQ0IgMvxUZ6tj0gE4DtjoOv2DBau
	BcLjRsdOCyo+VYv2r8zvOBGb1QXveBslhU1NmOlnElTVEVhzQjeJ/sHvTBgkV9KIxrNPUebh5/ymw
	7Yfrs8YCYhiqGLsk31Z5+2ZKLNETiiYtnkLH6CZhfwVFd0FdBPoY70ZG0DwQ9rw4H84bqC9REE0ms
	FSqmnzmhnuNskVxxq8RHwVZURqV1zDVwHvjczLp+dZuX2dho+L20c8JITJJkoDPEzSW7bWjI19sg7
	HriUCR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJR-00000002OYG-2TKm;
	Fri, 19 Jun 2026 12:27:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJQ-00000002OWg-0HWj;
	Fri, 19 Jun 2026 12:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 818C1601F4;
	Fri, 19 Jun 2026 12:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88321F000E9;
	Fri, 19 Jun 2026 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872027;
	bh=UYqDsmIdVLvoRCAw+MQ1HCNricx4lrMJNZ1BVwF5Mjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oiPAkuTPGHS7rb6SKX25szPcachjtdvpfiXTY1AzWh2eCGid8PL4jmgFAIl2EaE3w
	 xlU9jcDAYlOVvKLikqTuMnrpszjbwGT7u4nFuAiytDxpSwWAkYYmA4SdQL9XDZblb9
	 s4BuFdaKgHeVJ13hqWBjV8VkoxiYlm235mi6F9HqTTlX2a4h1WGfVwUapk5zLCUcuX
	 n/MVq9N+OhEoJEynKeU+gAM7H7ZSPEmVaU1hvie1uu7FhYnUqVNnG3/kW4f23x1iCL
	 KHZG+MkXh6dTnZ+s15X37k0zVAC1vtVQrUjR+4jgl/aJ4Tq5g/FJGYw2ONlTEDGF7y
	 Obwgby0LJfDeQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:57 +0200
Subject: [PATCH v3 52/78] drm/mediatek: hdmi: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-52-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=mripard@kernel.org;
 h=from:subject:message-id; bh=X3YmX9YPN+MlLE1XC8WayfqLiWsnWAqBlADVy6f2NbM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpgzTebdw+i8M2OYrMlP5TelvJ0bPGdu3XU6+IbM5X
 qOnOvd5x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI21PGhrUBXEK3S+TS91gr
 LVXKK003zTWY7DMzd7P1fdON+2YUaVWt61aJv1nlUeCeGBPKJb+OsVaAW0nn+xEZde64P8fMi9y
 yQuU4dnuv3Gh2pPXVxIP9cxkt2t/aMs06wt3plRRm+idmKgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 38a7c7953874..738090a47176 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1070,11 +1070,11 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.mode_valid = mtk_hdmi_bridge_mode_valid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = mtk_hdmi_bridge_attach,
 	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
 	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
 	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,

-- 
2.54.0


