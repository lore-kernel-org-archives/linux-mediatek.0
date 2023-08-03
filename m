Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72527C04E69
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 11:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obwngE3wNtQILTpmWXSVVqRGgxdeMgYi2Erw2ZajQS0=; b=zpcAXZTfmL+eGlpBnNXFsAThT/
	H8k4SaiSK0450wOUKBzTIquuY+lAKWtoYlhu1OB5Qb+f0P6J/9PhjS31DCAMib2OeVAjARPkbcNT6
	QIuP6eT5XPAA0BbegFrGSSqPbXFIIs+l757ILXBCCK123xPl1MekBIoM5SVWGQeu6e4bK3cWvSj/+
	stDkqIXQBt0jcpxetOZHfSipO5a8iqcb3Fuiw26hvJ9fp9KN87k7kgPz/9uYZb2OOV/DPp5AKaqH/
	/VPVxApSDQKi6II3cnX8jHnIEBAkwiS1fWa863gq8P6eRJkpgMoltwBWcVhMBsfGkYoHKekdZpKWM
	xDOyodzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW7Q-007d05-0A;
	Thu, 03 Aug 2023 11:03:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW6D-007bp9-0k;
	Thu, 03 Aug 2023 11:02:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57EFA66071AD;
	Thu,  3 Aug 2023 12:02:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691060552;
	bh=zIuIzaHEwa0qol/Hd+tCNwDoAKXf8h/2l/cB7d8v3GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Po47SfpDrO8QRYfh0Yp8n/3/DG8uV8OPZDWAW5oGlWFlN/OcQldRt9V5K00nt4rBI
	 FatYBUomIfPRUid+uc0kq4gd06Tu/s0EZl4KtRdO7BuDEUbL8yvqGM4SDRxlMLcFy8
	 XYzqfLAr24pdGftUSjxvLPJ3afUb4I1TZ34PE3auFfrFrAROZ7BYhy9DQIpc1xPsA9
	 HSpcyh/fKLfxpSD98o2M9fCHbrU011baabPTI7wnrwxirP9LjkAfdjO6EdLWAv4bjM
	 oZS+ueRN48f8iF6IPmkp8/sCj0qhxDEbJk3gAsSSw32YCh5V2Rjy9Au478njkV/Tn7
	 9Fgnz3RmIVHyg==
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
Subject: [PATCH v9 12/16] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Thu,  3 Aug 2023 13:02:10 +0200
Message-ID: <20230803110214.163645-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
References: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_040233_480849_9C62C22D 
X-CRM114-Status: GOOD (  11.24  )
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
processed image goes through in both DISP_GAMMA and DISP_AAL for gamma
setting.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 3 +++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 21b25470e9b7..992dc1424c91 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -122,6 +122,9 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 		writel(word, (aal->regs + DISP_AAL_GAMMA_LUT) + (i * 4));
 	}
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~AAL_RELAY_MODE;
+
 	writel(cfg_val, aal->regs + DISP_AAL_CFG);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 7d2f8042ace0..fbff9f97b737 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -19,6 +19,7 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
@@ -177,6 +178,9 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~GAMMA_RELAY_MODE;
+
 	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
-- 
2.41.0


