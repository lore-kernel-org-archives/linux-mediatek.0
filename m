Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F041C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/vFFhyoBvnFiuEbTWtAaSHHVV6IanNVx9aqT6inzqc=; b=Xy1PwbZjgKDEbeoV4jg7WDc9XO
	l7e71qKU5gWXF1/N7Rj6WH1u2bej4XsSCylJ7y+pRN/aoIAmq5qlj+JJOEo6BOb3qJ/8qK72W7BBc
	nmsal0YQWQde6jazpb35plxvBarT1RS+rVUP6R34RuAwjSs3e3omA3rO1OHIkkLczGdxb7AGBNhTf
	k3d6ULv4sbhmJ1plN2VKENFRMN4m6zKEefKWgDjkKyyrOkes8cBx04GsMAD5vwux788kYzSoZL3re
	TWt3ztuCwlo82DAOF2+ShQ6BLViVDoBWDO+yg1fMOHwjLBp0U4chNoj2PICfHt9q1vdzZOLo25F2X
	DCeuLgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRD9b-0057Zo-0y;
	Wed, 02 Aug 2023 14:48:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRD9Y-0057YY-2r;
	Wed, 02 Aug 2023 14:48:46 +0000
X-UUID: a9fd9702314311ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=k/vFFhyoBvnFiuEbTWtAaSHHVV6IanNVx9aqT6inzqc=;
	b=Sj7uZEhK74lYKmWialIpMYG9Sjq8CdTBtTDLnWZdt1DatyC4N09GPfVx+xaXk3Tz/H9BNnupmLxs10HcyImbxWCIsSY3PU2I5uYJYTj9saJK6yj+ME/S92FVP/GAyDwDpVTTTJ58w6wGOQIqsrt554z2fNggN4+GGz4QTjwt4Uk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:6728e0ac-b6af-4e25-ba03-f41297cbb121,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:1fcc6f8,CLOUDID:4dffbd42-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9fd9702314311ee912e1518a6540028-20230802
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 102205203; Wed, 02 Aug 2023 07:48:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 5/8] drm/mediatek: dpi: Support dynamic connector selection
Date: Wed, 2 Aug 2023 22:47:59 +0800
Message-ID: <20230802144802.751-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230802144802.751-1-jason-jh.lin@mediatek.com>
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_074844_934339_9E11911F 
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
index 948a53f1f4b3..3d6b3c228f30 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -782,6 +782,15 @@ void mtk_dpi_stop(struct device *dev)
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
index f114da4d36a9..effaaa769b46 100644
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


