Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC1ACDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fOE0s2BG+dmz4IVJKd7oC1YWT04fOmf0YyPieb6z3o=; b=FI17wPq7jw6OYukXF6cnv2JsGZ
	yEBbs8TIsdrK2RyRCe2m3Q0F6H7aR1CnvBib+m9IduyscYEDfPwFhv2qy3BlaogYqC+NREucg+abe
	VxjARMvcn/C4apeDSvsgFQoSWVaXLn2UmkHI0HVpxV89sQaaRUP0G3KPgDRa8ECtpinsriBZw4E3F
	u0QBh9o12gVyaPSeo/YxV2E8xbUyaiNj0ZjVaxS9paRe+cO/w5tOtihH5xa0XbnAa4UAuSQXmm/RD
	p3XFUXofzUkMbWjWBtFXu4HTNR8Z+i7Yf4xVdlNTOPneWB0n3DVczLAfYT8CuJPRL4uG1hfcI9Bhc
	8tNHwS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSo-000U5Z-1K;
	Thu, 12 Oct 2023 09:58:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS7-000TDN-1q;
	Thu, 12 Oct 2023 09:58:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 984976607362;
	Thu, 12 Oct 2023 10:57:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104678;
	bh=yTuzr7kwQWHUl8HtZXARUiw4vwCiedeVUiWy+PyIDto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKGyDy9ocMehP5Q106HwzwZAExymO3OnWVdnh8WmarSyzztnnoin1zD/e8IBFqTy5
	 8TNsvNWL6ADTgCxAd6Kcg9uk0urAqKIQWctJb5iTm8PI/eYlShc3Ga22CMU+g6J+5p
	 aS+8kXeHZg95Bcf5mYMgnUDeYNWIwVm87hm3y3XqQ04sKWvdkSDCEI+2WhPbeGaqet
	 GvGJE2K3oB1jiwBWddeCb3lhscvtcHCp3orcnnEKPKLn0LsS2nrADLeToB0W7F1eGJ
	 dOY8IF2vS4Q7OpKgTGA19vV3coVFVE3tV01AJau9CZ4vRCUb60j2rpEiMfxu+u6m5V
	 rAfGReDSOxKFg==
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
	nfraprado@collabora.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 16/16] drm/mediatek: aal: Compress of_device_id entries and add sentinel
Date: Thu, 12 Oct 2023 11:57:36 +0200
Message-ID: <20231012095736.100784-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025759_770231_9F6968E6 
X-CRM114-Status: GOOD (  10.73  )
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

Compress the entry for mediatek,mt8173-disp-aal, as it fits in one
line, and fix the style; while at it, also add the usual sentinel
comment to the last entry.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 7b3e1c275056..677e7d378e7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -209,10 +209,9 @@ static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
 };
 
 static const struct of_device_id mtk_disp_aal_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = &mt8173_aal_driver_data},
-	{ .compatible = "mediatek,mt8183-disp-aal"},
-	{},
+	{ .compatible = "mediatek,mt8173-disp-aal", .data = &mt8173_aal_driver_data },
+	{ .compatible = "mediatek,mt8183-disp-aal" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
 
-- 
2.42.0


