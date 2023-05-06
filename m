Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 May 2023 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY+LDpePcxPqC0LSnTzjGb54ZPFiObTRo4yoVqCk6zs=; b=qeZ1YAkc758KFpDmAQBPvODDQZ
	kHo6gEucmKzLyr9f88IQ2LZqpgzsl84ruSbtqSwdmq/tgduDa6o+Md8ptBVRxYcTnGesLASD6EDO9
	G+xGw1sfSmZFkYanTE0VnruPr3LIpBfU4RIi3kLXDbI1f4JT8yLfPnQCeJ6/n/sszJUp+vkPkRJU8
	cB7tlJishhUtTEN+p3ivjq0ZPYjTtQkcViKz9OhtJOiLRlZ/R7DieKZGVWxWU/mNcNKy53lzHyuwt
	akdkwprF0QRccatTk42SFOoDO+E2MCUEWM8CezO/DyTvO7UQBKdO6+C/VglgC+a/MBF9h67S2Z1Sd
	VP9F/HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvH9W-00DPwb-0n;
	Sat, 06 May 2023 12:36:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvH8u-00DPKk-2C;
	Sat, 06 May 2023 12:36:06 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2EFF66057B8;
	Sat,  6 May 2023 13:36:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683376563;
	bh=PdN+gUkXX/P0quN1LP+5WsuYIv15xBNzV6SWlkNHBrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1x6RXJQnTBKWh7b9kHxqmxAFGbxRcppsgvPOKEe4HWhlotoRffkD95RGeceJYqkX
	 Y0IhNg/eyv3C7VpZnHZmrRpUh/TLn3RyzASaMbP/v4LBbl1n3XvI1Qha4Kf/I1ctwO
	 msRC0s4/Y368Q/wRXp9YMDIJHIrmN+HO4RNjvxv1p4lnIUsISufNRZdoDRVtdMIzcp
	 FMkp+Zn0Gmyxsw5gRAwi0vnLOqyIfB4YckQeth0gMbmF7nyTQpiA6bo3AD5eoILFx6
	 aBGsmAmbKcV5ftKxQOpwssaxaGGJ0ziGuirx8K9SvtJ+dES4gzXp8v49l/qr5EUjy+
	 mYU3xTUnPJsGA==
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
Subject: [PATCH v3 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Sat,  6 May 2023 14:35:48 +0200
Message-Id: <20230506123549.101727-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_053604_858015_8318FA30 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Disable relay mode at the end of LUT programming to make sure that the
processed image goes through.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c8ccc38c5170..450da7062db4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -20,6 +20,7 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
@@ -184,6 +185,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~GAMMA_RELAY_MODE;
+
 	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
-- 
2.40.1


