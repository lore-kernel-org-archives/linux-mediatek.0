Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD04E61B39
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD04E61B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dA3QUrNT95htXwzf69DhMHaYU7dRwMdnoltuVKQiGDg=; b=xqQyhiZhOIHjwj
	p2oPwuobFE8aC8VLgpnrysInc2/dOYd/adGvzkiyTRJvFxAO/3KTlR2Ol1qr7bh1GB02IbKTzjiw8
	PjqA0UhTa6Npr5nBN8S4XAe0h+Q3WCpoOVAFI+F8mDaxRe2iMeNpYhKc9/md14+2KAZpQqqEcckSC
	MhDQIhljFyeVvSxaPSTAMflxlfYFjlUDaSGVV4DJEX6ZHt9k9ym4Dr+tB/UmWK1eQc9j0GoUbzsIR
	4Y3Z2vAFReYfDnwqk2vyKhzM/KemBcdvmVP0AfYNt0B3BYAyXNsx7ai5gdm+4Vp4q41yol8YI2ex0
	UfxOE9t4/jYjkJvKGQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnaGC-006vHU-P0; Thu, 18 Nov 2021 05:47:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnaFz-006vGY-T9; Thu, 18 Nov 2021 05:46:49 +0000
X-UUID: 24c74697dd6b40b4ba031c5dc1d96c8d-20211117
X-UUID: 24c74697dd6b40b4ba031c5dc1d96c8d-20211117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 13270453; Wed, 17 Nov 2021 22:46:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 21:44:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 18 Nov 2021 13:44:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Nov 2021 13:44:31 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
 <james.hsu@mediatek.com>, <yee.lee@mediatek.com>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] kmemleak: fix kmemleak false positive report with HW
 tag-based kasan enable
Date: Thu, 18 Nov 2021 13:44:19 +0800
Message-ID: <20211118054426.4123-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_214647_978401_B9A996F3 
X-CRM114-Status: GOOD (  13.47  )
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

With HW tag-based kasan enable, We will get the warning
when we free object whose address starts with 0xFF.

It is because kmemleak rbtree stores tagged object and
this freeing object's tag does not match with rbtree object.

In the example below, kmemleak rbtree stores the tagged object in
the kmalloc(), and kfree() gets the pointer with 0xFF tag.

Call sequence:
ptr = kmalloc(size, GFP_KERNEL);
page = virt_to_page(ptr);
kfree(page_address(page));
ptr = kmalloc(size, GFP_KERNEL);

Call sequence like that may cause the warning as following:
1) Freeing unknown object:
In kfree(), we will get free unknown object warning in kmemleak_free().
Because object(0xFx) in kmemleak rbtree and pointer(0xFF) in kfree() have
different tag.

2) Overlap existing:
When we allocate that object with the same hw-tag again, we will
find the overlap in the kmemleak rbtree and kmemleak thread will
be killed.

[  116.685312] kmemleak: Freeing unknown object at 0xffff000003f88000
[  116.686422] CPU: 5 PID: 177 Comm: cat Not tainted 5.16.0-rc1-dirty #21
[  116.687067] Hardware name: linux,dummy-virt (DT)
[  116.687496] Call trace:
[  116.687792]  dump_backtrace+0x0/0x1ac
[  116.688255]  show_stack+0x1c/0x30
[  116.688663]  dump_stack_lvl+0x68/0x84
[  116.689096]  dump_stack+0x1c/0x38
[  116.689499]  kmemleak_free+0x6c/0x70
[  116.689919]  slab_free_freelist_hook+0x104/0x200
[  116.690420]  kmem_cache_free+0xa8/0x3d4
[  116.690845]  test_version_show+0x270/0x3a0
[  116.691344]  module_attr_show+0x28/0x40
[  116.691789]  sysfs_kf_seq_show+0xb0/0x130
[  116.692245]  kernfs_seq_show+0x30/0x40
[  116.692678]  seq_read_iter+0x1bc/0x4b0
[  116.692678]  seq_read_iter+0x1bc/0x4b0
[  116.693114]  kernfs_fop_read_iter+0x144/0x1c0
[  116.693586]  generic_file_splice_read+0xd0/0x184
[  116.694078]  do_splice_to+0x90/0xe0
[  116.694498]  splice_direct_to_actor+0xb8/0x250
[  116.694975]  do_splice_direct+0x88/0xd4
[  116.695409]  do_sendfile+0x2b0/0x344
[  116.695829]  __arm64_sys_sendfile64+0x164/0x16c
[  116.696306]  invoke_syscall+0x48/0x114
[  116.696735]  el0_svc_common.constprop.0+0x44/0xec
[  116.697263]  do_el0_svc+0x74/0x90
[  116.697665]  el0_svc+0x20/0x80
[  116.698261]  el0t_64_sync_handler+0x1a8/0x1b0
[  116.698695]  el0t_64_sync+0x1ac/0x1b0
...
[  117.520301] kmemleak: Cannot insert 0xf2ff000003f88000 into the object search tree (overlaps existing)
[  117.521118] CPU: 5 PID: 178 Comm: cat Not tainted 5.16.0-rc1-dirty #21
[  117.521827] Hardware name: linux,dummy-virt (DT)
[  117.522287] Call trace:
[  117.522586]  dump_backtrace+0x0/0x1ac
[  117.523053]  show_stack+0x1c/0x30
[  117.523578]  dump_stack_lvl+0x68/0x84
[  117.524039]  dump_stack+0x1c/0x38
[  117.524472]  create_object.isra.0+0x2d8/0x2fc
[  117.524975]  kmemleak_alloc+0x34/0x40
[  117.525416]  kmem_cache_alloc+0x23c/0x2f0
[  117.525914]  test_version_show+0x1fc/0x3a0
[  117.526379]  module_attr_show+0x28/0x40
[  117.526827]  sysfs_kf_seq_show+0xb0/0x130
[  117.527363]  kernfs_seq_show+0x30/0x40
[  117.527848]  seq_read_iter+0x1bc/0x4b0
[  117.528320]  kernfs_fop_read_iter+0x144/0x1c0
[  117.528809]  generic_file_splice_read+0xd0/0x184
[  117.529316]  do_splice_to+0x90/0xe0
[  117.529734]  splice_direct_to_actor+0xb8/0x250
[  117.530227]  do_splice_direct+0x88/0xd4
[  117.530686]  do_sendfile+0x2b0/0x344
[  117.531154]  __arm64_sys_sendfile64+0x164/0x16c
[  117.531673]  invoke_syscall+0x48/0x114
[  117.532111]  el0_svc_common.constprop.0+0x44/0xec
[  117.532621]  do_el0_svc+0x74/0x90
[  117.533048]  el0_svc+0x20/0x80
[  117.533461]  el0t_64_sync_handler+0x1a8/0x1b0
[  117.533950]  el0t_64_sync+0x1ac/0x1b0
[  117.534625] kmemleak: Kernel memory leak detector disabled
[  117.535201] kmemleak: Object 0xf2ff000003f88000 (size 128):
[  117.535761] kmemleak:   comm "cat", pid 177, jiffies 4294921177
[  117.536339] kmemleak:   min_count = 1
[  117.536718] kmemleak:   count = 0
[  117.537068] kmemleak:   flags = 0x1
[  117.537429] kmemleak:   checksum = 0
[  117.537806] kmemleak:   backtrace:
[  117.538211]      kmem_cache_alloc+0x23c/0x2f0
[  117.538924]      test_version_show+0x1fc/0x3a0
[  117.539393]      module_attr_show+0x28/0x40
[  117.539844]      sysfs_kf_seq_show+0xb0/0x130
[  117.540304]      kernfs_seq_show+0x30/0x40
[  117.540750]      seq_read_iter+0x1bc/0x4b0
[  117.541206]      kernfs_fop_read_iter+0x144/0x1c0
[  117.541687]      generic_file_splice_read+0xd0/0x184
[  117.542182]      do_splice_to+0x90/0xe0
[  117.542611]      splice_direct_to_actor+0xb8/0x250
[  117.543097]      do_splice_direct+0x88/0xd4
[  117.543544]      do_sendfile+0x2b0/0x344
[  117.543983]      __arm64_sys_sendfile64+0x164/0x16c
[  117.544471]      invoke_syscall+0x48/0x114
[  117.544917]      el0_svc_common.constprop.0+0x44/0xec
[  117.545416]      do_el0_svc+0x74/0x90
[  117.554100] kmemleak: Automatic memory scanning thread ended

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/kmemleak.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index b57383c17cf6..fa12e2e08cdc 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -381,15 +381,20 @@ static void dump_object_info(struct kmemleak_object *object)
 static struct kmemleak_object *lookup_object(unsigned long ptr, int alias)
 {
 	struct rb_node *rb = object_tree_root.rb_node;
+	unsigned long untagged_ptr = (unsigned long)kasan_reset_tag((void *)ptr);
 
 	while (rb) {
 		struct kmemleak_object *object =
 			rb_entry(rb, struct kmemleak_object, rb_node);
-		if (ptr < object->pointer)
+		unsigned long untagged_objp;
+
+		untagged_objp = (unsigned long)kasan_reset_tag((void *)object->pointer);
+
+		if (untagged_ptr < untagged_objp)
 			rb = object->rb_node.rb_left;
-		else if (object->pointer + object->size <= ptr)
+		else if (untagged_objp + object->size <= untagged_ptr)
 			rb = object->rb_node.rb_right;
-		else if (object->pointer == ptr || alias)
+		else if (untagged_objp == untagged_ptr || alias)
 			return object;
 		else {
 			kmemleak_warn("Found object by alias at 0x%08lx\n",
@@ -576,6 +581,7 @@ static struct kmemleak_object *create_object(unsigned long ptr, size_t size,
 	struct kmemleak_object *object, *parent;
 	struct rb_node **link, *rb_parent;
 	unsigned long untagged_ptr;
+	unsigned long untagged_objp;
 
 	object = mem_pool_alloc(gfp);
 	if (!object) {
@@ -629,9 +635,10 @@ static struct kmemleak_object *create_object(unsigned long ptr, size_t size,
 	while (*link) {
 		rb_parent = *link;
 		parent = rb_entry(rb_parent, struct kmemleak_object, rb_node);
-		if (ptr + size <= parent->pointer)
+		untagged_objp = (unsigned long)kasan_reset_tag((void *)parent->pointer);
+		if (untagged_ptr + size <= untagged_objp)
 			link = &parent->rb_node.rb_left;
-		else if (parent->pointer + parent->size <= ptr)
+		else if (untagged_objp + parent->size <= untagged_ptr)
 			link = &parent->rb_node.rb_right;
 		else {
 			kmemleak_stop("Cannot insert 0x%lx into the object search tree (overlaps existing)\n",
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
