Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C98C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Feb 2022 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LP2kZYHJ4+KWJE387Mj0k8rRzP3qrwcdTxn07CFS398=; b=bXa/uSEhPTZWyA
	6zb8/PgQOqBKIg+lR+6YrvH8PmcgBrApjftE930bz242fP6LJcdlmlp+jsLnUM7OcZWE0RiR279bK
	kvxo9htsZlNCTH22jY4LMICmKCqKmacIFRl8P3lLvgsCzHQGe88u170cmm7j5olZUo6EOo04rFL7S
	TbWaDmmfvahdHy4bSElPaWFbhPhmrHBrp2EDtW/Kf3BaYJIRAL7EVqxyGkaoEqGyDhqfpi0tWu/k2
	HbtpaMEVI0qtbI5b1o5Ddwj+renu73RiMTBqa+E+M6CQd6rQnhH4qpavMqbLJztagHPkQhkatdtaU
	e1iir4zAJH/7H5n7rhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFv7i-003vyF-Pm; Fri, 04 Feb 2022 09:43:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFv7W-003vw9-Nf; Fri, 04 Feb 2022 09:43:13 +0000
X-UUID: e89487c8833f4549a474a49677f1a12f-20220204
X-UUID: e89487c8833f4549a474a49677f1a12f-20220204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2017634764; Fri, 04 Feb 2022 02:43:05 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Feb 2022 01:33:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Feb 2022 17:33:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Feb 2022 17:33:02 +0800
From: Phil Chang <phil.chang@mediatek.com>
To: <jens.wiklander@linaro.org>
CC: <sumit.garg@linaro.org>, <matthias.bgg@gmail.com>,
 <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <phil.chang@mediatek.com>
Subject: [PATCH] optee: make tee_shm_register vmalloc supported
Date: Fri, 4 Feb 2022 17:32:54 +0800
Message-ID: <20220204093254.2467-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_014310_803053_12CC86EF 
X-CRM114-Status: GOOD (  14.88  )
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

This patch allowed the tee shm use vmalloc area buffer.

Signed-off-by: Phil Chang <phil.chang@mediatek.com>
---

Hi,

 In some low-memory devices, it's hard to aquire large-orders pages,
 this pathes is allowed user use scatter pages to register shm.

 Thanks.

 drivers/tee/optee/call.c |  2 +-
 drivers/tee/tee_shm.c    | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index b25cc1fac945..937bcc7df8e4 100644
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
index 499fccba3d74..31d0c10485ff 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -195,6 +195,20 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	if (flags & TEE_SHM_USER_MAPPED) {
 		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
 					 shm->pages);
+	} else if (is_vmalloc_addr((void *)start)) {
+		struct page *page;
+		int i;
+
+		for (i = 0; i < num_pages; i++) {
+			page = vmalloc_to_page((void *)(start + PAGE_SIZE * i));
+			if (!page) {
+				ret = ERR_PTR(-ENOMEM);
+				goto err;
+			}
+			get_page(page);
+			shm->pages[i] = page;
+		}
+		rc = num_pages;
 	} else {
 		struct kvec *kiov;
 		int i;
--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
