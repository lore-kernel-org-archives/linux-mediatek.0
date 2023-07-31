Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97553C001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN85wiWkZVFwggRuVX2kPZbQo9VZUZBF4boe+uUJZno=; b=mGiS2u1SfPgCsNyiPdN71Cdw0K
	3xhzK9eWlNN95sG9+FfhmxDdqE42EKZrPDV2b2XRe7ifyUS28jRrgX2R5ehueCAtK2Ms7Vv0xxJou
	yvQyYVgo6SY0mIvlO1BGViS3EOtl1GOwCcTuDe8fFYDsj2f0Qfgnre7+6kOZOQOpJWY5bBYxxQRYR
	1f095YcpFcVoRtO4sVju1tNIw7PtjGSYv59ycpxnNd7+eOCNHyeYBOyAsQ3YdjYuwKO1iAr+15L/U
	xG42VfsmO+7OJo9sUgLCAc7r9ymsHrX/WaiyQlTEDEvvnzXBMa5td6sbkartpnqZzbp9rzK0YGgWU
	m0ftvWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSbh-00FgVf-2J;
	Mon, 31 Jul 2023 13:06:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSa1-00Ffky-14;
	Mon, 31 Jul 2023 13:04:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 607156607186;
	Mon, 31 Jul 2023 14:04:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690808696;
	bh=JyiXp46HkBH9WpMUqKvCDJPiZ8ZADL6pJeyaAgpHTPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZVXhalDl1WIW+iMpTN24xPmdb/ngijVWmOxfIKgCRiWCiMEJ6rx2i5KSXZj7UTaWF
	 O2gXayCb5nZ2cBc2mMXcN+i1t7j4ma5fxURbmCl/83omsDbkRMlcoFXqBU2pQLsWUH
	 BBtG+ZczQLNOsU7zeObcpmg/pGlKrb/tTb4eZZoyf3zuSlyAbYnZc9FS54RxJu8Ax2
	 X/vP0E2Xjok6TGFncAb2HhOx5KJIk6YLR8XSnP0Os1+ceHEGRe8ud3kaMlA8jRt7xa
	 yqgSS8znUh0gRTa0zppT8SVLia5WKzR8TITeJJ5TYVh8dhMVBu2gyHLjFkVGG4CRgC
	 QMP0Rpzd4XV/g==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 11/13] drm/mediatek: gamma: Program gamma LUT type for descending or rising
Date: Mon, 31 Jul 2023 15:04:39 +0200
Message-ID: <20230731130441.173960-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
References: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_060457_496865_5ABE3C54 
X-CRM114-Status: GOOD (  13.56  )
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
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 659d5c512238..6fa3f583f8a1 100644
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
@@ -86,6 +87,16 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return LUT_SIZE_DEFAULT;
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
 /*
  * SoCs supporting 12-bits LUTs are using a new register layout that does
  * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
@@ -193,6 +204,14 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		}
 	}
 
+	if (gamma && gamma->data && !gamma->data->has_dither) {
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
2.41.0


