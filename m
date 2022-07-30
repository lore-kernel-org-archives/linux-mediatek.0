Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00897C04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V3WpcqsEae/EFC2moVJvkZ2ZgpMjoEOhKBVxC8jIwyA=; b=OF/K9l96SUvrpDgtIcLUQeNfUJ
	NCrfTFA5EJQXfxqH2aYslyT3VeFhrHdIhWzROhbpMSXH173qp/OpzbMaFsLnszrnCzyZ6DHlnUfHT
	vGY7jbG9oB3wt3Aaqb+8e77XXNC5llOkg+K2dutGO+vwibQ1O4G0oVTX6iZOC+60KLD7Kv8vZh1yO
	YX8RHa1/+KaR4QaFsI5qfqctMt5uUa5DexEN//TkRjF5ze56UbkiiP0zqYGet3WFMG9+MsIvUozty
	tH75fnYPbqBccc9KIvonHbyBXudH050Hsf/jCz6cCj4/XNGBH3M4AA9gYNn1yrElKGPez8xHi1DlJ
	h52uTAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHluA-000eyB-Nh; Sat, 30 Jul 2022 12:49:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHlu5-000etS-85; Sat, 30 Jul 2022 12:49:16 +0000
X-UUID: 0733cd2b41f14e4e981ad96617edebe4-20220730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cc5f9a5e-b062-4e91-994a-f6c1fc7ca3f9,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:3293c1d0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0733cd2b41f14e4e981ad96617edebe4-20220730
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1043909512; Sat, 30 Jul 2022 05:49:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 30 Jul 2022 19:49:00 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 30 Jul 2022 19:48:59 +0800
From: <yf.wang@mediatek.com>
To: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
	"Marek Szyprowski" <m.szyprowski@samsung.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, "open list:DMA MAPPING HELPERS"
	<iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Ning Li
	<Ning.Li@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>, Miles Chen
	<miles.chen@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>, jianjiao zeng
	<jianjiao.zeng@mediatek.com>
Subject: [PATCH] dma-debug: Fix overflow issue in bucket_find_contain
Date: Sat, 30 Jul 2022 19:41:45 +0800
Message-ID: <20220730114146.32669-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_054913_298651_9E6324F2 
X-CRM114-Status: GOOD (  13.48  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

There are two issue:
1. If max_rang is set to 0xFFFF_FFFF, and __hash_bucket_find always
returns NULL, the rang will be accumulated. When rang is accumulated
to 0xFFFF_E000, after executing rang += (1 << HASH_FN_SHIFT) again,
rang will overflow to 0, making it impossible to exit the while loop.
2. dev_addr reduce maybe overflow.

So, add range and dev_addr check to avoid overflow.

Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 kernel/dma/debug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index ad731f7858c9..9d7d54cd4c63 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -352,6 +352,7 @@ static struct dma_debug_entry *bucket_find_contain(struct hash_bucket **bucket,
 
 	unsigned int max_range = dma_get_max_seg_size(ref->dev);
 	struct dma_debug_entry *entry, index = *ref;
+	unsigned int shift = (1 << HASH_FN_SHIFT);
 	unsigned int range = 0;
 
 	while (range <= max_range) {
@@ -360,12 +361,15 @@ static struct dma_debug_entry *bucket_find_contain(struct hash_bucket **bucket,
 		if (entry)
 			return entry;
 
+		if (max_range - range < shift || index.dev_addr < shift)
+			return NULL;
+
 		/*
 		 * Nothing found, go back a hash bucket
 		 */
 		put_hash_bucket(*bucket, *flags);
-		range          += (1 << HASH_FN_SHIFT);
-		index.dev_addr -= (1 << HASH_FN_SHIFT);
+		range          += shift;
+		index.dev_addr -= shift;
 		*bucket = get_hash_bucket(&index, flags);
 	}
 
-- 
2.18.0


