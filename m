Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/L7neu08DE3hUm9kEVzIrQd8fOQfYGi6WtqP1MEeRjk=; b=NSHWY/xArN8Rns
	n6iA5vdCRz++MY5NEFYqvPOiYUFaWKZlKy9iqaTXmXCHR0NRVql3M/eVLkSnnQ4g0M21UJ/lj90aC
	gWDhzLaTLiW4fVkI3tGDy5t44W4cqQxVBr+vHkHB6SWiMBjWbB1iJfDxbi5dUM87ycCNMEROWj++3
	QPvtGIUiCloiQQEI9gZV/AYpU90hgHJgFvu/ShvIugXYxLEYv7HjgX9SXutlfNNge19NuKNFX8ANm
	ynjAwtWRJBT1MXAA9pyJHJnd7z6wLYsJ2dX3jbuvqzY77+KhkEhgLbZJr13AFbemn7C8EUG0bJXDe
	QNkEXPuIIbeBzakNyEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd79R-002eYy-6R; Sat, 09 Apr 2022 09:13:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd78v-002eHb-1r; Sat, 09 Apr 2022 09:12:30 +0000
X-UUID: 5c1011aac8064eb0be7f6dc44f6dd940-20220409
X-UUID: 5c1011aac8064eb0be7f6dc44f6dd940-20220409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 348304930; Sat, 09 Apr 2022 02:12:20 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Apr 2022 02:12:18 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 9 Apr 2022 17:12:15 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 9 Apr 2022 17:12:14 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <jitao.shi@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>
Subject: [PATCH v4,3/3] drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c
Date: Sat, 9 Apr 2022 17:11:54 +0800
Message-ID: <1649495514-25746-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_021229_131132_F821799F 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add the compatible because use different cmdq addresses in mt8186.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ccb0511b9cd5..b13fd0317e96 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1155,6 +1155,12 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.has_size_ctl = true,
 };
 
+static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
+	.reg_cmdq_off = 0xd00,
+	.has_shadow_ctl = true,
+	.has_size_ctl = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
@@ -1162,6 +1168,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	  .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi",
 	  .data = &mt8183_dsi_driver_data },
+	{ .compatible = "mediatek,mt8186-dsi",
+	  .data = &mt8186_dsi_driver_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
