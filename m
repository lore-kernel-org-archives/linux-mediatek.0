Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848CDC27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0q+oYLuHRepu8/NDrtc+09PmuxXGzpD7Ijl3/E+6pXI=; b=1Au7aRLPNhnWOz8+Qgg4chskP1
	8Be5txabirBtktAqHLLbiuErAf9z0zMFQAZK5lHALimzPz2UFp9iw/dAs2nHNGJjnnS/oCJ4lFDnQ
	JHoHBGyITs0c0bme7dRkMRIVrRiCuR58xxyKOQaLWWuA8KqCN0cWxLWLOSILZm0jsHVDWJEUHAfK9
	f/jAykmgM42amBbGJ2VGf1nruMzd27JwCGmhMWtLiubB1XwP8h/2GfLMDiSoiOD+bkFmPkQ7+3P4R
	u95TH1LE6cCVVSs1Iw1o/pwz5XZm9KDz647LgQLumK3TAN4ohMSNvAjE5RQnuYat9LCgn2QBHgm1I
	he2lcnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwNR-00000001Z3s-1jDt;
	Wed, 19 Jun 2024 14:33:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMF-00000001YDM-1cRe;
	Wed, 19 Jun 2024 14:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F6CACE1FC1;
	Wed, 19 Jun 2024 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B557C4AF08;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807534;
	bh=nDauC53RPLl+Q/BbbOdZCjz+Z3uB4YVnDVwiZtsyjyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hLZP0Nm3CCq7u0QNm3dsEW6z2DfRBa4g1HvFboR76ytNF+Lf3bDUBJnEyzTtZSKYX
	 G7z8Hfxcemm9E56oC+CgocLU5ErVpwz+ntcnofBdG2IUz706CfRS8lAvr0jZlsKlWg
	 OxZ7l2ib0vBgis4ziP2aA1fKGFDoio6CwFOyadttTks4UZ4caHJAAhvLPzgKJ2Gq2W
	 0cn0EPe7ke/2rfugJ6Eif+w3Kq2J+N0/5MJs6uSwgn8xrROgpFPhttsSD1Bt9DmMhP
	 1lBaht3NEKN1aUove0+jsCix8WMRqGEUFrp+5RYfp2t9mTnnTRKrnZIOqJHCUoi+w9
	 xjsYcFw+90hSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C325C2BB85;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:43 +0800
Subject: [PATCH v2 02/14] drm/mediatek: Disable 9-bit alpha in ETHDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-2-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=1465;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=6fbUX6KRvCRN0DJcJEcVUjxpKT4VpT1Y9qernMaYSKY=;
 b=rAjWRftMXK7ta3qYwsbvYnPDZglASvzGpDwQeQXLRflRp641iLxiTpYr355ls8TTAKEmmQQOi
 HUcBl+QvWPICO6GFX5hgSHOQYglYtF6BCNYAltDFsfJv+eHhahwnzPi
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073223_502183_A42842D2 
X-CRM114-Status: GOOD (  11.32  )
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

When 9-bit alpha is enabled, its value will be converted from 0-255 to
0-256 (255 = not defined). This is designed for special HDR related
calculation, which should be disabled by default, otherwise, alpha
blending will not work correctly.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 156c6ff547e8..d7d16482c947 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -50,7 +50,6 @@
 
 #define MIXER_INX_MODE_BYPASS			0
 #define MIXER_INX_MODE_EVEN_EXTEND		1
-#define DEFAULT_9BIT_ALPHA			0x100
 #define	MIXER_ALPHA_AEN				BIT(8)
 #define	MIXER_ALPHA				0xff
 #define ETHDR_CLK_NUM				13
@@ -169,7 +168,7 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
 
 	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, alpha_con ? false : true,
-				  DEFAULT_9BIT_ALPHA,
+				  MIXER_ALPHA,
 				  pending->x & 1 ? MIXER_INX_MODE_EVEN_EXTEND :
 				  MIXER_INX_MODE_BYPASS, align_width / 2 - 1, cmdq_pkt);
 

-- 
Git-146)



