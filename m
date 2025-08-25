Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7DACA0FEE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJE9+b+I0gb+Mi8yFMteqsGLz96r4l/zK2J/HrKTKuE=; b=BtTfXjaAHta/kodYdqYU7POsd8
	mK97mIvW9SPi0zsvXOHurxN/gG6gXCPxIYE6kORvuHeQHKc62R67ItQToNUA0tEgyfh67KeBxsvSA
	BVBrypnrv9setWL6qXR+3vAEc7YrMIdSXdNeraGbqSX9U6ilObTZJYTHsV4rvIWS840YS6AQyTk16
	qayQ5dVPSy600kN5MeFeaDq3/QSvlugjr7mSn6RvgWRuXffkbxeV8DdqfbsXu364whHXs/4fW2bpM
	+rEtxoW+Oe3aDgoSKOA8YNth2ocEN8wXhw39BOauH40o+DBNSAZoMa96AMX9Z5cj1k/Vro6lTCTGZ
	H0wpxEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgu-00000008Nwi-2kZh;
	Mon, 25 Aug 2025 15:01:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXU2-000000087Mr-2l9e;
	Mon, 25 Aug 2025 13:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 156E25C5D9A;
	Mon, 25 Aug 2025 13:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E55C4CEF4;
	Mon, 25 Aug 2025 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129417;
	bh=fRlvE8ePbEUQlPi4SftjLgiOk4WsYYC2DKU3UHlDcig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bFhidSqWZE3ksEZ1z+MAWokhw6hEwtnZJYHsDuCvvwHCmCjgjrwUAjKCJsYR5fbPS
	 xCdlo4D+XzkxJFdL7sslS3OHoR75iVeXGAuJiQI1Stxvq1jIo1cBD6i4czSPKbW+J3
	 h5Z290ucnaVwFVpFfUgaMjMH4onGvJR3T9lS0fDv/8LmWcD+P+R48f5H9mXkc0pxDu
	 FF3c+SJWKGyS4aKsnwOWighFM04ce5URWGweE5X8ToKICKK1APpqA0kZwkdkSeCO1q
	 WSO46lxARwlORpN8CWmKYJCh6QKzTagC7BTnWyErp2lvwRuiENe0AUd5ndJk9wRHFb
	 McIcImPq0vuAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:06 +0200
Subject: [PATCH 01/39] drm/atomic: Make drm_atomic_get_connector_state()
 early return consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fRlvE8ePbEUQlPi4SftjLgiOk4WsYYC2DKU3UHlDcig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMooahIxPfue/4M0epeJXJWzrea18yz5v2d68hEtco
 ZMP/Z7YMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyeR1jw08zid3vNn6/fNhl
 2ewjD1x7dqREfIg+KnPnm3Bh28/H7trn5R92pl07tFyM1ZzHOyeyhLGhX4O/5nvb/qWXzkuV5jO
 wL+LYzvvD/JyIOZuDSNikXac95H9LMRs3BQpyWwQVW/QK7AEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064338_788005_7421CD76 
X-CRM114-Status: GOOD (  13.16  )
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

The drm_atomic_get_connector_state() tries to lookup if a connector
state was already allocated in the global state to return early if it
was the case. drm_atomic_get_plane_state() and
drm_atomic_get_crtc_state() behave similarly.

However, and unlike the other two, drm_atomic_get_connector_state() will
do that lookup after having called drm_modeset_lock(), when the others
will do it before.

Let's move the early return before the lock to make it consistent.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..fe21f154e0fa030f85fb3d6d35e2684adcf36e26 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1128,10 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
 
+	if (state->connectors[index].state)
+		return state->connectors[index].state;
+
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 
 	index = drm_connector_index(connector);
@@ -1150,13 +1153,10 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		       sizeof(*state->connectors) * (alloc - state->num_connector));
 
 		state->num_connector = alloc;
 	}
 
-	if (state->connectors[index].state)
-		return state->connectors[index].state;
-
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 
 	drm_connector_get(connector);

-- 
2.50.1


