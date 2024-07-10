Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C828CC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x7takVZpMcwrLmxaJMsAHbBygKIUg0Lk9HbAHRqgyk=; b=5F4LaI/uZfHG2cVJNDQ3puP2tm
	a1zAip6NoSRVcu+NE4pkxPTX2v0o8obS3hsCcMoLrSwwLpuNmsZ3gNBDGh0UeYpCkWKJ67yTdpyxv
	20Oc2KwFqSCnGAKOJ22RS7dYhE97OX17yYhzvwNuKYyHLRGNKdkKpKY0BRgM6TzpNT6Uoqab2D2qd
	F/WZ36lvSJ2Z5axEH72n9VVayArLXzS2pWg0IMXDKMeUdEEQ7uOZm30NQ4rZ4PWBKSujUt48bcBJc
	po0iuYxazkJ/t/R0NYoaAAUFrS24sUoZilBK0XcckLwaUqeje8NQSOyu/9dLc28i3L2tP6L4zGbuv
	itAruZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT5m-00000009yKW-28xE;
	Wed, 10 Jul 2024 08:54:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT4N-00000009xhW-2Bdk;
	Wed, 10 Jul 2024 08:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 815F5CE165A;
	Wed, 10 Jul 2024 08:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A075FC4AF0A;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720601574;
	bh=/Qr7i785NyZoohBvA3+3RT0TBw/MYaFLTRvo1jxRrWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T45LtMP5wRsE5Ej0WKRR9LkjyAmoyKz5/rduzGT/jyLgqFG1r/2WXEG9uyJmp5BIz
	 dYg02tMV8lN/bGok++PrQ8w3gjibm9fkWwal9o5L2B1j3Zpm9Uuar/IE2FotIkcOA/
	 Pd/Wmvx8A1JkgEteg3jrvBUNuNEmj9xu8p7Uuu/HbP9tc7PGNE85wg27KAWahpGtXf
	 1I4X0xmbBJtPqYw8pNSf+f8LbUWSEO6UeD1xrfaVBQ0kxScIPsLS4Ob7qVLvYmE6N2
	 U7+lyn7RcZYtThjjJ9PidlKz7/Vdz0yiGnegm27fG6AiXOZ/MsPv6epuXXcz5ZtP8L
	 inORK0XAq18hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B03AC3DA4A;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 10 Jul 2024 16:52:52 +0800
Subject: [PATCH v3 2/5] drm/mediatek: Support "None" blending in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-alpha-blending-v3-2-289c187f9c6f@mediatek.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
In-Reply-To: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720601573; l=1081;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=NVAbOi4mzHiTnH39+TnJjdV+FkeJtbkfCIlftGcvapk=;
 b=UlEWkcPuj+I5gioedwm26FdRkzB4Ci1DkJbei4KhGpz+0voJUedCYLzEwZnsCPWsQzWjc593Z
 vwS+slcoeYLB7huq8B+wvfVNiu/Qpklx8a+X1eZub8aYT66+0AXTyg/
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_015259_779358_364EDB42 
X-CRM114-Status: GOOD (  11.18  )
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



