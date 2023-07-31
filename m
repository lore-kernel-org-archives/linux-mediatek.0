Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30940C41513
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7mNQobM15yRT5EDU/Yn6Q2oH+hIhpVna+0HfgmKdxM=; b=s5pLamwr9EcbzTG4/Fq9VFIAW7
	6UJjbfFUoHlG9cy2G0ejkTIdr3fuukO0P1HTAlYzScELJ3i7QQq93Q6UvqvCxNFoF1BUhfj1I3m63
	tNStl8wAjKBgRmAJOrW732d76N+lvQu5mdl4uf3Ppm5AEs2I1/8kUgD4mDvt10KrMLbOXtC4yP7F5
	bJBJF/OXxE03Id8s2m1adfVt2S/+5ru3EovDgvXy3tH5eHDrjQ3BQ8Nhac0JOtG1BqZkcnnQ2BbUX
	QByBdlbImqi0Qw1ACeI6DVYBOUEB22ff0ZM37eFWPtWllngbUQ85ivl94JYnuZQH59w4mOnpHl19W
	2YcG3jtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSc3-00FgfB-0j;
	Mon, 31 Jul 2023 13:07:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSa3-00FfmU-04;
	Mon, 31 Jul 2023 13:05:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3240D6607190;
	Mon, 31 Jul 2023 14:04:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690808697;
	bh=oi90BFzw+vRNJ7SDlZut9Au2BJmQDV5m4O2v1GmjzUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Neol1ctUBENvx71Ht4UmmXxdW4B/HmSgfgO4UrxYzk4nyv5+yBqiYSWym7rWoplHb
	 1wU0NRRTIHt6lmJKxNLd4tzRfL6rYn9YHIlmIX4yQBKeYdFKQcAojop057QAv1/J7x
	 i5KysVJ6F8zps4h31ahGBaNvUsxc+Q+HtynSjyFj5hIJptL7lt/1GtXXKqPvHhLe/6
	 GEdUPRHMyIyrq8vErVGJt3YDJN/iFNlr2T0ZVd/VjRHWJwetfRD1ingh4+RKimn33v
	 qaIVou/udg7UvsjkZHosSSc3lpn70Fi5zc9gmAd5QRJHLkmbc8ddyW/s6YwuJOn93c
	 gjRLJSOgg8jCA==
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
Subject: [PATCH v7 13/13] drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
Date: Mon, 31 Jul 2023 15:04:41 +0200
Message-ID: <20230731130441.173960-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
References: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_060459_188213_D6F3863D 
X-CRM114-Status: GOOD (  10.01  )
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
index 6fa3f583f8a1..ee6b06223291 100644
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


