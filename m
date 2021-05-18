Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCF3C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:40:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D176109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 09:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D176109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1MdqVQMpBtBpgN6y1UMXvYs2twiDB5Yw/ZHOaCysf7w=; b=T2iJu2yi5IBhiaHDZPxW2/cgp
	xmaFRqZz5tNNS8sWZ1kjWWTqObWlVYMhEC/ZRmH43BN2Av/+ZgSyjA37q2z2psbi12ps9P5Ero3B8
	UT+V9l0/pLStRqzkkyIoMutDMUflD/rff4jqI7RQ8TaYDt3wGssnYa67gFaHjRHfeizxL6q67Pydq
	OA/eR+VgoUzye5o0ajmb1rBMfUEohlvuqqBq0ga6CekCcWMMkklYWom6I9pkM9qlG5ZITRiDTelE7
	ANtZejb9Tp3o7z+/9dU8Kiux3PWXA2/RwD/ZYdetIFJhbHpSEybDlrWZGSy/wiK/J14HaLUiEj3uQ
	pZ3SIfQyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwDF-000BdV-Ed; Tue, 18 May 2021 09:40:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwD7-000BbE-Ty; Tue, 18 May 2021 09:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=RlXBu9WGDcuUMnuchsjRfVTAyAWHFfW/wxkPyQQf21Y=; b=A7fBcudzQcY9PocoilGGvNEjyI
 MJXmySWGbMdL87dTBatHHSqILf+IxCcz3o4PO6sC0muDp3CXnsFcUvtk0aHjWSB/bkXoaBKQHRYqO
 AivJIE4K390n6lnt/G362NOgdtsNZ0g3B+akDBevIAIhLOOucVpmC3KU+4hSGT3A8Z8pj+y7Ih68N
 s+rlggNqFOqAu61hQSGFw9wQ5KG+QMYdtMtlClekkAKXzMTpgoqavS96lR2y9LNzkDQsA4HoAPG9n
 i9mePSYpz+9G8XaZR60zm00NNMTCoaNDwHzxC6zj4ZyQl+QjHbCuK4yQmpqZ1bt3zHM2imsy+ktXh
 3xvcVoLA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwD4-00EWBE-On; Tue, 18 May 2021 09:40:20 +0000
X-UUID: 765181ab518c4fea8661bf0f52f8dae7-20210518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RlXBu9WGDcuUMnuchsjRfVTAyAWHFfW/wxkPyQQf21Y=; 
 b=PdcLmyPbo80q2ftDuKo8qdElV2vyhWyqITUE2xD30uQYWvT6fRdAlVt1YMiSx4U2PaeKOkPs9MnruUqS2nWUCjVdTujkHQ/VuaC7+kSTP6c+uN4UhQtPyaI5mDgjnTqNBGjFB9EkhAsja4YPx/J5gHy/pn1gCDWX8X99yhv5kFo=;
X-UUID: 765181ab518c4fea8661bf0f52f8dae7-20210518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 150858819; Tue, 18 May 2021 02:40:11 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 02:40:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:09 +0800
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
Subject: [PATCH v2 2/2] mm: replace contig_page_data with node_data
Date: Tue, 18 May 2021 17:24:46 +0800
Message-ID: <20210518092446.16382-3-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210518092446.16382-1-miles.chen@mediatek.com>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_024018_859479_E7E58E2F 
X-CRM114-Status: GOOD (  16.19  )
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

Replace contig_page_data with node_data. Change the definition
of NODE_DATA(nid) from (&contig_page_data) to (node_data[0]).

Remove contig_page_data from the tree.

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Kazu <k-hagio-ab@nec.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
 arch/powerpc/kexec/core.c                      |  5 -----
 include/linux/gfp.h                            |  3 ---
 include/linux/mmzone.h                         |  3 +--
 kernel/crash_core.c                            |  1 -
 mm/memblock.c                                  |  2 --
 6 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 3861a25faae1..74185245c580 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -81,14 +81,6 @@ into that mem_map array.
 
 Used to map an address to the corresponding struct page.
 
-contig_page_data
-----------------
-
-Makedumpfile gets the pglist_data structure from this symbol, which is
-used to describe the memory layout.
-
-User-space tools use this to exclude free pages when dumping memory.
-
 mem_section|(mem_section, NR_SECTION_ROOTS)|(mem_section, section_mem_map)
 --------------------------------------------------------------------------
 
@@ -531,11 +523,6 @@ node_data|(node_data, MAX_NUMNODES)
 
 See above.
 
-contig_page_data
-----------------
-
-See above.
-
 vmemmap_list
 ------------
 
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 56da5eb2b923..41f31dfb540c 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -68,13 +68,8 @@ void machine_kexec_cleanup(struct kimage *image)
 void arch_crash_save_vmcoreinfo(void)
 {
 
-#ifdef CONFIG_NEED_MULTIPLE_NODES
 	VMCOREINFO_SYMBOL(node_data);
 	VMCOREINFO_LENGTH(node_data, MAX_NUMNODES);
-#endif
-#ifndef CONFIG_NEED_MULTIPLE_NODES
-	VMCOREINFO_SYMBOL(contig_page_data);
-#endif
 #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
 	VMCOREINFO_SYMBOL(vmemmap_list);
 	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 11da8af06704..ba8c511c402f 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -493,9 +493,6 @@ static inline int gfp_zonelist(gfp_t flags)
  * This zone list contains a maximum of MAX_NUMNODES*MAX_NR_ZONES zones.
  * There are two zonelists per node, one for all zones with memory and
  * one containing just zones from the node the zonelist belongs to.
- *
- * For the normal case of non-DISCONTIGMEM systems the NODE_DATA() gets
- * optimized to &contig_page_data at compile-time.
  */
 static inline struct zonelist *node_zonelist(int nid, gfp_t flags)
 {
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 557918dcc755..c0769292187c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1043,9 +1043,8 @@ extern char numa_zonelist_order[];
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
 
-extern struct pglist_data contig_page_data;
-#define NODE_DATA(nid)		(&contig_page_data)
 extern struct pglist_data *node_data[];
+#define NODE_DATA(nid)		(node_data[0])
 #define NODE_MEM_MAP(nid)	mem_map
 
 #else /* CONFIG_NEED_MULTIPLE_NODES */
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 825284baaf46..d1e324be67f9 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -457,7 +457,6 @@ static int __init crash_save_vmcoreinfo_init(void)
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
 	VMCOREINFO_SYMBOL(mem_map);
-	VMCOREINFO_SYMBOL(contig_page_data);
 #endif
 #ifdef CONFIG_SPARSEMEM
 	VMCOREINFO_SYMBOL_ARRAY(mem_section);
diff --git a/mm/memblock.c b/mm/memblock.c
index ebddb57ea62d..7cfc9a9d6243 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -93,8 +93,6 @@
  */
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
-struct pglist_data __refdata contig_page_data;
-EXPORT_SYMBOL(contig_page_data);
 struct pglist_data *node_data[MAX_NUMNODES];
 #endif
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
