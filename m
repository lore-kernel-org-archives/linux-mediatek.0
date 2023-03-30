Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4169C74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoJKdEQIfvGalQRfL+XtubdnsJCZ9nJUfiXfe+9wORA=; b=sqfhACff7JtH+bySyRHn3VE+v0
	sMcIgpAAA9NXaZGBvgSkPxfYENSGNYP1WgrnxBAnE+OD/NjKlVq9KkaX9LFQfLMaAOVKFkEnNuPHs
	GmRQlcCQVshOmV9d6Og4r8ZFAYyCLEC26P4+SUxkM2r6WPsdm9YeNgaGJGs3x110IWg/FAonBuQ7S
	WONgEGtNR/uurCCXEbYQf+yMpw2oWxJAO7B5oa3SGzSoDVhAELUNUIf2H1KJ24eBaL56QP57m6G8L
	U10+UAj8M1HxVfcvVN4FU6rZ7UggzJ1XROKwwlUpJUvO4LHr/CHo02hoD4Mcjw0gg7QNHJqUpjfDv
	lZNKYowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phiw5-002Qbm-1W;
	Thu, 30 Mar 2023 03:26:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phiw1-002QbB-1m;
	Thu, 30 Mar 2023 03:26:46 +0000
X-UUID: af77818aceaa11ed8687db9d93187ff1-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WoJKdEQIfvGalQRfL+XtubdnsJCZ9nJUfiXfe+9wORA=;
	b=RHCeGJ3D25lsROLguJmQdTWCKFcpkpKqvn3HnRyL0jF+8UotYXRwicwiZcEBszJgbD70mCqDCRn+9eLG/UNETxr5dIq3rLspL7r2SIsk1I4pi6gD2hAfuuK4cnB7OOzqxJdNvb5IdAPHqC/vAxd/lGKP3fEkIktLEah77O9YjPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:72826603-6d71-4623-9b13-6a771f3996a5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:79585af7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: af77818aceaa11ed8687db9d93187ff1-20230329
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 735148668; Wed, 29 Mar 2023 20:26:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 30 Mar 2023 11:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 30 Mar 2023 11:26:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<singo.chang@mediatek.com>, <shawn.sung@mediatek.com>, Nancy.Lin
	<nancy.lin@mediatek.com>
Subject: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
Date: Thu, 30 Mar 2023 11:26:13 +0800
Message-ID: <20230330032614.18837-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230330032614.18837-1-nancy.lin@mediatek.com>
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_202645_592837_6291C39B 
X-CRM114-Status: GOOD (  11.19  )
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

Add mdp_rdma get_format and get_num_formats function.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 0d28b2e2069c..17b169530beb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			 struct cmdq_pkt *cmdq_pkt);
+const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
+size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index eecfa98ff52e..e06db6e56b5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -62,6 +62,20 @@
 #define RDMA_CSC_FULL709_TO_RGB			5
 #define RDMA_CSC_BT601_TO_RGB			6
 
+static const u32 formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 enum rdma_format {
 	RDMA_INPUT_FORMAT_RGB565 = 0,
 	RDMA_INPUT_FORMAT_RGB888 = 1,
@@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			   MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
 }
 
+const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
+{
+	return formats;
+}
+
+size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
+{
+	return ARRAY_SIZE(formats);
+}
+
 int mtk_mdp_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
-- 
2.18.0


