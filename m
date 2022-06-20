Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91971C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yq8Rg+jYi6EHGS9ySrHVIP9Er8qQvO4+7q3rAcXlAS4=; b=u3VMQfE0dYfk1F+azLjUvRZYv7
	TL8umh+t8OFJ483+Me1fACcALyQ/1UFRwZAwEzkzFsxXQFH39KCBsa9uvdzeqZjD/FzzRFRL2Jy1Z
	dBAPs/vgvoAM0sKvPKcJueK4pXqlpaaXEeJ9oBf6eg5DZo77VFwnlNLElvTXxHyCvY65ZpQfDLuWG
	UlLPdumVT5QNmjr0fZvPyTi5mI2LXIcHYAHw1vYKYZrhWRtozq7ryyNq0+i+pPZMrrRBMMy5bv67U
	JCVEYUl/TkNTXs0vKHBUvV5zznITHbp0RP+kpEzQ6kt73V1b5Djx2Qxzv+njZxf/eg/GXNK+zEYTk
	h/QYtyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ear-00HR2B-UL; Mon, 20 Jun 2022 10:25:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Eag-00HQzg-MP; Mon, 20 Jun 2022 10:25:08 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3AC2E660166D;
	Mon, 20 Jun 2022 11:24:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655720698;
	bh=2y7HCdJit3cXRA/sDODSECzq5lWWkGtctbxdIAXtr5U=;
	h=From:To:Cc:Subject:Date:From;
	b=JRR5D1caw1ZcwxMgpxW97vZsMeHafj7w8aot2aPajs1M7TM3xcsOef6iQPvE+dsl0
	 CeOy9FUfLZwMlTaks+kXcjbamsg0eFmqKSLym6WD/WrRHFoB9Stv8IRMM88rc/PoFY
	 /fLJF/KT2rQInCoc7Y5Pp55JG174wzdiJRV3tG3aU1MPnyrNzsHDnKA1JeWsQbAJrm
	 89yG32Gu7SICP9amZOPiE5Wv/Axa5B7St5ogalkjH6SoD9D8IVO5A7n2oOsa4o4vp1
	 2VXOvCkoYLPMwjNsQY+aR6vkzfhh8lhIiJOdr4RCcNbYCoYy+vNAvPFT7gs65Yr1dA
	 Ts5btv9Tp7fow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: fparent@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mutex: Use DDP_COMPONENT_DITHER0 mod index for MT8365
Date: Mon, 20 Jun 2022 12:24:54 +0200
Message-Id: <20220620102454.131417-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_032506_924022_10329C18 
X-CRM114-Status: GOOD (  11.87  )
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

In commit
4e8988c634a1 ("soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0")
the enum mtk_ddp_comp_id was modified to add an index number to the
DITHER component because some new SoCs have multiple dither blocks.

As a result, all of the mutex mod arrays have been changed to use the
new definition instead of the old one (even if that's retained): for
consistency purposes, follow the same trend on the newly introduced
MT8365 mutex mod array.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index fa8e0ba38803..2fd8318c3bdc 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -358,7 +358,7 @@ static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_DITHER0] = MT8365_MUTEX_MOD_DISP_DITHER,
 	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
 	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
-- 
2.35.1


