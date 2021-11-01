Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EAFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E8860240
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E8860240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6HU53bepWabN3dFmgKAinFwPZ3GwjV9JNoKBSSWSsc=; b=INnY2LWYz4LCMk
	rOoxUtjRdh4gSCLweA8EZwduO2KePFMRrPl40t1Je5Hn5bcteagibJHBgMDpbgkBND7bQ3ETAo3mg
	ep3i+NtXHzIECWQ2Ov54SJGSVyytiJE7X1VShBvqLVplDZ5iWiTh7ADGPrUMBU6jm3nw4Hp2F1Mvr
	lQ5X+yASBHsb904cXlvyCqR90BQq/aQ7OSNZ01RpBxmisXvdL4ldRDyQKqF8dgW+HX5ZlswubHOsc
	g/QeX88Ymmm6Zf1dbedhqfM6/gc3qGKYdQpQusEoDbtIJdrovMDzL2+6Y5sVeMtl/nWUqC7W+5sDw
	T23eGxRaAK3/VGw10udQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhNo2-00F9bi-UZ; Mon, 01 Nov 2021 03:16:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhNnq-00F9aF-51; Mon, 01 Nov 2021 03:16:07 +0000
X-UUID: e3503b147d9f428397ec84e50885618c-20211031
X-UUID: e3503b147d9f428397ec84e50885618c-20211031
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1888997292; Sun, 31 Oct 2021 20:16:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Oct 2021 20:16:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 1 Nov 2021 11:15:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Nov 2021 11:15:59 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, Walter Wu
 <walter-zh.wu@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING
Date: Mon, 1 Nov 2021 11:15:58 +0800
Message-ID: <20211101031558.7184-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_201606_225809_FDBF0675 
X-CRM114-Status: GOOD (  15.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DMA_ATTR_NO_KERNEL_MAPPING is to avoid creating a kernel mapping
for the allocated buffer, but current implementation is that
PTE of allocated buffer in kernel page table is valid. So we
should set invalid for PTE of allocate buffer so that there are
no kernel mapping for the allocated buffer.

In some cases, we don't hope the allocated buffer to be read
by cpu or speculative execution, so we use DMA_ATTR_NO_KERNEL_MAPPING
to get no kernel mapping in order to achieve this goal.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 kernel/dma/direct.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4c6c5e0635e3..aa10b4c5d762 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -13,6 +13,7 @@
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
 #include <linux/slab.h>
+#include <asm/cacheflush.h>
 #include "direct.h"
 
 /*
@@ -169,6 +170,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		if (!PageHighMem(page))
 			arch_dma_prep_coherent(page, size);
 		*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
+		/* remove kernel mapping for pages */
+		set_memory_valid((unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle)),
+				size >> PAGE_SHIFT, 0);
 		/* return the page pointer as the opaque cookie */
 		return page;
 	}
@@ -278,6 +282,10 @@ void dma_direct_free(struct device *dev, size_t size,
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
 	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
+		size = PAGE_ALIGN(size);
+		/* create kernel mapping for pages */
+		set_memory_valid((unsigned long)phys_to_virt(dma_to_phys(dev, dma_addr)),
+				size >> PAGE_SHIFT, 1);
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
