Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB72C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Brdg/gWJkR8G9prIFcv0FxCrhJKRW9xqLlUOdMURPXI=; b=OxuniiVPgzFf9gpfwlDW9Gc295
	DLP1GflchZiVz2M7b/SYPK7eCAj0GTZ/3vrnqh1XtVExNQ134kJvScQMdGjWe4dhfkZ/RCqtEi/QQ
	ODGKmoe/kCOS0At6qVAxNkm9kFoi+5WaWIXO8Sg0RnXy3URLEXYUL+TiQophBuEnijB5O4P6tbWlA
	OyhLZ3kVEmNLVgRCHhT4DsI86s/LIaJ6gVOzZkiGFS3qU3H2PN/Bp6TjHFEfCwRaha+Ogp0jrFf2Z
	CJMDddsyZLHjQMq9ohs+fZYHAmY9aqtwReA1YTFHqgfQ0e5NBFStlIpsblk3vGWBkNoj8yTcawAdP
	8cR/xGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyME-000000025Fj-2HU0;
	Wed, 19 Jun 2024 16:40:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKl-0000000243b-1syX;
	Wed, 19 Jun 2024 16:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0A64CE2080;
	Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F81AC4AF48;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=QoOCchLhAkgR5oT73U1iQHt/xJx1/rjkd6jCZnxGdpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g6BGH8MZkAOoyx5QNoJpfkmO/rd5iBI4QSn3BLJzYdJTl/g2O4kYvv9qEI/urYFkY
	 09RN+6uJ7Ea+mS/4fHola4WzUiWR2RYvxYVH6EW8+DzqOUC9ejNE+fHi1PPMLOjK84
	 fDMjVKTTtrknSbWceMTCdnsHQUAirslGQm0pEFPfpkgqW3YfWM92rz5RM0E0RInmA7
	 guw+aXoEz2dkuS2A5GwjukvWl6shYyUiZPiOyyRVAYvoDJ9WRlL0fn98ZR9WBktcIW
	 bQ50+K2vXfhpOCdDjJHwQctvqCDzBc2SHqFsXUrKYG1usdwi7TckViafzBBhP5HwUW
	 TI5tnDmZ+KgaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DB5C27C53;
	Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:54 +0800
Subject: [PATCH v3 14/14] drm/mediatek: Support DRM plane alpha in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-14-a9d62d2e2c7e@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=1063;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=Vnu6L7E0FQDG2jpI6hDgdX16IWg1DCeKne1NvT//xQs=;
 b=oIEoZkfPXwHGxqdBosxBOqRMc/3HWUAjesYMnqVYPGpry/2X/nRyestB8qRDilMKWil2iczZr
 ohmhFHopQ09CB1Yk1BrckYm9Nv7HSeZ0Uw736E+Hzz/SxMhbQ+77G11
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093855_885171_21FED68C 
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
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
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



