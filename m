Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D807CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy8tHfbB7dfOahNj9sqb31f4STqmaO2eDuwe05dy/tQ=; b=YLJ+9Lg6WiOlEuVx6YC3Nxdv7j
	cJwozjCfVlMu1UwdTBRYd/RnvSp8G9yTANPTWtZqXynL+OUNz5b6xiEDa8vjDPPWM3tjoP8QT6lFo
	YBS0l5uaCj0ed+RDN+TNEG3kVUgvmUWZQ7+JMnnba5vrh0kDlMLoLlXFctXP2upfeX1g6eAIywId2
	5yGNUjYS1wS6ADx9c85iBmw89gxCgqz8vUEWdmhc1SyzF+eNUxyhZDIp/wW3bO6JNNGh6lMnB7WCj
	JHsPvfLCgreLDHXRTCJyhg13c+aYirheXD0Bdy0A0OwtoBeBK/5yzKl6yqpWMv7udQhV/5oM7Fn8s
	GEttGGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6Q-00000008fL7-10Gm;
	Mon, 25 Aug 2025 16:31:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXUX-000000087bt-3ymI;
	Mon, 25 Aug 2025 13:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52FE75C5DB6;
	Mon, 25 Aug 2025 13:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733CCC116C6;
	Mon, 25 Aug 2025 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129448;
	bh=GtAQSdS1ZwpO1wrhzVk13OKCtrYrUZErGzdK85qhnG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QadmStP2v9UsuOYT311avWLlpP/l6egme0AcjpIDhH9ksImI4ORKZ3DWspjrDHPgX
	 2x6HjZLLaiPUn3WL6Qm2ObWzvKYprTC4VDHS0rhLOjWSWTJ2GnJUIxSwRcjWv2yckw
	 l8ahX7DN03D2kQsSy79t4TDEgCMcLzLDTp3A2zv52af5r0fgSGjecjNIuzwGZ1nVJW
	 eFzfPExQ6XUlQqeN8TDT9xjBOJdwXi9T77+svalT5fTLRbHn9VOCulUbwJQhLs1o7z
	 WEJBMUjjdObXQ0DaH3GjBKTGNiKlHziXtKPcsZ43x49mFnStg8DrIMPX9pn21+T3Rc
	 ZO0ChC/8E/mag==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:17 +0200
Subject: [PATCH 12/39] drm/atomic: Convert drm_atomic_get_crtc_state() to
 use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-12-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
In-Reply-To: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GtAQSdS1ZwpO1wrhzVk13OKCtrYrUZErGzdK85qhnG4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMsqb7n1MlciLNLj+baGYzBGv5o++wa+/Hb3W3b2iI
 VjL1flLx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI7wDGWqFc1+IbP6z/9FlJ
 VrSbn4pqiO179fVn0iet9HbF3YXW8xc1vrstM5utTsbd332F9H0Hxobnc5h9fB1jt/3prU0r9nK
 rK4x+45n+Y3mkrPiHnoN6rV4LrF5leh1xnibf7mSqr/auCQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064410_076846_7B39AE1C 
X-CRM114-Status: GOOD (  13.71  )
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

The drm_atomic_get_crtc_state() function calls the deprecated
drm_atomic_get_existing_crtc_state() helper to get find if a crtc state
had already been allocated and was part of the given drm_atomic_state.

At the point in time where drm_atomic_get_crtc_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_crtc_state() can thus be replaced by
drm_atomic_get_new_crtc_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a9d1265e34602c454866869b81b8837b2c0a97a4..1147fa890a03ef2c3283972c816796d8de6307c9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -347,11 +347,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	int ret, index = drm_crtc_index(crtc);
 	struct drm_crtc_state *crtc_state;
 
 	WARN_ON(!state->acquire_ctx);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (crtc_state)
 		return crtc_state;
 
 	ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1


