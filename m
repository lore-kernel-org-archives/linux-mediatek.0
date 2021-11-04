Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF03C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 02:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217436113B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 02:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 217436113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z8gLCralPgv6TXAjggCC+UFrSHWJxF/XSkq+RZS8wfo=; b=XMWORlDmwSigz+
	/jJhafgLWZeMttCVtWj5Snh0J3GclP5C5At9Hl1lj2WxmA+7FVZTr7qoi0LPhVIgd1pcfbUKd7zOo
	pvKSjyPLteawnWQf87bB8aEHPTEuBnEkUZmHwdJz1HTjsRhFN0CO6/y1KpYF4214m0W84w1CqkRgP
	HLkkGCtwYx/lKPzLCjxdj2kub02e4LHXIYOyjwE7wE2HO+NqmNWgAPXStu8fjij/jvHAhVU7YqzUE
	TabFhp4wvtfVkBErF7zRQR2YnC0BSDYyDec8Rq13E6utd3N3G9uUvcW56b4x/cxMBQmUH3j8rHlsz
	vTiETLfmOxFMopPjbj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miSYY-007clB-6R; Thu, 04 Nov 2021 02:32:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miSYK-007chO-4s; Thu, 04 Nov 2021 02:32:35 +0000
X-UUID: a12a9c0f749a4598849fee577b6144d2-20211103
X-UUID: a12a9c0f749a4598849fee577b6144d2-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 667086334; Wed, 03 Nov 2021 19:32:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 19:32:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 10:32:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 4 Nov 2021 10:32:22 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>
CC: <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>, Walter Wu
 <walter-zh.wu@mediatek.com>
Subject: [PATCH v2] dma-direct: improve DMA_ATTR_NO_KERNEL_MAPPING
Date: Thu, 4 Nov 2021 10:32:21 +0800
Message-ID: <20211104023221.16391-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_193232_224397_F7ABB18D 
X-CRM114-Status: GOOD (  21.68  )
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

When the allocated buffers use dma coherent memory with
DMA_ATTR_NO_KERNEL_MAPPING, then its kernel mapping is exist.
The caller use that DMA_ATTR_NO_KERNEL_MAPPING mean they can't
rely on kernel mapping, but removing kernel mapping have
some improvements.

The improvements are:
a) Security improvement. In some cases, we don't hope the allocated
   buffer to be read by cpu speculative execution. Therefore, it
   need to remove kernel mapping, this patch improve
   DMA_ATTR_NO_KERNEL_MAPPING to remove a page from kernel mapping
   in order that cpu doesn't read it.
b) Debugging improvement. If the allocated buffer map into user space,
   only access it in user space, nobody can access it in kernel space,
   so we can use this patch to see who try to access it in kernel space.

This patch only works if the memory is mapping at page granularity
in the linear region, so that current only support for ARM64.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Christoph Hellwig <hch@lst.de>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---

v2:
1. modify commit message and fix the removing mapping for arm64
2. fix build error for x86

---
 include/linux/set_memory.h |  5 +++++
 kernel/dma/direct.c        | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index f36be5166c19..6c7d1683339c 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -7,11 +7,16 @@
 
 #ifdef CONFIG_ARCH_HAS_SET_MEMORY
 #include <asm/set_memory.h>
+
+#ifndef CONFIG_RODATA_FULL_DEFAULT_ENABLED
+static inline int set_memory_valid(unsigned long addr, int numpages, int enable) { return 0; }
+#endif
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr,  int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+static inline int set_memory_valid(unsigned long addr, int numpages, int enable) { return 0; }
 #endif
 
 #ifndef CONFIG_ARCH_HAS_SET_DIRECT_MAP
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4c6c5e0635e3..d5d03b51b708 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -155,6 +155,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	struct page *page;
 	void *ret;
 	int err;
+	unsigned long kaddr;
 
 	size = PAGE_ALIGN(size);
 	if (attrs & DMA_ATTR_NO_WARN)
@@ -169,6 +170,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		if (!PageHighMem(page))
 			arch_dma_prep_coherent(page, size);
 		*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
+		if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED)) {
+			kaddr = (unsigned long)phys_to_virt(dma_to_phys(dev, *dma_handle));
+			/* page remove kernel mapping for arm64 */
+			set_memory_valid(kaddr, size >> PAGE_SHIFT, 0);
+		}
 		/* return the page pointer as the opaque cookie */
 		return page;
 	}
@@ -275,9 +281,16 @@ void dma_direct_free(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
 	unsigned int page_order = get_order(size);
+	unsigned long kaddr;
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
 	    !force_dma_unencrypted(dev) && !is_swiotlb_for_alloc(dev)) {
+		if (IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED)) {
+			size = PAGE_ALIGN(size);
+			kaddr = (unsigned long)phys_to_virt(dma_to_phys(dev, dma_addr));
+			/* page create kernel mapping for arm64 */
+			set_memory_valid(kaddr, size >> PAGE_SHIFT, 1);
+		}
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
