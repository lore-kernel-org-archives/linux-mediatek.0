Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE696C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YT1uIkx8jul3bGIN4b2zOqGnelQrClOzDeqE96nF6cc=; b=sT+wKpm/R796lpzJKhDfi/3fur
	QS+fmUkr6lawPzNniGdmSbf/4IeU8lz492Nm/ontSXO7NFsZKbAl/pyNGk6Xa3wzgRv8ZyWzf4TU0
	z4tEpGfz2y2QlRaaciFPfMi1eiRvLEdnKcDQ4d0ADx7rol4U/z9AI0y4ZHWefS6QUiv+y4XIBL2kF
	czyOfyI1cXuBz05qO237wk/lteSF/TfxAZmRd+rGytIQC991ZpvvgAY5U93zRRrLJc7lNBKAFZ/JY
	teixIXjx019yr2KsUC9VsvURvr2yHVAjG+r//OgRtFwzyaVlwzAjeTO77Mzqd+UOREZ4SN27GcyEK
	rIAB/dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL3Y-0068lZ-Jm; Thu, 08 Sep 2022 17:11:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL3G-0068X9-TL; Thu, 08 Sep 2022 17:10:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64E20B82194;
	Thu,  8 Sep 2022 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389EEC433D6;
	Thu,  8 Sep 2022 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662657052;
	bh=9F5CpnV+yMlP6UNyeFpMMSeycsOh1cqro/gmzOq/zK4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=mI8KbLlb1gbEgrHPhmq7EFJ6s/0g5U+WGMgQjd+Fjvc/t/NOhmwgQqcasLtBD/Xie
	 WjOf69v17d9sMzJPAd1Qxvrt8381vIrb7XG/ALUZibqQOEZATCOabDDVApTinhQklc
	 WlJezsuShVnQVelVkBXpCzJ+LndsRE5v04cg5peI=
Subject: Patch "Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"" has been added to the 5.10-stable tree
To: akpm@linux-foundation.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,linux-mm@kvack.org,matthias.bgg@gmail.com,patrick.wang.shcn@gmail.com,yee.lee@mediatek.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 08 Sep 2022 19:10:39 +0200
In-Reply-To: <20220906070309.18809-1-yee.lee@mediatek.com>
Message-ID: <166265703924251@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101055_272131_BCD385B9 
X-CRM114-Status: GOOD (  15.41  )
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


This is a note to let you know that I've just added the patch titled

    Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-mm-kmemleak-take-a-full-lowmem-check-in-kmemleak_-_phys.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From yee.lee@mediatek.com  Thu Sep  8 19:05:17 2022
From: <yee.lee@mediatek.com>
Date: Tue, 6 Sep 2022 15:03:06 +0800
Subject: Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
To: <linux-kernel@vger.kernel.org>
Cc: <patrick.wang.shcn@gmail.com>, Yee Lee <yee.lee@mediatek.com>, <stable@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, "moderated list:ARM/Mediatek SoC support"  <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support"  <linux-mediatek@lists.infradead.org>
Message-ID: <20220906070309.18809-1-yee.lee@mediatek.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 mm/kmemleak.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1123,7 +1123,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
 void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
 			       gfp_t gfp)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_alloc(__va(phys), size, min_count, gfp);
 }
 EXPORT_SYMBOL(kmemleak_alloc_phys);
@@ -1137,7 +1137,7 @@ EXPORT_SYMBOL(kmemleak_alloc_phys);
  */
 void __ref kmemleak_free_part_phys(phys_addr_t phys, size_t size)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_free_part(__va(phys), size);
 }
 EXPORT_SYMBOL(kmemleak_free_part_phys);
@@ -1149,7 +1149,7 @@ EXPORT_SYMBOL(kmemleak_free_part_phys);
  */
 void __ref kmemleak_not_leak_phys(phys_addr_t phys)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_not_leak(__va(phys));
 }
 EXPORT_SYMBOL(kmemleak_not_leak_phys);
@@ -1161,7 +1161,7 @@ EXPORT_SYMBOL(kmemleak_not_leak_phys);
  */
 void __ref kmemleak_ignore_phys(phys_addr_t phys)
 {
-	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
+	if (!IS_ENABLED(CONFIG_HIGHMEM) || PHYS_PFN(phys) < max_low_pfn)
 		kmemleak_ignore(__va(phys));
 }
 EXPORT_SYMBOL(kmemleak_ignore_phys);


Patches currently in stable-queue which might be from yee.lee@mediatek.com are

queue-5.10/revert-mm-kmemleak-take-a-full-lowmem-check-in-kmemleak_-_phys.patch

