Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1319C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnHDPaF+R8FF8PJd9FlWmcGdhDJGTaMa9mgP/cJusow=; b=3JDRGff6PPVCcYWhF57GB2P2hV
	CQaLfeSRT8LQe4F2IeeoYedYk0cY/7Wi6tDKDb6sTGH/IX1SMNksHCHnrK51J7uKQLmJUAzLcMpgS
	kmDk+BEMXp+EbrfqbatXpbkrS7bYZFlAmDKPm6e8MgZgZMDiLh5TjXI/yXDHPr804Bb6vqI9V5Q1g
	vtEXmKTkasfmsvBQps1hqlb6n/Kfey4nN/nXm6yx+ZApf1DTCSMmF3rOrW+I05XEuhgRUc478suU0
	xpTiB1ANK6j0Yo+gseO2m/jE4QIs3Z5QiFHJOFogXLAYS+zY030bbstDOQed1Y1Lxq6PEoykIAJDI
	DOqP6oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6kN-00FUF6-RR; Thu, 23 Feb 2023 08:14:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6jq-00FTwR-B5; Thu, 23 Feb 2023 08:14:03 +0000
X-UUID: 05bb6670b35211edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rnHDPaF+R8FF8PJd9FlWmcGdhDJGTaMa9mgP/cJusow=;
	b=iyvZhzs/d+X6uWsDwkbwMsoSy8H+T4dCVr3oJ3NWVZcpgOczFwdH+AfbVcMDxdugTsIof8mhtuDUKe5XLZYFSg4IhzufZlgrtpBRoRi5LLvmzLoGL0l1ShKCZVG21Wc1tZsVTA6JS+zTz249d2DsQjbQqlVajpk36w+eFLsZPZo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:a3ab35b4-f070-45d6-8cc0-471810c68c31,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.20,REQID:a3ab35b4-f070-45d6-8cc0-471810c68c31,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:25b5999,CLOUDID:fa8de6f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230223161325QJPJ32VM,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 05bb6670b35211edbbe3f76fe852e059-20230223
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050818922; Thu, 23 Feb 2023 01:13:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 23 Feb 2023 16:13:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 16:13:20 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>
Subject: [V1,7/7] media: mtk-jpeg: refactor hw dev initializaiton
Date: Thu, 23 Feb 2023 16:13:12 +0800
Message-ID: <20230223081312.29296-8-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223081312.29296-1-irui.wang@mediatek.com>
References: <20230223081312.29296-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_001402_407225_46C4089E 
X-CRM114-Status: GOOD (  13.21  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add a atomic_t variable for initialization of hw dev.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h |  2 ++
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c   | 12 ++++--------
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c   | 12 ++++--------
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index ab06c1ee80d4..1dd03938df7e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1742,6 +1742,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 			num_child++;
 
 		atomic_set(&jpeg->hw_rdy, num_child);
+		atomic_set(&jpeg->hw_index, 0);
 
 		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
 							  WQ_MEM_RECLAIM
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 89242e407dc9..8ba6e757e11a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -208,6 +208,7 @@ struct mtk_jpegdec_comp_dev {
  * @hw_rdy:		jpg hw ready flag
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:	jpg decode hardware device
+ * @hw_index:		jpg hw index
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -229,6 +230,7 @@ struct mtk_jpeg_dev {
 
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
+	atomic_t hw_index;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index b7c2de2489b0..869068fac5e2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -638,14 +638,10 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to register JPEGDEC irq handler.\n");
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
-		if (master_dev->dec_hw_dev[i])
-			continue;
-
-		master_dev->dec_hw_dev[i] = dev;
-		master_dev->reg_decbase[i] = dev->reg_base;
-		dev->master_dev = master_dev;
-	}
+	i = atomic_add_return(1, &master_dev->hw_index) - 1;
+	master_dev->dec_hw_dev[i] = dev;
+	master_dev->reg_decbase[i] = dev->reg_base;
+	dev->master_dev = master_dev;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index e35ee1bdce3d..71e85b4bbf12 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -362,14 +362,10 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
-		if (master_dev->enc_hw_dev[i])
-			continue;
-
-		master_dev->enc_hw_dev[i] = dev;
-		master_dev->reg_encbase[i] = dev->reg_base;
-		dev->master_dev = master_dev;
-	}
+	i = atomic_add_return(1, &master_dev->hw_index) - 1;
+	master_dev->enc_hw_dev[i] = dev;
+	master_dev->reg_encbase[i] = dev->reg_base;
+	dev->master_dev = master_dev;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.18.0


