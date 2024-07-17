Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0090EC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 05:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsRc2n3oCfr6oqnbZzoEB49GV1kdxI9bRVHPnBndTcY=; b=XdjR6OKnGieDTEuICEiDFKFv+5
	jIsCtvWkARI0XH/Zt21wKcxjzpHDhANaOh/aezqKrlB/4RDvPDhe58CZnV7L0Ass5mq1ExF8BlyQi
	W44+FrWisYwKtLtpVIvdeCvViMVBKuy+YeGwA1qyoHYSd37LbgR1y07GDQdGsKDQ9CexloUROMODc
	kW53iiSGVUMN/w9OXvPba2GRx20nF0Cuvs423XtfGJ5W+GYBy/Fb+2LHAF+yW2tMLdiAsJzDTsj0F
	u0Etxn7+9U5s+xOc9bx0oAmdUorH4WBcVu4c7COha6X8Ph8RDbXeAFMPsrlDdZSvpd25yxll5BJ3J
	pdC+04Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxAQ-0000000ChRw-1ia5;
	Wed, 17 Jul 2024 05:25:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTx9l-0000000Ch9L-1ICV;
	Wed, 17 Jul 2024 05:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95A5BCE168C;
	Wed, 17 Jul 2024 05:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D7BBC4AF0C;
	Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721193886;
	bh=tfabwBvvONPi6G1imBOAg7bICWXSe8zF8QtpBuR5L0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oKukNrcwSDXrJfaioEr6rzZWSNIufWoJNGBvkR3N9+LArG3s2zEYYQRrkujzK5zGm
	 t94GMjd5lxRPiQCHYHE5vfIDT9Es4cxYnDuI82gOB+AtYTdRwJ+hOj4FpwmvsokfzQ
	 /13i1iNYUG4HovFqUB2KzP6A2iVhRN1ptyGryfAIPYofQRNCW/c8MpKQjmKi+cBqwe
	 gjNAZ59P4npPQci/FLIoKLCHx6KLlyic8FFPWhF5w1NgF3wzJCf1RX1/x2yvCknNlL
	 9e35kv4pVAvTvtnrmAQZhGqjp4EUMswDSDt3WqEcMKbwLemzoLVVj7QN85yHDxWv1Z
	 UkVJMoq9muGxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A231C3DA42;
	Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 17 Jul 2024 13:24:41 +0800
Subject: [PATCH v4 1/5] drm/mediatek: Support "None" blending in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-alpha-blending-v4-1-4b1c806c0749@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721193884; l=1452;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=XPDvZ7xzyMMnOIwBspXj+lmld62ksCxAgrZn9GTIqIg=;
 b=Wy9P+FVTGGbiW8DLQqinrUGhy4tek0KY1cjIauc/PX5eCpPsBFzUkqfUB0/w5gKKXXs7pEK33
 u4iJbnYii6OCcFP5B+sCDyImznSS+DZVc5UtLSlMO9l5AKEG6OX1weL
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_222449_742568_50C7324E 
X-CRM114-Status: GOOD (  11.52  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "None" alpha blending mode on MediaTek's chips.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 9d6d9fd8342e..add671c38613 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -434,6 +434,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int fmt = pending->format;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int blend_mode = state->base.pixel_blend_mode;
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 	bool is_afbc = pending->modifier != DRM_FORMAT_MOD_LINEAR;
@@ -463,7 +464,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
 	 * affect the result. Therefore we use !has_alpha as the condition.
 	 */
-	if (state->base.fb && !state->base.fb->format->has_alpha)
+	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
+	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {

-- 
2.43.0



