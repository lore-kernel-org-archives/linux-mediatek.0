Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D5FC77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlvJymOWGRZRk99o6Zs+tnpAttf3aWYZmWAsGXVYUDM=; b=uptgNJOK5CRIWjg60r4Fx5Kwwu
	Tyj/ACDuviuG5c0SqZHxjnufOAtm/uufqqtGhs5pFdOgKZVWxbV4Du7Z1/oSzUlcWTjHA4Tn1zwUe
	TkCjk46U/ohe+IXMZvHgHnrHyqLVDs2eNN4OnczRVCsIa2V3G+1rrmoJt8bsH2lOeJcacdGrgAtG7
	mu9LkY6lZbwGUeUrpNCtBKBplig807IujErR2frJ+J/PZ98bnesjHlT9tXImIiZIOrJFIGQ8VOvv6
	47BPgwn+o0PYFPGLh+lFABbYvANGC9V2NbsVHr/ysuGTRzjoWbu7bGdNKabrMQJLaJup+/qN/NDq3
	tXOCoiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbCi-00Cd1o-1E;
	Thu, 18 May 2023 10:49:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzbC4-00CcNj-0s;
	Thu, 18 May 2023 10:49:13 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E15666059A8;
	Thu, 18 May 2023 11:49:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684406951;
	bh=AE9iGK1lfVVDFBdwJsBq/oCrjdgmEivKNGIdMO9796U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nUnU9DLHgyjY+7bF1oLROH/6pCYSR1KrGlUHqccJoPG4gzC+SI/iRW7Qmz68TAHv3
	 p3sGyyREOMJh0Ct7uPkEHdjGdSEWPClXPKPvdXVrgusuNmpLsXWe5dgFNwk4jAR50I
	 z3Hlol+Mnx+TirsI8L6kETCOXO/JKXkS6BWwvn0g5MYjxJTId00a2b2ywvLCEpglwh
	 JWXRDih6pZp8SHlYHbgCk9Rz2Dz1ugRm8rzzM5IgpjE0SjnvYqB80SMXbjcauoy/RZ
	 v8Wq8WuQ/KHk6vS7GC8i23mqgv6nNtGLv/EUP8c2/5OjYQ4LiZhjgHPbrD3y7V27fY
	 Vwlp3imfz8P9A==
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
Subject: [PATCH v4 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Thu, 18 May 2023 12:48:56 +0200
Message-Id: <20230518104857.124265-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
References: <20230518104857.124265-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_034912_435244_FC3AF1BD 
X-CRM114-Status: GOOD (  10.04  )
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
index 9ae08a2d7da2..ba8a0f93f184 100644
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


