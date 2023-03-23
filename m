Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7EDC74A5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=02p1XoxXrLuMUBe0CjfZAi7psUBwCDsTusscQOeN2kU=; b=dZhD4Lfe9Ff97VnkWjdQZr4nIJ
	JSy7mw+JMWuFrTTdIGqTukOmOfRNAZloA0N6VgPMDdwXIgB5h1jXMaY/0V7itHF0z5eL1yK+TNytN
	MgMtcmqEEt1RNrkZS1GPjXtoZTPdzWEkZjB0v7vXM7sRGtnSo+SuAhnEww//6pNlwW1lYOgJ9NKuZ
	D7Nub4wqfwD/ivHnx1RgA0zTOikeWjfMOmSHYrNhiVPujhZjXy/8efm7htbcyCfBBcEo6JfGAbovH
	9clJ3EuQkrDDPvlXP7QpalYvaM9wbXcEGmK1Q+eHKJUF2Xu3Xtr4XdmsuCubzu47JBE/IHHbOh6BJ
	mxhT1gvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGTI-001IRU-32;
	Thu, 23 Mar 2023 08:38:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGTF-001IPQ-0w;
	Thu, 23 Mar 2023 08:38:54 +0000
X-UUID: 2043ba32c95611edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=02p1XoxXrLuMUBe0CjfZAi7psUBwCDsTusscQOeN2kU=;
	b=f7OnHpUTpnNP2fcPBRIzEyK+L9PK3z9SuDMmPWX+fP5JRvjL5ooT4NXfnR5KMCo65A82uTp3zJUS0djdFwCkl3irZ5Ny5n6wUMai7egSB5h+ItPSPZY/KEaTZDi1fe1o5bNVZMTfL02IrkXgMezR81uPLRtr2zpnZrijoflHnP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:f218e96c-c8a7-49d1-a164-0a0c0219c515,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:9378aff6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 2043ba32c95611edb7d8d11f642b8e78-20230323
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2100709468; Thu, 23 Mar 2023 01:38:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 23 Mar 2023 16:38:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 23 Mar 2023 16:38:11 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Yong Wu <yong.wu@mediatek.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/2] media: mediatek: vcodec: Remove decoder 'dma-ranges' conditon when set dma mask
Date: Thu, 23 Mar 2023 16:38:09 +0800
Message-ID: <20230323083810.21912-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_013853_338040_064FF4F8 
X-CRM114-Status: GOOD (  13.96  )
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

After commit f1ad5338a4d5("of: Fix "dma-ranges" handling for bus controllers"),
the dma-ranges is not allowed in decoder dts node. But the driver still need
to set dma mask, remove "dma-ranges" condition in prob function.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
Reference series:
[1]: v5 of this series is present by Yong Wu.
     20230307023507.13306-1-yong.wu@mediatek.com
---
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index bba7b932f4fa..2c3a4c2cdaee 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -137,6 +137,20 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
 	return 0;
 }
 
+static int mtk_vcodec_dec_set_dma_mask(struct device *dev)
+{
+	int ret = 0;
+
+	return !(of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec") ||
+	       of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"));
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
+	if (ret)
+		mtk_v4l2_err("Failed to set dec mask");
+
+	return ret;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -323,13 +337,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL)) {
-		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
-		if (ret) {
-			mtk_v4l2_err("Failed to set mask");
-			goto err_core_workq;
-		}
-	}
+	ret = mtk_vcodec_dec_set_dma_mask(&pdev->dev);
+	if (ret)
+		goto err_core_workq;
 
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
-- 
2.18.0


