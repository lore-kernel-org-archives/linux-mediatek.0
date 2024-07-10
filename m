Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE96AC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQa/ppt1OzggyP+AWh3rSH8HcIHGrzGpk4iB1JmvhQ0=; b=2uJfnUE5e76xgDIWrT4UDFkwMD
	HtA9+6S+2txTO2fEEpD//ocwZSbRKkDYxQaFA2Z5YaxA5tdErbwlMe8tPifLDugjkb05u64/eV5x8
	HtTyVQzKUm5yt9q2CuHJwMblrSo89eWb5xEQI3FyyXUJRyUn8rhAuXmgzBQ99X3DVrpOKVwzNWw+u
	QAjKQphDvwVOH2OCBzOBdpRgFgFkBvC4TErnQjYjBeLVdJBqHsDCIEXHhwAIqapD+Pv0MlDLxHnJk
	AvwWXzuSEo2HcaWyy5YUqgGpUfyFlBALCJXaDKnf2QdquS9KDNoBfs7jnwnFCOHtyQLMYBAMd0WhE
	HmVX1+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSpq-00000009uaV-42eX;
	Wed, 10 Jul 2024 08:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSpI-00000009uIw-1RtN;
	Wed, 10 Jul 2024 08:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AF45619FE;
	Wed, 10 Jul 2024 08:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8879C4AF0C;
	Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720600642;
	bh=mpbbUI/mfwuOOro+o5eOZMLj6A6beyQDhQ6pgkpGycU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WyproQ6Ok09KxPh5i3X68h/IMVMV8hpu+9K1W5PGqCr+8OTwIi/0KCWkzy4qT5VuY
	 LOnyBKb03nTmqiqmCUXNAclGyhySdoc1gLhlaW1R/IeshrDlPzMjvCTn8A+JCeLL/N
	 06hI6jpFoJjVp9II+rMww+Yq0XG61MT7IaFeG6yPkNVmwFWxGj0SW49DgTP3wk7AcM
	 A2AwU2entnR/fdUPsegQOQI4NTQ68PQfLzSu/3mUKqLt42XSNIieHxTnEYXydPMbFp
	 x1i0lo0Ubw7kBF4SnGuP+WFOe6mMhKco50DD6D3y+LjbHMfGbTl2VZ3rmVzLa1boRM
	 xON0EgFD0BH8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BDFC3DA45;
	Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 10 Jul 2024 16:37:20 +0800
Subject: [PATCH v2 2/5] drm/mediatek: Support "None" blending in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-alpha-blending-v2-2-d4b505e6980a@mediatek.com>
References: <20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com>
In-Reply-To: <20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600641; l=1135;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=V+WmuBOlE61kgcB5A/JpymRNWhSW2cZJELqH7p6yZBM=;
 b=qo2kqnA8BYODr1XXhQEwuQy1ZySuB5FV/+zsYdB9VQTWywlOfLdLbbFntw8gDVjlJfaZGWEuT
 qNjVJikekxxCiDFFrN/P9CS7YhwuSJmQj8ZUIjGXMcDRwEN5LkLHP9I
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_013724_472567_7BE9BA0F 
X-CRM114-Status: GOOD (  11.30  )
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

Change-Id: I9455c367bb74b75461935ecf4a3eb8e429f6e95e
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 9dfd13d32dfa..80ccdad3741b 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <linux/clk.h>
@@ -175,7 +176,8 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con |= state->base.alpha & MIXER_ALPHA;
 	}
 
-	if (state->base.fb && !state->base.fb->format->has_alpha) {
+	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
+	    state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
 		/*
 		 * Mixer doesn't support CONST_BLD mode,
 		 * use a trick to make the output equivalent

-- 
2.43.0



