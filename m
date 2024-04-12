Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241B6C00A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKPXM/JgMcLVdMjRyu3K8t7ijNs+Rf3jj3bo8pD6Yls=; b=kWqvn5EDN+S8o+31Yk3Nw82j0V
	+BrTlcJivDRV1ycGTjPoRc1q68PqRrIA/wTBvEQH3igp9rdFYQM1o5JU7L+tbvYxKnV5SLL2HO0WD
	moLWSUPIAY/C/wOQc5/fCm9mZAOReUia9a+ucBy6WQknF0JmtQ/JZB3uF9Cfr/uE6e1xiASi9kIcL
	ngzS2wIVdSCzYYBVke+FDsRi4fKVOI4OpEDg6g/cZt3ug4BBQ05NNWqdz9ORaMdGoMYTi0r+lS1cq
	uzsRPpajpK6MHZXnP+SSgQO4BZTYvXvwzcD7xaSq+EXj+FGvgOWQB0TC3r6t1q9Sl+z9smj1wHJeX
	fSiSv3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCvb-0000000GKH9-2FfD;
	Fri, 12 Apr 2024 09:10:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCud-0000000GJW6-21wd;
	Fri, 12 Apr 2024 09:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OKPXM/JgMcLVdMjRyu3K8t7ijNs+Rf3jj3bo8pD6Yls=; b=mhxRM/XJbnLwj33LFTIWBJhcUW
	jDLXvH1KAQWux1uqRlXL1WTy11RCmRSpRop0B0p3TOIN0+txJ6E69srYoHYW8l1HIpCyVT1lpz5SX
	SyEfi6VdQ+KqbdTpW/u16kRavCZRs6EkmmPhbIqi86UdpkH4KGNhLSe4V4/n5OPXHd12z5TFsOen5
	4owq2YWaB7pZUWjpqCgVX/CDqaugh+fxez7cexPiCklNyiDtYgyrqyYn3XZKPzoo3vlKKd2G8mwYY
	5zHAYu9My5ZEKcw0PLO3LFvM4/dZTd+Nw8YEOlIByCAFAoqCdhP9F22VToalGR0gYALEZ7Jmq59d+
	oqFcFs8w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCuY-000000094LR-3mDf;
	Fri, 12 Apr 2024 09:09:34 +0000
X-UUID: 5ba69910f8ac11ee96d5dfc950b7243d-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OKPXM/JgMcLVdMjRyu3K8t7ijNs+Rf3jj3bo8pD6Yls=;
	b=VJfltCvmRQxbFnc+JKQx9MYrFMm2Q5Rt+6dFARXXga/Kio0DB/4wadXBbQ10/MClOJnuC502ibY49BtWny2ElbQC18UDuIbvlI3hubbO8jxuBIhefVrCEtoR2a3qNnIVrxjmCTNiS164NKDB8HiaMZN9sCK/hfDFz4hzytcfsLE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6b315f84-fe15-44e5-9e52-c9f7fc49bd43,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:25f19882-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ba69910f8ac11ee96d5dfc950b7243d-20240412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 761464494; Fri, 12 Apr 2024 02:09:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,18/23] media: mediatek: vcodec: remove parse nal_info in kernel
Date: Fri, 12 Apr 2024 17:08:46 +0800
Message-ID: <20240412090851.24999-19-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.507800-8.000000
X-TMASE-MatchedRID: 59Hu41dzmXRNlZ1zEcyAYwPZZctd3P4B7f6JAS2hKPjANHjiWWI+7XVX
	4shSYpPIKuucQMr5Le3XJhQ9fMGheSV6fVT+kLJ6UiOWIqwRnLOcgz9a61Hb4bj4Vle8ifDUo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjro1URZJFbJsWP1l9c1C6v/MlDxEY3sdCe/hJ6i/+M2ep3/
	Z9DWZw4HsZZVbRteBCZXGDIVmSFvNcVbo3DrWFK6RH3BORLaJUaHc58rl1xBFtUY6LqdlQnFr3v
	nlc+D6eVZObrZkNVZRlRd/nfa56MV7IEEqsePYG
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.507800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BBBEF77162127FDF2B42C273AC6FEA14214509B59F33864575126E8152C40BC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_100931_626927_686F2492 
X-CRM114-Status: GOOD (  12.44  )
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

The hardware can parse syntax to get nal_info, needn't to use cpu.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 40836673f7fe..f27d326f00ba 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -645,11 +645,10 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 	struct mtk_video_dec_buf *src_buf_info;
-	int nal_start_idx, err, timeout = 0;
+	int err, timeout = 0;
 	unsigned int data[2];
 	struct vdec_lat_buf *lat_buf;
 	struct vdec_h264_slice_share_info *share_info;
-	unsigned char *buf;
 
 	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
 				vdec_h264_slice_core_decode,
@@ -673,14 +672,6 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	share_info = lat_buf->private_data;
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
-	buf = (unsigned char *)bs->va;
-	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
-	if (nal_start_idx < 0) {
-		err = -EINVAL;
-		goto err_free_fb_out;
-	}
-
-	inst->vsi->dec.nal_info = buf[nal_start_idx];
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
@@ -689,7 +680,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		goto err_free_fb_out;
 
 	if (!inst->ctx->is_secure_playback)
-		vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
+		vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
 					   &share_info->h264_slice_params.pps);
 
 	*res_chg = inst->resolution_changed;
-- 
2.18.0


