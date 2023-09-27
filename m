Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA3AE82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJ9DhphfPGeOwdaUqrJFn3d1iWvpD1hp8V5uhwMwkX4=; b=JtrBb+YHGASOmzMAsD3R+q9yvN
	SfCsKjjCYAKVZA9oGZTe00WNiJAGdsVFQcak1C6xOE0awQvmmHlree/PjUXCtTC9Wis0oHSZnwTx4
	gb+NfvjLcUPXElXzeKC0gHjUWgiiY1iHZCrK6SjqoepTf/Utyznq48QkLU55veij+K+/7kRvzHT4+
	szQyZgIeoS+9APFZBuC/VyHuC1bk1G63FYIcR+QgXqGkhuju6KqBhdKPXtM42FceaHYdV2Hz7kKvx
	L5pCYYG+qnxcDyJW+REA5S/GIjmKPfv572dUzUIgMa2lezDg4AFs7JCP7RPxkToYro/xbst0t5Zm1
	/ohEpV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWfh-001LzY-2C;
	Wed, 27 Sep 2023 15:41:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWdA-001JQB-1Q;
	Wed, 27 Sep 2023 15:39:21 +0000
X-UUID: ffc8079c5d4b11ee86758d4a7c00f3a0-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iJ9DhphfPGeOwdaUqrJFn3d1iWvpD1hp8V5uhwMwkX4=;
	b=AljqS7H7HHrnCSHvh9zCsmvEadUfg7Fbjg+ETuNR4602oq+8S8+I2sABJE8xfJSgfq/LsMO2qXbh8cgdtc5rcrp5gEvrf9QMY70ObucKHkKG+xVq0gZv0gijPyHbA7mx141gd4bsoZ6ZfqvHw/ey8AQlskWLn31+fSCplFQzoJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:32522ed0-d470-4f3b-8a6a-867b02679e97,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:dcaa88c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffc8079c5d4b11ee86758d4a7c00f3a0-20230927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1299682026; Wed, 27 Sep 2023 08:39:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:38:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:38:35 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10 6/9] drm/mediatek: dpi: Support dynamic connector selection
Date: Wed, 27 Sep 2023 23:38:30 +0800
Message-ID: <20230927153833.23583-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083916_591234_F1BE6E2A 
X-CRM114-Status: GOOD (  12.56  )
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

Add implementation of mtk_dpi_encoder_index to mtk_ddp_comp_func
to make mtk_dpi support dynamic connector selection.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          | 9 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..5f07037670e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -44,6 +44,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
+unsigned int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2f931e4e2b60..4e3d9f7b4d8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -781,6 +781,15 @@ void mtk_dpi_stop(struct device *dev)
 	mtk_dpi_power_off(dpi);
 }
 
+unsigned int mtk_dpi_encoder_index(struct device *dev)
+{
+	struct mtk_dpi *dpi = dev_get_drvdata(dev);
+	unsigned int encoder_index = drm_encoder_index(&dpi->encoder);
+
+	dev_dbg(dev, "encoder index:%d\n", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 4ddb5e561116..07f5ac634c20 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -304,6 +304,7 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
 static const struct mtk_ddp_comp_funcs ddp_dpi = {
 	.start = mtk_dpi_start,
 	.stop = mtk_dpi_stop,
+	.encoder_index = mtk_dpi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dsc = {
-- 
2.18.0


