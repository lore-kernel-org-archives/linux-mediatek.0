Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8AFC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 19:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314D261465
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 19:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314D261465
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJ232reFBLKAAIepiQGzc7HMWJxgwZgONJ+3YwhZeFM=; b=KWOibgsGUXPWo0
	gg4BtJKT8yZYE81qwpLnRl2ghHo2wr+7uAkTJzLqg+BYq6gVRFBj3x2Ls44mQ6PLVBhRiC//Tst45
	9slCKopeWR6AiWyehDY8OycMg5VwxLFLnKYy27DtlsJVi8mksXqGjOrwdiYPRaY5wQxoIuvvrnm2J
	W5AU31n4q9j5APrH92aA2wAa4R4vrDUZObTHMkhmETwvQ7fISua9nLd627/pijmxhVb7iCRzEukf8
	VxDoyJyzzIqDT39NMvUIncImhPJdHgBA/mDj8sAHk7wG/9ueVwwZY8jnNpt39ra+ydHRN+qMBhsZl
	hmMf1H4LwjWyvQbDoTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyfek-00F5u3-Dq; Wed, 30 Jun 2021 19:13:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyfeW-00F5sS-Rn
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 19:13:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id j2so4926742wrs.12
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LwMx6mpf58K+dt89atcRzUa+xJG7iS/9NXSnO3QAijk=;
 b=r7y6xbzz3Ru117IKa1A1HqYQLPsQ9JWTt80K0/sfpiwfqVG1bSJD0SFSYl/jMHoCJ2
 ob3TpfUWHwHuwt70WI4j1pKseqgibuQ5m4T4+kBD+5X/Bv38bChnS+jbYWPjkjI6EjUo
 G/39As31rcJBFn/TdNWaDFYEVqq/MFEqS9de5nZt01bJR5tya6r0t+hff3JJ1iQaFL6q
 dB7TWBXgRhxSKJ7KbJGzlDhCLUgE6zw1ZuoAEHVgShC17Fx8OFPzpryUET3AzY1C1mhQ
 /Xv8NisXpCuGG5Ni7I7u/OU/OthuU1kcuTvSAoWLDujFEbHTJ+JOsHYi3+V0+37L6dy3
 6FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LwMx6mpf58K+dt89atcRzUa+xJG7iS/9NXSnO3QAijk=;
 b=gOOZAHVCvadx2Vg2+CewrwON+GaqmxznmTQssFK+NzRhAg8k2HiwjCr1hu/NtLaBiG
 0Ws759K5eLlnimnHAAvPr+y0Bnf3gn8NZC+LBNs6WbJQ0IOrm8k5eg0m0Zr4t9sDVO+6
 QCtPn0LX35IPmRCQiaD7IHd1XZr7GHm0gJp8u2XAZ6gu2ZRBHZTbBltcaKwEC/QyinvJ
 RZ3/IxiX2qGq9xBCtCCdon4LARiIGaJGUb/C+91TA7CQm4OauFPYdCqpDBIubyl4BN9v
 PkYJm93ZOCJyBocMqCIE9QUmo+6KglB78Ovkk5M3v7Plr8y4tHYdUwHqcuKTB80AKj/F
 4Log==
X-Gm-Message-State: AOAM533qs8SQpWxGk9RXdhkc62fybPtZuwUWwLjS9iN68Tbz4pk9P4cP
 XHoFVNTzmElHEzyAagUCpFbqng==
X-Google-Smtp-Source: ABdhPJwGJqNIQjt34+ofqYDqSFhTn0KnMtEPFfjP2mQPalcDH63xTtPzA6qVHWDm/uGp300DxtbuOA==
X-Received: by 2002:adf:c18a:: with SMTP id x10mr41309800wre.193.1625080415431; 
 Wed, 30 Jun 2021 12:13:35 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:8b0e:c57f:ff29:7e4])
 by smtp.gmail.com with ESMTPSA id o20sm6991115wms.3.2021.06.30.12.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 12:13:34 -0700 (PDT)
Date: Wed, 30 Jun 2021 21:13:27 +0200
From: Marco Elver <elver@google.com>
To: yee.lee@mediatek.com
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
Message-ID: <YNzCVxmMtZ1Kc6XA@elver.google.com>
References: <20210630134943.20781-1-yee.lee@mediatek.com>
 <20210630134943.20781-2-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630134943.20781-2-yee.lee@mediatek.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_121340_958740_8BB1DAB3 
X-CRM114-Status: GOOD (  36.60  )
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

On Wed, Jun 30, 2021 at 09:49PM +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone of object with unaligned size.
> 
> An additional memzero_explicit() path is added to replacing init by
> hwtag instruction for those unaligned size at SLUB debug mode.
> 
> The penalty is acceptable since they are only enabled in debug mode,
> not production builds. A block of comment is added for explanation.
> 
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>

In future, please add changes to each version after an additional '---'.
Example:

---
v2:
* Use IS_ENABLED(CONFIG_SLUB_DEBUG) in if-statement.

> ---
>  mm/kasan/kasan.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..6f698f13dbe6 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,6 +387,16 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>  
>  	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>  		return;
> +	/*
> +	 * Explicitly initialize the memory with the precise object size
> +	 * to avoid overwriting the SLAB redzone. This disables initialization
> +	 * in the arch code and may thus lead to performance penalty.
> +	 * The penalty is accepted since SLAB redzones aren't enabled in production builds.
> +	 */

Can we please format the comment properly:

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 6f698f13dbe6..1972ec5736cb 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -388,10 +388,10 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
 		return;
 	/*
-	 * Explicitly initialize the memory with the precise object size
-	 * to avoid overwriting the SLAB redzone. This disables initialization
-	 * in the arch code and may thus lead to performance penalty.
-	 * The penalty is accepted since SLAB redzones aren't enabled in production builds.
+	 * Explicitly initialize the memory with the precise object size to
+	 * avoid overwriting the SLAB redzone. This disables initialization in
+	 * the arch code and may thus lead to performance penalty. The penalty
+	 * is accepted since SLAB redzones aren't enabled in production builds.
 	 */
 	if (IS_ENABLED(CONFIG_SLUB_DEBUG) && init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
 		init = false;

> +	if (IS_ENABLED(CONFIG_SLUB_DEBUG) && init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +		init = false;
> +		memzero_explicit((void *)addr, size);
> +	}
>  	size = round_up(size, KASAN_GRANULE_SIZE);
>  
>  	hw_set_mem_tag_range((void *)addr, size, tag, init);

I think this solution might be fine for now, as I don't see an easy way
to do this without some major refactor to use kmem_cache_debug_flags().

However, I think there's an intermediate solution where we only check
the static-key 'slub_debug_enabled' though. Because I've checked, and
various major distros _do_ enabled CONFIG_SLUB_DEBUG. But the static
branch just makes sure there's no performance overhead.

Checking the static branch requires including mm/slab.h into
mm/kasan/kasan.h, which we currently don't do and perhaps wanted to
avoid. Although I don't see a reason there, because there's no circular
dependency even if we did.

Andrey, any opinion?

In case you guys think checking static key is the better solution, I
think the below would work together with the pre-requisite patch at the
end:

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 1972ec5736cb..9130d025612c 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -6,6 +6,8 @@
 #include <linux/kfence.h>
 #include <linux/stackdepot.h>
 
+#include "../slab.h"
+
 #ifdef CONFIG_KASAN_HW_TAGS
 
 #include <linux/static_key.h>
@@ -393,7 +395,8 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 	 * the arch code and may thus lead to performance penalty. The penalty
 	 * is accepted since SLAB redzones aren't enabled in production builds.
 	 */
-	if (IS_ENABLED(CONFIG_SLUB_DEBUG) && init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
+	if (slub_debug_enabled_unlikely() &&
+	    init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
 		init = false;
 		memzero_explicit((void *)addr, size);
 	}



[ Note: You can pick the below patch up by extracting it from the email
  and running 'git am -s <file>'. You could then use it as part of a patch
  series together with your original patch. ]

From: Marco Elver <elver@google.com>
Date: Wed, 30 Jun 2021 20:56:57 +0200
Subject: [PATCH] mm: introduce helper to check slub_debug_enabled

Introduce a helper to check slub_debug_enabled, so that we can confine
the use of #ifdef to the definition of the slub_debug_enabled_unlikely()
helper.

Signed-off-by: Marco Elver <elver@google.com>
---
 mm/slab.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 18c1927cd196..9439da434712 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -215,10 +215,18 @@ DECLARE_STATIC_KEY_TRUE(slub_debug_enabled);
 DECLARE_STATIC_KEY_FALSE(slub_debug_enabled);
 #endif
 extern void print_tracking(struct kmem_cache *s, void *object);
+static inline bool slub_debug_enabled_unlikely(void)
+{
+	return static_branch_unlikely(&slub_debug_enabled);
+}
 #else
 static inline void print_tracking(struct kmem_cache *s, void *object)
 {
 }
+static inline bool slub_debug_enabled_unlikely(void)
+{
+	return false;
+}
 #endif
 
 /*
@@ -228,11 +236,10 @@ static inline void print_tracking(struct kmem_cache *s, void *object)
  */
 static inline bool kmem_cache_debug_flags(struct kmem_cache *s, slab_flags_t flags)
 {
-#ifdef CONFIG_SLUB_DEBUG
-	VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
-	if (static_branch_unlikely(&slub_debug_enabled))
+	if (IS_ENABLED(CONFIG_SLUB_DEBUG))
+		VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
+	if (slub_debug_enabled_unlikely())
 		return s->flags & flags;
-#endif
 	return false;
 }
 
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
