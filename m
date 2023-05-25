Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C9C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STKhAvKkC+lP256ddY50b+4KlNHKLcVMgo0FloXQtxI=; b=qKqmE0uGEuRXNK8XvVCP8soL3T
	yZ3HAHVl8EWuZHoh3bBaLWmpuQxyVYU+YuZmhPcWpsgsNFLylxnV/Lc8VLKt26Gp5n4msMtfj/vW9
	HCUOf3aPRgsEh0wZ23gWZi6SWW4MHbc0UxSa5gLKs3p6xncGkkeW35834ZujtQ6vj+mRLoFCRbHEA
	7n+icB3C6uKO+UuXlIjRp3+BEdwdEHMLpNk26oGJEQURM1WsvUoFiQ1uKtfSyBD1fpRQZSWtnVFaZ
	KBvydodYL1GGwvhQRwiajwAuFHjuO02DCci5Ol6DYj1Gjfm/QYkLuKBht9ANjnSmvsva/G2GUqtw9
	qOQEbSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q29X3-00GYaS-2t;
	Thu, 25 May 2023 11:53:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q29Wl-00GYQ9-2K;
	Thu, 25 May 2023 11:53:09 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2B096605873;
	Thu, 25 May 2023 12:53:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685015586;
	bh=MoBImu80zRJLNrIylFPj8ddmA5b0Asfo7LRys0h84Do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVBEcI9ahUXaJXN448On565H6zdBKU95wp/y1ZvBKINEPWuCIw+kg+z6GCt5V3zsl
	 7oze6tsHLIb/sMuUJLy180HiOLrwB0GvlXFPvyWQKQ5SaGSsMVmv0+X+LLJEmOqMys
	 aMzHW+qyeJ9oIpea7t6W9MZYUu8WzQ8xIpr1u0JPy6BVHCy8uRN3d1eQ7WFljI8EpK
	 atAjfwUy8AuS1XsidThCn9LY8d34ybReXeGDsLWOcFcPazUrlKMhIvgqn5pQS/cn0f
	 l7/ClU6K++2TUGjJXOvRcQ0PXl/h6GONldIhGAuHeuElqHoe3mEhGqrqsQkc6goowo
	 N0f69sdpw2ThQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/3] phy: mediatek: mipi-dsi: Compress of_device_id match entries
Date: Thu, 25 May 2023 13:52:58 +0200
Message-Id: <20230525115258.90091-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_045307_893702_CC772F35 
X-CRM114-Status: GOOD (  11.38  )
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

All of the entries do fit in a maximum of 82 columns, which is
acceptable. While at it, also remove the useless comma on the
last entry and add the usual sentinel comment.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 4e75c34c819b..065ea626093a 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -180,13 +180,10 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
-	{ .compatible = "mediatek,mt2701-mipi-tx",
-	  .data = &mt2701_mipitx_data },
-	{ .compatible = "mediatek,mt8173-mipi-tx",
-	  .data = &mt8173_mipitx_data },
-	{ .compatible = "mediatek,mt8183-mipi-tx",
-	  .data = &mt8183_mipitx_data },
-	{ },
+	{ .compatible = "mediatek,mt2701-mipi-tx", .data = &mt2701_mipitx_data },
+	{ .compatible = "mediatek,mt8173-mipi-tx", .data = &mt8173_mipitx_data },
+	{ .compatible = "mediatek,mt8183-mipi-tx", .data = &mt8183_mipitx_data },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
-- 
2.40.1


