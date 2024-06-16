Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BBFC27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSkl9KtyvKIacSEDBB36i3KuKgNRUzKEQ9qfus5ebmo=; b=iXI2rQJP44KnnQjzdiRWEnJEkq
	nlBsSUkWuFn/Xxk93YGWECOXj8bZ0bWRMsZ0X4G1WQO22oj2ZGEl0pKWSKQdF5QE9B+FN1AbwHlnY
	+5c1oHGMBsq4lk+ZysPfMWm+ZcseYY++/yfBNtyzmg59hs+ad6WcnF5Z2Mq4AftzCiR5kCThi5sKi
	5v74OxxnS1/lqvEmbEeUN/iVM7sVf2YF9oXRqii2JzSqpjSV+YCXJ35UYVUSH4fynqsV1TIoGJzfG
	eBnTU/Y2mKhqVwoJuMzf9HiNKc/+GUgXZxHRNakMFGBkFCIv1LugjOWP7vfxC/0wfgoCLXzgy9uA/
	vO0gz9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlIJ-0000000796K-07OG;
	Sun, 16 Jun 2024 08:31:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGN-000000077ld-1pmW;
	Sun, 16 Jun 2024 08:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C29160C7B;
	Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82A2AC4DDE4;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526555;
	bh=y4L8DPEW0N5VNTT2zRd+oYE4bUJeVmfldTAKxmr2cq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pL6gyk101a9mfx7ZugzjEuVs2OlyU5b8QXjcE2GDGdFdGpFP+sKuICB8/0DwYMq2T
	 4rNmwJA0aDTYVkkdx68PKB8RNZ1doI0v9JZ+ZWfog4f+Yf2hxdI3EGpvA0v3Ce9a9L
	 mlWY5O0tMsnmi/l9V4ISbiD32HjORMLTf99FIO7yK3aqS5bINIBvDW6cQJxFzg9i8a
	 KH1eClwU3XOSKX2Mh04P/rge8mPhD51AS6Ew5sd8iwWsQTw9a4E8KG0k73X3ddYy3E
	 6Tfcnyw/f8Dq7fwJIfWIxiI1WMDZFMAQ4YUFGrWYBVpK7IyitztwD3x0tiyYpEz7o8
	 wLTf5LCqmT0mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB4EC2BA16;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:23 +0800
Subject: [PATCH 13/13] drm/mediatek: Support DRM plane alpha in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-13-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=901;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=7ThFleBFmPuW5Sf6NpW0LO1TvAYrv9i7y0k4TPqs4a4=;
 b=0Ex4IiVIAOYPqOVPscuiMW6iSaEiPi9nM1nnfH3Aq7O/HTOiD+BrqezlMqZQrnM23tubAhdL4
 757mf7Ek2kaCrKL2Mnp1PjpKWZE0hysrXjY1x0jxEnHEaPPym8U3juS
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_012923_709592_F04DDF62 
X-CRM114-Status: UNSURE (   9.07  )
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

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index a302b12aae3f..16be98cee505 100644
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



