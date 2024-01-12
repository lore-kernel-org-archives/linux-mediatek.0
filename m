Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27299C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jHIiPkYdMqrIuViIDt09m/oNMLq/0qMbZqFoJXbNq8=; b=3KpkMKnaqkKaKwfu27Sd1W0sz5
	hOgxgTH50tehl4L07sTzwjzdY3b7+xzgntDeyHrP7nLRO/huuMEHMeMLFHZpsmTAO81im3DrxgDNg
	dHfmaSQFwHFgq0POTD/8xfvP2Gzv5nBODZCKOfQ6JRGFlc7wx/5lvR20kmIq3B/fp7cLYXgY90IPL
	h7V+T9xb1Ql3e4JkbqWve2mVcamhuFa4GLh4gmbtSHsdh9rqRPuxN5dTW+uIPWDjnHtZE8sXwbTsn
	d7T6kzYYa7T/8Wvf51LhPJzlcAdsKtpQ7cByPBrEZzXyz7vS4FqP9rTocEJnGpByFzy7iKWBgiTiV
	7keugZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODix-002IAO-2w;
	Fri, 12 Jan 2024 09:21:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODiu-002I7X-32;
	Fri, 12 Jan 2024 09:21:10 +0000
X-UUID: e64fd73eb12b11ee9a662f17bb45267e-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6jHIiPkYdMqrIuViIDt09m/oNMLq/0qMbZqFoJXbNq8=;
	b=TD9sqqYIY5f+voXnqFuUeaiG7sOiy6ohkg3BKaAJwktv05l2zpep8PsoIk5lNQ9toA2slerzjC7M2yBX4Wk0LyrLDfUQ9GAnSW2UFkIw7qbtDrbX4AzwE/WFjZcGjFF4Ak8tFRnVOUO3sep+Bal8dtH6YilWJ6Oel/eAP2DcORQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:9f95ea79-c1c7-47e7-bf4b-507a1a3636c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:dc5ac782-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e64fd73eb12b11ee9a662f17bb45267e-20240112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 811239125; Fri, 12 Jan 2024 02:21:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:20:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:20:53 +0800
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
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, "Pavel
 Machek" <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, <youlin.pei@mediatek.com>
Subject: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
Date: Fri, 12 Jan 2024 17:20:10 +0800
Message-ID: <20240112092014.23999-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.237500-8.000000
X-TMASE-MatchedRID: iSQL5szRvdExaBEU4bKrV0hEDfw/93BuMApqy5cfknVX4H/AHZTAKiyG
	2FFo0u8oRHLRFcKKZXfbCHv011Gy9ZCoy9iDotiwzfqlpbtmcWiH7D1bP/FcOrXvDHySC+eU+a/
	zdHOJ3WkVrfWt68rqN2a39PjWf0NNHxPMjOKY7A8LbigRnpKlKSBuGJWwgxArX1upngn1GyfAxT
	6U8SDb8vUxfqD56Kpg95Wd/WEnd3Q/A2ducvlnMYZSLT91ovb7o0pTThB0QTAQDF6kcoF++1KIU
	FLF1m+Y8mf/2A2Ja/Zpp55fZDlsr34cY/B7JqXaYZ1R7NXn0MdBmmCXcKyFFJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.237500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E17AEBE1573EE56AA0E5BF0CDAEE0C2195895CC9F7701A5D61573FE5E60280622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012108_983152_F160BC2C 
X-CRM114-Status: GOOD (  15.95  )
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
a) memory_alloc: Allocate the buffer in kernel;
b) memory_restrict: Restrict/Protect/Secure that buffer.
The memory_alloc is mandatory while memory_restrict is optinal since it may
be part of memory_alloc.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
 drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index fd7c82abd42e..8c266a0f6192 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -12,10 +12,44 @@
 
 #include "restricted_heap.h"
 
+static int
+restricted_heap_memory_allocate(struct restricted_heap *heap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = heap->ops;
+	int ret;
+
+	ret = ops->memory_alloc(heap, buf);
+	if (ret)
+		return ret;
+
+	if (ops->memory_restrict) {
+		ret = ops->memory_restrict(heap, buf);
+		if (ret)
+			goto memory_free;
+	}
+	return 0;
+
+memory_free:
+	ops->memory_free(heap, buf);
+	return ret;
+}
+
+static void
+restricted_heap_memory_free(struct restricted_heap *heap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = heap->ops;
+
+	if (ops->memory_unrestrict)
+		ops->memory_unrestrict(heap, buf);
+
+	ops->memory_free(heap, buf);
+}
+
 static struct dma_buf *
 restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
 {
+	struct restricted_heap *restricted_heap = dma_heap_get_drvdata(heap);
 	struct restricted_buffer *restricted_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
@@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	restricted_buf->size = ALIGN(size, PAGE_SIZE);
 	restricted_buf->heap = heap;
 
+	ret = restricted_heap_memory_allocate(restricted_heap, restricted_buf);
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
+		goto err_free_restricted_mem;
 	}
 
 	return dmabuf;
 
+err_free_restricted_mem:
+	restricted_heap_memory_free(restricted_heap, restricted_buf);
 err_free_buf:
 	kfree(restricted_buf);
 	return ERR_PTR(ret);
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 443028f6ba3b..ddeaf9805708 100644
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
+	int	(*heap_init)(struct restricted_heap *heap);
+
+	int	(*memory_alloc)(struct restricted_heap *heap, struct restricted_buffer *buf);
+	void	(*memory_free)(struct restricted_heap *heap, struct restricted_buffer *buf);
+
+	int	(*memory_restrict)(struct restricted_heap *heap, struct restricted_buffer *buf);
+	void	(*memory_unrestrict)(struct restricted_heap *heap, struct restricted_buffer *buf);
 };
 
 int restricted_heap_add(struct restricted_heap *rstrd_heap);
-- 
2.25.1


