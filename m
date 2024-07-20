Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD1BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLZB/k6jso90VJO74ijPSPuDokAH3TsIn30+K8soOlI=; b=oBlAX3BvNnjF85kM2dXwcchVXC
	9cgKcllzJz6RlbwSktpRQx0eOeP3MTIzjpZ9E62Urs5m0uCav9gqmMmgouxBKV/KTj2jQApzZbITY
	GnitPcX12rLKIKzFFeLoUbq9JBFlyQjR12/49cYzqkdC7eKFs/BgYcCTtXr/QZR2ofqvjoR/iMm2+
	sqhJqCPK9BHTu0lG69fH0AXvxNdhOfxRttWHxbzjL5WQ+X7uChOJEMa5cg/TLShSkN/rFHVCIPUBv
	eTplxGz1XmaAw7OQmCKy1cdzq9DQ1HBV9TOE5kgcP/NEk1BzQSbEISKXZIeJHAr+sFpaCbHMyOEUO
	iUARdj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4LK-00000004cdj-3Mly;
	Sat, 20 Jul 2024 07:17:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4KL-00000004byY-24ZK;
	Sat, 20 Jul 2024 07:16:23 +0000
X-UUID: f3d308dc466711ef955bff358274dad2-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bLZB/k6jso90VJO74ijPSPuDokAH3TsIn30+K8soOlI=;
	b=TX6MEWIZGCQ78NkRizO7b781o+7DWUyf/YfVsitXW7e2AcoyUhdnC6Z60Gb4o9yxnFbL20mV4PrL6CxEdKkS+ZaRMD4OW1eoBRciVA1X9Pzc4UNojFr4fnHMwf9UaTRYbuQYw082c339eu1LfzyrkulqA/FEcNjQdhjxTd6DN4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:2a586403-08df-44ff-b14b-d891a0a262af,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:ba885a6,CLOUDID:8cc9ad0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3d308dc466711ef955bff358274dad2-20240720
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1712828354; Sat, 20 Jul 2024 00:16:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:11 +0800
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
Subject: [PATCH v7 03/28] media: videobuf2: calculate restricted memory size
Date: Sat, 20 Jul 2024 15:15:41 +0800
Message-ID: <20240720071606.27930-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_001621_587507_5A2CB506 
X-CRM114-Status: GOOD (  13.95  )
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

Getting the physical address with sg_dma_address for restricted memory,
only return the first physical address size since sg may not be physical
continuous, then leading to the dmabuf size is small than buf size. Need
to bypass continuous checking for restricted memory.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 3d4fd4ef5310..f0e4652b615f 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -66,6 +66,22 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
 	return size;
 }
 
+/**************************************************/
+/*   restricted mem scatterlist table functions   */
+/**************************************************/
+
+static unsigned long vb2_dc_get_res_mem_contiguous_size(struct sg_table *sgt)
+{
+	struct scatterlist *s;
+	unsigned int i;
+	unsigned long size = 0;
+
+	for_each_sgtable_dma_sg(sgt, s, i)
+		size += sg_dma_len(s);
+
+	return size;
+}
+
 /*********************************************/
 /*         callbacks for all buffers         */
 /*********************************************/
@@ -648,10 +664,13 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 		goto fail_sgt_init;
 	}
 
-	contig_size = vb2_dc_get_contiguous_size(sgt);
+	if (buf->vb->vb2_queue->restricted_mem)
+		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
+	else
+		contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < size) {
-		pr_err("contiguous mapping is too small %lu/%lu\n",
-			contig_size, size);
+		pr_err("contiguous mapping is too small %lu/%lu/%u\n",
+		       contig_size, size, buf->vb->vb2_queue->restricted_mem);
 		ret = -EFAULT;
 		goto fail_map_sg;
 	}
@@ -711,10 +730,13 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	}
 
 	/* checking if dmabuf is big enough to store contiguous chunk */
-	contig_size = vb2_dc_get_contiguous_size(sgt);
+	if (buf->vb->vb2_queue->restricted_mem)
+		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
+	else
+		contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < buf->size) {
-		pr_err("contiguous chunk is too small %lu/%lu\n",
-		       contig_size, buf->size);
+		pr_err("contiguous chunk is too small %lu/%lu/%u\n",
+		       contig_size, buf->size, buf->vb->vb2_queue->restricted_mem);
 		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
 						  buf->dma_dir);
 		return -EFAULT;
-- 
2.18.0


