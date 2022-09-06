Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8261C38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4X0g6zh3LL2gC/S+uOCH4TXJCztnz+tFKJu4PBhlAjQ=; b=hEvs/9nROH/WwUoO8SYjDDCgcr
	rYFqpXiXciQGOH68S2lLFoFg4vo+WJMr6z0FzX96rxzoS28DvR2bHHU5PBF7gUrJBKgnjTb3IPFPr
	xgcYCASH+3LYT5u9nncv/YbXXJAX2UmB4Vd7yaawHdksWChFfS6LwR1Ler408N3kA7A0Vk7eGtR0S
	aJ039gT6TdvtRTEf0AjpPqUvx6+tbDydi48pahoEXo9nn4H0evDYu3ff6zS+tWeSZmT/+bmE+DSho
	NHaF3oLf0YkJLrA6GoKHMw0BOkbe4ltPaAVyAIep2Ujfyk7UlG951VmgYSmXfOrGqdIuNX8EEA7Xi
	SjzknI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTPO-00AxkW-LO; Tue, 06 Sep 2022 07:54:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTPD-00AxgN-0T; Tue, 06 Sep 2022 07:54:04 +0000
X-UUID: 280bf440bf7841158fe2d4bbc8d02142-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4X0g6zh3LL2gC/S+uOCH4TXJCztnz+tFKJu4PBhlAjQ=;
	b=i4J8NQoV1WB49QjRCx8FfFEa6QF4vm9gjnHUaQeaRgMSU7DHQqGXloht43hQ0Nu6t04YF9E65YvMsw48tLUI+xhLFgU8BHAtw01v7UcYeDWL1HZTNhXrvAg5fA/cByg+J7wCuQzqs9NxIm+5gsWLmp5OFTXV+tv0ha14QxMtGMQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5b898953-f7e4-4849-ac9e-7c24ce766a82,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-20
X-CID-META: VersionHash:84eae18,CLOUDID:32fd5521-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 280bf440bf7841158fe2d4bbc8d02142-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 199590893; Tue, 06 Sep 2022 00:53:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 6 Sep 2022 15:03:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 15:03:11 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <patrick.wang.shcn@gmail.com>, Yee Lee <yee.lee@mediatek.com>,
	<stable@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.15.y] Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
Date: Tue, 6 Sep 2022 15:03:06 +0800
Message-ID: <20220906070309.18809-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_005401_399842_282AD30D 
X-CRM114-Status: GOOD (  10.24  )
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

From: Yee Lee <yee.lee@mediatek.com>

This reverts commit 23c2d497de21f25898fbea70aeb292ab8acc8c94.

Commit 23c2d497de21 ("mm: kmemleak: take a full lowmem check in
kmemleak_*_phys()") brought false leak alarms on some archs like arm64
that does not init pfn boundary in early booting. The final solution
lands on linux-6.0: commit 0c24e061196c ("mm: kmemleak: add rbtree and
store physical address for objects allocated with PA").

Revert this commit before linux-6.0. The original issue of invalid PA
can be mitigated by additional check in devicetree.

The false alarm report is as following: Kmemleak output: (Qemu/arm64)
unreferenced object 0xffff0000c0170a00 (size 128):
  comm "swapper/0", pid 1, jiffies 4294892404 (age 126.208s)
  hex dump (first 32 bytes):
 62 61 73 65 00 00 00 00 00 00 00 00 00 00 00 00  base............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<(____ptrval____)>] __kmalloc_track_caller+0x1b0/0x2e4
    [<(____ptrval____)>] kstrdup_const+0x8c/0xc4
    [<(____ptrval____)>] kvasprintf_const+0xbc/0xec
    [<(____ptrval____)>] kobject_set_name_vargs+0x58/0xe4
    [<(____ptrval____)>] kobject_add+0x84/0x100
    [<(____ptrval____)>] __of_attach_node_sysfs+0x78/0xec
    [<(____ptrval____)>] of_core_init+0x68/0x104
    [<(____ptrval____)>] driver_init+0x28/0x48
    [<(____ptrval____)>] do_basic_setup+0x14/0x28
    [<(____ptrval____)>] kernel_init_freeable+0x110/0x178
    [<(____ptrval____)>] kernel_init+0x20/0x1a0
    [<(____ptrval____)>] ret_from_fork+0x10/0x20

This pacth is also applicable to linux-5.17.y/linux-5.18.y/linux-5.19.y

Cc: <stable@vger.kernel.org>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 mm/kmemleak.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 859303aae180..b78861b8e013 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1125,7 +1125,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
 void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
 			       gfp_t gfp)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_alloc(__va(phys), size, min_count, gfp);
 }
 EXPORT_SYMBOL(kmemleak_alloc_phys);
@@ -1139,7 +1139,7 @@ EXPORT_SYMBOL(kmemleak_alloc_phys);
  */
 void __ref kmemleak_free_part_phys(phys_addr_t phys, size_t size)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_free_part(__va(phys), size);
 }
 EXPORT_SYMBOL(kmemleak_free_part_phys);
@@ -1151,7 +1151,7 @@ EXPORT_SYMBOL(kmemleak_free_part_phys);
  */
 void __ref kmemleak_not_leak_phys(phys_addr_t phys)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_not_leak(__va(phys));
 }
 EXPORT_SYMBOL(kmemleak_not_leak_phys);
@@ -1163,7 +1163,7 @@ EXPORT_SYMBOL(kmemleak_not_leak_phys);
  */
 void __ref kmemleak_ignore_phys(phys_addr_t phys)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_ignore(__va(phys));
 }
 EXPORT_SYMBOL(kmemleak_ignore_phys);
-- 
2.18.0


