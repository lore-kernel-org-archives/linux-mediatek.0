Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9615CC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jArxd/cKEKBzoKShJV1okHPlGr77zGTdvNqVXjyot/w=; b=0neSeWgzxjYX+crJE7oaT6KeUn
	3ikFHEcKIJKRecHYBdvKHTPmNPY9VAbVegKpVCiT67Vv7HNzOnY4QuNPqN27/FpBtADINLCGC+ZgM
	H+ZoFElMw95fCGa7KS5tQgzSn/bWFnwsdsisx4ddVSkFIuN204T+kxUJkgHmej/Wqb6QtxHGJRMpk
	J7nD0PPUXkTYtV5JXUjhPgPO4d5TX8b93b1t/ghcJFbg/1Dm2+D5AER0BP1nhhFDgHC+eHl+yYSws
	xUBEcSTSAdmqRKQpLiOcWJQoNdfdUvUC5i76HO8T4ZzaQJr1l5slT+dGcFMBh5GUZd6EZll27x/el
	SQUqYI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWL-00000007U4X-3G7k;
	Mon, 06 May 2024 13:36:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVc-00000007TV1-3dBp;
	Mon, 06 May 2024 13:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8061FCE0E89;
	Mon,  6 May 2024 13:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B47FC4DDE1;
	Mon,  6 May 2024 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002557;
	bh=0kDtbAaVTUzCfU0u7ieyZBAWWC/9d6iWWtENhJGOYbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lR9oKcUPpndQp18qBV2mivcjy5kCKkBF2vXx/0ArM+BTUOKgA1xP3vAJGn+Flb0eT
	 ykzkprANmvCZsVEeLfqtVIhJWrmhZMrEH++iJMmN9TEzWSR4IbXrpJfYycMRFQHrRm
	 P0iURHTBT2I627ep7jAhQsCgQ4qXcpNqb1FhnDHOduu5LVnf/CG1h+UEsmH72UMjDl
	 wm+mTtr80qXdKbW2c4xhJoglyiYi5fnBirDDMqCgXJseEKdDyCYeHv4QvIusbD847m
	 MPQuOzC5k93U5fsv0gDViI1ej/aRkesOWMzvxK4CA/lXlbXxxTsshhNpJcDOk3enw7
	 ukHmYtM8RpLQQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:40 +0200
Subject: [PATCH 11/20] drm/bridge: tc358775: reformat weird indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-11-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_063601_331387_CD0B0D2A 
X-CRM114-Status: GOOD (  11.55  )
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

Reformat the indentation of the mipi_dsi_device_info initialization.
While at it, move it to the top of the function.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index be2175571b99..e6d1f0c686ac 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -557,14 +557,15 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 
 static int tc_attach_host(struct tc_data *tc)
 {
+	const struct mipi_dsi_device_info info = {
+		.type = "tc358775",
+		.channel = 0,
+		.node = NULL,
+	};
 	struct device *dev = tc->dev;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	int ret;
-	const struct mipi_dsi_device_info info = { .type = "tc358775",
-							.channel = 0,
-							.node = NULL,
-						};
 
 	host = of_find_mipi_dsi_host_by_node(tc->host_node);
 	if (!host)

-- 
2.39.2


