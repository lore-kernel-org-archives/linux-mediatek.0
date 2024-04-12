Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF1BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+ef2Q9ahOvlZFjf4kINWNbY/u+5TXF52PZFS/LVSOw=; b=EHnCg8i2+OX694lC8y0G9IOYit
	HaqIGWCgOKQIwgs0B6j+01vVyK+wJgmNoeesZ43klzckPXJR3y8BGFfBcLRvgdXCqo4xlPrOozv+U
	fnwKBjhLgPUTZYEMJZ4hLqUEmEfOLEAuwzi48vvVLzEGV5iiitOuA5KV7y1iz4IVSTaqSV3q66a6C
	vhEVKkIInUtHIp+5aXOg8Tr2hcaSxe+F7jmzkXunWSuAk5a5SDwBKomDlQtrRPgn+7XaLiH6jdOjV
	/sXJM8c2ck6d4F3Y2Eb8kJ3WBB7c0Wt5g7/6HrqpIo1RZ2/4iaUku48VVryWB14YxlXFt8ExCCDkz
	4GAi9xSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCvR-0000000GK9P-38Wb;
	Fri, 12 Apr 2024 09:10:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCub-0000000GJTt-3ZIn;
	Fri, 12 Apr 2024 09:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B+ef2Q9ahOvlZFjf4kINWNbY/u+5TXF52PZFS/LVSOw=; b=LY1Wp2L+OFy78RmgatNJFptm4W
	NwVO6qRLVaiUKc3WaJrRzT7Reqlfu9GWR/Mi47OliFPFYEbpR+7tcO8UTrlkWh2SAnu5rPNzG7oQ8
	736LSZtDpQ8k1KUa1FOaMWpXhJSUG4nV69OwHMuSgEpP8bH6fs/LiHwT0B11fOAP2A/C2g2X2BO0j
	CE1Gk0EVYidEQghwpRxFFPceISDOrlvuNXzgNKvvQ/NOqUhLj2BVbryOKmFALYUXqq3tpKXb+TE2c
	gVHIdEr4p2WTX4OZA+AG8HY6qyJHFTdvXHQuzLr3pD3s0GbWypnc1nwTPXOXaheQuiamr/TKtm+AK
	42Fgcc0w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCuW-000000094HE-0SCL;
	Fri, 12 Apr 2024 09:09:32 +0000
X-UUID: 5734a980f8ac11ee96d5dfc950b7243d-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B+ef2Q9ahOvlZFjf4kINWNbY/u+5TXF52PZFS/LVSOw=;
	b=I3d2Gv4IsdkV11PnjaLqYuJZfxCwOS2+xNf/oLfg+w/txWwvlr7eBwzQDX1S2mWW0gNu9HzjFduOpyX9m0v3oDZs/VKcVmMXRA5p+mM6Cj5X9/6by0gOIJcAfmkGu3eH2baEq/G8BEL/WjuQ0R2aesQC9+qxbZpMbf3puD/QXPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4bae7b52-973d-4ec5-904e-3b5223dccff5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:09e5d5fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5734a980f8ac11ee96d5dfc950b7243d-20240412
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 48720164; Fri, 12 Apr 2024 02:09:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:12 +0800
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
Subject: [PATCH v5,13/23] media: mediatek: vcodec: using shared memory as vsi address
Date: Fri, 12 Apr 2024 17:08:41 +0800
Message-ID: <20240412090851.24999-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.493000-8.000000
X-TMASE-MatchedRID: TPKnaArzlb40Z9sXcK7F6QPZZctd3P4BK2i9pofGVSsKogmGusPLb/BY
	Ro06eVj3M+9E78FP+k6T5In082VlTzMbZlaZZohC58dk5sbwmyhfyi4Yas3gTZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNd9Yv5wIp3lSt60hkI2pQ2CK7F3rMBgxv9NV+Z1yWVO7LpxXk6BRcssk+l
	YdApu1OhjUf8I4ABKpbG4rxE+9EaHkND3OC32gUa6c9X2DKLPd82Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.493000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A0F58FCED3818B83AE8FC4A54B55B14D1EE6BD834E297FBBC6516943757948762000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_100928_807795_7F102CDA 
X-CRM114-Status: GOOD (  11.40  )
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

The vsi buffer is allocated by tee share memory for svp mode, need to
use the share memory as the vsi address to store vsi data.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c         | 9 +++++++--
 .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 8 ++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 2d4611e7fa0b..d7fec1887ab5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -417,8 +417,13 @@ static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 
 	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
 	inst->vsi = inst->vpu.vsi;
-	inst->vsi_core =
-		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	if (ctx->is_secure_playback)
+		inst->vsi_core =
+			mtk_vcodec_dec_get_shm_buffer_va(ctx->dev->optee_private, MTK_VDEC_CORE,
+							 OPTEE_DATA_INDEX);
+	else
+		inst->vsi_core =
+			(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
index 5336769a3fb5..5c31641e9abe 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
@@ -18,8 +18,12 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
-	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
-					     msg->vpu_inst_addr);
+	if (vpu->ctx->is_secure_playback)
+		vpu->vsi = mtk_vcodec_dec_get_shm_buffer_va(vpu->ctx->dev->optee_private,
+							    MTK_VDEC_LAT0, OPTEE_DATA_INDEX);
+	else
+		vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
+						     msg->vpu_inst_addr);
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
-- 
2.18.0


