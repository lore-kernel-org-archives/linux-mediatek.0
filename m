Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986FBC04A94
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2ThE4UBL1oerTjDLeHGolXrEnWzxXfjV/UoaGXXiV4=; b=Y0JUUwYq0Dt0TE
	w0r41hrtbxVPBqAuiTtCr7PNRe7tx5o6vRFP7znShMLLELx4P3fsv5506JKVjmb0DKorOZa5VxfYc
	/nqEJGZljV73PEdRWu1TA88g7gIXOlB0JFkNxh3cb1fwm4vQcFiwB0A5MU1/FwauUmYne9AyCi3KU
	G11k6IZr5w4fvxmCGqtP+vwQ68nsNhUVfgmfSCWTX76GqeBdadrjUWnPfKNcBlUG06u/xIu0lhizZ
	Z+whpKifpaNEIAHYIjzmIy0k6DJNdAaKPjlajIelZhWU6hUWbMpIOuzJ7rc1fQZQvvDCjJldflicG
	sFQvEz6zInDijOC9VJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnk-009ZeP-0M;
	Wed, 26 Jul 2023 08:23:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZnP-009ZST-0W;
	Wed, 26 Jul 2023 08:23:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 328296607123;
	Wed, 26 Jul 2023 09:22:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690359777;
	bh=fnTCmYsrDDNtkDG9EQwHh0fbSiert+Ttme90qPGoI74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixo/92B0b4iuNTniChsi9dxG+BxLjIWQ8FWpvz4PiRgpa7+PwlE2/dc+DpgLjk92D
	 S4p20SuBmmRAvyYtQni89CnMSvPlZQKNVam4y4hyG9keJITRDBdBTMnPgRNmcq347b
	 fiIVHXdFqpbT1pjcXh7Go9ZVt37NQRZBpDKJB30nRObUvf1PuP3xhVAK9Zc2CTtgQf
	 KOmB5stsbGzewlJDMVtoLE3HAezbYmbPj/NBGpzMrJUVfWYuQ6mPmZoz3K917ja/v+
	 bCh9QU9WDRlmO3AW31KqPiJ1ECJ+lJXp/Jm3rjP3JpvkSKV0VzSvBvlGZE70qQYwwk
	 u8EJ5JvOtLexA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v3 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
Date: Wed, 26 Jul 2023 10:22:43 +0200
Message-ID: <20230726082245.550929-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012259_325052_2ED5BFCE 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The .remove() callback cannot fail: switch to .remove_new() and
change mtk_dpi_remove() to void.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 08822fe88c93..2c95de5539fd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1086,11 +1086,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_dpi_remove(struct platform_device *pdev)
+static void mtk_dpi_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_dpi_component_ops);
-
-	return 0;
 }
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
@@ -1121,7 +1119,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
-- 
2.41.0


