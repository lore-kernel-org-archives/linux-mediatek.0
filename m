Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCF7EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnhTI/F82CgPOVx1SlpJlEZGaZUaIbcTkTSKiCyKd/M=; b=FbcMZ9bpXxuQoF
	yOnBah8r0PSd2MGkR50tG1T6VkT3NpcvOsygho9VfeEunFWgK1OGaeyrzs6CJbRvDoo/wDvYkDtTJ
	m7Syi48x4x9NxlAqwgynav3apRAXFBe+9yAbkNxYE0iv38ShR0gaAJmOz1HEJJeYJo6neV50Nkc93
	hH6NVx6xe/M5f2ds/HYWn+rjuVOZqEajX5YBoY9kD66o2jQUszFS2EjJ3De04psxUkkX7zg+bO1i0
	Vs14fLwFZEpd8hV5EdSfFq5lfo+tsJY71HjK/whdbUNf5ZJ0iiU3BEzaKgjZsDvgC/76q+UDx8Q26
	ou10HPlJmA0X76LwNVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1yD-00696j-0I;
	Wed, 19 Jul 2023 07:51:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1xm-0068oJ-38;
	Wed, 19 Jul 2023 07:51:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F6A16607072;
	Wed, 19 Jul 2023 08:51:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689753069;
	bh=lw4Zkv3oS6GSkPKOSPEXOFTpN59kNOlACTF4/SJM4pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKZwt9Y3MCS4bZ3uTZssAD3AlKromVqKaRw/2gYboZ24CuR/b4gJ/3r995tND22qt
	 yTbJS+cf5GkoR+y/b5VybefGocyes/d5UseDbgAG+6kmKpoEf1KKhH/ZjtfEnR9ZSJ
	 mrRuZdYqTbYZZDqqXUdKIcMvPEiW09dwEBIaZAJJQgADK5CHD/p0MGvuz6Qlo+dwo0
	 UpA6YaBcF/Duh5MhqIP1Mr8kPUad2ERTBeI7YxUJvbipGCMYbYEhz6tu7dpKzvlqxQ
	 hLXw+WX6jKkcly65ZCXs53OurQ4wNDeNXSupqKxl+esmLd2W0aCsjIfD2nVdkPtNVm
	 YitujLBf8wMGg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
Date: Wed, 19 Jul 2023 09:50:54 +0200
Message-Id: <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005111_136974_47850421 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The .remove() callback cannot fail: switch to .remove_new() and
change mtk_dpi_remove() to void.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e9c5a0f44537..3a140498c98a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1087,11 +1087,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
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
@@ -1122,7 +1120,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove = mtk_dpi_remove,
+	.remove_new = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
-- 
2.40.1


