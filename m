Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5435C53219
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Psw8OpvNMRRl6ECgSXkGuvyjb/PTRjiQBwo1OEix2zU=; b=3+0WzpBggoGLTrNYtQ6cyXOt6U
	CfnykCAx0VnbFG/AMtSUl8EI4vYJDoDeJoMzAd+3DGmQgOPDL25huF97wBg6A80XsZUYJmNHEobPU
	2mcEyc4QC5lqmiC6+bpkbrQz+t9TH6STt3uotwKV7yDtwxEK72WELTrjhOEdso0XGAW95xbAIOCMg
	QnTrtrDHYRK4/L47xpjS40Xa2lmDFm6rTN/VIVJiG0n9Ga+3NRAHgB48P4YggzacCqX7It1JQ8xz+
	FUD5N9jt+F89rqoUrbzBOtM/R+N4SlfJ9nSdvyQFX7A+tbeCTNl5y6dZuYiOfY2LaPkK82Y+iT4eu
	nI8cSwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojmr-00000005enh-2zHC;
	Tue, 28 Jul 2026 15:32:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojmc-00000005eh3-1dcE;
	Tue, 28 Jul 2026 15:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785252711;
	bh=jNf+NTAzPXJW2SC52yIh7wMgagupWvUDp+KApzXPS0s=;
	h=From:To:Cc:Subject:Date:From;
	b=RXpBHG8isxRMlAJmWA5lj4AF5RwedtfRJLNatn3VikbQXo73BabVPf0c+evCXrUuJ
	 RHOluL/1XPU3/BIhov3k2gT/Gi1YwEOQg07qwAOCkJybZsm9CIc2udDDfKN2cCTV5Z
	 DARtFZpA0+uZM9nJBglQQjwDuL2msOQe8TI7OBEzeaPl4bO+5VnKRqOarhvLgpLk3s
	 msxkRtzsQAdBBwORvIvw2NtBzElWc9pjsGjftCrqyLz/z6Y2a3YKDMSjks68sLkI4R
	 jfkKuXchmi1LSs8aCs8LvKWDoy53ogUAQ+csGJkamX5/pye5eTsTtpbmU8tohokDXW
	 VCGX5W3XoYV9w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E061A17E063E;
	Tue, 28 Jul 2026 17:31:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: me@adamthiede.com,
	bisson.gary@gmail.com,
	regressions@leemhuis.info,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk_dsi: Enable HS clock only at pre-enable
Date: Tue, 28 Jul 2026 17:31:45 +0200
Message-ID: <20260728153145.578404-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_083154_611954_227984E3 
X-CRM114-Status: GOOD (  12.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 76255024cadb ("drm/mediatek: mtk_dsi: enable hs clock
during pre-enable") rightfully moves the HS clock enablement to
before atomic_enable(), but it's moving it to mtk_dsi_poweron(),
which is not only called in the .atomic_pre_enable() callback
for the DRM bridge, but also in the MediaTek DRM's .ddp_start()
callback, which happens way before the bridge ones.

The HS clock enablement should be done at just the right time,
otherwise some bridge chips (or some Display Driver ICs) may
not work correctly: this is seen at least with a Parade DSI to
eDP bridge (PS8640) on the MT8173 Elm Chromebook.

This resolves a regression that was seen on the aforementioned
machine, which was happening only after a suspend-resume cycle.

Cc: <stable@vger.kernel.org> # 7.1.x
Fixes: 76255024cadb ("drm/mediatek: mtk_dsi: enable hs clock during pre-enable")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index dc0c4e867179..c729a163bda6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1165,8 +1165,6 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		goto err_disable_dsi_and_digital_clk;
 
 	mtk_dsi_set_interrupt_enable(dsi);
-	mtk_dsi_lane_ready(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	return 0;
 
@@ -1284,6 +1282,9 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	ret = mtk_dsi_poweron(dsi);
 	if (ret < 0)
 		drm_err(drm, "failed to power on dsi\n");
+
+	mtk_dsi_lane_ready(dsi);
+	mtk_dsi_clk_hs_mode(dsi, 1);
 }
 
 static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-- 
2.55.0


