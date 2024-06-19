Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC7BC2BC81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY5WshLFRorsbka8SSD+rFk5o1/+s5iqv2PA3gXjE1k=; b=XZVA7Z5mgYQp9jyGnnYilCjYRJ
	mbVMMBfa9/G/ayzE7GhVQcM5wzGCkSIP+mWSAKeslPRvNgPquFVSIbqpmEGVZI2d8gyknliuitxs0
	WY+HDpRzB9/PsCXnok2LMd8He5WuLiw14LAy02p75A33TT8gs1SW0rvv4GaZFYnknzw2erXNHypwW
	j7vJByXdzYQfAI1G20XEdoxBGZ3gciBAQea7gLrXTmRFjPEDjhUemH3ivLwO+uQH0Et8r4mvcsbNV
	7rw5UmZlthg0QjbjFjLgaMZ8dlRc+ODdQ5bOhPhwV58cEyIghJ2G8InvsN03gMPgoI4xOhKE3Rx6Q
	TAwW0xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKp-0000000247q-0mx4;
	Wed, 19 Jun 2024 16:38:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKc-000000023xC-2yLr;
	Wed, 19 Jun 2024 16:38:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E3F361EAA;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BB96C4AF0B;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=GMUTsruzzAYn0n7hmwAGt8zwytpi3KhL2H6cMAMOTwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o9I6UWARKhdQAarnE3m6YUch84ybDp4BeEm27PI45HX+rqb3jBMMzIH8Jhmb/9N40
	 TMn9s/1qGLUVAT2iJqPDthvSqAWKpL/bwDsWlEIiz4GYSo7bzxbaCpx9FTwJfmbznI
	 RXOdGE/jQhdQ4etIjuATVNnA/8hpz4Z9ca0sAwgXm009zp8i7VQLoXM19wJSwR+RmE
	 4p0gfvPmsYDh1VrFvf4uEqtjIqYjlE1n7HRzl4ck0cuhEGSzHr4qfhz1K35ANGe9jr
	 aW+Ub066hVO1sz8xnZbtX6awgpNObVsowN9+Hc5Uvo4Y9uyG1UkUH14xeV4dM68pCP
	 L4gFKOOVOTApw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01532C27C53;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:44 +0800
Subject: [PATCH v3 04/14] drm/mediatek: Fix XRGB setting error in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-4-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=1806;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=iVCN8PnNVHs904I6AJ55kOr+V0K7XkkYFUBoVjBPemw=;
 b=YGUI6RWS0nP5fpjX4gax+ewcdTiGdFlfVwGr3KMmRMoWefuqd/Ov64zpSE37WmTC6fSVlfMee
 Ual5RWvPhOuAj9ENdQSkMcZOMniEGfqK685rChC26tStrwq1vx0UuNA
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093847_029872_F547272F 
X-CRM114-Status: GOOD (  11.58  )
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

Although the alpha channel in XRGB formats can be ignored, ALPHA_CON
must be configured accordingly when using XRGB formats or it will still
affects CRC generation.

Fixes: d886c0009bd0 ("drm/mediatek: Add ETHDR support for MT8195")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index d7d16482c947..5c52e514ae30 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -153,6 +153,7 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	unsigned int offset = (pending->x & 1) << 31 | pending->y << 16 | pending->x;
 	unsigned int align_width = ALIGN_DOWN(pending->width, 2);
 	unsigned int alpha_con = 0;
+	bool replace_src_a = false;
 
 	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
 
@@ -167,7 +168,15 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	if (state->base.fb && state->base.fb->format->has_alpha)
 		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
 
-	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, alpha_con ? false : true,
+	if (state->base.fb && !state->base.fb->format->has_alpha) {
+		/*
+		 * Mixer doesn't support CONST_BLD mode,
+		 * use a trick to make the output equivalent
+		 */
+		replace_src_a = true;
+	}
+
+	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, replace_src_a,
 				  MIXER_ALPHA,
 				  pending->x & 1 ? MIXER_INX_MODE_EVEN_EXTEND :
 				  MIXER_INX_MODE_BYPASS, align_width / 2 - 1, cmdq_pkt);

-- 
Git-146)



