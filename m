Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5ECC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ala1ks6V0rarnm7IA1fl3swYvyi677tS76330+JRWP4=; b=eh11t8Sc/mg5PIQj3Es84VVERH
	3lSzmKv6CjddW7fie0zov47ZQXW9/S3zZTqUX6XTna1MgLg4NfxP+WJ6SFTEoDK5DWqZhmxKz7F7x
	AxduugKQf/Trlmg/mEDzG0pDz6zVrbUF0fXgJwqL/8Ham5RkthF4rie6yxePmXqxXJ7c5/czr6ehX
	7H31XuQi0MQooDceBpytvNYLVftLu6KejomeMxqEfr6/DNA1oMN5Ntg95AHqIXpArvOwm6R046ALs
	KOH3dSLVVNtVVn6n+vpu3wsFR0zHYtS2OVqjDHFRMTeDyr5yrTBwgmGx5I4VlKVDZ5OnYitUSeLyj
	SfRRg4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW7j-007dKZ-1X;
	Thu, 03 Aug 2023 11:04:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW6H-007buI-0U;
	Thu, 03 Aug 2023 11:02:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B36E066071B2;
	Thu,  3 Aug 2023 12:02:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691060555;
	bh=eOGxKFVDezkCZBwW2hUee7R5nYDwDHZk82jsXyRXIgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYg+BLNcCZWfYvOBc79Cldv92wmSwBsSTRdQesNTk0xi+aDyXWMskQVNtYHYBHYMJ
	 8ciy72f9F2L7SSoEu41qA8BvGN5gD7Lr2cvAShiZlVxiP2ZUj//MqN3HYGfSkgeTE/
	 5mU94q8T0cah+fgS+GS7V/9vDcLEg1QryM5hIlPW05ctOudm/rKEQVWsEkYlBbb7Wn
	 b96idRuoIisXzYkTpfbtWpB13ray91f5Zs7RoZrB6t7M8fZfeHJVy/hvlHZGU0KbW6
	 8Wm/RZ+y43Y7o7XHMiHKQjgJdK5BN9p63NKhclzQdaCARjY9AHULQINhs80n9qIm9B
	 zVHZo0Gn9sMBg==
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
Subject: [PATCH v9 16/16] drm/mediatek: aal: Compress of_device_id entries and add sentinel
Date: Thu,  3 Aug 2023 13:02:14 +0200
Message-ID: <20230803110214.163645-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
References: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_040237_349076_4E0EDD33 
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

Compress the entry for mediatek,mt8173-disp-aal, as it fits in one
line, and fix the style; while at it, also add the usual sentinel
comment to the last entry.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index e6ab3eaa1126..70de5f3007e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -212,10 +212,9 @@ static const struct mtk_disp_aal_data mt8173_aal_driver_data = {
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
2.41.0


