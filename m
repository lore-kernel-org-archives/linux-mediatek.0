Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D950CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEX36ZGbuV2YIOBK6Cb/zSWpo7+Xgxf7u7m0TtV2jPM=; b=tlOqo5upTeHGMdV2OrjybCY3sD
	RVofotV8li0jOQHDHuLQN6dh+bsg6+aDvk65wtGCEYose/ezkY36K0NS9AqnIasRbXJpI4BELGxMy
	OO3AsEIZwSJjm7ZjOAKqk1WUNmvxXELNqAPq1QwjEymW3gFWMaYEO8omHK0IrEYOae62jq3w9k+cs
	m3Q+lmAtcZ0gJifeIA56r14qqpH5nvDDekpFLbyhlvWjx1uvmImPOIc4z6U84nPRbuWJOqbyTYoFG
	3thssh90WB2jY3EOGe9sUSLgOymLb5bhuxghIzJ4k9jME2paaOUKL3uG1gM1lxD3CcRsldJZnC8Pb
	8n9+/uOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYh7-00000008OE2-1c5A;
	Mon, 25 Aug 2025 15:01:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXUB-000000087Rh-2MXv;
	Mon, 25 Aug 2025 13:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F33A95C578F;
	Mon, 25 Aug 2025 13:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407D2C116D0;
	Mon, 25 Aug 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129426;
	bh=wFYe8IhxpCJtPvgevdyVNVoa1kh0rXMyxXaOMW2sjnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JxtopDQj6ULDe0mqR9DVwTgnUmVDas9rVHH6T+25o1ZWzYgj2ldH8ysOL2+Jz/sOX
	 GkED+1LHZrZlhCniMPY2Bd7R1uxFiviqZ+R4efulj1fnh8noIAI+Y0GtPW43rNAhPz
	 NL6tbkZIASVWOFlfJUzGCYwl7xnZfzFTD1rYx3pzpK0hsZKL9VEUs0iWY2ukqqegV1
	 R/TsbH5UPxLzAA/ynadvyfVVgClyMIYImnS0wu7Z7AsyJPV73+/ycT+n08cqbFY+qo
	 iOZTxiUiRfI1q28EeadUhBEdVlIgUs5ChVSCmTi5yGNQQ3sgyzIQ0pyJQWphC+GJy6
	 hu8FvRcQYUTAw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:09 +0200
Subject: [PATCH 04/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wFYe8IhxpCJtPvgevdyVNVoa1kh0rXMyxXaOMW2sjnE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMooDdRfpr76ywjU/fVb0zH8FnB/PBATmPZ7rpyqse
 1dwpl5sx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIJQfG+hQhb85JMc///dmV
 4jUh+RNrzPEfYoJ+PDE2pcw199I/LGX6f3djmZ3h1vUbD5XYJb5zZmx4OnHh7j3Hu2VvBny8u75
 rhdJftY1qDiyZSptOZ089E9QUnLBCQvKriES7pveHOUsZeTUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064347_688659_EB60281D 
X-CRM114-Status: GOOD (  11.97  )
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

The drm_atomic_get_existing_connector_state() function is deprecated and
isn't used anymore, so let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..321c866d5b0a46df7a9adbbf5e4cabd1ff987aad 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -729,33 +729,10 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 			       struct drm_plane *plane)
 {
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
-/**
- * drm_atomic_get_existing_connector_state - get connector state, if it exists
- * @state: global atomic state object
- * @connector: connector to grab
- *
- * This function returns the connector state for the given connector,
- * or NULL if the connector is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_connector_state or
- * @drm_atomic_get_new_connector_state should be used instead.
- */
-static inline struct drm_connector_state *
-drm_atomic_get_existing_connector_state(const struct drm_atomic_state *state,
-					struct drm_connector *connector)
-{
-	int index = drm_connector_index(connector);
-
-	if (index >= state->num_connector)
-		return NULL;
-
-	return state->connectors[index].state;
-}
-
 /**
  * drm_atomic_get_old_connector_state - get connector state, if it exists
  * @state: global atomic state object
  * @connector: connector to grab
  *

-- 
2.50.1


