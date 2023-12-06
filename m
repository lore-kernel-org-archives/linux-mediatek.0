Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A305EC46CA0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbClLI66nLXR6+DrvXNRdDsoO2AywNyP9UvNF0j25Es=; b=W+mQ5xuu/keSuiVYUbE4HOpOvB
	H3Cy0mq9ElArqsgGTjGLQ5njrqTnnLbgzIlDX1TAMWUxFMax5uDm7ayKVjP7qyCzzfYtThbKaYYXq
	Nghyjj+KVbB6EUAIvh87jVqCI3cO9PkPzJ6qi7wEfd1TvdBoVurPsmEyjsSTuEl1VvvNIUnsmQu/9
	bgyEJ6whF3uUIt/56MAhzcuGwwEHmpG/fJG/Whn6oXTHN6AQl/2k5JJghN6+NxC50D1EPl8YnPsLZ
	c52Bza0x+2q4WhXCVI/5NSrA5OFESEtAalxuR/YlIzNJnUBN8K3PEdc9KUJ2x1gxResqQt4XJV3zv
	u2QYZYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAn5A-009O6s-2V;
	Wed, 06 Dec 2023 08:16:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAn4x-009Nt5-2k;
	Wed, 06 Dec 2023 08:16:28 +0000
X-UUID: bc79b508940f11ee958cff29c719f35b-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xbClLI66nLXR6+DrvXNRdDsoO2AywNyP9UvNF0j25Es=;
	b=cRW6mP1pz65/Eq+nfYOerOJHYeI/9JkAmywuPWYpfUabXpatevW8XDcBcQgNqsBjATJ+O4ZuMBSCID4LkVllPe92zWIwhucgPeFKsAvOoVcAt1UI0hABGHBZDSRq85feMiBYlF8D0dh+6CZQEEOGgJaxKDr6h7/0GaUIr7JUMMA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:aa828f0c-b811-4f95-8391-d18ecadc5e88,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:abefa75,CLOUDID:1d2e59fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc79b508940f11ee958cff29c719f35b-20231206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 688168905; Wed, 06 Dec 2023 01:16:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:42 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,03/21] v4l2: verify secure dmabufs are used in secure queue
Date: Wed, 6 Dec 2023 16:15:20 +0800
Message-ID: <20231206081538.17056-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_001623_954961_37BA39B1 
X-CRM114-Status: GOOD (  10.81  )
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

From: Jeffrey Kardatzke <jkardatzke@google.com>

Verfies in the dmabuf implementations that if the secure memory flag is
set for a queue that the dmabuf submitted to the queue is unmappable.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 3d4fd4ef5310..ad58ef8dc231 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -710,6 +710,12 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 		return -EINVAL;
 	}
 
+	/* verify the dmabuf is secure if we are in secure mode */
+	if (buf->vb->vb2_queue->secure_mem && sg_page(sgt->sgl)) {
+		pr_err("secure queue requires secure dma_buf");
+		return -EINVAL;
+	}
+
 	/* checking if dmabuf is big enough to store contiguous chunk */
 	contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < buf->size) {
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 28f3fdfe23a2..55428c73c380 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -564,6 +564,12 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
 		return -EINVAL;
 	}
 
+	/* verify the dmabuf is secure if we are in secure mode */
+	if (buf->vb->vb2_queue->secure_mem && !sg_dma_secure(sgt->sgl)) {
+		pr_err("secure queue requires secure dma_buf");
+		return -EINVAL;
+	}
+
 	buf->dma_sgt = sgt;
 	buf->vaddr = NULL;
 
-- 
2.18.0


