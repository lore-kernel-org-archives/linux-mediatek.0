Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9732q1YlsrxBAGlhh2BHj/JTTx7n4M0Lg3Er/ayRML4=; b=Fn2V75krnuTBLP
	v7aohmXNK4VUUzWhw+bCZbT4o61QIAQ089fePdgqMm/sVVb9kLJo2oW9EGGjJ2eNhbbwhsp/ju+9Y
	jjm15G2NdL6te1LA+qQ7wAFUqK1NMQCWQd3bm+GjsYjttr1L0JFXPlYbiN9usH7CojHfzZmJV/jxG
	vafUvuhOHmYF7w9wEHrra+nJf+Ayn4ANomeNCcS62kvdswRaAUMVsu1KBlN7EXzDbftEFisoYfJNs
	9NYf8XC6U2TmuoDCp2PhMfLK4/C4TklkKr4KQlWhVX/C35y7S26ngIfqUH13FCb/VkpDCvlz8gGrQ
	ev5982lWcCmeJ2h5kXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV3c3-000I4T-DC; Fri, 18 Mar 2022 03:49:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV3br-000I2n-QR; Fri, 18 Mar 2022 03:49:05 +0000
X-UUID: 21faa62d4c6941f1b8e4a35c81bf8be7-20220317
X-UUID: 21faa62d4c6941f1b8e4a35c81bf8be7-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1398488182; Thu, 17 Mar 2022 20:48:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 20:40:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 11:40:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 11:40:56 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
 <yee.lee@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm/kmemleak: Reset tag when compare object pointer
Date: Fri, 18 Mar 2022 11:40:48 +0800
Message-ID: <20220318034051.30687-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_204903_868168_CB749E60 
X-CRM114-Status: GOOD (  11.68  )
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

When we use HW-tag based kasan and enable vmalloc support, we hit
the following bug. It is due to comparison between tagged object
and non-tagged pointer.

We need to reset the kasan tag when we need to compare tagged object
and non-tagged pointer.

[    7.690429][T400001] init: kmemleak: [name:kmemleak&]Scan area larger than object 0xffffffe77076f440
[    7.691762][T400001] init: CPU: 4 PID: 1 Comm: init Tainted: G S      W         5.15.25-android13-0-g5cacf919c2bc #1
[    7.693218][T400001] init: Hardware name: MT6983(ENG) (DT)
[    7.693983][T400001] init: Call trace:
[    7.694508][T400001] init:  dump_backtrace.cfi_jt+0x0/0x8
[    7.695272][T400001] init:  dump_stack_lvl+0xac/0x120
[    7.695985][T400001] init:  add_scan_area+0xc4/0x244
[    7.696685][T400001] init:  kmemleak_scan_area+0x40/0x9c
[    7.697428][T400001] init:  layout_and_allocate+0x1e8/0x288
[    7.698211][T400001] init:  load_module+0x2c8/0xf00
[    7.698895][T400001] init:  __se_sys_finit_module+0x190/0x1d0
[    7.699701][T400001] init:  __arm64_sys_finit_module+0x20/0x30
[    7.700517][T400001] init:  invoke_syscall+0x60/0x170
[    7.701225][T400001] init:  el0_svc_common+0xc8/0x114
[    7.701933][T400001] init:  do_el0_svc+0x28/0xa0
[    7.702580][T400001] init:  el0_svc+0x60/0xf8
[    7.703196][T400001] init:  el0t_64_sync_handler+0x88/0xec
[    7.703964][T400001] init:  el0t_64_sync+0x1b4/0x1b8
[    7.704658][T400001] init: kmemleak: [name:kmemleak&]Object 0xf5ffffe77076b000 (size 32768):
[    7.705824][T400001] init: kmemleak: [name:kmemleak&]  comm "init", pid 1, jiffies 4294894197
[    7.707002][T400001] init: kmemleak: [name:kmemleak&]  min_count = 0
[    7.707886][T400001] init: kmemleak: [name:kmemleak&]  count = 0
[    7.708718][T400001] init: kmemleak: [name:kmemleak&]  flags = 0x1
[    7.709574][T400001] init: kmemleak: [name:kmemleak&]  checksum = 0
[    7.710440][T400001] init: kmemleak: [name:kmemleak&]  backtrace:
[    7.711284][T400001] init:      module_alloc+0x9c/0x120
[    7.712015][T400001] init:      move_module+0x34/0x19c
[    7.712735][T400001] init:      layout_and_allocate+0x1c4/0x288
[    7.713561][T400001] init:      load_module+0x2c8/0xf00
[    7.714291][T400001] init:      __se_sys_finit_module+0x190/0x1d0
[    7.715142][T400001] init:      __arm64_sys_finit_module+0x20/0x30
[    7.716004][T400001] init:      invoke_syscall+0x60/0x170
[    7.716758][T400001] init:      el0_svc_common+0xc8/0x114
[    7.717512][T400001] init:      do_el0_svc+0x28/0xa0
[    7.718207][T400001] init:      el0_svc+0x60/0xf8
[    7.718869][T400001] init:      el0t_64_sync_handler+0x88/0xec
[    7.719683][T400001] init:      el0t_64_sync+0x1b4/0x1b8

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/kmemleak.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 7580baa76af1..acd7cbb82e16 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -796,6 +796,8 @@ static void add_scan_area(unsigned long ptr, size_t size, gfp_t gfp)
 	unsigned long flags;
 	struct kmemleak_object *object;
 	struct kmemleak_scan_area *area = NULL;
+	unsigned long untagged_ptr;
+	unsigned long untagged_objp;
 
 	object = find_and_get_object(ptr, 1);
 	if (!object) {
@@ -804,6 +806,9 @@ static void add_scan_area(unsigned long ptr, size_t size, gfp_t gfp)
 		return;
 	}
 
+	untagged_ptr = (unsigned long)kasan_reset_tag((void *)ptr);
+	untagged_objp = (unsigned long)kasan_reset_tag((void *)object->pointer);
+
 	if (scan_area_cache)
 		area = kmem_cache_alloc(scan_area_cache, gfp_kmemleak_mask(gfp));
 
@@ -815,8 +820,8 @@ static void add_scan_area(unsigned long ptr, size_t size, gfp_t gfp)
 		goto out_unlock;
 	}
 	if (size == SIZE_MAX) {
-		size = object->pointer + object->size - ptr;
-	} else if (ptr + size > object->pointer + object->size) {
+		size = untagged_objp + object->size - untagged_ptr;
+	} else if (untagged_ptr + size > untagged_objp + object->size) {
 		kmemleak_warn("Scan area larger than object 0x%08lx\n", ptr);
 		dump_object_info(object);
 		kmem_cache_free(scan_area_cache, area);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
