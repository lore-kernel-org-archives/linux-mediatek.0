Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB420C25B79
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT/s+h1Cq+YzYYbCVYx249Bu2mXtGqq6RR2QY3C1tCU=; b=oAWwFvHtZ9It3Tjt2IlR2Usl0+
	92iod9zba7Y9uJ9Kx3I29PeIfU9UOMP+51z1zyJwjOsKCVhKP7vwklTe3JtULcg4dJpeARAzN0mdB
	P3R+LIp1TwcEf80+pPnyeyseiMKk9fuSwbNKfF4HEw14zBf8t+ioo1uBkQKNYQRGl4jH4EeUdjQoM
	PUpAY0Gry8XpgA1l9NTyMXdikyf2dzskZcccYw+ptAFqyjp8PMAV1Ap0yjn1a3aSUqndxu/52iRJR
	zzLpi9CeQkTZ/E82m5ht1HPNGDXXbP7TmaWh3Dy14ks8w2RFd80hMxRBBGN9wCc2BUIuzHaEL2e+E
	4r8JyJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ck5-00000001MNS-1NMA;
	Wed, 15 May 2024 11:24:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ck1-00000001MKS-0gBN;
	Wed, 15 May 2024 11:24:14 +0000
X-UUID: a5490d8012ad11ef9a78ddf43a9225dc-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VT/s+h1Cq+YzYYbCVYx249Bu2mXtGqq6RR2QY3C1tCU=;
	b=A4juQ7iQYHA1HOowFi69TeuWfoZFLWgdo4ZZSXAz74cNsCDdxcEJxDq/h4xnxp6o/tDVjkdz8xGLfCjnwdcnxurs0lqvPnPaPAHRNtigZmLnY8tTenMOu9L7uE51ddvrlRknh6NE822/DpvrOigJMg+pqoKws4pW5TA0dH2iO1g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:4afb17e7-4ab2-42f8-a17b-0a910c0593b6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:0bc91ffc-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5490d8012ad11ef9a78ddf43a9225dc-20240515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1899818280; Wed, 15 May 2024 04:24:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:24:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:24:03 +0800
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
Subject: [PATCH v5 3/9] lib/scatterlist: Add sg_dup_table
Date: Wed, 15 May 2024 19:23:02 +0800
Message-ID: <20240515112308.10171-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.271200-8.000000
X-TMASE-MatchedRID: Eu5iVMCjEvmiwkztVCsqbz9B1SHosSXQsuIso71Vk6IaIkPr5OoG5XB4
	4IkzjfYyThbvLLI8RvNq7k1NHAqvK5sYdIGP6PlZuIwLnB3Aqp0oUVkB7ifJnriBTLMkgNsWlS9
	xDwj9R9hTNzcLY8ZQFvjW/vDq1F1wuR5n9WRcv4rr/EBmiNuXt5dhffisWXfHjNnoU1fopos/8y
	JL1KErHcb+TbMWrxk0gDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaDBbGvtcMofw/pG1Fl9oluDzNl
	sSO6mpKWiEvKz7iFFVM/CORY37OFUbCDlF3ki+qXeVIMojsyVXps0pE8ve9V/hhuo7ryYdpuDSe
	sCd4STviw6uxviJP8r9tsSiUciBlQ5zsaM5qada/lr1yYih0SylGctXaTCsu
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.271200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E051011996F3694BAAD156BFFC0CB68A4FCCAD6201235414943C12123678785E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042413_291375_D83FFA29 
X-CRM114-Status: GOOD (  14.04  )
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

Prepare for the restricted heap to reuse, move it out from system_heap.c.
To keep the function name consistent, rename it to sg_dup_table.

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/system_heap.c | 27 +--------------------------
 include/linux/scatterlist.h         |  2 ++
 lib/scatterlist.c                   | 26 ++++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9076d47ed2ef..204e55f92330 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -54,31 +54,6 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
-static struct sg_table *dup_sg_table(struct sg_table *table)
-{
-	struct sg_table *new_table;
-	int ret, i;
-	struct scatterlist *sg, *new_sg;
-
-	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
-	if (!new_table)
-		return ERR_PTR(-ENOMEM);
-
-	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
-	if (ret) {
-		kfree(new_table);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	new_sg = new_table->sgl;
-	for_each_sgtable_sg(table, sg, i) {
-		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
-		new_sg = sg_next(new_sg);
-	}
-
-	return new_table;
-}
-
 static int system_heap_attach(struct dma_buf *dmabuf,
 			      struct dma_buf_attachment *attachment)
 {
@@ -90,7 +65,7 @@ static int system_heap_attach(struct dma_buf *dmabuf,
 	if (!a)
 		return -ENOMEM;
 
-	table = dup_sg_table(&buffer->sg_table);
+	table = sg_dup_table(&buffer->sg_table);
 	if (IS_ERR(table)) {
 		kfree(a);
 		return -ENOMEM;
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index a6ad9018eca0..53a4cdc11f4f 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -538,6 +538,8 @@ size_t sg_pcopy_to_buffer(struct scatterlist *sgl, unsigned int nents,
 size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 		       size_t buflen, off_t skip);
 
+struct sg_table *sg_dup_table(struct sg_table *table);
+
 /*
  * Maximum number of entries that will be allocated in one piece, if
  * a list larger than this is required then chaining will be utilized.
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 7bc2220fea80..3efcf728c13b 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -1100,6 +1100,32 @@ size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 }
 EXPORT_SYMBOL(sg_zero_buffer);
 
+struct sg_table *sg_dup_table(struct sg_table *table)
+{
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+EXPORT_SYMBOL(sg_dup_table);
+
 /*
  * Extract and pin a list of up to sg_max pages from UBUF- or IOVEC-class
  * iterators, and add them to the scatterlist.
-- 
2.25.1


