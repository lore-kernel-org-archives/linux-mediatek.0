Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133C2C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3V6024Solz4jQYx03PCU2DnkByw7fBKMpDmrnrFyUcU=; b=TbQnOVyJRfyYA7an1Ck7GmQKNI
	rPy+Q0VvwhLl2wFMq8AafMPrA9pUxCc0rvFSYdGUVFaGab6e4lAM4o11G26Rpa9qpWexGriIv0cVs
	fGJAQDU2l2a2UgWQUZtUWbVHIRze+omWEUsPyiootE3HSpj5ajM8gUAKCu/njx0FbnqVKxmGrRzXy
	FCamtgu20j9Z8dKy//y9gT3vKhBPCXARyBOjQhIZodbm5EcD+butiwe/k3JUQ2BCEpn92jHc95JUo
	q1klskGNPwNNyud0O/SLxKALeS+Od10TFvwiA6LQtXw9y/p0a64f5LBA7XMkailF/a+RCDzsl+h6v
	pUCHAHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsnr-00AYzg-1Q;
	Tue, 12 Dec 2023 02:47:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsnn-00AYx4-1g;
	Tue, 12 Dec 2023 02:47:20 +0000
X-UUID: c0fc9b3a989811ee958cff29c719f35b-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3V6024Solz4jQYx03PCU2DnkByw7fBKMpDmrnrFyUcU=;
	b=pOmEvuXoxChbJWuq92cRacJm0mAMVy3dBVGjYOxuxr1fwA6Ek6HOSlnaku5zgJV37qK1aLd3vtkQ/4jXQ+QFldwXBMNYRpsVW24D9Qzs71ch8w95iFsjWoGXVkLQz5xezE7Vb3KihPJ3L5Pdk6OJmLRsYas3xHfWyWwPU05Adg8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:289586e5-8c1c-4880-b1a7-7f506e88a976,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:8e87ad73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c0fc9b3a989811ee958cff29c719f35b-20231211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 507502971; Mon, 11 Dec 2023 19:47:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:46:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:46:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
	<ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v3 3/7] dma-buf: heaps: secure_heap: Add private heap ops
Date: Tue, 12 Dec 2023 10:46:03 +0800
Message-ID: <20231212024607.3681-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_184719_560979_9BE4A175 
X-CRM114-Status: GOOD (  16.37  )
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

Add "struct secure_heap_ops". For the secure memory, totally there are
two steps:
a) memory_alloc: Allocate the buffer in kernel;
b) secure_the_memory: Secure/Proect that buffer.
The memory_alloc is mandatory while secure_the_memory is optinal since
it may be part of memory_alloc.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 39 ++++++++++++++++++++++++++++-
 drivers/dma-buf/heaps/secure_heap.h | 11 ++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index e087da5638aa..925cf8e1c7ce 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -12,10 +12,42 @@
 
 #include "secure_heap.h"
 
+static int secure_heap_memory_allocate(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	const struct secure_heap_ops *ops = sec_heap->ops;
+	int ret;
+
+	ret = ops->memory_alloc(sec_heap, sec_buf);
+	if (ret)
+		return ret;
+
+	if (ops->secure_the_memory) {
+		ret = ops->secure_the_memory(sec_heap, sec_buf);
+		if (ret)
+			goto sec_memory_free;
+	}
+	return 0;
+
+sec_memory_free:
+	ops->memory_free(sec_heap, sec_buf);
+	return ret;
+}
+
+static void secure_heap_memory_free(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	const struct secure_heap_ops *ops = sec_heap->ops;
+
+	if (ops->unsecure_the_memory)
+		ops->unsecure_the_memory(sec_heap, sec_buf);
+
+	ops->memory_free(sec_heap, sec_buf);
+}
+
 static struct dma_buf *
 secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 		     unsigned long fd_flags, unsigned long heap_flags)
 {
+	struct secure_heap *sec_heap = dma_heap_get_drvdata(heap);
 	struct secure_buffer *sec_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
@@ -28,6 +60,9 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	sec_buf->size = ALIGN(size, PAGE_SIZE);
 	sec_buf->heap = heap;
 
+	ret = secure_heap_memory_allocate(sec_heap, sec_buf);
+	if (ret)
+		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.size = sec_buf->size;
 	exp_info.flags = fd_flags;
@@ -36,11 +71,13 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err_free_buf;
+		goto err_free_sec_mem;
 	}
 
 	return dmabuf;
 
+err_free_sec_mem:
+	secure_heap_memory_free(sec_heap, sec_buf);
 err_free_buf:
 	kfree(sec_buf);
 	return ERR_PTR(ret);
diff --git a/drivers/dma-buf/heaps/secure_heap.h b/drivers/dma-buf/heaps/secure_heap.h
index 50733dc6d4db..ec5349cd28d0 100644
--- a/drivers/dma-buf/heaps/secure_heap.h
+++ b/drivers/dma-buf/heaps/secure_heap.h
@@ -15,6 +15,17 @@ struct secure_buffer {
 
 struct secure_heap {
 	const char		*name;
+
+	const struct secure_heap_ops *ops;
+};
+
+struct secure_heap_ops {
+	int	(*memory_alloc)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+	void	(*memory_free)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+
+	/* Protect/unprotect the memory */
+	int	(*secure_the_memory)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+	void	(*unsecure_the_memory)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 };
 
 int secure_heap_add(struct secure_heap *sec_heap);
-- 
2.25.1


