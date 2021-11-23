Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E39AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sj+AW6qRQ9F09c4EwgNADl0tqnIX8Ei/QPaG4gObqck=; b=YDBiwhvCVpVEpS
	Xt2bFZw7kxfXwa8N3FcWQHpEBGTY62D3RSb6QLDoHMmoQK45hp1i1cTgCIN4OLqSSd038v8gEl1Qp
	GXPe/nV1Gb7J/eDHtX5w12/ZlvXSVX99hfOCjBfUIfpUZhcyvA9Xs8sIr6idRgj5apM3j4f/ZRh0L
	8kLLj616rn7hq/73RJ58dmL8w52JZIPI/MYF0O50mHt4KltrvONHl3T+DBSkfGYT49lPHP1cmyRtP
	zYgaREWdDb0fjiiJcvpFmjWRReWvdnlvn3y7/l7yFkd/vtZovD+TRt2CMvSiTYW/h1vwinwXj0gP9
	jTa0EWo5rhesXbHFEslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTs0-001sIw-Oj; Tue, 23 Nov 2021 11:21:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTrN-001s26-Sk
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 11:21:17 +0000
Received: by mail-pg1-x532.google.com with SMTP id f65so8369100pgc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Nov 2021 03:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXx4tPUfUH9pafyzAeGR5gquV85Y2Z7tudxqqufT9GE=;
 b=Wyu1LS1cdtTMg0hBT2U10oleP2US7ydiLPsXo5v+x1MNLCd6m33da3VzYuAdmFxMDv
 /atTSJHqbJlfRgPOsJTgGAwa42sZEMLJfCeeybWG2f34PtVrGXjnb2T1yJRaaAh4pnH5
 yo0ASPO7kd0LehyYoqSA3V7IvNbzQ7efFI4NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXx4tPUfUH9pafyzAeGR5gquV85Y2Z7tudxqqufT9GE=;
 b=Jlsk5Vcuk6B0ItNwfWqJ4LD42ZFPoT3PgrVn3g7OwI5ZcH5wooe6I/FIYoPuMX43hg
 igRSK6giZdgtkRF/Z2RLuVC6Nmx86llgRpRkCvF7oPa5ccdMJi1Zhmdr8ui4bdERwWoi
 bXzsTlBH/+JSh2afRGKftP8aW/MbLN/3G+JF3eU/29bpNY3KeIDWfDa/ZOTs1sY37tk0
 PqmY4Io0cnfM5gMHF+UVn3L/LUOahFyh9hQKFaTg9b40yU0Pq3WAphkAmdSdAFIIByE6
 /QTkx6CIWlDc7ALiYLVQnRWeVMxnJd631OzUTSVD++wK5fCxnnO/cGou1NKXTsH0Qg/9
 Udng==
X-Gm-Message-State: AOAM53092KoTU6tolfA/CBhPUmaSNF8vgCzVF6K46nq4XP9pVA9YXPUA
 H/HKN5NOJJ+IWoMtZTvjdSF2PQ==
X-Google-Smtp-Source: ABdhPJxjIMzcvOjNvrJ8u+XuK5KrPYWq/y8+SH32D3Ysykp7V9Qvil0zhFT6XjR7GIbSKLcWQI8AkA==
X-Received: by 2002:a63:1813:: with SMTP id y19mr3266275pgl.93.1637666472835; 
 Tue, 23 Nov 2021 03:21:12 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:d1ae:c331:ed2a:15e9])
 by smtp.gmail.com with ESMTPSA id 63sm11093914pfz.119.2021.11.23.03.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:21:12 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, - <devicetree-spec@vger.kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 senozhatsky@chromium.org, tfiga@chromium.org
Subject: [PATCH 1/3] dma: swiotlb: Allow restricted-dma-pool to customize
 IO_TLB_SEGSIZE
Date: Tue, 23 Nov 2021 19:21:02 +0800
Message-Id: <20211123112104.3530135-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211123112104.3530135-1-hsinyi@chromium.org>
References: <20211123112104.3530135-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_032113_991206_633A78EC 
X-CRM114-Status: GOOD (  18.95  )
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

Default IO_TLB_SEGSIZE is 128, but some use cases requires more slabs.
Otherwise swiotlb_find_slots() will fail.

This patch allows each mem pool to decide their own io-tlb-segsize
through dt property.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 include/linux/swiotlb.h |  1 +
 kernel/dma/swiotlb.c    | 34 ++++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 569272871375c4..73b3312f23e65b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -95,6 +95,7 @@ struct io_tlb_mem {
 	unsigned long nslabs;
 	unsigned long used;
 	unsigned int index;
+	unsigned int io_tlb_segsize;
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8e840fbbed7c7a..021eef1844ca4c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -145,9 +145,10 @@ void swiotlb_print_info(void)
 	       (mem->nslabs << IO_TLB_SHIFT) >> 20);
 }
 
-static inline unsigned long io_tlb_offset(unsigned long val)
+static inline unsigned long io_tlb_offset(unsigned long val,
+					  unsigned long io_tlb_segsize)
 {
-	return val & (IO_TLB_SEGSIZE - 1);
+	return val & (io_tlb_segsize - 1);
 }
 
 static inline unsigned long nr_slots(u64 val)
@@ -186,13 +187,16 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	mem->late_alloc = late_alloc;
+	if (!mem->io_tlb_segsize)
+		mem->io_tlb_segsize = IO_TLB_SEGSIZE;
 
 	if (swiotlb_force == SWIOTLB_FORCE)
 		mem->force_bounce = true;
 
 	spin_lock_init(&mem->lock);
 	for (i = 0; i < mem->nslabs; i++) {
-		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].list = mem->io_tlb_segsize -
+				     io_tlb_offset(i, mem->io_tlb_segsize);
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
 	}
@@ -523,7 +527,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
 	}
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
+	     io_tlb_offset(i, mem->io_tlb_segsize) != mem->io_tlb_segsize - 1 &&
 	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 
@@ -603,7 +607,7 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * with slots below and above the pool being returned.
 	 */
 	spin_lock_irqsave(&mem->lock, flags);
-	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
+	if (index + nslots < ALIGN(index + 1, mem->io_tlb_segsize))
 		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
@@ -623,8 +627,8 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
-	     i--)
+	     io_tlb_offset(i, mem->io_tlb_segsize) != mem->io_tlb_segsize - 1 &&
+	     mem->slots[i].list; i--)
 		mem->slots[i].list = ++count;
 	mem->used -= nslots;
 	spin_unlock_irqrestore(&mem->lock, flags);
@@ -701,7 +705,9 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 
 size_t swiotlb_max_mapping_size(struct device *dev)
 {
-	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+	return ((size_t)IO_TLB_SIZE) * mem->io_tlb_segsize;
 }
 
 bool is_swiotlb_active(struct device *dev)
@@ -788,6 +794,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 {
 	struct io_tlb_mem *mem = rmem->priv;
 	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+	struct device_node *np;
 
 	/*
 	 * Since multiple devices can share the same pool, the private data,
@@ -808,6 +815,17 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 
 		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
 				     rmem->size >> PAGE_SHIFT);
+
+		np = of_find_node_by_phandle(rmem->phandle);
+		if (np) {
+			if (!of_property_read_u32(np, "io-tlb-segsize",
+						  &mem->io_tlb_segsize)) {
+				if (hweight32(mem->io_tlb_segsize) != 1)
+					mem->io_tlb_segsize = IO_TLB_SEGSIZE;
+			}
+			of_node_put(np);
+		}
+
 		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
 		mem->force_bounce = true;
 		mem->for_alloc = true;
-- 
2.34.0.rc2.393.gf8c9666880-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
