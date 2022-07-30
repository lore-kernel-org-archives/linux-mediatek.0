Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0948EC04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6amBzc2l5Qg9X8wwEWGPGGsS5wwMLagMH0O7eUBGVNw=; b=NWk+QbA2EFLFuZMhijkY03rC/b
	kcL6lM3nno/MLzkA5RfmqT5mUjtZlmdB3DW8ZTz2g3dpacTmFcYirN4zVFv/9bil0x3cH0L+SRNkM
	fDp+Xy9EvcBhni0IHQGU/qabCjUxJustCk2+cJdpQmbTaZiVvpK2mLMGosSBqGnubrnvqeDcQkCie
	UmNGV1orf06WXH1XGyyGDpJPrIzXGWVpOAK2Q/5JreKSSM/ofazaIgmNM2tBaWgpHVrnA7S5Tn4dB
	4rrJT+SAnNfBRQ5/W1p/TFb90YZMhChYaiGcicPZfs5inOYnUNwQDCGCSUAycefPsdDojf7DyCj+c
	pRDOkZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiYp-00GuLc-4M; Sat, 30 Jul 2022 09:15:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiYg-00GuGe-7f; Sat, 30 Jul 2022 09:14:55 +0000
X-UUID: 3f976ab7fc4344c6aae487b35ac78a99-20220730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a309a37b-2335-4a2c-9b33-d12ba36c1865,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4685cfcf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3f976ab7fc4344c6aae487b35ac78a99-20220730
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1727922087; Sat, 30 Jul 2022 02:14:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 30 Jul 2022 17:04:10 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 30 Jul 2022 17:04:10 +0800
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
	<miles.chen@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>
Subject: [PATCH] dma-debug: Remove warning in dma_debug_entry
Date: Sat, 30 Jul 2022 16:56:55 +0800
Message-ID: <20220730085657.31977-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021454_294179_9F3B8C32 
X-CRM114-Status: GOOD (  12.52  )
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

The same physical address can be mapped multiple times, and it is not
required to have attributes such as DMA_ATTR_SKIP_CPU_SYNC, but
dma_debug_entry will report an warning if active_cacheline_insert
returns -EEXIST, which can cause a lot of trouble.

For example, if two dma engine share the same dma-buf, the two dma
engine drivers will call the DMA API to map their own dma address
respectively, which is normal follow, but dma_debug_entry will
report an warning.

In addition, if active_cacheline_insert returns -EEXIST, the
active_cacheline_inc_overlap function already has the logic to
check overlapping mappings counter, if it exceeded
ACTIVE_CACHELINE_MAX_OVERLAP overlapping mappings, it already
has a warning.
And also, if warning as panic is turned on, it will cause KE.

So, dma_debug_entry does not need report warning.

Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 kernel/dma/debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 2caafd13f8aa..ad731f7858c9 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -566,9 +566,6 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
 	if (rc == -ENOMEM) {
 		pr_err_once("cacheline tracking ENOMEM, dma-debug disabled\n");
 		global_disable = true;
-	} else if (rc == -EEXIST && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		err_printk(entry->dev, entry,
-			"cacheline tracking EEXIST, overlapping mappings aren't supported\n");
 	}
 }
 
-- 
2.18.0


