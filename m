Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7031DCF34A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igNERjzw42v425WqlzXvdTEyLpvMyT8MhX7BK4cDcdk=; b=cAV5K+ZR+q7Y8By1OkJuTW5dJR
	6xIlprKUI+Un97DcwdmeFQ8wOLYU/QzcUX8GlgTZIBL4eYkJWgmBN9A5M79yRf827OkdNUg+mPgDu
	V5Lw3kSVs9XDWkZud30pOwFY5KlRcOPyS5cyQLbS819QGaPNbUErVtxl1llCpnaBM5MasWG7OtoUo
	QRnEIEOegd++m6F6tdOnnXLk82GJcAK8b9xFT037a2H2hJ1Hn8k3SI1tifvE6HcBs9GVWjCa0l2B4
	uoATS/VuwjeuS0WfRqrPIeCEs4ePPtT/NkzXQCiS1rMAlj0ui8Tv04wOykFvfu1TZwYze31rUfNSJ
	m1WnrFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhvT-00000003FGS-2j14;
	Wed, 19 Nov 2025 13:08:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhvR-00000003FFJ-2nel;
	Wed, 19 Nov 2025 13:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=igNERjzw42v425WqlzXvdTEyLpvMyT8MhX7BK4cDcdk=; b=kw4BbYzm0LeDzTtmnFMJ+vCKZ3
	A59UeSH2rqgoa/XlhzGcFHnsX6ne8pZyG2851LenLD+g2LuSWUamms0lR73fq/AtopAH5WLZwbrQ3
	yw45Qm9nHNyvMXBM/J9z0RvN608wh9UFAe4RDmQZC2krSk4CJ538uxN2i4dvRocmn1Ul/4cwlJiy0
	InTpvhHlVmdpLkOEaDaxRVdR5dVLRzuC6U6V3IQBj3LEt/ehaDSI4ximN0wLjaficNTbJJDh6G2Qr
	LKHC1R9yMij9RNcpdxeu2dZoHDIGVJTTjBQyvUKMM1O/wSuGuC8qimSNDSj4PRRQdzNq9GAqZTxdE
	mMslUPFw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh3l-0000000CAbQ-3RNs;
	Wed, 19 Nov 2025 12:13:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33C041A1BDA;
	Wed, 19 Nov 2025 13:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 051B160699;
	Wed, 19 Nov 2025 13:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4191110371A50;
	Wed, 19 Nov 2025 14:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=igNERjzw42v425WqlzXvdTEyLpvMyT8MhX7BK4cDcdk=;
	b=JCYmeXmP/seI6JRcUYUke20noK7upDq8K5d4C1WYodBXggU8chHWTsFhA/DCJSOK8W8p3w
	7mKCWFCpSBu+XKWkGgbuyvXbQaOrpkGA8RlYjt+7YO2u7tT54BfQF+OjpVUg7JpVkahT7x
	gPRNbEEgJuIICj/Rh8Mlm3KAnGC6yxZF0LSmWyfbToHu4h2tL65ARh+xyvohUM7Dl7gqOV
	ExpNJbaUX7ssSBXMvWo5kgqDTs89FOY2DHdLxZwzIVAw7mJHRSu1f+LtDo1wpz9klOrvLJ
	xa4IlhFU80gqMUfrf/ZA6yHvNOfNwkJjb01HqNaO6A5/18aSMESPHEqoKB5qdg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:49 +0100
Subject: [PATCH 18/26] drm/bridge: sii902x: use devm_drm_of_find_bridge()
 to put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-18-0db98a7fe474@bootlin.com>
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
X-CRM114-CacheID: sfid-20251119_121317_984410_2BC87D21 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/gpu/drm/bridge/sii902x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb..ca3ef23683a3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1208,7 +1208,7 @@ static int sii902x_probe(struct i2c_client *client)
 			return -ENODEV;
 		}
 
-		sii902x->next_bridge = of_drm_find_bridge(remote);
+		sii902x->next_bridge = devm_drm_of_find_bridge(dev, remote);
 		of_node_put(remote);
 		if (!sii902x->next_bridge)
 			return dev_err_probe(dev, -EPROBE_DEFER,

-- 
2.51.1


