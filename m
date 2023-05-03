Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4726FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5c7y0UT7nVX94WUnBP3XjsczxpT/TJ0jMYu1UziX0s=; b=bjBT+RPAgi8Rm11ZczO6VOwUVu
	cX9qvQF7wu02rV++loCQTku1yCyvIeIUCnrUNJ9ZlCTYRwMb87ZMu+fjBm+jjNYMTSpQbTavIRjOC
	/6ebevNdMi0TjXFF/vKIt3pmbL1VRV2kghOPOSsx+a2OJRd1eJil7DDFM5g6UG8V8ZA/+qHCZb9cV
	ZeVNt3mC85pi7UMmbM50hmniNPb8oog3MY971nugTK/vui7nTFs/2w44HfDEv45r/eehKJPnFEr7B
	6MN2SOED59qBqi6BSZpN8f0T1hIpKp85sjbuvEd34bL6rq3jOwKHEME0OtqdiuAM4sLWLiZBZClKp
	ZtkCgfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puB00-004RtU-1l;
	Wed, 03 May 2023 11:50:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzN-004R9c-1T;
	Wed, 03 May 2023 11:49:43 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6888266056F7;
	Wed,  3 May 2023 12:49:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114580;
	bh=VyVu+pf1p1xOpUgIaK+PGsX/DVeLntrIgyVC08xqhAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfMfsPKhizXDp+gvksw1TeJ321YApn/AYVnGnPcAKywO5NY82egG9fn5RBfBUtdeU
	 f3cBA1my1aDJF/8mDsqmLY9IlN1ENZYBklkXjfQ/oclQLprMc12ZzgsvZ9SEIwJHTA
	 QA/l8Ypj25CAfq2tkoCfEsO0DS/2RkqHjw02bWqwHeHP+8NzjOsrlxrRCGeJn1fdo4
	 EL2tjqOwSoQspxEBwHrPwDmE5NY51pN5HN+3XyOwa19nWsx9fQFjRP3hEhh3WZTD0u
	 zTqOON5lilmgxiU94N/UD221I1k4hqABlQXCHnfJJ/u4HVsQieloPgYBpBzscSZD0p
	 cSMsxZdE7AAqQ==
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
	kernel@collabora.com
Subject: [PATCH v2 11/11] drm/mediatek: gamma: Program gamma LUT type for descending or rising
Date: Wed,  3 May 2023 13:49:23 +0200
Message-Id: <20230503114923.156985-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
References: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044941_640529_A5CEEC7D 
X-CRM114-Status: GOOD (  13.84  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 44f397f88d0a..1cf3c89175a3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -23,6 +23,7 @@
 #define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
+#define GAMMA_LUT_TYPE					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
@@ -89,6 +90,16 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return lut_size;
 }
 
+static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+{
+	u64 first, last;
+
+	first = lut[0].red + lut[0].green + lut[0].blue;
+	last = lut[lut_size].red + lut[lut_size].green + lut[lut_size].blue;
+
+	return !!(first > last);
+}
+
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
@@ -182,6 +193,14 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		}
 	}
 
+	if (gamma && !gamma->data->has_dither) {
+		/* Descending or Rising LUT */
+		if (mtk_gamma_lut_is_descending(lut, lut_size))
+			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
+		else
+			cfg_val &= ~GAMMA_LUT_TYPE;
+	}
+
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-- 
2.40.1


