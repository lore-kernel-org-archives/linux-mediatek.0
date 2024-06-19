Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE22C2BC81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrGzvk1tW6wci4kPJxh/I1gXXNLWq3nGqaElvNasIjU=; b=xw5YBAeqQDbkC/vnxfBod7suYU
	b1gHUIwyV1U5eJaZj8oQGxsdH5JBDsYseSsZP0rypScK5xeqO9pPU3ZIxQ1Az0//FsoYI/Bc1MAvx
	TtkwTSEO4F8XbTs/w15Rln/qRT17iOCv168dKO4pdYSXiZVnnjfy8MNZDJoT6SurrdzaPktGx4b2c
	GvL94KyEWlAG1DPCy75somi2DMAqyUH2/46YWbTmV1oLMMWLJAHUlDpiA92cDCFc+SMyd9lFh/OU5
	llvDZyHCfkEM8YUB3wBSpkWAPndNFfUcAoXScmYLU5z5lQHjuQaemM5nF2iLro/VTkMSyjQtucLWT
	M/6CTGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwOh-00000001ZqI-1MrX;
	Wed, 19 Jun 2024 14:34:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMb-00000001YTi-0Dzr;
	Wed, 19 Jun 2024 14:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=hrGzvk1tW6wci4kPJxh/I1gXXNLWq3nGqaElvNasIjU=; b=b7uVRGdbkNfb7Bb+nYnCb0gdW3
	N0PVlcSRKBACRcfr7KNQX8lrAqVlGqsTmHR2v7kpegYimdbieRRXIlJgeKlKy6cWuvaEWLpEZAZhJ
	gCzObR68PRTCq168F8EmBdc/6EVlknFSBlM7CpCRdgXA/wUkBsNxznJecPLIKaeTbMkMSTz22HMbD
	5H/rCoZdgfb+/9+QLyi67cxiSckU363eDOmeorwWYvb5lrGLkbm7lvnHaoh+L6OJDcZBPLRS4Mz/y
	2hpg2FpYitl44ia+poASriUHQY1ah67Gn0xawbBozsMbshU9C68zExu44wGHmk9uyehMHz+RaC0qI
	xFE7ZbqQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMX-00000007McR-0mYc;
	Wed, 19 Jun 2024 14:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 680D961E7F;
	Wed, 19 Jun 2024 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E9F4C4AF61;
	Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807535;
	bh=683XBBTcCjvNlqsnqsvC5qU2ha2+uSLRYzWNbExOTr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=txRLZHMwbTzif/kI0RBsVhAlpzzjw9EWMOsJ9pKS338xPVGTcpoHA9P92VGa1x8pe
	 edXEu1CoLeViLtW9T21Wpt5qvUz0HiFNnsWx7wUV2ZD8knp6Dce+ndPKqpw7mL3DP4
	 Q82EvBG/TZJ0OPYK+ilzq2ltYFU3jD/mNXFNTA1r/AWG09f4kiwiCBqowERGpsJ6A2
	 ZxN7jNjBpuCt8Doq9GFQGyYaitABO7OH8pujajqz+aV++tlNEV6YmGXBPRIHuU1/WK
	 KiTq8jlqyML52lKrIXYFW/bJVv5mA+gRmF0YqoF7n6GlQZN6e2e2y1NPooMLZjFxV0
	 l4uDZkimFW3eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2743AC27C53;
	Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:55 +0800
Subject: [PATCH v2 14/14] drm/mediatek: Fix XRGB setting error in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-14-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=1547;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=N+q+J8F01q3+w5AJm23nX2Ta3bBWa72KPt0JkxnFDyM=;
 b=UGkb80MLoatE4rhTH91SKYMfduSoEsuHwJOGEjgG5YhEsMiyJ77CyrZu85rwXyMZq3lSE0pKP
 BuGab+SbGDVCkdRv1qaDjrNhTvABHv31tqQubuZZIXknz7+ZNzsYWPw
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_153237_751995_F84EFBAD 
X-CRM114-Status: GOOD (  10.03  )
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

CONST_BLD must be enabled for XRGB formats although the alpha channel
can be ignored, or OVL will still read the value from memory.
This error only affects CRC generation.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f358dbfed5e3..6abefc338045 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -455,6 +455,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		con |= state->base.alpha & OVL_CON_ALPHA;
 	}
 
+	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
+	 * can be ignored, or OVL will still read the value from memory.
+	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+	 * affect the result. Therefore we use !has_alpha as the condition.
+	 */
+	if (state->base.fb && !state->base.fb->format->has_alpha)
+		ignore_pixel_alpha = OVL_CONST_BLEND;
+
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
 	 * can be ignored, or OVL will still read the value from memory.
 	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't

-- 
Git-146)



