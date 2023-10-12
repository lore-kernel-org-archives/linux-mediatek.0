Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B2CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I4c4zk1/ul2wYlG4nRZDeBLTa3NI6Ka5pPpYUr5+MU=; b=SH3wDfpQjzBzb0BX1O7aq8okUN
	5TrMYDCSD/aK9d/A/hv+N+uzKPXCPXz0HrOYZYuSIokawYA7bHAhnN0rTyvJCDAVtNpCaDWZ59P5Q
	CUEPYSxnN9hBJzwIIx3Om8CqVU2z4nRcVNaT3CsG79AZcTfYIgt8B7hP6N2/IYfSCacBGKj9bBVN1
	xXsjYOC/kwNQtzm/53CPOofm/dTzB18Vl7AWmz3Pq7WqFvQuXq5gd5aSg5cqA5jsn3fDN6Rfy3D4G
	lhvCJvImOn89Yd5zVwgJbtO8hVvddKw3EmQCAWc3rlq6qb6/4Jtd6SK2yIMGFTtF2auRK8SrHfj5z
	etLQR+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSV-000TiQ-1M;
	Thu, 12 Oct 2023 09:58:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS4-000T9j-2f;
	Thu, 12 Oct 2023 09:57:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAED66607354;
	Thu, 12 Oct 2023 10:57:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104675;
	bh=kE4xYln1H3vYAzVz5ckJegqLjKvVvNwbUjwODAr7b6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZKU5RSOCY9RHfx4yarEb75ggkhZjyQUINmE4jOinyW+vOySM8TEWzdZnmTcnrTl2
	 hEVtTNNuwb+BsJgyMF00UzEuMk9852sUyA15s3TIDga2Nx+i73LUBc3UVz6KhCfGi9
	 V3M1U829zMKEVF7K7UecXz5UwySA34VDPZktxBUQ+x0YpJU334YIDmjytTGmBF9vvg
	 1/0AbSKDWZRQB+pMzl4tT7uUBbylsLVIB9Rn8jmurG21h1bAt1pezGKLmu8IFklXyo
	 R/NcvaqZcRoA7zyevdTCxvz5A0B5BRC26fdZOy5cO0vOnfPzRelJKXGX/fSjqy0KRy
	 KN7y+Lvs0zH7w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com,
	nfraprado@collabora.com,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 13/16] drm/mediatek: gamma: Program gamma LUT type for descending or rising
Date: Thu, 12 Oct 2023 11:57:33 +0200
Message-ID: <20231012095736.100784-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025757_020326_E9E1DF5A 
X-CRM114-Status: GOOD (  13.31  )
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

All of the SoCs that don't have dithering control in the gamma IP
have got a GAMMA_LUT_TYPE bit that tells to the IP if the LUT is
"descending" (bit set) or "rising" (bit cleared): make sure to set
it correctly after programming the LUT.

Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6746033615db..0f116c0e51b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -22,6 +22,7 @@
 #define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
+#define GAMMA_LUT_TYPE					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
@@ -82,6 +83,17 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
+static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+{
+	u64 first, last;
+	int last_entry = lut_size - 1;
+
+	first = lut[0].red + lut[0].green + lut[0].blue;
+	last = lut[last_entry].red + lut[last_entry].green + lut[last_entry].blue;
+
+	return !!(first > last);
+}
+
 /*
  * SoCs supporting 12-bits LUTs are using a new register layout that does
  * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
@@ -173,6 +185,14 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
 
+	if (!gamma->data->has_dither) {
+		/* Descending or Rising LUT */
+		if (mtk_gamma_lut_is_descending(lut, gamma->data->lut_size - 1))
+			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
+		else
+			cfg_val &= ~GAMMA_LUT_TYPE;
+	}
+
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-- 
2.42.0


