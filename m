Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8350DC00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1/bPs/BxFNXGqv9H1rzERGNtX0OyJ3swYdBbl4atw8=; b=GvaQwDBiK/EEXeEcTq+Z05nXBr
	RqMQcLW1x3Evr+JxKU9Phbqb3RvHGGOeo9gRPqgY48OJaGTfKUtnBKHBC3WgqiAq3DonDmBLPSer5
	GvQiUXAGsGUtGVKT8PrW6gKctYL59jMpjS2enHa1BJSQi/S2ZN7WSpAGzn1/cHL0DRgUjqaJz7kZo
	qX10NvkeebpQxqWm4uWhNlmsOAMkog4Ozx5SJnpVGCfEVC9njwGpd3Jdsp148wvlTWZct1J9qyi4Q
	pfWrv0aliBaDLfUPcSY/MuinjZv5B4ekIm+L96ysoRQ9KAdICgLaXOW7A60erfXl1ypWs1CojgZrn
	4AL8UhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWDx-007g00-1s;
	Thu, 03 Aug 2023 11:10:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWDu-007fwX-08;
	Thu, 03 Aug 2023 11:10:31 +0000
X-UUID: 56ef602631ee11ee912e1518a6540028-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y1/bPs/BxFNXGqv9H1rzERGNtX0OyJ3swYdBbl4atw8=;
	b=PiwlT4zTQLrBxUTvpO2LqKe3RXbRHrZI5s7jRxkt1Li47C31rASohhHiZ09f8cmFkVQR6Fuq6nimT9R6CgSYGWBLH/m0wH1pkYHLlny1CqPH4dheqMiuw2NwuQiG+oK6Imx+fRN7KtdcrReOXdWjGr5ImyVE2K6V60t1zO9B47k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:5307b4c4-1abc-4a4b-bd7d-37cbb76a3f69,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:1fcc6f8,CLOUDID:a5a6d9a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 56ef602631ee11ee912e1518a6540028-20230803
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiaoyong.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 823216570; Thu, 03 Aug 2023 04:10:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 19:10:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 19:10:18 +0800
From: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
	<acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
	<xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
	<dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3] media: mediatek: vcodec: fix AV1 decoding on MT8188
Date: Thu, 3 Aug 2023 19:10:17 +0800
Message-ID: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_041030_108980_6BB69C33 
X-CRM114-Status: GOOD (  13.71  )
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

Fix AV1 decoding failure when the iova is 36bit.

Before this fix, the decoder was accessing incorrect addresses with 36bit
iova tile buffer, leading to iommu faults.

Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
---
Changes from v2:

- refine commit subject and message

Changes from v1:

- prefer '|' rather than '+'
- prefer '&' rather than shift operation
- add comments for address operations

v1:
- VDEC HW can access tile buffer and decode normally.
- Test ok by mt8195 32bit and mt8188 36bit iova.

---
 .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
index 404a1a23fd402..e9f2393f6a883 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
@@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 allow_update_cdf = 0;
 	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
 	int tile_info_base;
-	u32 tile_buf_pa;
+	u64 tile_buf_pa;
 	u32 *tile_info_buf = instance->tile.va;
-	u32 pa = (u32)bs->dma_addr;
+	u64 pa = (u64)bs->dma_addr;
 
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
@@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
 		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
 
-		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
-		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
+		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits position
+		 * and clear original for hw requirement.
+		 */
+		tile_info_buf[tile_info_base + 1] = (tile_buf_pa & 0xFFFFFFF0ull) |
+			((tile_buf_pa & 0xF00000000ull) >> 32);
+		tile_info_buf[tile_info_base + 2] = (tile_buf_pa & 0xFull) << 3;
 
 		sb_boundary_x_m1 =
 			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 1) &
-- 
2.18.0


