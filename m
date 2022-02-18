Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C36C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=foG5Gqn/GSCDydcNBGMbbnBTvksEXWVdo2Zq6SEE+6w=; b=X61gDBU8zx5RKG
	t2QxQkdbQvtJs930xI2D8IVj4z7WyO7Zgv6kjpXk7ygz+KeBEnpSuLQA0/71/c3jJA8mfrl1cWmlm
	jiOvoZ2h0COeTDJd7MUKbfCnnX7d1dZ3RLHpo7xxfCCaqm9MbGQsaqWb0AGscqi5CaE5pG7AxAaIv
	sz4QB5QZmkPscHpSZrZEDRNNQAVJTxqHKhLkPLYv/LO89Bsh/0Bg2LmQen/FdlpalCswo2tiF2ncG
	KOufeadOVsomjZoAShmlWCXTmq79rOS/LAycGDJsHxnrKxZsWHT/VVOPMeDcapKNP2u9UUduZgaUZ
	XAFlmW30s0vSFeHWVzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3xr-00EkPU-Fj; Fri, 18 Feb 2022 14:10:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3xf-00EkMb-VS; Fri, 18 Feb 2022 14:10:17 +0000
X-UUID: 063493e6dad448e9944449231e46c600-20220218
X-UUID: 063493e6dad448e9944449231e46c600-20220218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 703082191; Fri, 18 Feb 2022 07:10:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 06:10:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 22:10:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 22:10:06 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <jens.wiklander@linaro.org>
CC: <sumit.garg@linaro.org>, <matthias.bgg@gmail.com>,
 <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Phil Chang <phil.chang@mediatek.com>
Subject: [PATCH v3] tee: make tee_shm_register_kernel_buf vmalloc supported
Date: Fri, 18 Feb 2022 22:10:04 +0800
Message-ID: <20220218141004.16912-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_061016_037289_70691B65 
X-CRM114-Status: GOOD (  13.59  )
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

In some low-memory devices, it's hard to aquire large-orders pages,
this patch allowed user using scatter pages to register shm.

Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---

Changelog
	v2 -> v3: use the "n" variable to walk through "page_count"

 drivers/tee/optee/call.c |  2 +-
 drivers/tee/tee_shm.c    | 37 ++++++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index bd49ec934060..2082e632adff 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -362,7 +362,7 @@ int optee_check_mem_type(unsigned long start, size_t num_pages)
 	 * Allow kernel address to register with OP-TEE as kernel
 	 * pages are configured as normal memory only.
 	 */
-	if (virt_addr_valid(start))
+	if (virt_addr_valid(start) || is_vmalloc_addr((void *)start))
 		return 0;
 
 	mmap_read_lock(mm);
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index f31e29e8f1ca..1412adad9397 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -23,21 +23,36 @@ static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 static int shm_get_kernel_pages(unsigned long start, size_t page_count,
 				struct page **pages)
 {
-	struct kvec *kiov;
-	size_t n;
 	int rc;
+	size_t n;
 
-	kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
-	if (!kiov)
-		return -ENOMEM;
+	if (is_vmalloc_addr((void *)start)) {
+		struct page *page;
 
-	for (n = 0; n < page_count; n++) {
-		kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
-		kiov[n].iov_len = PAGE_SIZE;
-	}
+		for (n = 0; n < page_count; n++) {
+			page = vmalloc_to_page((void *)(start + PAGE_SIZE * n));
+			if (!page)
+				return -ENOMEM;
+
+			get_page(page);
+			pages[n] = page;
+		}
+		rc = page_count;
+	} else {
+		struct kvec *kiov;
 
-	rc = get_kernel_pages(kiov, page_count, 0, pages);
-	kfree(kiov);
+		kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
+		if (!kiov)
+			return -ENOMEM;
+
+		for (n = 0; n < page_count; n++) {
+			kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
+			kiov[n].iov_len = PAGE_SIZE;
+		}
+
+		rc = get_kernel_pages(kiov, page_count, 0, pages);
+		kfree(kiov);
+	}
 
 	return rc;
 }
-- 
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
