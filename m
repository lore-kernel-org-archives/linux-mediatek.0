Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A417C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 09:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B33D6115B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 09:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B33D6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MmqomUK3IphbVSEaGVNgnvRz4vwMFobAVo+6VDTgOvw=; b=eqjIRJkGcTpCY5
	JMNk5rnt4c8hu3AvBMFw8hKoMZwGM5RInEBgO/C3SCoPWiMhMydP/0okdO+3TfucznHmyeHO71Sob
	fvZruCdYJ2CwWDFPldzHcbuBOHEiOmVG1YoV/Jl+VQO9/Eua3X1IkohMbRvBUZnZkbITCpYJc9x1U
	xa+ijxDSe232lJgPg6gchFZFwj8iML5XeftQNY7Pjrl7lrAjq3UuUQt9B44VAc7qBDFkZ3RfF486T
	Iq+fZFs4+i+1tEp+Z+6HkP/HLzS741CnherfSNh2KsFBpTK8sI10YGOwX2eg2TY+GsAwA1WfPtZCB
	Q/AKw/UPeggHNNpunkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBy4-002jk4-Pw; Mon, 07 Jun 2021 09:54:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBiv-002f1I-If
 for linux-mediatek@lists.infradead.org; Mon, 07 Jun 2021 09:39:14 +0000
X-UUID: 60d051e531f7437d9f807a15b3a2cb35-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AwyBzG3hmF1f7XpZ5Jdjq9IJI+Tlp9FS1JzSiKeKBjs=; 
 b=TN+qjKZ2nJ0c+uABc+hIQ3I+wRXKTBps31vkt3dTAEFsPKVwMlcIExZ+TENbUCOE7Yt2fV3mCr9TsCWbwJxC45rU5wXucLz2Q+iPXQMg85SC8pqfMgfImBADvodHH2X9IRnkZ0nlQp13DmRCyifmc4JiFVYJz4SIACQX1s0ovl0=;
X-UUID: 60d051e531f7437d9f807a15b3a2cb35-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1455839913; Mon, 07 Jun 2021 02:39:06 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 02:38:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 17:38:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 17:38:50 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Miles Chen <miles.chen@mediatek.com>,
 Baoquan He <bhe@redhat.com>, Kazu <k-hagio-ab@nec.com>
Subject: [RESEND PATCH v3] mm/sparse: fix check_usemap_section_nr warnings
Date: Mon, 7 Jun 2021 17:38:49 +0800
Message-ID: <1623058729-27264-1-git-send-email-miles.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_023911_136547_D25E86CB 
X-CRM114-Status: GOOD (  16.47  )
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

I see a "virt_to_phys used for non-linear address" warning from
check_usemap_section_nr() on arm64 platforms.

In current implementation of NODE_DATA, if CONFIG_NEED_MULTIPLE_NODES=y,
pglist_data is dynamically allocated and assigned to node_data[].

For example, in arch/arm64/include/asm/mmzone.h:
extern struct pglist_data *node_data[];
\#define NODE_DATA(nid)          (node_data[(nid)])

If CONFIG_NEED_MULTIPLE_NODES=n, pglist_data is defined as a global
variable named "contig_page_data".

For example, in include/linux/mmzone.h:
extern struct pglist_data contig_page_data;
\#define NODE_DATA(nid)          (&contig_page_data)

If CONFIG_DEBUG_VIRTUAL is not enabled, __pa() can handle both
dynamically allocated linear addresses and symbol addresses.
However, if (CONFIG_DEBUG_VIRTUAL=y && CONFIG_NEED_MULTIPLE_NODES=n)
,we can see the "virt_to_phys used for non-linear address"
warning because that &contig_page_data is not a linear address on arm64.

To fix it, create a small function to handle both translation.

Warning message:
[    0.000000] ------------[ cut here ]------------
[    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : __virt_to_phys+0x58/0x68
[    0.000000] lr : __virt_to_phys+0x54/0x68
[    0.000000] sp : ffff800011833e70
[    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
[    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
[    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
[    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
[    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
[    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
[    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
[    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
[    0.000000] Call trace:
[    0.000000]  __virt_to_phys+0x58/0x68
[    0.000000]  check_usemap_section_nr+0x50/0xfc
[    0.000000]  sparse_init_nid+0x1ac/0x28c
[    0.000000]  sparse_init+0x1c4/0x1e0
[    0.000000]  bootmem_init+0x60/0x90
[    0.000000]  setup_arch+0x184/0x1f0
[    0.000000]  start_kernel+0x78/0x488
[    0.000000] ---[ end trace f68728a0d3053b60 ]---

Cc: Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Kazu <k-hagio-ab@nec.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>

---

Change since v1:
Try to allocate pgdat (do not use global variables)

Change since v2:
Go back to original implementation

---
 mm/sparse.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index b2ada9dc00cb..55c18aff3e42 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -344,6 +344,15 @@ size_t mem_section_usage_size(void)
 	return sizeof(struct mem_section_usage) + usemap_size();
 }
 
+static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
+{
+#ifndef CONFIG_NEED_MULTIPLE_NODES
+	return __pa_symbol(pgdat);
+#else
+	return __pa(pgdat);
+#endif
+}
+
 #ifdef CONFIG_MEMORY_HOTREMOVE
 static struct mem_section_usage * __init
 sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
@@ -362,7 +371,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 	 * from the same section as the pgdat where possible to avoid
 	 * this problem.
 	 */
-	goal = __pa(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
+	goal = pgdat_to_phys(pgdat) & (PAGE_SECTION_MASK << PAGE_SHIFT);
 	limit = goal + (1UL << PA_SECTION_SHIFT);
 	nid = early_pfn_to_nid(goal >> PAGE_SHIFT);
 again:
@@ -390,7 +399,7 @@ static void __init check_usemap_section_nr(int nid,
 	}
 
 	usemap_snr = pfn_to_section_nr(__pa(usage) >> PAGE_SHIFT);
-	pgdat_snr = pfn_to_section_nr(__pa(pgdat) >> PAGE_SHIFT);
+	pgdat_snr = pfn_to_section_nr(pgdat_to_phys(pgdat) >> PAGE_SHIFT);
 	if (usemap_snr == pgdat_snr)
 		return;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
