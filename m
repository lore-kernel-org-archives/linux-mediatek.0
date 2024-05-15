Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20060C25B79
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b62MFZCKZYClERIcSnVzKxk/kLwYIFY6WRjWetJojiY=; b=HQhLYT2hsVnCtb0AatZODWz6YU
	vn2mQjmyrjvynsA3EZc6myjRSN4MO9r3TBevXb3fr3eRLgnn7/9aUj/6q+SKeLRk3oYOfJpGcShwZ
	LlVHeIhIleYYrIM0Hbu5uUpeNlBqg+te9FecRQLSl9IixuapLnB+Y9VnpO0cErSH8p3cpFrKdhamK
	JIBSgPqwwEYXYM1gAPrCJ1mF+4/P86TdWmDdNTqqvoI8dsih4evCgJuNpAHLZE25cBkZaR97AJb0P
	SSJaidh8qiQg6PMWm6JjuEYmgXUlHxrx2pENu52E9C9r4we2ERxJSvlDJZKrM4riefbyeDi9gTScX
	Yq5/qnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Cko-00000001Mtu-3gX6;
	Wed, 15 May 2024 11:25:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7CkW-00000001Mfu-0Cw7;
	Wed, 15 May 2024 11:24:49 +0000
X-UUID: b77ffebe12ad11efa8f1cd58ee6c2400-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b62MFZCKZYClERIcSnVzKxk/kLwYIFY6WRjWetJojiY=;
	b=k6voYFuRQFWQ5htmljjM4/eyStQjtozswBumIt972NYdmNmKrmLmk37mh308sBs8DwrSw47LC61AicXT9JhVCfAY2LtLZejdOOB8XkaLymU6c8/W0cVHFZXVhLjF4PVZZzSquHJKsbLNgaOMTvq6y//VCSDLX1YnNLJ2Mf928n8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:c51afae6-67d6-4def-a52f-ffa8074e805a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:572be383-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b77ffebe12ad11efa8f1cd58ee6c2400-20240515
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 377877881; Wed, 15 May 2024 04:24:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:24:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:24:30 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
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
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, "Pavel
 Machek" <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 5/9] dma-buf: heaps: restricted_heap: Add private heap ops
Date: Wed, 15 May 2024 19:23:04 +0800
Message-ID: <20240515112308.10171-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.511100-8.000000
X-TMASE-MatchedRID: 9DomuZeNnSYxaBEU4bKrV0hEDfw/93BuMApqy5cfknVX4H/AHZTAKsg8
	wayHBdO7rOOppPTYnnjVL7DIQyVd77BAQLqGlKiv4pdq9sdj8LW6hgVvSdGKoxS11FlOYRoheKL
	mRI5Hi0abuQcHZubU2v3EE/72W02OSSOWVJeuO1AURSScn+QSXt0H8LFZNFG7gaH1JgrOSO4Jpe
	vTilEwkAIlJ+SeTxt8M78kjWgPIvku/9MlpPMpE018g8B8tThlw6Gk3uypg8eT2qM+VJ76tKASz
	D9Y/9Fwsc5392oMuYZSC2TRJDkZy21Rjoup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxXsgQ
	Sqx49gY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.511100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4D73BE4E88C5968707784482A7B4FCD08AB357438873D5A387C89F82BA4748E12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042444_603617_4FAC0DC0 
X-CRM114-Status: GOOD (  15.89  )
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

Add "struct restricted_heap_ops". For the restricted memory, totally there
are two steps:
a) alloc: Allocate the buffer in kernel;
b) restrict_buf: Restrict/Protect/Secure that buffer.
The "alloc" is mandatory while "restrict_buf" is optional since it may
be part of "alloc".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
 drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index c2ae19ba7d7e..8bb3c1876a69 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -12,10 +12,44 @@
 
 #include "restricted_heap.h"
 
+static int
+restricted_heap_memory_allocate(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = rheap->ops;
+	int ret;
+
+	ret = ops->alloc(rheap, buf);
+	if (ret)
+		return ret;
+
+	if (ops->restrict_buf) {
+		ret = ops->restrict_buf(rheap, buf);
+		if (ret)
+			goto buf_free;
+	}
+	return 0;
+
+buf_free:
+	ops->free(rheap, buf);
+	return ret;
+}
+
+static void
+restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = rheap->ops;
+
+	if (ops->unrestrict_buf)
+		ops->unrestrict_buf(rheap, buf);
+
+	ops->free(rheap, buf);
+}
+
 static struct dma_buf *
 restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
 {
+	struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
 	struct restricted_buffer *restricted_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
@@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	restricted_buf->size = ALIGN(size, PAGE_SIZE);
 	restricted_buf->heap = heap;
 
+	ret = restricted_heap_memory_allocate(rheap, restricted_buf);
+	if (ret)
+		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.size = restricted_buf->size;
 	exp_info.flags = fd_flags;
@@ -36,11 +73,13 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err_free_buf;
+		goto err_free_rstrd_mem;
 	}
 
 	return dmabuf;
 
+err_free_rstrd_mem:
+	restricted_heap_memory_free(rheap, restricted_buf);
 err_free_buf:
 	kfree(restricted_buf);
 	return ERR_PTR(ret);
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index b448f77616ac..5783275d5714 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -15,6 +15,18 @@ struct restricted_buffer {
 
 struct restricted_heap {
 	const char		*name;
+
+	const struct restricted_heap_ops *ops;
+};
+
+struct restricted_heap_ops {
+	int	(*heap_init)(struct restricted_heap *rheap);
+
+	int	(*alloc)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+	void	(*free)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+
+	int	(*restrict_buf)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+	void	(*unrestrict_buf)(struct restricted_heap *rheap, struct restricted_buffer *buf);
 };
 
 int restricted_heap_add(struct restricted_heap *rheap);
-- 
2.25.1


