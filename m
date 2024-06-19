Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175E1C2BB85
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/e5JO5dt4MO7bTYd1udSeIqzRZZ/ew/RLaAElrEjkUE=; b=tIfr9pRIKT8FSEJ5If+i3a5dlZ
	sbDT5O1Mxi+69y4yKSVAFzzHba7ROo+5NmiSsJkd9gzVgefeAzl4Oefo9eMuqC2cUKu1MVYiI83si
	NIFxYdiLwdwbbLCfYuACGo+hd4I4CApFg3VTxB2K0mUnRJrMRBNJLQhvmUL3OzVDa/ddk1UqU1jXY
	FoGyAQIhcSWqGcHcoK0JTbj4dYU2p7ASAmXkawyaX3ufVfgg46lHA1KM17Y9YbgDw/H1RzHsZS8jp
	VzZVvq33Y8pZ5nuXinZrBFdLUGjInii3leMNHDPX3g4u0rEDMeBAdYXUiFiCaZOP0D21nA5mij7ch
	agmoQwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwOf-00000001Zos-2qjJ;
	Wed, 19 Jun 2024 14:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMb-00000001YTk-0EUk;
	Wed, 19 Jun 2024 14:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=/e5JO5dt4MO7bTYd1udSeIqzRZZ/ew/RLaAElrEjkUE=; b=XC+6rxJGkV2EyUWi/m8oFyPyi5
	O9sAzaYEbZYLKDQ0KeC/xKaH2pNSD6G+xjs5sAPotvtFZn0qZFYRD5nM02bk9QWLcoD5Qxmn/prSk
	fOPhLJGZvj3MoxYwrGgw5nJFk1bUFEaaE0lClYAbecaGeopYNLlwOq9BMeW+a/xpYOATrSqtbg5H4
	+TGcY4J1qHgfr/msnW9RgGJodTr4tL0BrB1Mu1xpt9bTPjzyo9QQBduK7j9Lw6cWnjttYIdHyea0H
	ku6zOkkZxVweQxpwEBJy9iEl2WyNgdSw7yb8DgSFyMcbEcXYv8PEA47pDoP2trcgyWlc5kpmOs4ng
	o1dd9L6A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMX-00000007McQ-0nZM;
	Wed, 19 Jun 2024 14:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38ADA61E63;
	Wed, 19 Jun 2024 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F20C4AF5F;
	Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807535;
	bh=7I8aImA7pkdTjSfDGsH5pzBGFaEl5gU0gk3Hz8BCIzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HNpuobnklSoOj6aoufKEc5UePTl0BWcI/G/ndpkPM9zPy5kj3U2LDjds5ybUlp75S
	 8fnLhqeQ8t6DWJbl8zF1D6Sf51KoN/4KPDsykjLTRurzzE3tbohiHoGajXwD9b7P9X
	 9uwhUlPOVYE4e04JaQdiUX4CCL8eFoqk2i+jQzAtFk6yDymQNpmU2RGs4/WRyQ/SUf
	 myWdceJQIhMTa3tr3ld/0GdrZBOnclo8lbLJr1Bxor0+CwYt2kBvo7nbXDGLGUL7YQ
	 9UipZRzs9uSXx9lAvq+Oa6XFRGrJqvFwf16yAlzMy8NA1Np8Mr+4TVI4GSpIgt4g1q
	 HTGTjPhv/9bYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BE9C27C79;
	Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:54 +0800
Subject: [PATCH v2 13/14] drm/mediatek: Support DRM plane alpha in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-13-abf68f46f8d2@mediatek.com>
References: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
In-Reply-To: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=984;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=wRuukHEj6ar3MzrXsZ6wMBC1YWkwtR1Cd5NiPWkH4fQ=;
 b=mXffXrDFXrHd8s/MoUIUUbt/P7yp7KbzAnh4zOUemxlxHfiBroL5wHk35yF0/DMHdRIAWLfR2
 d4oOEUBWMpeA2jzbQDTSaw/jhwFjI+xMSQDX1+voFSDc/N3erHWWKGS
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_153237_716478_CEC4BB82 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Set the plane alpha according to DRM plane property.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index bf5826b7e776..36021cb8df62 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -170,8 +170,10 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+	if (state->base.fb) {
+		alpha_con |= MIXER_ALPHA_AEN;
+		alpha_con |= state->base.alpha & MIXER_ALPHA;
+	}
 
 	if (state->base.fb && !state->base.fb->format->has_alpha) {
 		/*

-- 
Git-146)



