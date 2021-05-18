Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E7FC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:41:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CBB610A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CBB610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z++iQhirrZdBtxsiISFdepP5xnwqafJtdIFmKF+8e+Y=; b=WIJ2PeEyzj2tk+Ito6wX9UvfK
	IjAXInaV4qVLc0kRRhQ6bJ1uYQsJo8Rt2HxlNIFbW7znpGbLhIAJFzIgIHsVLRW9FOFBCV6ZrhTy3
	rLMGu66jwcnYzLVw5VRd5Jzp25Bi0XAuzxmquO1iSH5t78p5nB2D2Hi1ryTibEn93wjGt8yTir7ZQ
	u0/IOMoM8MIVHWE54IXMsTYzFYkzt9u5Cub1pjvUpzP+XsfX5Uyb2vHa9JGdpKD23JaA1Lh+64jGN
	4huVo2SNVzBY8GeSXRLTMrkORubYf961gC7EMkCi9S6T2830MKuFNgXgG9f0t8od0TWCQTZubZ0oq
	cuVqyRWdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwEC-000BvD-6r; Tue, 18 May 2021 09:41:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwDS-000BhR-DD; Tue, 18 May 2021 09:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=DMmlq0cFGW4t6gxeOtRUbUHz7I5Ct5uA+QmbIPr7f+k=; b=BfuAjv1sVSILd9312JinkSTMgk
 dw1+9sK7HRDloBJd8OAtTafrQEkNTyVpMtriMCLOvYh+96Y/tJ51uNGgFOFPHWLGfHgx0jMH6dgBP
 BezOzCm7nhZvxo6SQD2iaqX0dMeCdo6GWuUEJVW4LHJDhfcdBMLfB1T6EYPC3+T3UWzIm7de60MdY
 eYCnVRXWVU8wCRsiSsMTMffI91MTKx1NfBTdm8RI8Ndxs/uKOa4JnUpSRyOLSrz8bUi6onigGy/Od
 NotbtQ/iG8fLeil7pCz4WWxeCcI3dkqUMytI2iKg+3Foq6ONxYRv7N8VgRzGvuSsHzP/7TZvA2gYI
 YUtbFtOg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwDP-00EWE8-MC; Tue, 18 May 2021 09:40:41 +0000
X-UUID: fa0ce63d087f4b8b94998923ff173cf2-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DMmlq0cFGW4t6gxeOtRUbUHz7I5Ct5uA+QmbIPr7f+k=; 
 b=DR8Y0ZOi0WRBAH9Cv0idEjpA/m8ZwqJXwS+ck7zhOtxx2ok0tg7Nv8GOZnmujReeDWkKJAhwPTJD/qBsv2ZCnczn2gVrYPWm/pVaVNPLSsezuLVrkQWhg7dpgOzRldWF3EnYgfu8VbPUfydfFut/prqmHQ1g0J35oZRXGXn5QF0=;
X-UUID: fa0ce63d087f4b8b94998923ff173cf2-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 73119581; Tue, 18 May 2021 02:40:36 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 02:40:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 May 2021 17:40:09 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Mike Rapoport" <rppt@kernel.org>
CC: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Miles Chen <miles.chen@mediatek.com>, Kazu <k-hagio-ab@nec.com>
Subject: [PATCH v2 1/2] mm: introduce prepare_node_data
Date: Tue, 18 May 2021 17:24:45 +0800
Message-ID: <20210518092446.16382-2-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210518092446.16382-1-miles.chen@mediatek.com>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_024039_752514_9AE38AD8 
X-CRM114-Status: GOOD (  15.00  )
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

When CONFIG_NEED_MULTIPLE_NODES=y (CONFIG_NUMA=y),
the pglist_data is allocated by a memblock API and stored in an array
named node_data[].
When CONFIG_NEED_MULTIPLE_NODES=n (CONFIG_NUMA=n), the pglist_data
is defined as global variable contig_page_data. The difference
causes problems when we enable CONFIG_DEBUG_VIRTUAL and use __pa()
to get the physical address of NODE_DATA.

To solve the issue, introduce prepare_node_data() to allocate
pglist_data when CONFIG_NUMA=n and stored it to node_data.
i.e., Use the same way to allocate node_data[] when CONFIG_NUMA=y
or CONFIG_NUMA=n.
prepare_node_data() is called in sparer_init() and
free_area_init().

This is the first step to replace contig_page_data with allocated
pglist_data.

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Kazu <k-hagio-ab@nec.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 include/linux/mm.h     |  2 ++
 include/linux/mmzone.h |  1 +
 mm/memblock.c          |  1 +
 mm/page_alloc.c        | 16 ++++++++++++++++
 mm/sparse.c            |  2 ++
 5 files changed, 22 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c274f75efcf9..3052eeb87455 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2462,9 +2462,11 @@ static inline int early_pfn_to_nid(unsigned long pfn)
 {
 	return 0;
 }
+extern void prepare_node_data(void);
 #else
 /* please see mm/page_alloc.c */
 extern int __meminit early_pfn_to_nid(unsigned long pfn);
+static inline void prepare_node_data(void) {};
 #endif
 
 extern void set_dma_reserve(unsigned long new_dma_reserve);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0d53eba1c383..557918dcc755 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1045,6 +1045,7 @@ extern char numa_zonelist_order[];
 
 extern struct pglist_data contig_page_data;
 #define NODE_DATA(nid)		(&contig_page_data)
+extern struct pglist_data *node_data[];
 #define NODE_MEM_MAP(nid)	mem_map
 
 #else /* CONFIG_NEED_MULTIPLE_NODES */
diff --git a/mm/memblock.c b/mm/memblock.c
index afaefa8fc6ab..ebddb57ea62d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -95,6 +95,7 @@
 #ifndef CONFIG_NEED_MULTIPLE_NODES
 struct pglist_data __refdata contig_page_data;
 EXPORT_SYMBOL(contig_page_data);
+struct pglist_data *node_data[MAX_NUMNODES];
 #endif
 
 unsigned long max_low_pfn;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index aaa1655cf682..0c6d421f4cfb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1659,6 +1659,20 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
 
 	return nid;
 }
+#else
+void __init prepare_node_data(void)
+{
+	if (node_data[0])
+		return;
+
+	node_data[0] = memblock_alloc(sizeof(struct pglist_data),
+			SMP_CACHE_BYTES);
+
+	if (!node_data[0])
+		panic("Cannot allocate node_data\n");
+
+	memset(node_data[0], 0, sizeof(struct pglist_data));
+}
 #endif /* CONFIG_NEED_MULTIPLE_NODES */
 
 void __init memblock_free_pages(struct page *page, unsigned long pfn,
@@ -7697,6 +7711,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	int i, nid, zone;
 	bool descending;
 
+	prepare_node_data();
+
 	/* Record where the zone boundaries are */
 	memset(arch_zone_lowest_possible_pfn, 0,
 				sizeof(arch_zone_lowest_possible_pfn));
diff --git a/mm/sparse.c b/mm/sparse.c
index b2ada9dc00cb..afcfe7463b4a 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -580,6 +580,8 @@ void __init sparse_init(void)
 
 	memblocks_present();
 
+	prepare_node_data();
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
