Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014CC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 03:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BETkkIZySjhEOf7Tdtg9qVoyKMNyel8xSjuNwP+/t0k=; b=PQtovLzZMKhZwdWoGe0dY7wJYj
	Dd3rNEyaqSB2PdVIaREZGDKeu1G12dcNaxIyzWm9aQpBfTJHpKpAddCWF3kkEB3LUfXGo4SfMHoni
	oi3tORDS6Hnkxl09IqNUTM4f/i+e6deCa+M+dv8vnR7iWcN3Sxfk2X8YUhiKe5jMDRdPB0Ls+aAq6
	U8rgc1l8AZZGrg2YxoUO/66aC+vCFfS0YxmN6opA+bISKRNaJZyxx0oRGlBnwpKWa6IMMSh+YGZZV
	QBRfBDSfMDqGFBNyqnt9QibzqdjOcXt6FnxLAlsjcaAWun0u2TrOHVRPXSkhLopqPfrqtYxH3psac
	Zf6TZ5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YbG-001ljV-0O;
	Thu, 01 Jun 2023 03:03:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YbC-001lhE-2k;
	Thu, 01 Jun 2023 03:03:40 +0000
X-UUID: e551d940002811ee912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BETkkIZySjhEOf7Tdtg9qVoyKMNyel8xSjuNwP+/t0k=;
	b=CxB77BRfoB4LCT/XplwD/1pudNgR8hqvKsup0hF53+2vR6w6X/Ars0GcoSWVxUbABUf3xDPLw5xbvqw0YZgm0w09nR0yZPqlPYRhFOpLR9hSRNkHHPfJuhF6UtvDfhGJwuMiwSgwZ7dClsES+Wn68TK8pFYJ7HbL/8AVasFjynM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:48ab7796-b871-4267-927b-a07fe965d58a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:fb78333d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e551d940002811ee912e1518a6540028-20230531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861857458; Wed, 31 May 2023 20:03:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:02:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:02:58 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/8] media: mediatek: vcodec: remove unused parameter
Date: Thu, 1 Jun 2023 11:02:49 +0800
Message-ID: <20230601030256.29875-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601030256.29875-1-yunfei.dong@mediatek.com>
References: <20230601030256.29875-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_200338_902770_6F5C770F 
X-CRM114-Status: GOOD (  11.49  )
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

remove unused parameter in struct mtk_vcodec_dev.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h     | 6 ------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index d41f2121b94f..03721eda2769 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -336,8 +336,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_core_workq;
 	}
 
-	init_waitqueue_head(&dev->queue);
-
 	vfd_dec = video_device_alloc();
 	if (!vfd_dec) {
 		mtk_v4l2_err("Failed to allocate video device");
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index f17d67e781c9..e3230a4d7b8e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -448,10 +448,7 @@ struct mtk_vcodec_enc_pdata {
  * @decode_workqueue: decode work queue
  * @encode_workqueue: encode work queue
  *
- * @int_cond: used to identify interrupt condition happen
- * @int_type: used to identify what kind of interrupt condition happen
  * @dev_mutex: video_device lock
- * @queue: waitqueue for waiting for completion of device commands
  *
  * @dec_irq: decoder irq resource
  * @enc_irq: h264 encoder irq resource
@@ -496,10 +493,7 @@ struct mtk_vcodec_dev {
 
 	struct workqueue_struct *decode_workqueue;
 	struct workqueue_struct *encode_workqueue;
-	int int_cond;
-	int int_type;
 	struct mutex dev_mutex;
-	wait_queue_head_t queue;
 
 	int dec_irq;
 	int enc_irq;
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 5df0a22ff3b5..a56652e476c2 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -311,8 +311,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	init_waitqueue_head(&dev->queue);
-
 	/* allocate video device for encoder and register it */
 	vfd_enc = video_device_alloc();
 	if (!vfd_enc) {
-- 
2.25.1


