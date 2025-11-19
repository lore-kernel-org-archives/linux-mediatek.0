Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AACCF34A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ug+PhDpwof8UC1as0UO8CJI8RrRNzwgCCqAFDo7o0RQ=; b=Z5VP9ibiYo2vI+XavIj1GCHau3
	oiPYD+GiPnnOWpUGG4KnjojyKLsjJppaAhUkGHuU20p0C2W3iJ65Ruvc+Jrm5AIrNLrg7wajJKIND
	0rqUgpPt35X/P+hvwOSA+3J7RQTWKh0jRyYTisRXemMnY9GK2BzL6adLWaqdgwBr4Dr3byxKBG5rl
	fZsSCzFbe8Ls/Ms7FaqXu3bPYtbANOQRkuxTNNhFl2O3kzjL8sWVv+nGOGpjqkTzYA4nInp4gJGWp
	Sk6Uf8iQiZK6EWysVRyhlkbP8s/Vr0Upho0YVNHSSt8eaknsZzxvcqJ9axcNZlyGoxxc/okl4tT39
	6H3vUBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhvd-00000003FKg-1bEB;
	Wed, 19 Nov 2025 13:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhva-00000003FJZ-15P7;
	Wed, 19 Nov 2025 13:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ug+PhDpwof8UC1as0UO8CJI8RrRNzwgCCqAFDo7o0RQ=; b=lJXAVc6u9YxlXMKOXO3XmlNFEQ
	Tsjth1EIgTW8kDbYHL2lVOmoX8BityuWZtoQmDqr7H3mWebsBFKDLBUKR9SKpRbuIJi4D9GD7P9I5
	Zit4V1WA9e+Sk50/oSQG3dmA50fIMsAfjwK/5e/7Ho2rJkWzSmSrgitK8qCODBSYkHdh49Kxj1kvU
	nYq/X7NgW8TqlcLNtZKCjrhCisIRUmP5RIUQLE64F6t0gtIBCiikghzuj37+HR2l1ZE65Ev6VFjQv
	DJVB2LFRFb+RngAp8n446UIcG55ETOtIep61xtLWMnj6qHJUIQMKtFOFRvyOfM4kZXmxno0CQyBsQ
	N4/ooVqA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh3u-0000000CAeO-0qsf;
	Wed, 19 Nov 2025 12:13:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B63CA4E41795;
	Wed, 19 Nov 2025 13:08:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A03C60699;
	Wed, 19 Nov 2025 13:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AF7E10371A51;
	Wed, 19 Nov 2025 14:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ug+PhDpwof8UC1as0UO8CJI8RrRNzwgCCqAFDo7o0RQ=;
	b=Mr/S+z4rb6W/sVm8IPs7WuYmJSreXiSjDzMbksS0wSpWfu7AHKR5qbat7HA5+dytFRMgpG
	SW6oZB5ucrzHcjiwTVDq9AqizEVGFHUwRFG1mPcltSaPb5Nuu/ZgGOStmmZ1hUSS+Xx4AX
	QO/2AAwYsHeBDp/sRP+pnY3XINDKFM68uLt3YIIJC9Q0ZZDhnEKMGARWAZT52+AFIdZq89
	PqkN6f+2D9GAh0JvsHNXtNl8Jb5RjP122UVzzI+HEd3rYaCZyiwkq2/GuCtcZlqCqDB636
	gbI5wwYwE3PvH0+BHrtyhB2AkWfgf5z5Vf0BKNbpccKs+P3F4Q+8DEfCcDLd8w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:50 +0100
Subject: [PATCH 19/26] drm/mediatek: use devm_drm_of_find_bridge() to put
 the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-19-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_121326_402296_913DC39C 
X-CRM114-Status: GOOD (  13.47  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_drm_of_find_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index b766dd5e6c8d..57a926bdf8b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1405,7 +1405,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
+		hdmi->next_bridge = devm_drm_of_find_bridge(dev, remote);
 		if (!hdmi->next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);

-- 
2.51.1


