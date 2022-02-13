Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Feb 2022 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zfAhqrCniF0FlfCXOrxT7AxOmfQzNjYxiYJNtCwK4vg=; b=HpB3hLxXjfIw7m
	d+zgSQRjhQ7fm8YEPJ7+6KZ6q9T/cfazztXFCf4CRW5ueJ9F3NR7aF85BLpsu3Ybqh0di2jaOuK6w
	g2A7kusvgenfoiGYpPmpMncaebZmqEZtugecKyo5oX/9Owzc7sMhOcN7YRgeZG4HHHI2cHaw2Cr/T
	H4lGiWE3hgJAv54Z7Z9zZcSq8XQihI5dmD4pYlF5Ap6xxFs3OHouaEjk0EWDGTml+LsynU+b1GG4o
	yRttmrY1Cj+ZxiQF4NiFA+kK4QWu+evZCYtnSVwpqRimdckQtwuuU/OUXljRvLUHuxG7d+8Q2w6bS
	njtZ1x7LOemXfx4JVHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJHcz-00BwsR-2Z; Sun, 13 Feb 2022 16:21:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJHcm-00Bwqp-2B; Sun, 13 Feb 2022 16:21:21 +0000
X-UUID: 988fd07427c149eab7a0a1ab14ddffd9-20220213
X-UUID: 988fd07427c149eab7a0a1ab14ddffd9-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 269069954; Sun, 13 Feb 2022 09:21:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 08:21:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 00:21:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Feb 2022 00:21:12 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <phil.chang@mediatek.com>
CC: <jens.wiklander@linaro.org>, <matthias.bgg@gmail.com>,
 <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] tee: make tee_shm_register_kernel_buf vmalloc supported
Date: Mon, 14 Feb 2022 00:21:10 +0800
Message-ID: <20220213162110.27210-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_082120_137392_A7CF2A2F 
X-CRM114-Status: GOOD (  13.85  )
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
 drivers/tee/optee/call.c |  2 +-
 drivers/tee/tee_shm.c    | 40 ++++++++++++++++++++++++++++------------
 2 files changed, 29 insertions(+), 13 deletions(-)

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
index f31e29e8f1ca..861403588485 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -23,22 +23,38 @@ static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 static int shm_get_kernel_pages(unsigned long start, size_t page_count,
 				struct page **pages)
 {
-	struct kvec *kiov;
-	size_t n;
 	int rc;
 
-	kiov = kcalloc(page_count, sizeof(*kiov), GFP_KERNEL);
-	if (!kiov)
-		return -ENOMEM;
-
-	for (n = 0; n < page_count; n++) {
-		kiov[n].iov_base = (void *)(start + n * PAGE_SIZE);
-		kiov[n].iov_len = PAGE_SIZE;
+	if (is_vmalloc_addr((void *)start)) {
+		struct page *page;
+		int i;
+
+		for (i = 0; i < page_count; i++) {
+			page = vmalloc_to_page((void *)(start + PAGE_SIZE * i));
+			if (!page)
+				return -ENOMEM;
+
+			get_page(page);
+			pages[i] = page;
+		}
+		rc = page_count;
+	} else {
+		struct kvec *kiov;
+		size_t n;
+
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
 	}
 
-	rc = get_kernel_pages(kiov, page_count, 0, pages);
-	kfree(kiov);
-
 	return rc;
 }
 
-- 
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
