Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CF6C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUl62F0yXmRhO/8nxFkuhQdVGSkdKVrP24aIAVxWSpg=; b=Z4s0GHX4fvYwKoCi4w9nN33zve
	Kb1vW08j7p4ui0/JoC2ioCWI38MMsmLN5gerL8euHGRzrYcodRzEsQ9Li++8w40eVAef71uL4SbOk
	0rzxrrBnBxsUvof7X9h8lHqKvhS2b+wsrnfKcK+I+qc+bzGGoV+gGP2ga5jbDwKwd2/jW40FZaYUA
	jjJU5aMnHnSy8bsM2DvCEU51yMjAo657ykIjJQUx93jetL4ifupe3Mr/UuK3jQkxyZ1OdbnlztL+/
	t5VCTWl18h1FrMUlt71hZ9GNb4aoN32to8NQf/IIHAFCDOM05rRm6cQ/UxfgNcZywvkuGEIJp+Dm+
	mU12PitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4hS4-003Xi0-0m;
	Thu, 01 Jun 2023 12:30:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4h8Y-003O6k-0I;
	Thu, 01 Jun 2023 12:10:41 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0740E6606EC6;
	Thu,  1 Jun 2023 13:10:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685621436;
	bh=h6f7psRee+vgHmJfxJWJCr98AHCwupGoqyn4DcinahM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwNzSYmzOqeJoIioc+aQvsTONAuh3cDGtd6rE4aBXNJ92klpNdZs0f0r2xc6inZNB
	 JsCpHJcAHHqwolqKa33s9awweqNwudjgZP2OZQMEDbzGDaQXMH+fXEv+s/PN4lXGrV
	 PkJj0jy3m2IrP4JqIzrbrkFK7yzUvInZz6Df0necDCqxi7IM+Gb/+5lTJ/pjINrzut
	 w7/Oi5bTHOetUH+1DB2XNLs5EvA6E3xTPo9jhkglOLmlkbUF5Vq/HQBrMQe8GdEBM5
	 79FNz5r76x8og1naQF8GNVfyOI8TQHNml5CA43Qw+7rizXiLzKp2QMS/3tsLJLYsji
	 Gyt58l8pgmGJQ==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH v5 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Thu,  1 Jun 2023 14:10:21 +0200
Message-Id: <20230601121022.2401844-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
References: <20230601121022.2401844-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_051038_875113_96796C8F 
X-CRM114-Status: GOOD (  10.23  )
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
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index e0e2d2bdbf59..e9655b661364 100644
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
@@ -180,6 +181,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~GAMMA_RELAY_MODE;
+
 	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
-- 
2.40.1


