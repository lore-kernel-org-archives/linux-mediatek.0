Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1BCC44511
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvMgTaBglCpRBphZhhMgN06pEhZRxMG1CwlLCM4ocmI=; b=tE8K3zrWSK/uFBalwfmIqOW28W
	ynfyZMd3MmqvZU72Zetfjy9u51UpJ0LTtRGXKKfeEUtBz6ZVACewsfqsUpfjrT0UCOChgvq2ANWIp
	pX+Ppb+KP89pxnFMMxtx7Xu3ASBwRVfengxvAC+BMu99DAYZziaeUxMJKzyHCCoeQ3PR8yfA7G1Cx
	B3bATGLYk6eS3oUt9be3D7wyMmK84UzDOLOkjMQdnuBUdYoUveaHnSDixVxq1DEwD+KO9V3D+oUWT
	X0r87TQ7TlxNSQ1/90oK0B81mrKN9YGC3267AfppH+B4Eb551Gtfhoc+EhdoE5DnPZmLsgBcgXe4r
	DqfKDuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06x-0000000F1RY-3ISU;
	Wed, 15 Jul 2026 13:57:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06s-0000000F1JX-0UAM;
	Wed, 15 Jul 2026 13:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123831;
	bh=8PBnueuBT6jwz1nO5Ycv+65fEIKpNJ2+KGYPkC4+P8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AG6crVklKLA9pS3xdMs67YIyS1JXJFECwdTMzwg6778EiSgjuhZZXDB4ivkPOoxJd
	 ol0tAiWfwlLNAXbHMY0fiWVeOOa9PXJQ6TNnko3UaA9XfoIWRKR0BNCl4kvzdLasdT
	 zytWKioYb2lCk6+AAmrsghCo6BBOBiVrt/B2r5BgUndicv5hHvaT5CUqYFWe+z/Rin
	 sChND1f70D+hLHUqktBcMkSO8vT5JHHmUKmBtszkcOdT11FoOrp2Bc4wPCTUffHvjM
	 qOgBm678797a4ajRIyUwLEKnkhaZetPxt2Xme4MzIm1gMwOMCNxoTa+aVni+TV7svG
	 aG4lkbyFU7PUg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACF8E17E0E4C;
	Wed, 15 Jul 2026 15:57:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 04/11] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 15 Jul 2026 15:56:56 +0200
Message-ID: <20260715135703.46540-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065714_334130_C8375427 
X-CRM114-Status: GOOD (  12.00  )
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

When binding the dsi component, the .bind() callback initializes
the encoder, and then will optionally trigger resets.

Should that last operation fail, binding will as well fail but
the encoder is never removed from the DRM encoder list and if
the driver gets removed afterwards, this may crash the kernel
because of an use-after-free condition.

In order to avoid that, cleanup the encoder upon reset failure.

Fixes: 605c83753d97 ("drm/mediatek: mtk_dsi: Reset the dsi0 hardware")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 8ab5c3431dbb..e3d7338c35e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1090,7 +1090,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret) {
+		drm_encoder_cleanup(&dsi->encoder);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.54.0


