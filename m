Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59893C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 03:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NQw5nNr+V8dqKIJpGJGwWeRSbrLITZuKVgdVEn6kVQ=; b=k8PRkaoRMaq75UDK2muGvU0b7K
	tzgo0YFQJFCeP1RXenX1zcB8dBqLDakQCmTiPXxsRiV/dTCQlI7unorh499nSVC2/WHTIfzF4H2o+
	sR/V790ZHBIYPD7EddvRBHNNnFO1mIZYOSk0yntGrkSet/TDs1heDd/kS77IJ5QUWjvyUk8VPFRwa
	oailOq+XXh5XWECjUCmoxut5Jl0kWVQXnL4AP4EiIEJkgTUtR//YWZEBIkpq88eQAX8feQiaa56rk
	PqWBIni5UZY+GG9O81ihIbOnHAEUb4/KuZgnJNo+bDYNZ1oGh4nxRj1XPME/oJXJCYJFfFvOGV0OG
	n1ONCREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YbU-001ltN-36;
	Thu, 01 Jun 2023 03:03:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YbL-001lmS-08;
	Thu, 01 Jun 2023 03:03:50 +0000
X-UUID: e968fe1e002811ee83ed1395ce914268-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5NQw5nNr+V8dqKIJpGJGwWeRSbrLITZuKVgdVEn6kVQ=;
	b=kPgOQfZGgYmbBUXq5aokAueCuMxSXR/99Gydcv1SibYLUn9b9eQzU6EdOgq16eHD/nuDfpXnqKwaFgMq90k9PNjeDW06Z/m8PXQ7ZCTAiqayDrQNXSvErv9WJFUoKLULXoD5uBTGwk4cQDoLEWDl1sqqkgB68rAUjzfu6ZoRuMA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:70a7a41a-3b60-44a1-a5b1-2300262f496f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:097b333d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e968fe1e002811ee83ed1395ce914268-20230531
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1058773204; Wed, 31 May 2023 20:03:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:03:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:03:05 +0800
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
Subject: [PATCH 7/8] mediatek: vcodec: remove unused include header
Date: Thu, 1 Jun 2023 11:02:55 +0800
Message-ID: <20230601030256.29875-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601030256.29875-1-yunfei.dong@mediatek.com>
References: <20230601030256.29875-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_200347_164490_E19F5D0F 
X-CRM114-Status: GOOD (  11.10  )
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

remove unused include header for .c files

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c         | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c     | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c      | 1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c      | 1 -
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c    | 2 --
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c         | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c     | 2 --
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c          | 1 -
 .../media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c   | 1 -
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c      | 1 -
 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c  | 1 -
 .../platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c      | 1 -
 .../platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c      | 1 -
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c       | 1 -
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c   | 1 -
 .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c   | 1 -
 drivers/media/platform/mediatek/vcodec/vdec_drv_if.h            | 1 -
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h         | 2 --
 drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c            | 1 -
 drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h            | 2 --
 drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c      | 1 -
 drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c       | 1 -
 drivers/media/platform/mediatek/vcodec/venc_vpu_if.c            | 1 -
 drivers/media/platform/mediatek/vcodec/venc_vpu_if.h            | 1 -
 25 files changed, 33 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index e55d67783d39..24d74437b76a 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -11,8 +11,6 @@
 
 #include "mtk_vcodec_dec_drv.h"
 #include "mtk_vcodec_dec.h"
-#include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 #include "vdec_drv_if.h"
 #include "mtk_vcodec_dec_pm.h"
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 123c1430ce67..9dfe37143f9c 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -21,8 +21,6 @@
 #include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
-#include "mtk_vcodec_fw.h"
 
 static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_dev *dev)
 {
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index f33bb0c99911..39c3798d33a0 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -16,7 +16,6 @@
 #include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 
 static const struct of_device_id mtk_vdec_hw_match[] = {
 	{
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
index dd961a1ae2e8..12a99a1ecdd5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
@@ -12,7 +12,6 @@
 
 #include "mtk_vcodec_dec_hw.h"
 #include "mtk_vcodec_dec_pm.h"
-#include "mtk_vcodec_util.h"
 
 int mtk_vcodec_init_dec_clk(struct platform_device *pdev, struct mtk_vcodec_pm *pm)
 {
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
index b0e1e18b2d9b..d4ac7cde6333 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
@@ -5,8 +5,6 @@
 #include <media/videobuf2-dma-contig.h>
 
 #include "mtk_vcodec_dec.h"
-#include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 875cbade949b..56bd9b877bbc 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -7,8 +7,6 @@
 #include <linux/module.h>
 
 #include "mtk_vcodec_dec.h"
-#include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 #include "mtk_vcodec_dec_pm.h"
 #include "vdec_drv_if.h"
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index 452bcbf82d23..99f247231d95 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -11,8 +11,6 @@
 #include <linux/pm_runtime.h>
 
 #include "mtk_vcodec_enc.h"
-#include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
 #include "venc_drv_if.h"
 
 #define MTK_VENC_MIN_W	160U
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index b9653330e7af..deb6a8d46016 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -19,8 +19,6 @@
 #include "mtk_vcodec_enc.h"
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_intr.h"
-#include "mtk_vcodec_util.h"
-#include "mtk_vcodec_fw.h"
 
 static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
index ba619beeac59..db3ef07d0d40 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw.c
@@ -2,7 +2,6 @@
 
 #include "mtk_vcodec_dec_drv.h"
 #include "mtk_vcodec_enc_drv.h"
-#include "mtk_vcodec_fw.h"
 #include "mtk_vcodec_fw_priv.h"
 
 struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_fw_type type,
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
index 64cd9ef99766..3cee123dde35 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
index 326cb27faca2..f2e4003ca519 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 
 #include "../vdec_drv_if.h"
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_vpu_if.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
index be9f678ae6f9..4a6bd7e14546 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
@@ -6,7 +6,6 @@
 #include <media/v4l2-h264.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 171d05b9a870..2baec6cb5586 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -10,7 +10,6 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
index 46b564b3f247..dc9846153389 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
index a89c477fc4cf..bb28e961673d 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
@@ -7,7 +7,6 @@
 
 #include <linux/slab.h>
 #include "../vdec_drv_if.h"
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_vpu_if.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
index f530ad00e5ea..71ad1c89afc2 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
@@ -9,7 +9,6 @@
 #include <media/videobuf2-dma-contig.h>
 #include <uapi/linux/v4l2-controls.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index e61b0dc13e08..0226c6eec526 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -9,7 +9,6 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-vp9.h>
 
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_dec.h"
 #include "../mtk_vcodec_intr.h"
 #include "../vdec_drv_base.h"
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
index 7b41ce23158b..bfd297c96850 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
@@ -9,7 +9,6 @@
 #define _VDEC_DRV_IF_H_
 
 #include "mtk_vcodec_dec.h"
-#include "mtk_vcodec_util.h"
 
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index af2636244af0..654468a169b1 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -12,8 +12,6 @@
 #include <linux/slab.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "mtk_vcodec_util.h"
-
 #define NUM_BUFFER_COUNT 3
 
 struct vdec_lat_buf;
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
index 01b66dec1403..504f8f863699 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
@@ -8,7 +8,6 @@
 #include "vdec_drv_if.h"
 #include "vdec_ipi_msg.h"
 #include "vdec_vpu_if.h"
-#include "mtk_vcodec_fw.h"
 
 static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 {
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h
index c9766c108209..fbb3f34a73f0 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.h
@@ -7,8 +7,6 @@
 #ifndef _VDEC_VPU_IF_H_
 #define _VDEC_VPU_IF_H_
 
-#include "mtk_vcodec_fw.h"
-
 struct mtk_vcodec_dec_ctx;
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
index 50cad924d616..8c0b9ca84dc2 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
@@ -11,7 +11,6 @@
 #include <linux/slab.h>
 
 #include "../mtk_vcodec_enc_drv.h"
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_intr.h"
 #include "../mtk_vcodec_enc.h"
 #include "../mtk_vcodec_enc_pm.h"
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
index 7d5077c5a2ae..acec99c6ee18 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 
 #include "../mtk_vcodec_enc_drv.h"
-#include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_intr.h"
 #include "../mtk_vcodec_enc.h"
 #include "../mtk_vcodec_enc_pm.h"
diff --git a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
index 9ce6a8ee80d6..5aa8db95bea5 100644
--- a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
@@ -5,7 +5,6 @@
  */
 
 #include "mtk_vcodec_enc_drv.h"
-#include "mtk_vcodec_fw.h"
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
diff --git a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.h b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.h
index 71370ab98809..ede55fc3bd07 100644
--- a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.h
@@ -7,7 +7,6 @@
 #ifndef _VENC_VPU_IF_H_
 #define _VENC_VPU_IF_H_
 
-#include "mtk_vcodec_fw.h"
 #include "venc_drv_if.h"
 
 /*
-- 
2.25.1


