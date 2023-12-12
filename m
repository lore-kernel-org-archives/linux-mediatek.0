Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111B9C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 02:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUt8l+91IoXVo1cpDt79bjGAdJRilmTqvcbGtD1y4Uw=; b=GTsiejsTYP1hw/iG33zdNyveJb
	Jyn5qucnoelMYWZQvp1/L3uaGtZ9M+BzbfV4iWebV3bUEgg0fq0f/v5lLst3xbnoFmsTF34Zh/3p/
	T5ze0LwxhOMJASKsGSQPfaYEs/yIfggNltBvqEmHrUDXg+FBKP/dFRHUpbYPyTOuOsMsXpZH5qipn
	QjQWWHBsDQTCTSVjoEHv2obBb2SPrlFI9GfgHmBQkSKRAMW5+JJHfqb1zv2qFRCUVAUuv/BK5D5pU
	MV0Z43bfAr/LG0l8bTIGlzlX5kjTNx1f6O9JbuxP1wISAtFzl4C+b16BcVITfWEVHDTg0KkQrxVZ5
	T0c270hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsnb-00AYuj-2X;
	Tue, 12 Dec 2023 02:47:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsnX-00AYtO-0h;
	Tue, 12 Dec 2023 02:47:04 +0000
X-UUID: b7154054989811ee9b09ad09c76753c8-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IUt8l+91IoXVo1cpDt79bjGAdJRilmTqvcbGtD1y4Uw=;
	b=L3KsD28ySxOB1TVEHChyB0MKuFtyte//kfSf8RafnC2KdbIKzaZ7EQwyuWeOtR1N9Jl+n1eNGxDxucPhdwajRMqOPaoOa+uGkpehD23dAMUrGJWElck3EWtETwLUIwyAgp4rmjbgDw1X0SiMIc1MMZtnq2WM+G3vpLAwfaflyaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ceac105f-8e42-4210-b1ab-0e51ed420918,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:2a5b10bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b7154054989811ee9b09ad09c76753c8-20231211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 31073421; Mon, 11 Dec 2023 19:46:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:46:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:46:44 +0800
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
Subject: [PATCH v3 2/7] dma-buf: heaps: Initialize a secure heap
Date: Tue, 12 Dec 2023 10:46:02 +0800
Message-ID: <20231212024607.3681-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.162000-8.000000
X-TMASE-MatchedRID: jFGZ1KSu+yPtAxjyNphE0lz+axQLnAVB5Y0kb0hqatw1LB46LFAAkpkC
	erFMaabiXQS0szagh4NSeVWfRpnv1OG0fWP55EEGma6DzXaohvPJ5SXtoJPLyO0JEDP8WtN7rVb
	mNWMCsmqzR95c6Z6Roe1oMOv2nr2N0H/zLeBgX28SDAzxRL+lMVg3VqSTJ7SoYdn5x3tXIpeSLr
	afNpSUmkpqm9YsoMoIEAhIuZPp0MQfE8yM4pjsDzXJPZYaymc4xEHRux+uk8gVPU8Gz4xVjZgtw
	ixx9AosTJt/087qXILnCRyFIAHTrUDilNfZzLJbW496KV7WSvGDSsK68ZB5JuO5WhTxlk3SeI9M
	zgCvEUcpDHQ3eKOza7W994ja5xiQ8jae4OD13tAV7Mc+rowcVKtX/F0pBwVJjSV5hDFby7aYnYB
	3Lm7XsQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.162000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DCCFB0A26993BC3E487D177E281AF68FA8257BAA72E1133602723C55C68896A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_184703_297220_ECFDFED7 
X-CRM114-Status: GOOD (  17.12  )
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

Initialize a secure heap. Currently just add a null heap, Prepare for
the later patches.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig       |  6 +++
 drivers/dma-buf/heaps/Makefile      |  1 +
 drivers/dma-buf/heaps/secure_heap.c | 67 +++++++++++++++++++++++++++++
 drivers/dma-buf/heaps/secure_heap.h | 22 ++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c
 create mode 100644 drivers/dma-buf/heaps/secure_heap.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..3a9943e94200 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,9 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_SECURE
+	bool "DMA-BUF Secure Heap"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable dma-buf secure heap. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..b1ad9d1f2fbe 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+= secure_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
new file mode 100644
index 000000000000..e087da5638aa
--- /dev/null
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF secure heap exporter
+ *
+ * Copyright (C) 2023 MediaTek Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+
+#include "secure_heap.h"
+
+static struct dma_buf *
+secure_heap_allocate(struct dma_heap *heap, unsigned long size,
+		     unsigned long fd_flags, unsigned long heap_flags)
+{
+	struct secure_buffer *sec_buf;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	int ret;
+
+	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
+	if (!sec_buf)
+		return ERR_PTR(-ENOMEM);
+
+	sec_buf->size = ALIGN(size, PAGE_SIZE);
+	sec_buf->heap = heap;
+
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.size = sec_buf->size;
+	exp_info.flags = fd_flags;
+	exp_info.priv = sec_buf;
+
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto err_free_buf;
+	}
+
+	return dmabuf;
+
+err_free_buf:
+	kfree(sec_buf);
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops sec_heap_ops = {
+	.allocate = secure_heap_allocate,
+};
+
+int secure_heap_add(struct secure_heap *sec_heap)
+{
+	struct dma_heap_export_info exp_info;
+	struct dma_heap *heap;
+
+	exp_info.name = sec_heap->name;
+	exp_info.ops = &sec_heap_ops;
+	exp_info.priv = (void *)sec_heap;
+
+	heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap))
+		return PTR_ERR(heap);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(secure_heap_add);
diff --git a/drivers/dma-buf/heaps/secure_heap.h b/drivers/dma-buf/heaps/secure_heap.h
new file mode 100644
index 000000000000..50733dc6d4db
--- /dev/null
+++ b/drivers/dma-buf/heaps/secure_heap.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Secure heap Header.
+ *
+ * Copyright (C) 2023 MediaTek, Inc.
+ */
+
+#ifndef _DMABUF_SECURE_HEAP_H_
+#define _DMABUF_SECURE_HEAP_H_
+
+struct secure_buffer {
+	struct dma_heap		*heap;
+	size_t			size;
+};
+
+struct secure_heap {
+	const char		*name;
+};
+
+int secure_heap_add(struct secure_heap *sec_heap);
+
+#endif
-- 
2.25.1


