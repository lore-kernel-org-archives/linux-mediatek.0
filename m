Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20081EE49AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6jPHQ8/ihfSwFIDrR+mTFdxoHGqeLjAmqmbiTOz4wI0=; b=IuuKoTLqCv2vrp2U1ViAW1NSsA
	0cHYFzlud1ba30PgDl44IGRBLo0S0iUr+IGrxxlc2qFhE9G2xp0u97V7MncWteAnSlm7zN9uM9raa
	Ol6l9tQSa/3j3Q7G/I9CGDpGRez910LA50J8+7hELhtJ9119AfOUZ6bKZnB06Ztsl7seOYbGp9jnj
	HRPDYiIth2OZweHWJtsaI7HKXg1YsWt2jS6uWbiAXj5bVQbc5ZnPq6IOEnxHlWb7FnkfYuL8R2LKi
	LQviaqTPfhI6m5VPadU4LIBUg4T96q3Z8BggsLTQlPyjbKBJx6p4UTqBYbrZgoItpDIMLK+otT8AR
	HYUmFNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjBU-00HYio-30;
	Wed, 23 Aug 2023 08:25:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjBR-00HYhW-28;
	Wed, 23 Aug 2023 08:25:47 +0000
X-UUID: a48794c0418e11ee83ed1395ce914268-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6jPHQ8/ihfSwFIDrR+mTFdxoHGqeLjAmqmbiTOz4wI0=;
	b=q2zF0Ad9Jp2yPa2T8m9TLMmbPs5rVu6Zu/SAXzv1hTYoaHVL8oSnSSkDFc9rC9DfbvjbgdnBTB+qLnLOeatej9W/ZAICFLoJotDAqfmFoAh3UOGvjhnTMDndKqnYpmmBXCsrydPu9WguGJcHM+vsxZC+0rKFGm/2C+61AwGhkiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:1057f251-71f1-4600-b8c1-5c8767741781,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:1057f251-71f1-4600-b8c1-5c8767741781,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:41582ec2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:230823162540Y05U1C5O,BulkQuantity:1,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a48794c0418e11ee83ed1395ce914268-20230823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 890429188; Wed, 23 Aug 2023 01:25:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 16:25:36 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 16:25:36 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>
Subject: [PATCH] drm/mediatek: Support IGT in dp driver
Date: Wed, 23 Aug 2023 16:25:49 +0800
Message-ID: <20230823082549.24756-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_012545_712645_DCC3A43B 
X-CRM114-Status: GOOD (  10.54  )
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

Support IGT (Intel GPU Tools) in Mediatek DisplayPort driver

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..a494e04f0ddf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -806,6 +806,25 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	mtk_dsi_poweroff(dsi);
 }
 
+static enum drm_mode_status
+mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_info *info,
+			  const struct drm_display_mode *mode)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	u32 bpp;
+
+	if (dsi->format == MIPI_DSI_FMT_RGB565)
+		bpp = 16;
+	else
+		bpp = 24;
+
+	if (mode->clock * bpp / dsi->lanes > 1500000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -815,6 +834,7 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid = mtk_dsi_bridge_mode_valid,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.40.1


