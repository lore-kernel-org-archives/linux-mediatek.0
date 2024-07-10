Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE17C3DA49
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeP6HKmoe5rlSKsnhYW82P6YhdsQQkAY4rtkyK6NEZg=; b=pd7R8b64hcysBZSMRPA7Sd8PuM
	m396xSgUXE5w7ES4CUeShNtoh65wq7D72uEquIpNxKlOZ3p7EGP+uIURn0cUH5WRlpS2Qoh4mliL+
	N/GyjDnFiIAxJ7uSGdzazj6wMhUte/ygM4nkdMz4+vCJsZq+m8ZdEfxUpDNecc1N8tMa9gSOD1MbC
	L6GUMvmx7osQtVslObCWn++D2OlRFLu4KsbzCC/JdvhGYA01p8yZrNh9OoMOUBsQwsnonjvHKVQjQ
	1B24SVrIF7d677cioS+ferk++AscM4mojSl9Jb/s3xXM03nrQkaPvJYe/Mtfqi69Rg7hYmytvLklM
	4YfD29Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT5J-00000009y7E-2brt;
	Wed, 10 Jul 2024 08:53:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT4J-00000009xfa-4AcJ;
	Wed, 10 Jul 2024 08:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AA9561A08;
	Wed, 10 Jul 2024 08:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C59D8C4AF10;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720601574;
	bh=fyYXOHu9fHp+yDLi4tjopWasn0OOj6F3xVVYEta73ZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=agMy0ZvPA9AgNZn1oouu2BL7h3fSH1dC8oL5gaXTLb8jDdc/L42xSzg+NrzwpoUUW
	 YdabgmkExMiNXy91Ea3vTUyGEsWCAYoA3sqOOWIKG4sQyXHDKyrvkGjnBqQe5qjQtN
	 7p8ut5y5CI8kU3wr0hKevB9DD26v7OlgJdcwHG1Unkb7TOldNZ01vnFEc2rBOiJZZy
	 AG+WqHyKIOHS1vP6M0AJ8C7TOSOQYWSRT1SxjBXZHJkibj8T9P3UtLo+U8eBZfji3l
	 YeI1WtHI9mHaQK/VXMP/OolrCaxWW544ZB1rXEqc17aYcJSd1GV4GG0doP6Hbt+jLc
	 DAhFACn2Fj50g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA44C3DA45;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 10 Jul 2024 16:52:55 +0800
Subject: [PATCH v3 5/5] drm/mediatek: Support alpha blending in display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-alpha-blending-v3-5-289c187f9c6f@mediatek.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
In-Reply-To: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720601573; l=2210;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=NXMVY+5up48Xsv5+9pKY3kYmUYHXnlx5rItB6cJy0f4=;
 b=g2exBNCESLyv0OqJnjsb6aEiZ7/B0/C+zT6GweHyHS0nO0LEBQ6E0tfIYh3ix4JSSOu48bEH2
 rlbJA5vUiPpA+rpTx5lzAlHRI6UtPp/+0gK9zVNnmvBcw/enxuJI6jE
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_015256_176706_EC1AA1C0 
X-CRM114-Status: GOOD (  12.80  )
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

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

For more information, there are three pixel blend modes in DRM driver:
"None", "Pre-multiplied", and "Coverage".

To understand the difference between these modes, let's take a look at
the following two approaches to do alpha blending:

1. Straight:
dst.RGB = src.RGB * src.A + dst.RGB * (1 - src.A)
This is straightforward and easy to understand, when the source layer is
compositing with the destination layer, it's alpha will affect the
result. This is also known as "post-multiplied", or "Coverage" mode.

2. Pre-multiplied:
dst.RGB = src.RGB + dst.RGB * (1 - src.A)
Since the source RGB have already multiplied its alpha, only destination
RGB need to multiply it. This is the "Pre-multiplied" mode in DRM.

For the "None" blend mode in DRM, it means the pixel alpha is ignored
when compositing the layers, only the constant alpha for the composited
layer will take effects.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1723d4333f37..5bf757a3ef20 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -346,6 +346,17 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			DRM_INFO("Create rotation property failed\n");
 	}
 
+	err = drm_plane_create_alpha_property(plane);
+	if (err)
+		DRM_ERROR("failed to create property: alpha\n");
+
+	err = drm_plane_create_blend_mode_property(plane,
+						   BIT(DRM_MODE_BLEND_PREMULTI) |
+						   BIT(DRM_MODE_BLEND_COVERAGE) |
+						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
+	if (err)
+		DRM_ERROR("failed to create property: blend_mode\n");
+
 	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
 
 	return 0;

-- 
2.43.0



