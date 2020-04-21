Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CC6C38A30
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271252082E
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbMFLkKR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T/QdX7Sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271252082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7UJfMAUwbW7UpRTHkTXYW8a+S/Mmw/sc26jBJrSSAz0=; b=gbMFLkKRglg500
	tSOPhOyxSxQYWG/UnnsCZrLoRCpgSTBrN5go+FPkybZYgQpfaSftFBgKENpuE94cokOBqz9xMOZK5
	V9d6nPvdOV0NBvUkkBesdSzs1mV2UrsrAJl71BHllnGAihzZMpyqaNyEAXQPgi8D7TTWwWwGoIkVA
	g1COILehPg1usN3k9ftyPloOwWG/nNqFWIlYq0/C0lMtHfK4um66iq8RviyBA29R/oy7oQOMJmezo
	rPXvcon5n+hyLS5lcNbWjyFFOWgmoGyZPc3a+nemmaeD9kNdL/fNCeoHplgCTgnVBI1gyDpBllYQ+
	PU7RRRTFSP/F6Y7+XTGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQhtq-0001fb-NA; Tue, 21 Apr 2020 01:40:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQhtb-0001Uk-Mr; Tue, 21 Apr 2020 01:40:21 +0000
X-UUID: eeb90b60b2f2453b879a55f9fda97233-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kvJkIFmK0+Fajj8XRCQra0WIBlEJ5d/F7a174u9kVSw=; 
 b=T/QdX7SaZnL/IeMrSAiHEPljMiaexR1Y51eI1C0+9kc2JUy5GanICHFpPALA+J/V4E+ee9mivtIjbBpw2o47FdECd7gOOqsVSOBdcCexjyxF+QfgrXRgl7UfyRg14wVkxOc/3jVa0WVOT9/7I6wS9LrRKByQSSx8vvKDuzDBKuI=;
X-UUID: eeb90b60b2f2453b879a55f9fda97233-20200420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 568565482; Mon, 20 Apr 2020 17:40:16 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 18:40:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 09:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 09:40:08 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrey Konovalov <andreyknvl@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>
Subject: [PATCH] kasan: fix KASAN unit tests for tag-based KASAN
Date: Tue, 21 Apr 2020 09:40:07 +0800
Message-ID: <20200421014007.6012-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2CEDE98B7C8540AA4DB9C008FB938823D9E9F478584B868D577067E8D6D705122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_184019_749868_EA84CA31 
X-CRM114-Status: GOOD (  10.01  )
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

When we use tag-based KASAN, then KASAN unit tests don't detect
out-of-bounds memory access. Because with tag-based KASAN the state
of each 16 aligned bytes of memory is encoded in one shadow byte
and the shadow value is tag of pointer, so we need to read next
shadow byte, the shadow value is not equal to tag of pointer,
then tag-based KASAN will detect out-of-bounds memory access.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/test_kasan.c | 62 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index e3087d90e00d..a164f6b47fe5 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -40,7 +40,12 @@ static noinline void __init kmalloc_oob_right(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	ptr[size] = 'x';
+#else
+	ptr[size + 5] = 'x';
+#endif
+
 	kfree(ptr);
 }
 
@@ -92,7 +97,12 @@ static noinline void __init kmalloc_pagealloc_oob_right(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	ptr[size] = 0;
+#else
+	ptr[size + 6] = 0;
+#endif
+
 	kfree(ptr);
 }
 
@@ -162,7 +172,11 @@ static noinline void __init kmalloc_oob_krealloc_more(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	ptr2[size2] = 'x';
+#else
+	ptr2[size2 + 13] = 'x';
+#endif
 	kfree(ptr2);
 }
 
@@ -180,7 +194,12 @@ static noinline void __init kmalloc_oob_krealloc_less(void)
 		kfree(ptr1);
 		return;
 	}
+
+#ifdef CONFIG_KASAN_GENERIC
 	ptr2[size2] = 'x';
+#else
+	ptr2[size2 + 2] = 'x';
+#endif
 	kfree(ptr2);
 }
 
@@ -216,7 +235,11 @@ static noinline void __init kmalloc_oob_memset_2(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	memset(ptr+7, 0, 2);
+#else
+	memset(ptr+15, 0, 2);
+#endif
 	kfree(ptr);
 }
 
@@ -232,7 +255,11 @@ static noinline void __init kmalloc_oob_memset_4(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	memset(ptr+5, 0, 4);
+#else
+	memset(ptr+15, 0, 4);
+#endif
 	kfree(ptr);
 }
 
@@ -249,7 +276,11 @@ static noinline void __init kmalloc_oob_memset_8(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	memset(ptr+1, 0, 8);
+#else
+	memset(ptr+15, 0, 8);
+#endif
 	kfree(ptr);
 }
 
@@ -265,7 +296,11 @@ static noinline void __init kmalloc_oob_memset_16(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	memset(ptr+1, 0, 16);
+#else
+	memset(ptr+15, 0, 16);
+#endif
 	kfree(ptr);
 }
 
@@ -281,7 +316,11 @@ static noinline void __init kmalloc_oob_in_memset(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	memset(ptr, 0, size+5);
+#else
+	memset(ptr, 0, size+7);
+#endif
 	kfree(ptr);
 }
 
@@ -415,7 +454,11 @@ static noinline void __init kmem_cache_oob(void)
 		return;
 	}
 
+#ifdef CONFIG_KASAN_GENERIC
 	*p = p[size];
+#else
+	*p = p[size + 8];
+#endif
 	kmem_cache_free(cache, p);
 	kmem_cache_destroy(cache);
 }
@@ -497,6 +540,11 @@ static noinline void __init copy_user_test(void)
 	char __user *usermem;
 	size_t size = 10;
 	int unused;
+#ifdef CONFIG_KASAN_GENERIC
+	size_t oob_size = 1;
+#else
+	size_t oob_size = 7;
+#endif
 
 	kmem = kmalloc(size, GFP_KERNEL);
 	if (!kmem)
@@ -512,25 +560,25 @@ static noinline void __init copy_user_test(void)
 	}
 
 	pr_info("out-of-bounds in copy_from_user()\n");
-	unused = copy_from_user(kmem, usermem, size + 1);
+	unused = copy_from_user(kmem, usermem, size + oob_size);
 
 	pr_info("out-of-bounds in copy_to_user()\n");
-	unused = copy_to_user(usermem, kmem, size + 1);
+	unused = copy_to_user(usermem, kmem, size + oob_size);
 
 	pr_info("out-of-bounds in __copy_from_user()\n");
-	unused = __copy_from_user(kmem, usermem, size + 1);
+	unused = __copy_from_user(kmem, usermem, size + oob_size);
 
 	pr_info("out-of-bounds in __copy_to_user()\n");
-	unused = __copy_to_user(usermem, kmem, size + 1);
+	unused = __copy_to_user(usermem, kmem, size + oob_size);
 
 	pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
-	unused = __copy_from_user_inatomic(kmem, usermem, size + 1);
+	unused = __copy_from_user_inatomic(kmem, usermem, size + oob_size);
 
 	pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
-	unused = __copy_to_user_inatomic(usermem, kmem, size + 1);
+	unused = __copy_to_user_inatomic(usermem, kmem, size + oob_size);
 
 	pr_info("out-of-bounds in strncpy_from_user()\n");
-	unused = strncpy_from_user(kmem, usermem, size + 1);
+	unused = strncpy_from_user(kmem, usermem, size + oob_size);
 
 	vm_munmap((unsigned long)usermem, PAGE_SIZE);
 	kfree(kmem);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
