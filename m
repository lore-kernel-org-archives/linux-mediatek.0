Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17567C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 13:35:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98822084C
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 13:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfnuOMzT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Vy8v80xO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D98822084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSUyQ5rs6dwcdM9XKLiFxp0A6GBYJOKsGicpzCWpJQk=; b=FfnuOMzTqobp5OZFfRqac/GFfQ
	k5y522BfBK/tjikoWJf37kcQCktWr+L++oU+V2DW1+aijM5ADrwonuHO23ZL2GBC2jXNCZhBKri20
	+Bi4JvrzGo7115V788uyAoxmn3QTEoNDKas941RFjISpI+73KgqlG88GJouwVsC3RnkgZYhPfHE1T
	nYnhVNgQTQZyukiNldapEHlrbbcyioyyW3mjLhJkBaodyD4WcyUsaR9GEImTdp+hObyeYOzLB1cN+
	sRVkkAzlH6+yur2Ar9cr1HxK0eRFKSHorwm+Ao0wj636xp6YTfKdwllWibyJj+ETtXxReFDKEGoU2
	p924U0wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtAEh-0000fL-9f; Wed, 08 Jul 2020 13:35:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtAEa-0000dK-TN; Wed, 08 Jul 2020 13:35:38 +0000
X-UUID: 7c23a0f9312e4af98441b2923b3abefd-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8MKbH1IX9Wezlb1mLgBVH7giMxWeaQpi+Vzc+0gSWkA=; 
 b=Vy8v80xOZTFHBhasKp+PoTg5TPwq0U8m8utT/Nzx2Hrjz14rYJiN0g4V60MwqhO8zhtmTDEaOizKxrDeo/2h7nURk4ye0+uRpUb3Nv1IpoSALkc6F7bOYh9MMU3PM9p1MZtqAgSIzfPJozGCZ6qWcM7I4x7jUDclNOPbqkcXJ2Y=;
X-UUID: 7c23a0f9312e4af98441b2923b3abefd-20200708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 124518782; Wed, 08 Jul 2020 05:35:54 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 06:25:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 21:25:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 21:25:22 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrey Konovalov <andreyknvl@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>
Subject: [PATCH v4] kasan: fix KASAN unit tests for tag-based KASAN
Date: Wed, 8 Jul 2020 21:25:24 +0800
Message-ID: <20200708132524.11688-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4FE038726111CFDF32B6454EE1B6840009C597B427D47AC810D59EFB2B7294702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_093537_142534_FBAC8D01 
X-CRM114-Status: GOOD (  13.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We use tag-based KASAN, then KASAN unit tests don't detect out-of-bounds
memory access. They need to be fixed.

With tag-based KASAN, the state of each 16 aligned bytes of memory is
encoded in one shadow byte and the shadow value is tag of pointer, so
we need to read next shadow byte, the shadow value is not equal to tag
value of pointer, so that tag-based KASAN will detect out-of-bounds
memory access.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---

changes since v1:
- Reduce amount of non-compiled code.
- KUnit-KASAN Integration patchset is not merged yet. My patch should
  have conflict with it, if needed, we can continue to wait it.

changes since v2:
- Add one marco to make unit tests more readability.

changes since v3:
- use KASAN_SHADOW_SCALE_SIZE instead of 13.

---
 lib/test_kasan.c | 49 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 61a3cc11556f..003ea5b49f4c 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -23,6 +23,10 @@
 
 #include <asm/page.h>
 
+#include "../mm/kasan/kasan.h"
+
+#define OOB_TAG_OFF (IS_ENABLED(CONFIG_KASAN_GENERIC) ? 0 : KASAN_SHADOW_SCALE_SIZE)
+
 /*
  * Note: test functions are marked noinline so that their names appear in
  * reports.
@@ -40,7 +44,8 @@ static noinline void __init kmalloc_oob_right(void)
 		return;
 	}
 
-	ptr[size] = 'x';
+	ptr[size + OOB_TAG_OFF] = 'x';
+
 	kfree(ptr);
 }
 
@@ -92,7 +97,8 @@ static noinline void __init kmalloc_pagealloc_oob_right(void)
 		return;
 	}
 
-	ptr[size] = 0;
+	ptr[size + OOB_TAG_OFF] = 0;
+
 	kfree(ptr);
 }
 
@@ -162,7 +168,8 @@ static noinline void __init kmalloc_oob_krealloc_more(void)
 		return;
 	}
 
-	ptr2[size2] = 'x';
+	ptr2[size2 + OOB_TAG_OFF] = 'x';
+
 	kfree(ptr2);
 }
 
@@ -180,7 +187,9 @@ static noinline void __init kmalloc_oob_krealloc_less(void)
 		kfree(ptr1);
 		return;
 	}
-	ptr2[size2] = 'x';
+
+	ptr2[size2 + OOB_TAG_OFF] = 'x';
+
 	kfree(ptr2);
 }
 
@@ -216,7 +225,8 @@ static noinline void __init kmalloc_oob_memset_2(void)
 		return;
 	}
 
-	memset(ptr+7, 0, 2);
+	memset(ptr + 7 + OOB_TAG_OFF, 0, 2);
+
 	kfree(ptr);
 }
 
@@ -232,7 +242,8 @@ static noinline void __init kmalloc_oob_memset_4(void)
 		return;
 	}
 
-	memset(ptr+5, 0, 4);
+	memset(ptr + 5 + OOB_TAG_OFF, 0, 4);
+
 	kfree(ptr);
 }
 
@@ -249,7 +260,8 @@ static noinline void __init kmalloc_oob_memset_8(void)
 		return;
 	}
 
-	memset(ptr+1, 0, 8);
+	memset(ptr + 1 + OOB_TAG_OFF, 0, 8);
+
 	kfree(ptr);
 }
 
@@ -265,7 +277,8 @@ static noinline void __init kmalloc_oob_memset_16(void)
 		return;
 	}
 
-	memset(ptr+1, 0, 16);
+	memset(ptr + 1 + OOB_TAG_OFF, 0, 16);
+
 	kfree(ptr);
 }
 
@@ -281,7 +294,8 @@ static noinline void __init kmalloc_oob_in_memset(void)
 		return;
 	}
 
-	memset(ptr, 0, size+5);
+	memset(ptr, 0, size + 5 + OOB_TAG_OFF);
+
 	kfree(ptr);
 }
 
@@ -415,7 +429,8 @@ static noinline void __init kmem_cache_oob(void)
 		return;
 	}
 
-	*p = p[size];
+	*p = p[size + OOB_TAG_OFF];
+
 	kmem_cache_free(cache, p);
 	kmem_cache_destroy(cache);
 }
@@ -512,25 +527,25 @@ static noinline void __init copy_user_test(void)
 	}
 
 	pr_info("out-of-bounds in copy_from_user()\n");
-	unused = copy_from_user(kmem, usermem, size + 1);
+	unused = copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in copy_to_user()\n");
-	unused = copy_to_user(usermem, kmem, size + 1);
+	unused = copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in __copy_from_user()\n");
-	unused = __copy_from_user(kmem, usermem, size + 1);
+	unused = __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in __copy_to_user()\n");
-	unused = __copy_to_user(usermem, kmem, size + 1);
+	unused = __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
-	unused = __copy_from_user_inatomic(kmem, usermem, size + 1);
+	unused = __copy_from_user_inatomic(kmem, usermem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
-	unused = __copy_to_user_inatomic(usermem, kmem, size + 1);
+	unused = __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB_TAG_OFF);
 
 	pr_info("out-of-bounds in strncpy_from_user()\n");
-	unused = strncpy_from_user(kmem, usermem, size + 1);
+	unused = strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
 
 	vm_munmap((unsigned long)usermem, PAGE_SIZE);
 	kfree(kmem);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
