Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fN4BdN+OOj6MpNIBgv7uoJhB+JsnIyeUMs2x5uOzfT4=; b=JlHTTKdcV6vtdv
	Frlk2ENsq9z1XQNYHKa7K9Hn2Gg6HO6k9373fG9wcOQSixhCddL9Hc1jepym9euuwgb5lofp9d+bt
	Hxdxr/imppgkBsmwm+wgBKg1Y5NbrSPz2aMFneJs6LcC5uInawAiWFGo2oMIA83sW2NE0pM+m485x
	N8NN3uQOOqycFAFgykCWynxE4E1ysCMvw49QWJ/E8eT4E08FgQe47LN8YuhSWy6MWIxklVkXkmlXV
	QfNgFLUBoRCS/FQ/AlaBc2Q66eiwEnPtWZUwXFyoiccfNSKVAp+IMoDJY1m1uMMbke7zfi2pKVtYX
	jNey/wJSHSXSfTTbQOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ojq-001gwP-2C; Tue, 18 Jan 2022 13:41:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9ojd-001gtA-F1; Tue, 18 Jan 2022 13:41:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 950F51F43F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642513276;
 bh=IPtBzMiKepEmzjvtX9sO6tEJL6k0DuE+x1vV5p8WYvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WIzFqSVDaIt7gohiINlfy6Mgyaj46ala6Hdgnd9yNMpBnOYHg6uZQJIbwyC1vL7oP
 vhNmMf2oylYAyhmDbMaflelPUCI8iv310tQ9wjTZKsOJOp84ZoQ9UJAKl5CmA25+Rf
 HkxZKXl7icfZGc82z+CQiAElg2k+XhQF2EDofbb09/lE7g0SK/Vkl/EMB2nQny/8rL
 YrnaMlGBuiw69QHt5wEVIMwxh2CaHe/CwO7MyMzZf5k0vXGzfSSm9KYWC4qWRaEZO5
 YLhr1neFX+N49nkfRCldq98afbc55Zy4V41fGX6Uhi9ilLg3XZEgTkHXJ1iAybdopz
 Lyui61qx0K8rQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] drm: mediatek: mtk_drm_crtc: Use kmalloc in
 mtk_drm_crtc_duplicate_state
Date: Tue, 18 Jan 2022 14:37:59 +0100
Message-Id: <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_054117_655667_02D630E2 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Optimize mtk_drm_crtc_duplicate_state() by switching from kzalloc() to
kmalloc(): the only variable of this struct that gets checked in other
functions is `pending_config`, but if that's set to false, then all of
the remaining variables will only ever be set, but not read - so, also
set `pending_config` to false.
This saves us some small overhead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 09fc9ad02c7a..f536a0a927e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -185,7 +185,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc
 {
 	struct mtk_crtc_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
@@ -193,6 +193,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc
 
 	WARN_ON(state->base.crtc != crtc);
 	state->base.crtc = crtc;
+	state->pending_config = false;
 
 	return &state->base;
 }
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
