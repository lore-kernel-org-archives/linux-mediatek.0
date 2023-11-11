Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB50BC4167D
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roR8Vq3ha/ba4tX960IysHiPrj6jd3ZptOPgK0s/rp4=; b=VAdkzRDTPCQfimYcczx4Lv0KOy
	XIf+dm6vyqt3xnkXXXrkZxn9Vigj64Dn4IFJP+STtorZnRY5zh3LYAv2cRpd9I3DO8b89L3pJTuqV
	2oxoJupg1Pp6qaXUPPzC8efuJ/RF0U38KSnfvrCDCnkS+bDOeKg8XSJss4/CYayidtZHDBu7kLJbw
	/XWvqiaUJXTpv8l4m9dZ1p3RaWfyxueGBLasJvYM4v7dddJqJ9lqbduiux/rYhP97fZTh0okMct7T
	UJ1yRJ8rdFiyggU+cknfaH9y3yt5Z4JqEfV5zF7RlvxomAYmGs3ZJtEcrSAMNcb0lgxfzx9VNSCIn
	24YTyKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lz7-00AOir-2c;
	Sat, 11 Nov 2023 11:17:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lz4-00AOhF-1g;
	Sat, 11 Nov 2023 11:17:04 +0000
X-UUID: d44bbb62808311ee86758d4a7c00f3a0-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=roR8Vq3ha/ba4tX960IysHiPrj6jd3ZptOPgK0s/rp4=;
	b=GTzNDTYKhRWPyXeIfVZ00SyFJYVeDngGXk2UQl35JPSXie+ZcxUV70k380xGp+q0xvn5W0Y6Au3NyDRNBIeXweW1ZQX05CEmi+3ZfGWEQYUwhYeD4nsVg4h3pRCU9NF3CimidaU5+BwUJztyucU1Wx3GE8G6k1FMHNXW4gU3QMs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:62f00e37-b61c-4a1d-b648-444f3437263d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:43828872-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d44bbb62808311ee86758d4a7c00f3a0-20231111
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1263522868; Sat, 11 Nov 2023 04:16:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:16:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:16:54 +0800
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
Subject: [PATCH v2 3/8] dma-buf: heaps: secure_heap: Initialize tee session
Date: Sat, 11 Nov 2023 19:15:54 +0800
Message-ID: <20231111111559.8218-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_031702_559194_491A6217 
X-CRM114-Status: GOOD (  19.95  )
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

The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
here since this is not a platform driver, therefore initialize the TEE
context/session while we allocate the first secure buffer.

Add our special UUID and tee type in the private data.

If the uuid is zero, it means that it doesn't enter TEE to protect the
buffer, there may be other ways to protect the buffer.

All the MTK chrome projects use this UUID. The UUID is only used in the
kernelspace while userspace never use it. The userspace could allocate the
secure memory via the existing dma-buf ioctl.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 75 +++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 87ac23072e9e..2a037fc54004 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -10,6 +10,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#define TZ_TA_MEM_UUID_MTK		"4477588a-8476-11e2-ad15-e41f1390d676"
+
+#define TEE_PARAM_NUM			4
 
 enum secure_memory_type {
 	/*
@@ -27,6 +33,9 @@ struct secure_buffer {
 struct secure_heap;
 
 struct secure_heap_prv_data {
+	const char			*uuid;
+	const int			tee_impl_id;
+
 	int	(*memory_alloc)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 	void	(*memory_free)(struct secure_heap *sec_heap, struct secure_buffer *sec_buf);
 
@@ -39,9 +48,62 @@ struct secure_heap {
 	const char			*name;
 	const enum secure_memory_type	mem_type;
 
+	struct tee_context		*tee_ctx;
+	u32				tee_session;
+
 	const struct secure_heap_prv_data *data;
 };
 
+static int tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	const struct secure_heap_prv_data *d = data;
+
+	return ver->impl_id == d->tee_impl_id;
+}
+
+static int secure_heap_tee_session_init(struct secure_heap *sec_heap)
+{
+	struct tee_param t_param[TEE_PARAM_NUM] = {0};
+	struct tee_ioctl_open_session_arg arg = {0};
+	const struct secure_heap_prv_data *data = sec_heap->data;
+	uuid_t ta_mem_uuid;
+	int ret;
+
+	sec_heap->tee_ctx = tee_client_open_context(NULL, tee_ctx_match, data, NULL);
+	if (IS_ERR(sec_heap->tee_ctx)) {
+		pr_err_once("%s: open context failed, ret=%ld\n", sec_heap->name,
+			    PTR_ERR(sec_heap->tee_ctx));
+		return -ENODEV;
+	}
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	ret = uuid_parse(data->uuid, &ta_mem_uuid);
+	if (ret)
+		goto close_context;
+	memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
+
+	ret = tee_client_open_session(sec_heap->tee_ctx, &arg, t_param);
+	if (ret < 0 || arg.ret) {
+		pr_err_once("%s: open session failed, ret=%d:%d\n",
+			    sec_heap->name, ret, arg.ret);
+		ret = -EINVAL;
+		goto close_context;
+	}
+	sec_heap->tee_session = arg.session;
+	return 0;
+
+close_context:
+	tee_client_close_context(sec_heap->tee_ctx);
+	return ret;
+}
+
+/* The memory allocating is within the TEE. */
+const struct secure_heap_prv_data mtk_sec_mem_data = {
+	.uuid			= TZ_TA_MEM_UUID_MTK,
+	.tee_impl_id		= TEE_IMPL_ID_OPTEE,
+};
+
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
 					      struct secure_buffer *sec_buf)
 {
@@ -84,11 +146,23 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 		     unsigned long fd_flags, unsigned long heap_flags)
 {
 	struct secure_heap *sec_heap = dma_heap_get_drvdata(heap);
+	const struct secure_heap_prv_data *data = sec_heap->data;
 	struct secure_buffer *sec_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
 	int ret;
 
+	/*
+	 * If uuid is valid, It requires enter TEE to protect buffers. However
+	 * TEE probe may be late. Initialize the secure session the first time
+	 * we request the secure buffer.
+	 */
+	if (data->uuid && !sec_heap->tee_session) {
+		ret = secure_heap_tee_session_init(sec_heap);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
 	if (!sec_buf)
 		return ERR_PTR(-ENOMEM);
@@ -127,6 +201,7 @@ static struct secure_heap secure_heaps[] = {
 	{
 		.name		= "secure_mtk_cm",
 		.mem_type	= SECURE_MEMORY_TYPE_MTK_CM_TZ,
+		.data		= &mtk_sec_mem_data,
 	},
 };
 
-- 
2.25.1


