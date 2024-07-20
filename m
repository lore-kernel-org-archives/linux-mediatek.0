Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBEAC3DA49
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls8vv00ZGhvGA4qmFtrNDhCNt27OWvxlvD2BDSCrlIw=; b=Nbn2Vkw0anoIObXZdRIEF6n9H8
	1G2fsRmyPVzf5VNwEgbeW4pYvjq3UtetNo4bhdqa9HWCTxEL0V6j+/JgxTsRtXEz8arAJWsqOvW4+
	B7Ja29grkfFrV04KhZIaosryqfZwBDj+lHPsRXwXzXo5IMx97NE+dFxPbIvhNfmW+xoLI69IoIHVI
	LeA0mWEIZWWukgw9aNbnfvKmLEWPXIxLCvVaCBObtokKRrkqAGMLnHCdsAuJ59GTN6cP1+q+srWif
	aPbdXu3CLet1ScA5UM22SQHcgPQTjDPgD27JzpxgHJJKvvLbRnTxS0VS7XxWSp49vnHOqamCnJkuX
	qsc5luIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4eI-00000004gxt-0ftO;
	Sat, 20 Jul 2024 07:36:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4eF-00000004gwk-35tp;
	Sat, 20 Jul 2024 07:36:56 +0000
X-UUID: d4eee37a466a11ef955bff358274dad2-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ls8vv00ZGhvGA4qmFtrNDhCNt27OWvxlvD2BDSCrlIw=;
	b=Ir6rsODJ2mSqWQx3KzUsNMwm6n1im5cbahYnRkuOIeRutrY+K6eaymB4RgrPSNNRCpswvDygF6z0hud5CtovrGcIFiXFGeKeZ7hMDXdPvTqLsoJii5BmWpziVb9ClrLgV+X4A2b7WHzYrqPwg+82FudTIZ532eAOL43Ca+xOPKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:d0f44a5d-b3c5-4a24-9459-e839ef20589e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:9131b4d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d4eee37a466a11ef955bff358274dad2-20240720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1204957277; Sat, 20 Jul 2024 00:36:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 00:16:48 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 27/28] media: mediatek: vcodec: adding non extend struct
Date: Sat, 20 Jul 2024 15:16:05 +0800
Message-ID: <20240720071606.27930-28-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_003655_787659_5614687F 
X-CRM114-Status: GOOD (  13.07  )
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

Adding non extend struct to support two different architecture.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 76 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index ed63430aca9d..8d88670c2f38 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -68,6 +68,29 @@ struct vdec_h264_slice_info_ex {
 	u32 reserved;
 };
 
+/**
+ * struct vdec_h264_slice_info - decode information
+ *
+ * @nal_info:		nal info of current picture
+ * @timeout:		Decode timeout: 1 timeout, 0 no timeount
+ * @bs_buf_size:	bitstream size
+ * @bs_buf_addr:	bitstream buffer dma address
+ * @y_fb_dma:		Y frame buffer dma address
+ * @c_fb_dma:		C frame buffer dma address
+ * @vdec_fb_va:	VDEC frame buffer struct virtual address
+ * @crc:		Used to check whether hardware's status is right
+ */
+struct vdec_h264_slice_info {
+	u16 nal_info;
+	u16 timeout;
+	u32 bs_buf_size;
+	u64 bs_buf_addr;
+	u64 y_fb_dma;
+	u64 c_fb_dma;
+	u64 vdec_fb_va;
+	u32 crc[8];
+};
+
 /*
  * struct vdec_h264_slice_mem - memory address and size
  */
@@ -128,6 +151,44 @@ struct vdec_h264_slice_vsi_ex {
 	struct vdec_h264_slice_lat_dec_param h264_slice_params;
 };
 
+/**
+ * struct vdec_h264_slice_vsi - shared memory for decode information exchange
+ *        between SCP and Host.
+ *
+ * @wdma_err_addr:		wdma error dma address
+ * @wdma_start_addr:		wdma start dma address
+ * @wdma_end_addr:		wdma end dma address
+ * @slice_bc_start_addr:	slice bc start dma address
+ * @slice_bc_end_addr:		slice bc end dma address
+ * @row_info_start_addr:	row info start dma address
+ * @row_info_end_addr:		row info end dma address
+ * @trans_start:		trans start dma address
+ * @trans_end:			trans end dma address
+ * @wdma_end_addr_offset:	wdma end address offset
+ *
+ * @mv_buf_dma:		HW working motion vector buffer
+ *				dma address (AP-W, VPU-R)
+ * @dec:			decode information (AP-R, VPU-W)
+ * @h264_slice_params:		decode parameters for hw used
+ */
+struct vdec_h264_slice_vsi {
+	/* LAT dec addr */
+	u64 wdma_err_addr;
+	u64 wdma_start_addr;
+	u64 wdma_end_addr;
+	u64 slice_bc_start_addr;
+	u64 slice_bc_end_addr;
+	u64 row_info_start_addr;
+	u64 row_info_end_addr;
+	u64 trans_start;
+	u64 trans_end;
+	u64 wdma_end_addr_offset;
+
+	u64 mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_info dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
 /**
  * struct vdec_h264_slice_share_info - shared information used to exchange
  *                                     message between lat and core
@@ -176,10 +237,19 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi_ex *vsi_ex;
-	struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_ex;
+		struct vdec_h264_slice_vsi *vsi;
+	};
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+		struct vdec_h264_slice_vsi *vsi_core;
+	};
 
-	struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+	union {
+		struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+		struct vdec_h264_slice_vsi vsi_ctx;
+	};
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
-- 
2.18.0


