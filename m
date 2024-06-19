Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB27EC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUBrtBloUgDOLWH1+EMKBy2PiXGmu1qmFMrdlYPEOQg=; b=n8Roq6srRNTY4KFdTb4GwaWBmx
	UOyE4BIxBCbJEZppwbrAkNGfxl3Cw3xBotPM++LnEswahs4FwsxyD86Fz0Rc41LnDo1sWCQ5uLKGy
	Mi6kG51B+jem5e59tTJi9TJlfXUKv7DZaeL8h3tf75lPUmE3ZjHRjh4+676FXxjAoJoclCyCVmJ32
	1u60sud/2PBTqt2+owQ/koQ82RuwJH2qZ934yPv1Xgt7xGOIKeqfqJZi5PEoTbscEaHoIsS2QUj7M
	WbgRCjB968daEeC5+L5wCDMnZKeCDkbGUvb1ZBhI3lVFqHd5uEABO18SXLkZYivEr/FmywdgI4yzZ
	i81++6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyLh-000000024vW-31vx;
	Wed, 19 Jun 2024 16:39:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKl-0000000243c-03QB;
	Wed, 19 Jun 2024 16:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=eUBrtBloUgDOLWH1+EMKBy2PiXGmu1qmFMrdlYPEOQg=; b=QbwjNj8Qm9nzVC5O3/2c5XN0X+
	iBQIlENLtHqjGheWrYiHaMvlGgvFfDtR6tfpOS10W9tj1Bj7hnWMA+6fqJUoTAlYLrUGzpnidem+T
	46tE8qwWQG3WYoXYoQjpFCP3gqGGDpD2dtoWlbPunPtmcVg73BRtPLcvSUShFI7zfKDazZKIH2X3m
	shh6gYUTbyhpE6NS0EY9PqJinovHdnh5M+gHWWDqj0uNfJKe8HpQQCvG29t1cbaGCq6Wrn0h5AlMN
	eTxZK1jeio49dvhbXKJwW6SU3nytvhuTTl+NMcKrEVh0UrMabJCKpiYsLlgKcGI0xmZ475T9GlQAV
	FgOSUjaA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyKg-00000007O5o-31De;
	Wed, 19 Jun 2024 16:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B18DCE206F;
	Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECCC9C32786;
	Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718815125;
	bh=ZJmYvkWyDQXkVIDz4EYMvvkEgoGgO/o3I8+tANsq22s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h4aGWKHG9lNs8tPkSgbQhaVtmHWxRIY+548H6PRQugZTomVEvRjznLDA3+F4pgshr
	 K+wBMQ4nqE46ZyZ11rDKK3bUSaZmuOeKk+ajaR25cR9/Yz9mnDZcYtlgttrgxYNA0A
	 Yzw6YRvShjDJdFtcm+rCVOOJiOkv+H+6iUh2U/kV1PbGCX/fndVpoDoKdNgAdDRMcI
	 PUTZ4hqEw3vg3NkgaZdG8jkiEEff3UyyOURr5PC7W/zLPKDuPza85IJKGOLCKTMaVq
	 C/PM+DgJ6NesgK+VlEehAMyJq87OcpthdR4x/he2ynZVwkpK8e0CIugtZ6yIfZAkjH
	 Q29oO6zU9hyUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A38C2BB85;
	Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:42 +0800
Subject: [PATCH v3 02/14] drm/mediatek: Use 8-bit alpha in ETHDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-2-a9d62d2e2c7e@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=1391;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=7umBnacXHY95A+TiUODUrNhd3bD2WRNrF+DOB/ds4t8=;
 b=BMG77zft9eH3Te3rgMGiWvej9yoe0q1+9thWcfprzf6tjSNlo1Ze6n2dxH1SlPwrT5Ds80vNk
 7dZANunCC3LDuyQwcnlkz8iM7TznwAYRWuGA01zflm7nBwNyx7NYg/4
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_173851_744979_42516FAE 
X-CRM114-Status: GOOD (  10.09  )
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

9-bit alpha (max=0x100) is designed for special HDR related
calculation, which should be disabled by default.
Change the alpha value from 0x100 to 0xff in 8-bit form.

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



