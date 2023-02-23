Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834E6C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsyCwrGwGh6nf4heZThET+LTLXoG42t7GpLMsbNCMTs=; b=MrBNB5Upab372GBnyOlkbEqPeP
	lhqTPvbiWFWzLV+doPJmPOyrQ1pH5SfhLjejdqoNc1rN5kyufEoWmWxls6HWgXdJEz/HR+kIP7qky
	z9iaJSdLx2Q02gkUzvjD5/W58RlWKCQ+KjYH8ACSas1pg5Gj5Wnpy+WAXzyNpwFIsVfFC29pwYJT4
	sgWhUelNNCx00vv58u5FrivKCtQB73MckN3VXbv7WM2vy4IRoKg7woI+jccQ5rreyM62gfiDJDkSu
	h242XEkKrH/GGAyBKLJ+Wx4PBPudsrVrNjo6110DBak533EXfetInDie2oo7d2MDOgji44LxRZ4Vv
	2UbiC3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6t2-00FWzX-TT; Thu, 23 Feb 2023 08:23:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6sz-00FWyw-Hl; Thu, 23 Feb 2023 08:23:31 +0000
X-UUID: 563ebea2b35311edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QsyCwrGwGh6nf4heZThET+LTLXoG42t7GpLMsbNCMTs=;
	b=EQhUWMEhiLzo52BoAhc3eABLKbhW/C/kAk/DV+8M4V59q8DnMckVNZ4aKojfAAN3a0AWoKtzhZevyQgVncFmB4KQDNcSwfINnWxsff9S2U5HNrDKYw4lDq8ZP87nP9R0FTYL5zzSRvySv47zcToX6GsUkZIUArXtI81Lz4af+nY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:890b772c-6a65-4c02-8fed-38fe7c0c873e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:13d37826-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 563ebea2b35311edbbe3f76fe852e059-20230223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223902949; Thu, 23 Feb 2023 01:23:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 23 Feb 2023 16:13:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 16:13:19 +0800
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
Subject: [V1,5/7] media: mtk-jpeg: Remove some unnecessary variables
Date: Thu, 23 Feb 2023 16:13:10 +0800
Message-ID: <20230223081312.29296-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223081312.29296-1-irui.wang@mediatek.com>
References: <20230223081312.29296-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_002329_629157_B081FA27 
X-CRM114-Status: GOOD (  13.13  )
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

remove is_jpgenc_multihw, is_jpgdec_multihw,
and unnecessary initialization.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ---
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 29 ++++++++-----------
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 18 ++++--------
 3 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index e118a0175f75..83cf35a12b7a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -204,12 +204,10 @@ struct mtk_jpegdec_comp_dev {
  * @variant:		driver variant to be used
  * @reg_encbase:	jpg encode register base addr
  * @enc_hw_dev:		jpg encode hardware device
- * @is_jpgenc_multihw:	the flag of multi-hw core
  * @enc_hw_wq:		jpg encode wait queue
  * @enchw_rdy:		jpg encode hw ready flag
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:		jpg decode hardware device
- * @is_jpgdec_multihw:	the flag of dec multi-hw core
  * @dec_hw_wq:		jpg decode wait queue
  * @dec_workqueue:	jpg decode work queue
  * @dechw_rdy:		jpg decode hw ready flag
@@ -229,13 +227,11 @@ struct mtk_jpeg_dev {
 
 	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
 	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
-	bool is_jpgenc_multihw;
 	wait_queue_head_t enc_hw_wq;
 	atomic_t enchw_rdy;
 
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
-	bool is_jpgdec_multihw;
 	wait_queue_head_t dec_hw_wq;
 	struct workqueue_struct	*dec_workqueue;
 	atomic_t dechw_rdy;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 8c07fa02fd9a..5b47bd83c5ce 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -608,23 +608,18 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	dev->dev = &pdev->dev;
 
-	if (!master_dev->is_jpgdec_multihw) {
-		master_dev->is_jpgdec_multihw = true;
-		for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
-			master_dev->dec_hw_dev[i] = NULL;
-
-		init_waitqueue_head(&master_dev->dec_hw_wq);
-		master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-								WQ_MEM_RECLAIM
-								| WQ_FREEZABLE);
-		if (!master_dev->workqueue)
-			return -EINVAL;
-
-		ret = devm_add_action_or_reset(&pdev->dev, mtk_jpegdec_destroy_workqueue,
-					       master_dev->workqueue);
-		if (ret)
-			return ret;
-	}
+	init_waitqueue_head(&master_dev->dec_hw_wq);
+	master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+							WQ_MEM_RECLAIM
+							| WQ_FREEZABLE);
+	if (!master_dev->workqueue)
+		return -EINVAL;
+
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       mtk_jpegdec_destroy_workqueue,
+				       master_dev->workqueue);
+	if (ret)
+		return ret;
 
 	atomic_set(&master_dev->dechw_rdy, MTK_JPEGDEC_HW_MAX);
 	spin_lock_init(&dev->hw_lock);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 867f4c1a09fa..c2bc0b531b32 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -340,18 +340,12 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	dev->dev = &pdev->dev;
 
-	if (!master_dev->is_jpgenc_multihw) {
-		master_dev->is_jpgenc_multihw = true;
-		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
-			master_dev->enc_hw_dev[i] = NULL;
-
-		init_waitqueue_head(&master_dev->enc_hw_wq);
-		master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-								WQ_MEM_RECLAIM
-								| WQ_FREEZABLE);
-		if (!master_dev->workqueue)
-			return -EINVAL;
-	}
+	init_waitqueue_head(&master_dev->enc_hw_wq);
+	master_dev->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+							WQ_MEM_RECLAIM
+							| WQ_FREEZABLE);
+	if (!master_dev->workqueue)
+		return -EINVAL;
 
 	atomic_set(&master_dev->enchw_rdy, MTK_JPEGENC_HW_MAX);
 	spin_lock_init(&dev->hw_lock);
-- 
2.18.0


