Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75088EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU/10Nkq0x+7qlTIxX5UvWSGsecwoSJlB8tqDooA93U=; b=VK6Ch4bK2tIyMc378qKEBL9KJS
	Uq59XKOlETA2B7TgJ5AS8frnb5N1W+0FoL7YVv2+BHJURqi5J/PLEMWlgrhzWSaNUk8uQP7yIpOx+
	18nsZa7W0V2YnW1gVQe4iCWPNAF//DPrjJB7SIig9v+K+8X64WXw2OrDCJsMpp+XL3cniCkUZg7nf
	+UT4T2FTAgBoGAFltjZL1baJ8bpTr81uFoWyAd3NOj/7oIHBbINPN8ai6FakuikHIno/tLUT19LPM
	lrNBIVJe5VboTe1q0BguYTSlRZgRyv8GKuhFybvi88e5rOpumYpVjEtrdccF4ngJPfFia830SZymt
	2VRGcosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhk6-00AIjs-15;
	Mon, 10 Jul 2023 03:39:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhk2-00AIif-29;
	Mon, 10 Jul 2023 03:39:16 +0000
X-UUID: 547120921ed311ee912e1518a6540028-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jU/10Nkq0x+7qlTIxX5UvWSGsecwoSJlB8tqDooA93U=;
	b=ADwFYUKTB2ZiwbxWC7OvLSc6o3DbxAVNHhdM7grlqPqT4csfvFO4XqDidxl8APqGrLRINDZ3VtH4xfyk5sipPnOkyqy2JGqA1ueTPmlWnexo2ez5LsEvPijARdENSdCla3Q8fAmbznAk2MHzsSxa0bS9Sbttdvb1BS043SR4AWM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:6ab25a19-51a2-4057-a1ab-2f237a92de88,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.27,REQID:6ab25a19-51a2-4057-a1ab-2f237a92de88,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:01c9525,CLOUDID:db8dbf0d-26a8-467f-b838-f99719a9c083,B
	ulkID:230710113911WF3FTQGA,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 547120921ed311ee912e1518a6540028-20230709
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1536833770; Sun, 09 Jul 2023 20:39:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 11:39:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 11:39:07 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>
Subject: [PATCH v6 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Date: Mon, 10 Jul 2023 10:52:47 +0800
Message-ID: <20230710025247.20365-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230710025247.20365-1-jason-jh.lin@mediatek.com>
References: <20230710025247.20365-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_203914_757249_ECCB550C 
X-CRM114-Status: GOOD (  11.88  )
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

Add DSI as main display output for mt8188 vdosys0.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
 4 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 5f07037670e9..fdaa21b6a9da 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -48,6 +48,7 @@ unsigned int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
+unsigned int mtk_dsi_encoder_index(struct device *dev);
 
 int mtk_gamma_clk_enable(struct device *dev);
 void mtk_gamma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index bc7b0a0c20db..e6a7a0b9de6c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -318,6 +318,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
 	.start = mtk_dsi_ddp_start,
 	.stop = mtk_dsi_ddp_stop,
+	.encoder_index = mtk_dsi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ecd113f9908c..9b7ca8d35f71 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -189,6 +189,7 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
 
 static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, DDP_COMPONENT_DP_INTF0},
+	{0, DDP_COMPONENT_DSI0},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..62d5362916a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -865,6 +865,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	return ret;
 }
 
+unsigned int mtk_dsi_encoder_index(struct device *dev)
+{
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	unsigned int encoder_index = drm_encoder_index(&dsi->encoder);
+
+	dev_dbg(dev, "encoder index:%d", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	int ret;
-- 
2.18.0


