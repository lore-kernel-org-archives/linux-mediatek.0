Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91897CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhL9jBB9BseRx8DCqWYiLrRQwM4Vf4gqoeXNYt7+5Mo=; b=xvbWTYOcJ7Xjcu4bBkUJyZzthG
	U0ho3kpL1hJ5W/kRZUpUCtB4wf9wt5su6par7SSK5NKV/xmLvdM14jSKHeGKRn8e6DB+zec1oZqqp
	obQ65hJiDYzd4BbTXAPtofFQBueAp1QMPUbbIStWK9dF1DSxfS5j0MdDMzFK7BcY4NL7hTeaoBt/M
	D4Fp0/sMc/VIx3sLBYgFBH/MuyH6tOx/pF+5A18MoGXzKwLZqBOC6G2c8rw2g/J/6iM9G32iB/fX+
	BaBarSM0zXb4adWKpc/t08OrbdfMTTCGEZkvIHlkrwNnnTq7FqaWYKBQ/6NZEqNTNf5PAzwRXjw6r
	4ncPZg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgw-00000008Nze-023p;
	Mon, 25 Aug 2025 15:01:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXU5-000000087Oi-3AMt;
	Mon, 25 Aug 2025 13:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DB645C5DB4;
	Mon, 25 Aug 2025 13:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD67C116C6;
	Mon, 25 Aug 2025 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129421;
	bh=PvFz2tbovLUK8GLCCWdRDnXPX4fkTXJc0fftU/dIBLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tr3F9Altbjhrs1x7p1Zk97B/11uNdPU11CbH4+eY0nYoE55PZD2t7HCbjBUjw+u4e
	 gcaFB0Ugd+47dJLl8SdPpCAE66TW281L29vAxjNF9ItcwKxgvJ/XlC8VEeu75NT+hC
	 y+VrKP5sn4D1nHn/tPvsOpojXAqnjUcjUsWdhsLovTqqyGDuFFMfEbweQi1D2OlrRt
	 oSz2k0OtQxBgcHI8BQ2PT49cdFG4cb20aioGCdUUhx3FsqaQiSuV8G/D5bRiQX+oxV
	 QD7EwIdjOxtcngg6EmAv84R6oVO1+Tri7zeuU2HsbC2SmCQb59BzIxDQ4eRVcRkfSH
	 50w0wrutKkjLQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:07 +0200
Subject: [PATCH 02/39] drm/atomic: Convert drm_atomic_get_connector_state()
 to state accessor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-2-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PvFz2tbovLUK8GLCCWdRDnXPX4fkTXJc0fftU/dIBLY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMorri+d9DrAsKeHa9y+OcWHuko2W85tnLGXqnem3Q
 0SzQUOxYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzk/2HGhou2witn34m6Zno7
 /9crnSsPlLlOip/6aPpbf43//oWmn9au6tBvviY2YfneCywB1soXZjI2vH11eYewphHbWrGz6gq
 PuQUa/+1a46x/8fqppNdPr9xpEQ+y6suc/cymSzrrs+3PPjEZAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064341_882253_A3D46181 
X-CRM114-Status: GOOD (  13.81  )
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

The drm_atomic_get_existing_connector_state() looks up if a connector
state was already allocated in the global state before trying to
allocate a new one.

It does so using a hand-crafted version of
drm_atomic_get_existing_connector_state(), so let's convert to that
helper, even though it's currently deprecated.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index fe21f154e0fa030f85fb3d6d35e2684adcf36e26..660b081ff5d8c39061cebfb5ea122ac1e51677ad 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1128,12 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
 
-	if (state->connectors[index].state)
-		return state->connectors[index].state;
+	connector_state = drm_atomic_get_existing_connector_state(state, connector);
+	if (connector_state)
+		return connector_state;
 
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.1


