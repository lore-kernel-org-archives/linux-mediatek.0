Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0569C71153
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6+UmeKBuB6CucCMCQp2vyu3a7TQ6qQRz4yXZEaG2sc=; b=FDiTFERNa0aZgg
	mBxA18LqFz9CusPBURqAHl9oEG5lajRoLxDaCaM48btoDQCmBhnJmyoSrrIMFJLt79OsmIxL1yoIb
	1m7tq7QeHwH8dsC+HsLYBrqeeWJrYKd0XfWvtE+NJgXTPxGUK2JPXM8QLztzrWODWe+Aq9JYI0ekQ
	csnQUzohuhqXQ7NBViAk33FZzT115CQwUcT3wsCWTiqEnzPPnymuUD7nNY5vzbYux8+pq4Z6+ZqQF
	44WoVa7BSCmdFEY5y7W/Td/JlGU9SzVpnVDBWQiF8huH/ve+yw7CGtAq3WkCVL3cEjmhIKatpF/tO
	4wdgrWp7GFG5wKsgZ3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaye2-00BZmd-2M;
	Tue, 29 Aug 2023 13:20:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaydx-00BZk7-2y;
	Tue, 29 Aug 2023 13:20:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98E7A65266;
	Tue, 29 Aug 2023 13:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0331AC433CB;
	Tue, 29 Aug 2023 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693315224;
	bh=VmiiCQJmx/vUEhDJNuwCqJdIf0rnLGfJEi9IfqpWrHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NS5NeyHzBnEpCSp8tUcOhptK84Gn4+X+ta5XVY9kk0xU+tA6sgA9p6xWqjx/JL/nR
	 fSVCOyncSFQy3jAIVO+vfbKbwmzBzfvykwgR18CuIfxtp4893xTNP/bWRXyYziGz3R
	 dknzHrw6+ldB986WCqR7L0Y6hF+IlfZPrsEk3KXoz+y2a14lN8E6W2q2yymKdDLl4q
	 ttO4a2hm8M9h4CXFmwHFFhAU7YspeVrR+PZntfgwPtbxvGfGAU52SzcUtBYttHSKqp
	 TqBoM5xj1iHL0Ppn37bGy1ZhdqPmIBFIlh/k3NNWM2VWZ1U5Ulfj25h5Pd1YQhQ47O
	 9hFiSIDrm9Dzw==
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
Date: Tue, 29 Aug 2023 15:19:41 +0200
Message-Id: <20230829131941.3353439-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829131941.3353439-1-mwalle@kernel.org>
References: <20230829131941.3353439-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_062030_045875_8D792570 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Michael Walle <mwalle@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
always have the CRTC with id 0, the ext id 1 and the third id 2. This
is only true if the paths are all available. But paths are optional (see
also comment in mtk_drm_kms_init()), e.g. the main path might not be
enabled or available at all. Then the CRTC IDs will shift one up, e.g.
ext will be 1 and the third path will be 2.

To fix that, dynamically calculate the IDs by the precence of the paths.

Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 41 ++++++++++++++-------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..f3064bff64e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -526,21 +526,34 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
-
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+	int i = 0;
+
+	if (private->data->main_path) {
+		if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
+					     private->data->main_len,
+					     private->ddp_comp))
+			return BIT(i);
+		i++;
+	}
+
+	if (private->data->ext_path) {
+		if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
+					     private->data->ext_len,
+					     private->ddp_comp))
+			return BIT(i);
+		i++;
+	}
 
-	return ret;
+	if (private->data->third_path) {
+		if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
+					     private->data->third_len,
+					     private->ddp_comp))
+			return BIT(i);
+		i++;
+	}
+
+	DRM_INFO("Failed to find comp in ddp table\n");
+	return 0;
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-- 
2.39.2


