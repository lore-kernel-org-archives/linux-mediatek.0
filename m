Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF61DC001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUl62F0yXmRhO/8nxFkuhQdVGSkdKVrP24aIAVxWSpg=; b=l3VfBS5840roq9B91SIZ92NReg
	A6yN8tmfptmzmcmwyw3Zlf8yZJBNu54x8xu73g1Wm8gXncpWu2Ga69eFy6CpF1C9de+zpCmMbFwsa
	UfW6fjkCTqxlmNiQuwluoxnYcYM/W0dSBG4MAoHUCuJSiILqKHhJqq+/iO5pxVsUDLOI1OnGQ0O1y
	guhvckyKdnE8ARIK5jOVjy6HtdIDbPyNFuwLwkIf2edX8o8KK/Fz2AcaqlvZpw0zRtytzqHFeE3Dz
	nE70Ql2eUpvZcxUx4lSfHNAITYXmUw30ZYCxK2AhsG0pq52T2u0hpb/Z4DyYdFVmhhcUI6HDvRpuH
	p11ObW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxbc-00CsjQ-1w;
	Thu, 27 Jul 2023 09:48:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxa4-00Cs24-1x;
	Thu, 27 Jul 2023 09:46:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B12B6660716B;
	Thu, 27 Jul 2023 10:46:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690451207;
	bh=h6f7psRee+vgHmJfxJWJCr98AHCwupGoqyn4DcinahM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvKeA0w2LcQvp7rzcZH1qY5qVCXAbNiN6rLLKiEh1pgOYiG18AE/8hJyMaNPLuk2C
	 gY6Yc4PbG3ZYwU3NAqaDTW/LYWjN1DeRTh0i/KS+UiWkZbwJvW+WAmzgout94J0pi7
	 OXpW9Sn1Jkb2y6G4GIOPaP+P81jQvGlc55aLgBapPc+1NCDKTHmAtIw8SbJUsvObXL
	 pjANphnRTdVQd9E9QaydaRMJS/uR0U1fM/yKCnSXo3iPy+HhwANIuUUdcfSSxilV1j
	 hj2PbBTnOXj1O1BbrMhdfbEuWm6Q/4oRvbRkJKT2MnBnce9qS0xP3y0/TOL3pvQafa
	 eXOVY5dxZbRFA==
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
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH RESEND v6 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Thu, 27 Jul 2023 11:46:32 +0200
Message-ID: <20230727094633.22505-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_024648_817564_D9B64ADE 
X-CRM114-Status: UNSURE (   9.94  )
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


