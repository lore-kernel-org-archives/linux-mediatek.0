Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD0C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+0mAD68siKHkA4YtgC2Wh8sXu2aPnlLjtzoxs7OLwk=; b=koleKF/+eg3UJ0NMgar5d7wojA
	9TgdIVhSnsWKjm+EC5i5roLsjDBPRb0L7p5BcKOdqVRCvAbzW6cWJ3hQNW7BiSQPMoGWWx5fCaOIM
	anIdG4KUh33yh4GNZ6Fmk5eEUYNPPjwyJRdSc3X0zTAISzWtIAMYhiAHyDwefjyAarIqRMtdjz5lm
	cdQrcwlYizAcdFHGK5KIgOvlFFlsfxtYcr/jSRxkpzooKwDYSFrGhV3dL3yLqns1DQAgNbHHP5j2d
	2J/DFZFEH47p77Ytb/XsL9n9EMiFVwQ0bdku8wyqf97Yk89a61BPxYeokyHNcuFvntFqJOiFNHUmj
	3GVP++eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODjD-002IKb-2B;
	Fri, 12 Jan 2024 09:21:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODj9-002IEY-1a;
	Fri, 12 Jan 2024 09:21:25 +0000
X-UUID: ef63e306b12b11eeafd70d0b34820190-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y+0mAD68siKHkA4YtgC2Wh8sXu2aPnlLjtzoxs7OLwk=;
	b=K+Qb3h5jK5ZR/4x6tTjPTZV2ehRN4QVagffRT45k75khzyN8wVA55TwlwnX56KJfpgmJmbLZ3oGfDkkdUmk2xJBHuaar1QmlozuNawGfVnfgpMj/mbDKwj3+x73GhX4r5VmG25eg+5oU6iaUGADmDWiQPF9k/awmj+6YK91601g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ef1be907-4b60-4b04-8bf1-0f5f68b6ac28,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:cd542e8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef63e306b12b11eeafd70d0b34820190-20240112
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 52256277; Fri, 12 Jan 2024 02:21:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:21:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:21:11 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, <youlin.pei@mediatek.com>
Subject: [PATCH v4 4/7] dma-buf: heaps: restricted_heap: Add dma_ops
Date: Fri, 12 Jan 2024 17:20:11 +0800
Message-ID: <20240112092014.23999-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012123_557556_A3250AC8 
X-CRM114-Status: GOOD (  13.89  )
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

Add the dma_ops for this restricted heap. For restricted buffer,
cache_ops/mmap are not allowed, thus return EPERM for them.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.c | 103 ++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index 8c266a0f6192..ec4c63d2112d 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -12,6 +12,10 @@
 
 #include "restricted_heap.h"
 
+struct restricted_heap_attachment {
+	struct sg_table			*table;
+};
+
 static int
 restricted_heap_memory_allocate(struct restricted_heap *heap, struct restricted_buffer *buf)
 {
@@ -45,6 +49,104 @@ restricted_heap_memory_free(struct restricted_heap *heap, struct restricted_buff
 	ops->memory_free(heap, buf);
 }
 
+static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct restricted_heap_attachment *a;
+	struct sg_table *table;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = kzalloc(sizeof(*table), GFP_KERNEL);
+	if (!table) {
+		ret = -ENOMEM;
+		goto err_free_attach;
+	}
+
+	ret = sg_alloc_table(table, 1, GFP_KERNEL);
+	if (ret)
+		goto err_free_sgt;
+	sg_set_page(table->sgl, NULL, restricted_buf->size, 0);
+
+	a->table = table;
+	attachment->priv = a;
+
+	return 0;
+
+err_free_sgt:
+	kfree(table);
+err_free_attach:
+	kfree(a);
+	return ret;
+}
+
+static void restricted_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direct)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+
+	return table;
+}
+
+static void
+restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table *table,
+			      enum dma_data_direction direction)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+
+	WARN_ON(a->table != table);
+}
+
+static int
+restricted_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int
+restricted_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int restricted_heap_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	return -EPERM;
+}
+
+static void restricted_heap_free(struct dma_buf *dmabuf)
+{
+	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct restricted_heap *heap = dma_heap_get_drvdata(restricted_buf->heap);
+
+	restricted_heap_memory_free(heap, restricted_buf);
+	kfree(restricted_buf);
+}
+
+static const struct dma_buf_ops restricted_heap_buf_ops = {
+	.attach		= restricted_heap_attach,
+	.detach		= restricted_heap_detach,
+	.map_dma_buf	= restricted_heap_map_dma_buf,
+	.unmap_dma_buf	= restricted_heap_unmap_dma_buf,
+	.begin_cpu_access = restricted_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access	= restricted_heap_dma_buf_end_cpu_access,
+	.mmap		= restricted_heap_dma_buf_mmap,
+	.release	= restricted_heap_free,
+};
+
 static struct dma_buf *
 restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
@@ -66,6 +168,7 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	if (ret)
 		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &restricted_heap_buf_ops;
 	exp_info.size = restricted_buf->size;
 	exp_info.flags = fd_flags;
 	exp_info.priv = restricted_buf;
-- 
2.25.1


