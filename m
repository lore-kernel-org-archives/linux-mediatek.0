Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31076C2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJGNTUWoLXx9gSkpuUVeL/+NQQtpgnmTf+/KGroeScQ=; b=j4oCRvaJU1nsKLvb4DakE6vtBz
	BPp2W0zE3pgszg259fliI0LvjtU3/sDKy1BrvdpXLMOcnvemSxr4EEfEcRdAP2P9kcUyiXhi11FzM
	ZdeQqrDBfzTg6sba1hVTGExufCu5baaUd4iK0urI2pmC/3ffHjvRjKzCdDks9Ra1ldYv+WbRh7G/r
	lPOHJ8LUfHzTZGElkMncdunlRZsGHwA2bW27wIxLRfHjPwU6dxj5X3Mnp/yDNTEqJE6JiITWnYyl4
	rJEFgNasTOCrGstzJ7OweVI1l4EsHgYdMEtdoFvav8TysKK7CGGnCivdwIZJNdiaDoDTAqswZm5P7
	JlBo9H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz62-00000002DM8-14gA;
	Wed, 19 Jun 2024 17:27:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz5Y-00000002Cxb-09aA;
	Wed, 19 Jun 2024 17:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 763C5CE213B;
	Wed, 19 Jun 2024 17:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BBFFC4AF0D;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818032;
	bh=jv4d4Oqc5NFEU23JiIU4PcDVItnFp27R9cyRY1Vnzh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dVxn9UF3ZCDJ7hmqWCGoH64f9+8D3FG6Hn7aJSlGePexeuo+7vGEHn/yh+tyQ7UlE
	 if3dreFQ9aR5ax5K4LntNvbyYJ6tUG8Kf5xZnirTOx6bTlR5vhgqE71x+Vd9bFHdDk
	 l4aWR6gKRIGzd0Rzv449PZnQxy8iNCBqTbw9mvamy1Zv3cs7yntmmVLVkpjGpFBFB1
	 qosAh52qS7MjEIeg91mOL0HuceLUw8xYw4ILF21/ZVaAewoZBfS+JcK9lEmQtNFAz3
	 1q78fV7qhCSoC/oRg2raFONuMkXfSYqzih8PcsNz8c8nzJtxM21D9cBrpkBP3ihx3k
	 sU2yo7tzpJ/VA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F3EC2BD05;
	Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 01:27:10 +0800
Subject: [PATCH 5/5] drm/mediatek: Support alpha blending in display driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-blend-v1-5-72670072ca20@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-0-72670072ca20@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718818030; l=2212;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=ZXEEgZdYr6sFLsFE3tObHfLlq5Jjp3gd57RSpJwiaWk=;
 b=cpty0i5L97fiTXnZ0dYhFyfpl2UpFSYmEhpFLKHWC0s/PCJdwNQEYos4jPVBR/lcE9LJuActy
 ELMxdETYKawBFMZNbBHIXqs2vYwFTAh2OPJP9YZv98dfNiHvIeaE98j
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_102716_586929_404A3EA3 
X-CRM114-Status: GOOD (  12.60  )
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
Git-146)



