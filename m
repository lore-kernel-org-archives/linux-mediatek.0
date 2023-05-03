Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1EBC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnY/O39+ZadMl6zi5z4YHRQybMKStujbBUi1CQ+ajoA=; b=qJT1Zu+P6ZLBV/h0hPurV4idl3
	2lR5dfItuTPueNwm3SGWiF8FJe8zBWwt08fpnhLnUAsNPnZpXSIR2GcBx4b3BfgFVJXIf/7JzVQSJ
	dG7TSy4qsqdnPFg27czdeHEh4QQx5V0cTJLD3e3uD4uR2ZsUX25lMv/Nm5n72tt3PSzl4E1OwkGkn
	yorVIFdiC3erP5SIItc3Zwz3dBd3FBphF/3zJe7TMJTWE2qTykolEEQZrvsItd/tsAKD+pDjithvX
	GxfC6xeMOZVY1tU35LUzy2lQ/BYQt9nJeKK7OkRXdxBjpZeU/o6oIJ6biw5Y2lcBScUvY1xhxsrOI
	3Fd5YrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzr-004RjR-0x;
	Wed, 03 May 2023 11:50:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAzM-004R8U-1l;
	Wed, 03 May 2023 11:49:42 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6ACB766056D2;
	Wed,  3 May 2023 12:49:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683114579;
	bh=ivRmnwk1whxWeBslyrKNoyOanuLsoevQ051ndDHcIq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S60/A5woRGn/85G8+eIvnOss5a6G00x/v5ETzj/ufqOit4EOMwVbO3dCaEqE6C6/L
	 v4MSQzvADkdxPmLIQ+wmS5ZjjmCAllgiy12asXiOUEa+5vrahIx+bU7TrC2cma+czj
	 CRExLpz8e2xrL5OgB7kT3Wjsuj3Ib+8D03EAGzphshLYigNAnswCcRlv4DiZX/hDhp
	 csjv71++6Wm05QM24NxMtofPsay/rMI8HkBqE/JbgAS9UfwM03Pwj+QnIAKyFhUOva
	 pwm56cWyzkV9x0nykjXMCUnL81+9qVvBXKtzWTkdCObe46iTC584AbAivBeUiTkfNc
	 M6JKrUcCZfjfA==
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
Subject: [PATCH v2 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Wed,  3 May 2023 13:49:22 +0200
Message-Id: <20230503114923.156985-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
References: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_044940_746100_7220B244 
X-CRM114-Status: GOOD (  10.68  )
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
index d5da3e84cd53..44f397f88d0a 100644
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


