Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064DBC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF15B60F02
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 08:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF15B60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ptv0iFuFyjAvUNDF404LenZQuIkAuRcflYWeHq4nLw=; b=S5L0PGrxmlL+Ja
	AicKPrPajLnYo10wDoJdOvPYRIjOTm2R1DhrLNPTgzfqYvHzG5LD7elxME3pa5ZO8JiblXcG8sqaM
	2NaXrdjTWMDSh5Ptyfa+64SZIbnF0XqVpFETP1j5dCrOftEjKjs36FfjYa6ZiZ1wUP8kDRcv2LNE3
	0jA9xZ2lR85hA928cZL3ImCOOmbk+CekoZNbgMZqXhzHst9giYgGjHfbj6rbwgv2zmC1IMhUPWBur
	/AIeHX5pOqUYR5dZ/xYcFT3vv6vUrkZHflL/qIIhEFWswiEVzyiA5f18yBvMkBgFRcBue3lqsNP6p
	xduxTznYVK0XyKpNLcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCBZ-00581w-2C; Wed, 04 Aug 2021 08:23:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCBK-0057y4-JM; Wed, 04 Aug 2021 08:23:20 +0000
X-UUID: 3764ebe255ad42559da7e61c57f91024-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ttJQXD+RhSPgjF4AdTo78preKZinodO9i9V/f7UcD80=; 
 b=acn5tusQFDH+M25rQ4MnGjfKN48hC956YUwexQBzUgfnnoqfA0cFMTVLw09fJhnk6/J+RyAQtBDv0shYoykxrNXiD+NoSWLqDU7Vc/vWIZIp9rJs7nxw1zyvMRO0iV3mRKPI3tEU04FtKo1xTsdhvNVe7TkUWXH4jHcliXEoDFs=;
X-UUID: 3764ebe255ad42559da7e61c57f91024-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1497711002; Wed, 04 Aug 2021 01:23:14 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 01:23:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 16:23:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 4 Aug 2021 16:23:11 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.tang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v2 1/2] kasan, kmemleak: reset tags when scanning block
Date: Wed, 4 Aug 2021 16:22:29 +0800
Message-ID: <20210804082230.10837-2-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210804082230.10837-1-Kuan-Ying.Lee@mediatek.com>
References: <20210804082230.10837-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_012318_699909_187EACB1 
X-CRM114-Status: GOOD (  14.98  )
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

Kmemleak need to scan kernel memory to check memory leak.
With hardware tag-based kasan enabled, when it scans on
the invalid slab and dereference, the issue will occur
as below.

Hardware tag-based KASAN doesn't use compiler instrumentation, we
can not use kasan_disable_current() to ignore tag check.

Based on the below report, there are 11 0xf7 granules, which amounts to
176 bytes, and the object is allocated from the kmalloc-256 cache. So
when kmemleak accesses the last 256-176 bytes, it causes faults, as
those are marked with KASAN_KMALLOC_REDZONE == KASAN_TAG_INVALID ==
0xfe.

Thus, we reset tags before accessing metadata to avoid from false positives.

[  151.905804] ==================================================================
[  151.907120] BUG: KASAN: out-of-bounds in scan_block+0x58/0x170
[  151.908773] Read at addr f7ff0000c0074eb0 by task kmemleak/138
[  151.909656] Pointer tag: [f7], memory tag: [fe]
[  151.910195]
[  151.910876] CPU: 7 PID: 138 Comm: kmemleak Not tainted 5.14.0-rc2-00001-g8cae8cd89f05-dirty #134
[  151.912085] Hardware name: linux,dummy-virt (DT)
[  151.912868] Call trace:
[  151.913211]  dump_backtrace+0x0/0x1b0
[  151.913796]  show_stack+0x1c/0x30
[  151.914248]  dump_stack_lvl+0x68/0x84
[  151.914778]  print_address_description+0x7c/0x2b4
[  151.915340]  kasan_report+0x138/0x38c
[  151.915804]  __do_kernel_fault+0x190/0x1c4
[  151.916386]  do_tag_check_fault+0x78/0x90
[  151.916856]  do_mem_abort+0x44/0xb4
[  151.917308]  el1_abort+0x40/0x60
[  151.917754]  el1h_64_sync_handler+0xb4/0xd0
[  151.918270]  el1h_64_sync+0x78/0x7c
[  151.918714]  scan_block+0x58/0x170
[  151.919157]  scan_gray_list+0xdc/0x1a0
[  151.919626]  kmemleak_scan+0x2ac/0x560
[  151.920129]  kmemleak_scan_thread+0xb0/0xe0
[  151.920635]  kthread+0x154/0x160
[  151.921115]  ret_from_fork+0x10/0x18
[  151.921717]
[  151.922077] Allocated by task 0:
[  151.922523]  kasan_save_stack+0x2c/0x60
[  151.923099]  __kasan_kmalloc+0xec/0x104
[  151.923502]  __kmalloc+0x224/0x3c4
[  151.924172]  __register_sysctl_paths+0x200/0x290
[  151.924709]  register_sysctl_table+0x2c/0x40
[  151.925175]  sysctl_init+0x20/0x34
[  151.925665]  proc_sys_init+0x3c/0x48
[  151.926136]  proc_root_init+0x80/0x9c
[  151.926547]  start_kernel+0x648/0x6a4
[  151.926987]  __primary_switched+0xc0/0xc8
[  151.927557]
[  151.927994] Freed by task 0:
[  151.928340]  kasan_save_stack+0x2c/0x60
[  151.928766]  kasan_set_track+0x2c/0x40
[  151.929173]  kasan_set_free_info+0x44/0x54
[  151.929568]  ____kasan_slab_free.constprop.0+0x150/0x1b0
[  151.930063]  __kasan_slab_free+0x14/0x20
[  151.930449]  slab_free_freelist_hook+0xa4/0x1fc
[  151.930924]  kfree+0x1e8/0x30c
[  151.931285]  put_fs_context+0x124/0x220
[  151.931731]  vfs_kern_mount.part.0+0x60/0xd4
[  151.932280]  kern_mount+0x24/0x4c
[  151.932686]  bdev_cache_init+0x70/0x9c
[  151.933122]  vfs_caches_init+0xdc/0xf4
[  151.933578]  start_kernel+0x638/0x6a4
[  151.934014]  __primary_switched+0xc0/0xc8
[  151.934478]
[  151.934757] The buggy address belongs to the object at ffff0000c0074e00
[  151.934757]  which belongs to the cache kmalloc-256 of size 256
[  151.935744] The buggy address is located 176 bytes inside of
[  151.935744]  256-byte region [ffff0000c0074e00, ffff0000c0074f00)
[  151.936702] The buggy address belongs to the page:
[  151.937378] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x100074
[  151.938682] head:(____ptrval____) order:2 compound_mapcount:0 compound_pincount:0
[  151.939440] flags: 0xbfffc0000010200(slab|head|node=0|zone=2|lastcpupid=0xffff|kasantag=0x0)
[  151.940886] raw: 0bfffc0000010200 0000000000000000 dead000000000122 f5ff0000c0002300
[  151.941634] raw: 0000000000000000 0000000000200020 00000001ffffffff 0000000000000000
[  151.942353] page dumped because: kasan: bad access detected
[  151.942923]
[  151.943214] Memory state around the buggy address:
[  151.943896]  ffff0000c0074c00: f0 f0 f0 f0 f0 f0 f0 f0 f0 fe fe fe fe fe fe fe
[  151.944857]  ffff0000c0074d00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
[  151.945892] >ffff0000c0074e00: f7 f7 f7 f7 f7 f7 f7 f7 f7 f7 f7 fe fe fe fe fe
[  151.946407]                                                     ^
[  151.946939]  ffff0000c0074f00: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
[  151.947445]  ffff0000c0075000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  151.947999] ==================================================================
[  151.948524] Disabling lock debugging due to kernel taint
[  156.434569] kmemleak: 181 new suspected memory leaks (see /sys/kernel/debug/kmemleak)

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
---
 mm/kmemleak.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 228a2fbe0657..73d46d16d575 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -290,7 +290,7 @@ static void hex_dump_object(struct seq_file *seq,
 	warn_or_seq_printf(seq, "  hex dump (first %zu bytes):\n", len);
 	kasan_disable_current();
 	warn_or_seq_hex_dump(seq, DUMP_PREFIX_NONE, HEX_ROW_SIZE,
-			     HEX_GROUP_SIZE, ptr, len, HEX_ASCII);
+			     HEX_GROUP_SIZE, kasan_reset_tag((void *)ptr), len, HEX_ASCII);
 	kasan_enable_current();
 }
 
@@ -1171,7 +1171,7 @@ static bool update_checksum(struct kmemleak_object *object)
 
 	kasan_disable_current();
 	kcsan_disable_current();
-	object->checksum = crc32(0, (void *)object->pointer, object->size);
+	object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);
 	kasan_enable_current();
 	kcsan_enable_current();
 
@@ -1246,7 +1246,7 @@ static void scan_block(void *_start, void *_end,
 			break;
 
 		kasan_disable_current();
-		pointer = *ptr;
+		pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
 		kasan_enable_current();
 
 		untagged_ptr = (unsigned long)kasan_reset_tag((void *)pointer);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
