Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FB7C36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zZHcgrxblYBO1LZIVR1v1lilwDhlEpuQm9A9UNmlEQ=; b=3np9e+VpGwAPPMeahFZ/blFrdN
	yeLXgLqxAbpDTbJJYtIr+pme92Xxq0x+FOeoWWoyV8NlahbjGDgG6yeLMEWwJxzhXbdmVhshXsVeC
	UAwipVDwgx6IaTi9Q8AwpulVV0GhL5IqdCDGwp06CzuFQm94OfOZjhFx3H2wa0HscDVKmf61jkatk
	qff+ggcnovPeUJSSSgsTH3tPYPcgqPjsNFiaHXV2sBLSDY9qBQFnyHRMiZirH5fthsCqzR3LsQm89
	/88zzL5phTb7sL8aard27M8WCh9iFXnxVT7N/JPwlMC7VDjB/XRmhsLDzC2mRWWHJuwslmHOcuBkv
	zzDXhamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VIX-00000007GK5-0C4B;
	Wed, 09 Apr 2025 13:16:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VEx-00000007F1S-3dOO;
	Wed, 09 Apr 2025 13:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204393;
	bh=gv/6AiDijBd6gkSOSp+4FGoCW0Yre06suda1+c6HY/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e50j5eX2hKm9wWpetsGKUlhD+hBnvlEGRbi63E9U+64jKCA68ogjnsPuyo0TWIzpC
	 5B7+EcQi83k5bVSP0I0M771pFyTcNjIyz9Qw6KrH4/NbCjdonXTiZ1eVJzsnfjllL1
	 byG4nUrVhnVhy5ynpOnGiBoIx830ruuaZzUJw4F0GVFhGSngnkFBCIcrDP4+fxyDK5
	 EufFyCXF06BIazjixQjj/W/xhNV52XlNb+y7pmqceWm400qiAPbFqKKZ1EAMPXEgmk
	 LAY0kef2QNNWRJIMpMTIzy093FYTpXgNOPE5w2xqr3bsz9ZakQM9nDsun7xjqIowp9
	 3PC+oOCANwfgw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D132E17E0809;
	Wed,  9 Apr 2025 15:13:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 1/5] drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
Date: Wed,  9 Apr 2025 15:13:02 +0200
Message-ID: <20250409131306.108635-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061316_056705_4372DBF3 
X-CRM114-Status: GOOD (  11.41  )
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

In preparation for adding support for an additional color format,
convert the format conditional in mtk_dpi_config_color_format()
to a switch.
This also makes the concept of RGB being the default color format
a little more human readable.

This commit brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0fd13e6dd3f1..d735398e97f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -452,7 +452,8 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 {
 	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 
-	if (format == MTK_DPI_COLOR_FORMAT_YCBCR_422) {
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
 
@@ -463,11 +464,14 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		mtk_dpi_mask(dpi, DPI_MATRIX_SET, dpi->mode.hdisplay <= 720 ?
 			     MATRIX_SEL_RGB_TO_BT601 : MATRIX_SEL_RGB_TO_JPEG,
 			     INT_MATRIX_SEL_MASK);
-	} else {
+		break;
+	default:
+	case MTK_DPI_COLOR_FORMAT_RGB:
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
+		break;
 	}
 }
 
-- 
2.49.0


