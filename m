Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71C4C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 02:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwtS8L5iqxhbdUVvfvV1bHrAuc8ODHY3J4ZblLns0Jw=; b=bRMF0SHQqHX7fns4b0fbCMuJJq
	OJEW3I1JRIa7KgVzUZdcU5V8le/S9K2EuBQtZBqh+ILmBDpe/MVwvns5ftMqJzjALpYfKYJXRN626
	2sczkct94HtLy0gvvAq9w05RHN8sJhvTQ0nhmo5muMkJYhmWLHV3peWIehC93XN1Tzj21rhcL44nO
	mUoWCIa5PSYWG24tK3ZDtrZfAQ8Qlv4fqx4Es4N22KbIYB1y7jr4i4Qor/92P7eCK7O/+cZjBqoTN
	3b6Dv6nKza/pUcN/OnRCE+Zcy2U35KAFBndlxFY6yVYFyz7++rTcLhSY2eaeuCljznjxKraBiNtef
	U5Vgr3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsoJ-00AZEO-1V;
	Tue, 12 Dec 2023 02:47:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsoA-00AZ9V-2W;
	Tue, 12 Dec 2023 02:47:44 +0000
X-UUID: cff27c54989811ee9b09ad09c76753c8-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vwtS8L5iqxhbdUVvfvV1bHrAuc8ODHY3J4ZblLns0Jw=;
	b=Yb7vsKgSdQ2uePq+G51ovRnkSz6QIjpP499IqE1KjsveMB0+p0CaBqRjcs7yAkiXdX15z2mF4tAeSWLv5Mjoxk80pnUkhBrh6+KA4iOPbPqxDhAEG51uAjem/JWLoQc+jCXOMgVxSUQ64FAVXn8+jP5/T4VDn0iPuFTnxV5E35M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:0ce4afc1-1688-4855-a8da-648040150143,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:c688ad73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cff27c54989811ee9b09ad09c76753c8-20231211
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 864445244; Mon, 11 Dec 2023 19:47:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:47:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:47:21 +0800
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
Subject: [PATCH v3 6/7] dma-buf: heaps: secure_heap_mtk: Add tee memory service call
Date: Tue, 12 Dec 2023 10:46:06 +0800
Message-ID: <20231212024607.3681-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_184742_869449_12B047AA 
X-CRM114-Status: GOOD (  19.52  )
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

Add TEE service call for MediaTek heap. We have a limited number of
hardware entries to protect memory, therefore we cannot protect memory
arbitrarily, then our secure memory management is actually inside OPTEE.
The kernel just tells the TEE what size I want and the TEE will return a
"secure address". The secure_address is a reference to a secure buffer
within TEE. We put it in the sg_dma_address, please see the comment in
code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c     | 16 +++++
 drivers/dma-buf/heaps/secure_heap.h     |  2 +
 drivers/dma-buf/heaps/secure_heap_mtk.c | 92 +++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index ca4b433fb3f1..e2b8b97ad4dc 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -94,8 +94,22 @@ static struct sg_table *
 secure_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direction)
 {
 	struct secure_heap_attachment *a = attachment->priv;
+	struct dma_buf *dmabuf = attachment->dmabuf;
+	struct secure_buffer *sec_buf = dmabuf->priv;
 	struct sg_table *table = a->table;
 
+	/*
+	 * Technically dma_address refers to the address used by HW, But for secure buffer
+	 * we don't know its dma_address in kernel, Instead, we only know its "secure handle".
+	 * Thus use this property to save the "secure handle", and the user will use it to
+	 * obtain the real address in secure world.
+	 *
+	 * Note: CONFIG_DMA_API_DEBUG requires it to be aligned with PAGE_SIZE.
+	 */
+	if (sec_buf->secure_address) {
+		sg_dma_address(table->sgl) = sec_buf->secure_address;
+		sg_dma_len(table->sgl) = sec_buf->size;
+	}
 	return table;
 }
 
@@ -106,6 +120,8 @@ secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table
 	struct secure_heap_attachment *a = attachment->priv;
 
 	WARN_ON(a->table != table);
+	sg_dma_address(table->sgl) = 0;
+	sg_dma_len(table->sgl) = 0;
 }
 
 static int
diff --git a/drivers/dma-buf/heaps/secure_heap.h b/drivers/dma-buf/heaps/secure_heap.h
index 1ce9c431d989..374fd276bdd7 100644
--- a/drivers/dma-buf/heaps/secure_heap.h
+++ b/drivers/dma-buf/heaps/secure_heap.h
@@ -11,6 +11,8 @@
 struct secure_buffer {
 	struct dma_heap		*heap;
 	size_t			size;
+
+	u64			secure_address; /* A reference to the buffer in the secure world */
 };
 
 struct secure_heap {
diff --git a/drivers/dma-buf/heaps/secure_heap_mtk.c b/drivers/dma-buf/heaps/secure_heap_mtk.c
index c7e609dd7bd3..2c6aaeaf469f 100644
--- a/drivers/dma-buf/heaps/secure_heap_mtk.c
+++ b/drivers/dma-buf/heaps/secure_heap_mtk.c
@@ -25,6 +25,27 @@ enum mtk_secure_mem_type {
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
 };
 
+enum mtk_secure_buffer_tee_cmd {
+	/*
+	 * Allocate the zeroed secure memory from TEE.
+	 *
+	 * [in]  value[0].a: The buffer size.
+	 *       value[0].b: alignment.
+	 * [in]  value[1].a: enum mtk_secure_mem_type.
+	 * [out] value[3].a: The secure handle.
+	 */
+	MTK_TZCMD_SECMEM_ZALLOC	= 0x10000, /* MTK TEE Command ID Base */
+
+	/*
+	 * Free secure memory.
+	 *
+	 * [in]  value[0].a: The secure handle of this buffer, It's value[3].a of
+	 *                   MTK_TZCMD_SECMEM_ZALLOC.
+	 * [out] value[1].a: return value, 0 means successful, otherwise fail.
+	 */
+	MTK_TZCMD_SECMEM_FREE	= 0x10001,
+};
+
 struct mtk_secure_heap_data {
 	struct tee_context	*tee_ctx;
 	u32			tee_session;
@@ -74,6 +95,73 @@ static int mtk_tee_session_init(struct mtk_secure_heap_data *data)
 	return ret;
 }
 
+static int
+mtk_tee_service_call(struct tee_context *tee_ctx, u32 session,
+		     unsigned int command, struct tee_param *params)
+{
+	struct tee_ioctl_invoke_arg arg = {0};
+	int ret;
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.session = session;
+	arg.func = command;
+
+	ret = tee_client_invoke_func(tee_ctx, &arg, params);
+	if (ret < 0 || arg.ret) {
+		pr_err("%s: cmd %d ret %d:%x.\n", __func__, command, ret, arg.ret);
+		ret = -EOPNOTSUPP;
+	}
+	return ret;
+}
+
+static int mtk_tee_secure_memory(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	struct mtk_secure_heap_data *data = sec_heap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+	int ret;
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->size;
+	params[0].u.value.b = PAGE_SIZE;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[1].u.value.a = data->mem_type;
+	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
+				   MTK_TZCMD_SECMEM_ZALLOC, params);
+	if (ret)
+		return -ENOMEM;
+
+	sec_buf->secure_address = params[3].u.value.a;
+	return 0;
+}
+
+static void mtk_tee_unsecure_memory(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	struct mtk_secure_heap_data *data = sec_heap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = sec_buf->secure_address;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	mtk_tee_service_call(data->tee_ctx, data->tee_session,
+			     MTK_TZCMD_SECMEM_FREE, params);
+	if (params[1].u.value.a)
+		pr_err("%s, unsecure buffer(0x%llx) fail(%lld) from TEE.\n",
+		       sec_heap->name, sec_buf->secure_address, params[1].u.value.a);
+}
+
+static int mtk_secure_memory_allocate(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+	/* The memory allocating is within the TEE. */
+	return 0;
+}
+
+static void mtk_secure_memory_free(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
+{
+}
+
 static int mtk_secure_heap_init(struct secure_heap *sec_heap)
 {
 	struct mtk_secure_heap_data *data = sec_heap->priv_data;
@@ -85,6 +173,10 @@ static int mtk_secure_heap_init(struct secure_heap *sec_heap)
 
 static const struct secure_heap_ops mtk_sec_mem_ops = {
 	.heap_init		= mtk_secure_heap_init,
+	.memory_alloc		= mtk_secure_memory_allocate,
+	.memory_free		= mtk_secure_memory_free,
+	.secure_the_memory	= mtk_tee_secure_memory,
+	.unsecure_the_memory	= mtk_tee_unsecure_memory,
 };
 
 static struct mtk_secure_heap_data mtk_sec_heap_data = {
-- 
2.25.1


