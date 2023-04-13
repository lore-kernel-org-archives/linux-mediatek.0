Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BDCC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AItawy7Q1JaJglvIOtY2wIcjWZLOTFvyOBCO+6mVH0=; b=oJIu65WZO9vOEbWK2FsnwqtAKk
	H68NfbpVO6ScM+e/VtRKGjlJZ/Iuv6207ISzFB+tYDcBpkqZcxH6O+XryDdrZ/1/KJqys3YcIIAIR
	TueuIqtneinrjyCHulxZXl1HxYRbrQSUM+YwTAPfnKElW33E/XCaWhKI3HFjyNiOmX7CHeJddTekv
	geQFjmYcTPLCN2P2Ry4jvzdAIQSfg2XvyNJR7AchzHJ/dY+D3cwVW0RmaZilMZBK5a/p2FH1u9OdW
	+8ktxK4jzyvFyCxR0InVXlxeI9JGj6IvdpDx/pgxseIy/b0yGVcoOiTxO3GMbzhOIwST/7aPICWpn
	Npm3FNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqJY-0059RO-31;
	Thu, 13 Apr 2023 06:20:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqJV-0059QH-0G;
	Thu, 13 Apr 2023 06:20:10 +0000
X-UUID: 3a8ce1fcd9c311ed8687db9d93187ff1-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4AItawy7Q1JaJglvIOtY2wIcjWZLOTFvyOBCO+6mVH0=;
	b=FrkNpMVe1/xQ1H2vJ2I3v72XCjIhvKomwyot0no0m5WtopU/lVBVOPhcM3J4P+Th3RVRja6mHO0BZXiyjd+IJ+6m8EPjAgQtP6tFf37pNZyDeBjiVWBtMh2KkLBZ89HdgV7SeJ06AjLL1nVgPQOQFV/JnpvpaFOaoXT4oGO2Jtg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:de7bfc1f-08e3-47e9-a8c7-9c9950d4f494,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:8045d0ea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3a8ce1fcd9c311ed8687db9d93187ff1-20230412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 847196453; Wed, 12 Apr 2023 23:20:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 14:09:28 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 14:09:27 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
	<shuijing.li@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 2/3] drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
Date: Thu, 13 Apr 2023 14:09:21 +0800
Message-ID: <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_232009_127265_D19AC5AC 
X-CRM114-Status: GOOD (  10.84  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add the compatible because there are different definitions for cmdq
register bit control in mt8188.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a13b36ac03a1..9ba05961479d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -654,6 +654,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8188-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..500a3054282d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1208,6 +1208,12 @@ static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.has_size_ctl = true,
 };
 
+static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
+	.reg_cmdq_off = 0xd00,
+	.has_shadow_ctl = true,
+	.has_size_ctl = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
@@ -1217,6 +1223,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	  .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = &mt8186_dsi_driver_data },
+	{ .compatible = "mediatek,mt8188-dsi",
+	  .data = &mt8188_dsi_driver_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.18.0


