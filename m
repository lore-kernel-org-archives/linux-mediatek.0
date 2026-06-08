Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D0CCD8C9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBVPGNx1EY/l/eeMwPmgE1vBdHLcVJ7J9n0XGA+c5vA=; b=dwjx5UzABX0IKbs1tTf9zq5L3q
	HXchf0hGtkVM3D6TbdF7pCRNSImnUbIyQcB+mS+o89q0tn4AfHnfekjCrwxT/JGzd0JLvy+2ymsRo
	5cRM8YIF+gyEUySq0HoNmmXWft+7CYUwrDBhz6qiraVOl59/3fgkKcf4flIVmP+fTKGqzcFNSWbYW
	kxz7pbEnEGyRjozntTlGJiSbKNco4cR5oi88qWLflfPECa6lPN2UUN8Ud2yOfAdOvt2tSdA6qFULX
	nJl/fTRyUPUF9ctmbKCEGkYaaxmxt1TAHUXoPGc+7Y5l5d3aN37kbsh3u7cvP6+5zXrjdF2L7Bwvu
	OgN7fAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7r-00000003mny-1Rek;
	Mon, 08 Jun 2026 14:38:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7p-00000003mlN-1Otf;
	Mon, 08 Jun 2026 14:38:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1870F44451;
	Mon,  8 Jun 2026 14:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BD61F00893;
	Mon,  8 Jun 2026 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929529;
	bh=eBVPGNx1EY/l/eeMwPmgE1vBdHLcVJ7J9n0XGA+c5vA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PZr9XCb+domVHIIJ/FN32ZCx4zpDx74VAqZ79CGSfVkvnD2L/lQF8CxmOYFIRdmJ/
	 mp9CiNti+qfIKOFGtXStqqGvMiB21wZ75DPACnTgltR6EFuuachksjlqy9yfL9oIK2
	 NDHq4x9GxuKprKPcUqC8KkVCUwYCO+hEYUxOfvOyNkPbtW+BI3HnXNde6HrNoYYFs5
	 IFsvOupK/cbLENTN3vYvwD5CQ6Wcgz/se+8oTbdF2LDpyVi8/gJfoMBOF9kIs9JtvY
	 cgsPrGZ57TbNiEX8+7myrKdrEndSI8FUsPRud0mXGc5P6qciv9IgHWWDoci1kko8j8
	 MxtQIs3u/T3wA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:35 +0200
Subject: [PATCH v2 53/78] drm/mediatek: hdmi_v2: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-53-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=mripard@kernel.org;
 h=from:subject:message-id; bh=c+jKUnk4zx9DKEwaK16SnVWNaf04syTUxCbnrneTQ7Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql2Okja7d0z/6xyqmu1QvWMo753euZeSCJ7UrJ3+x+
 3Px+6+LHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiZt8YGw7JHtrey/PE1e+k
 5m7vReILuOJceB3O3zpwYKfJgv/Wli7/tqrz7VWO1bA/sizzQO57bcaGszZhEw4q3jZ5Ny+qUcd
 YpV2uJ/OKf8DmQzPbjAq5N1bPDu/N/7/kVox+6945r0U2XXYCAA==
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
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..d9316d30fd5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1324,11 +1324,11 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.atomic_enable = mtk_hdmi_v2_bridge_enable,
 	.atomic_disable = mtk_hdmi_v2_bridge_disable,
 	.atomic_post_disable = mtk_hdmi_v2_bridge_post_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.detect = mtk_hdmi_v2_bridge_detect,
 	.edid_read = mtk_hdmi_v2_bridge_edid_read,
 	.hpd_enable = mtk_hdmi_v2_hpd_enable,
 	.hpd_disable = mtk_hdmi_v2_hpd_disable,
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,

-- 
2.54.0


