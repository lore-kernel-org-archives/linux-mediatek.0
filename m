Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5D9C41513
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQTAYDiE+GfEtCgeFY9JHF01J93fSPWmXQearA4iWSs=; b=W3ITTywWOZTgAzTY5oyf719U4A
	T6/rsnNqEeskwZMaPFqSEV6+6CEJxD7eOylacRRd+QJJ6hnQCesN5HKu8CV857ba6084TZVBahHTv
	/rLPxypxBVFD5I6OSTWMMxlp0yRL3+B952dF1LwdfgM2FPGgJWUXjENkX3zj96OvD3mXx1iD3LsVn
	+qJ5priJdZQ7TvXobxfyXy3UKwJZwNOiEVzd4JCAupiCDsC60ysQlSsABG7wMJaWSuL8ApWbYcRTj
	1XrEKCpQTCvqepuiGnzC8TyNKUqgaGYxn/kK5QwMSeY5q0tUd/gJ4W4SuHjrqPkgQ2VPd8wkYXhCc
	sCUOszaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo2D-0029vp-0a;
	Tue, 01 Aug 2023 11:59:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo1x-0029ad-1y;
	Tue, 01 Aug 2023 11:59:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C19D8660719E;
	Tue,  1 Aug 2023 12:59:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690891152;
	bh=0jjC3Fg5s2rO0VQ/mVis11uZqJIg4LIgSGY5cW68WVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3R6cqlK085xUWcXg6UptkC6YQqgymple26EyBKjt8cibwdgFJLxSMb0TBo0TN9PG
	 J9q54fpBncBXTs8/k7du/CgnSaitIeQ5LB5p+Pp3d0r3rPygOT6Kiyx5d+SpYYWz1H
	 cSpSwaoX5rPj/yproq3zCXGXnIm9v+uDIeIQjyYTzLP9juHfwFrpGe2fIDupS4+poF
	 GjUYeYnDVAk2WPPFmXF6QC/nFXKI+dXAyUExbLnjM1r6jp8wmZg2A+RLfSdZaIzgV9
	 Wa81e+0VxsNYQ59vj54uxwiu1Vd1XWhhmWN4+zGspDYbLLM6XwE03Sjn2eDZRWK3Xn
	 eEd/Q+2OaRhCA==
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
	ehristev@collabora.com
Subject: [PATCH v8 13/13] drm/mediatek: mtk_disp_gamma: Add kerneldoc for struct mtk_disp_gamma
Date: Tue,  1 Aug 2023 13:58:54 +0200
Message-ID: <20230801115854.150346-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_045913_807462_4774EDB6 
X-CRM114-Status: GOOD (  10.28  )
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

The mtk_disp_gamma structure was completely undocumented: add some
kerneldoc documentation to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c6b77ca3e655..9be1efa9766c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -54,8 +54,12 @@ struct mtk_disp_gamma_data {
 	u8 lut_bits;
 };
 
-/*
- * struct mtk_disp_gamma - DISP_GAMMA driver structure
+/**
+ * struct mtk_disp_gamma - Display Gamma driver structure
+ * @clk:      clock for DISP_GAMMA block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform data for DISP_GAMMA
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.41.0


