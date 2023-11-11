Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F65C4167D
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VE6GZfuzzSGdF7z/E1jtU6vKI/4GFs1fIexqiuUOd+g=; b=ZNgaS9dt/GKSMxOSOQ5LFGD8+g
	derPyVS9YdkQZNXadf6H1/uWZDB4No/k+64YU/CeoLv+7EtKb59qKhYMjP6/TzNJullagZCLDAcNx
	S/IoM1qLNGdYwAulDqKazidyDBiF8N1CRBGYjBkuEKVtYsY6ZnN1IuCAdHBQkJ7m8OF1N9+c9Z+Pr
	ZHfN2YY1sFgC2UlI+tDB3ZRYFjNCrIaCc7JBsQcu0sSgnNL4FYi6kJMVKy4XFIk3si14VexaReXCm
	emcVPiDA7Mb0qlHGZH34mGw54voFLh7IJhRNBZRoIWPOZNu8mtjqqnMxt3ojSKJtvmzuOOLZ+LBQI
	SqMuBjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lys-00AObw-14;
	Sat, 11 Nov 2023 11:16:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lyp-00AOaN-1e;
	Sat, 11 Nov 2023 11:16:48 +0000
X-UUID: cb65b84a808311ee86758d4a7c00f3a0-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VE6GZfuzzSGdF7z/E1jtU6vKI/4GFs1fIexqiuUOd+g=;
	b=Aca1ymKXmrmk3qUnJmqsdfHn0820KQjYWuioZavR8cvxjc7poUvrCV0KR7kLA3aE/PwIJhI1nFxj4cFQmvrVJG27Yr2JLUzaKfzI2fd6xeGgVCjsaxZEPtFVX6tDeBT+48Gm1RTyN1lAYDiINS8xBMWC1GviTSy7qcPJUmMKCHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:ec723960-69f3-4574-bfea-6e853f405525,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:84f1f05f-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cb65b84a808311ee86758d4a7c00f3a0-20231111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1824652129; Sat, 11 Nov 2023 04:16:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:16:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:16:39 +0800
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
Subject: [PATCH v2 2/8] dma-buf: heaps: secure_heap: Add private heap ops
Date: Sat, 11 Nov 2023 19:15:53 +0800
Message-ID: <20231111111559.8218-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.256700-8.000000
X-TMASE-MatchedRID: PQ2N/OmJeX7YfPOPCpnfAhlckvO1m+Jc2D/7bUIJlF05mHVw4i4YQBMG
	tPkUyFbdIV4u8YKdeKsWHIQM6TbbE40GdWKgGbBh4T0EFRcNxxTEoDEGChh7CQqiCYa6w8tveKL
	mRI5Hi0abuQcHZubU2nATsg8MODVIHxPMjOKY7A8LbigRnpKlKSBuGJWwgxArX1upngn1Gyell7
	LwyCJ0+7K63CMI769Dwsv6gGdF/4S1typ2+c7FWpwJZ1Nrcojum9GQN90avfrr6k+nXg4S3WS1e
	oi1doD5Xy/9ftq4Z/Jpp55fZDlsr34cY/B7JqXaYZ1R7NXn0MdBmmCXcKyFFJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.256700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 94200BC56EA00A3F690E907892C59CF2C7B8A2B0F75DB0AA7E49E585E508D63C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_031647_559360_BFA77573 
X-CRM114-Status: GOOD (  15.12  )
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

For the secure memory, there are two steps:
a) Allocate buffers in kernel side;
b) Secure that buffer.
Different heaps may have different buffer allocation methods and
different memory protection methods. Here abstract the memory
allocation and securing operations.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 58 ++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index a634051a0a67..87ac23072e9e 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -24,15 +24,66 @@ struct secure_buffer {
 	size_t				size;
 };
 
+struct secure_heap;
+
+struct secure_heap_prv_data {
+	int	(*memory_alloc)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+	void	(*memory_free)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+
+	/* Protect/unprotect the memory */
+	int	(*secure_the_memory)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+	void	(*unsecure_the_memory)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
+};
+
 struct secure_heap {
 	const char			*name;
 	const enum secure_memory_type	mem_type;
+
+	const struct secure_heap_prv_data *data;
 };
 
+static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
+					      struct secure_buffer *sec_buf)
+{
+	const struct secure_heap_prv_data *data = sec_heap->data;
+	int ret;
+
+	if (data->memory_alloc) {
+		ret = data->memory_alloc(sec_heap, sec_buf);
+		if (ret)
+			return ret;
+	}
+
+	if (data->secure_the_memory) {
+		ret = data->secure_the_memory(sec_heap, sec_buf);
+		if (ret)
+			goto sec_memory_free;
+	}
+	return 0;
+
+sec_memory_free:
+	if (data->memory_free)
+		data->memory_free(sec_heap, sec_buf);
+	return ret;
+}
+
+static void secure_heap_secure_memory_free(struct secure_heap *sec_heap,
+					   struct secure_buffer *sec_buf)
+{
+	const struct secure_heap_prv_data *data = sec_heap->data;
+
+	if (data->unsecure_the_memory)
+		data->unsecure_the_memory(sec_heap, sec_buf);
+
+	if (data->memory_free)
+		data->memory_free(sec_heap, sec_buf);
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
@@ -45,6 +96,9 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	sec_buf->size = ALIGN(size, PAGE_SIZE);
 	sec_buf->heap = heap;
 
+	ret = secure_heap_secure_memory_allocate(sec_heap, sec_buf);
+	if (ret)
+		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.size = sec_buf->size;
 	exp_info.flags = fd_flags;
@@ -53,11 +107,13 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err_free_buf;
+		goto err_free_sec_mem;
 	}
 
 	return dmabuf;
 
+err_free_sec_mem:
+	secure_heap_secure_memory_free(sec_heap, sec_buf);
 err_free_buf:
 	kfree(sec_buf);
 	return ERR_PTR(ret);
-- 
2.25.1


