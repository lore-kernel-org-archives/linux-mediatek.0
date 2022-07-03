Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jul 2022 23:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eyxsET1uUtYDmBiIGGjIUzqUUGx8+bu39Q63tWlZoY=; b=EoNiAwPFDK1rOQfR6DLYKpgKWr
	p9Fx/hyY+pn8UKCnzWdm0ABRBzuEMIQ6o0SdnY/vSmN8Kn3Kqd/Udxaw2g6YxJjB7VrjzAyPwc0C5
	ZSvTxkOY6FDgEBPHYgQBzHnVt2Kt00EYr1zRfC/Tkq9oJrUvLLakzSbkBKIxFpSZVfMPWXvFMNVE+
	/TzlVmF9pmjNldXd6VncaObjKXwqbw57YWywdY6y1nlQ62kWPWMvDrr7ad2YPu33o0/HynC2Px1wP
	u8OfQMNnpQ4CZyiPbd4SQSunxmHPFefMJ0OB6XqUW55CISp+w2FOE9YWKBh7c1Tac8BgB4TkhY3bN
	5U0X6giw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o88ow-001V2m-W7; Sun, 03 Jul 2022 23:16:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o88ok-001Uuz-9w; Sun, 03 Jul 2022 23:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D66A16122A;
	Sun,  3 Jul 2022 23:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E80C341C6;
	Sun,  3 Jul 2022 23:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1656890153;
	bh=6ZlA7AQwed1b+Qbqhl49hZpBrdZGq0u3Y8Xc/8IfGvM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I9H7MVvwCGyF5EotDM1U20idIoHdP25AYE3YpwidP8cFIoPSvTlU1Z79MBXQDiAN+
	 U2ENsuk5lCHzaIsstSbPuR2Mm7MYzwGy+4XA3COkrhr3Iyyk8mJ1xrVBGeqJSEYxHZ
	 c7Q8J/EwSTU2lHZPw6EGto+1c+WFT4P0LOJXoH9Y=
Date: Sun, 3 Jul 2022 16:15:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <chinwen.chang@mediatek.com>,
 <yee.lee@mediatek.com>, <casper.li@mediatek.com>,
 <andrew.yang@mediatek.com>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] kasan: separate double free case from invalid free
Message-Id: <20220703161552.6a3304c8d316e4fdcce42caa@linux-foundation.org>
In-Reply-To: <20220615062219.22618-1-Kuan-Ying.Lee@mediatek.com>
References: <20220615062219.22618-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_161554_474574_DA80B948 
X-CRM114-Status: GOOD (  19.97  )
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

On Wed, 15 Jun 2022 14:22:18 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:

> Currently, KASAN describes all invalid-free/double-free bugs as
> "double-free or invalid-free". This is ambiguous.
> 
> KASAN should report "double-free" when a double-free is a more
> likely cause (the address points to the start of an object) and
> report "invalid-free" otherwise [1].
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=212193
> 
> ...

Could we please have some review of this?

Thanks.

> 
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index c40c0e7b3b5f..707c3a527fcb 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -343,7 +343,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>  
>  	if (unlikely(nearest_obj(cache, virt_to_slab(object), object) !=
>  	    object)) {
> -		kasan_report_invalid_free(tagged_object, ip);
> +		kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_INVALID_FREE);
>  		return true;
>  	}
>  
> @@ -352,7 +352,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>  		return false;
>  
>  	if (!kasan_byte_accessible(tagged_object)) {
> -		kasan_report_invalid_free(tagged_object, ip);
> +		kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_DOUBLE_FREE);
>  		return true;
>  	}
>  
> @@ -377,12 +377,12 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object,
>  static inline bool ____kasan_kfree_large(void *ptr, unsigned long ip)
>  {
>  	if (ptr != page_address(virt_to_head_page(ptr))) {
> -		kasan_report_invalid_free(ptr, ip);
> +		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
>  		return true;
>  	}
>  
>  	if (!kasan_byte_accessible(ptr)) {
> -		kasan_report_invalid_free(ptr, ip);
> +		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_DOUBLE_FREE);
>  		return true;
>  	}
>  
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 610d60d6e5b8..01c03e45acd4 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -125,6 +125,7 @@ static inline bool kasan_sync_fault_possible(void)
>  enum kasan_report_type {
>  	KASAN_REPORT_ACCESS,
>  	KASAN_REPORT_INVALID_FREE,
> +	KASAN_REPORT_DOUBLE_FREE,
>  };
>  
>  struct kasan_report_info {
> @@ -277,7 +278,7 @@ static inline void kasan_print_address_stack_frame(const void *addr) { }
>  
>  bool kasan_report(unsigned long addr, size_t size,
>  		bool is_write, unsigned long ip);
> -void kasan_report_invalid_free(void *object, unsigned long ip);
> +void kasan_report_invalid_free(void *object, unsigned long ip, enum kasan_report_type type);
>  
>  struct page *kasan_addr_to_page(const void *addr);
>  struct slab *kasan_addr_to_slab(const void *addr);
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index b341a191651d..fe3f606b3a98 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -176,8 +176,12 @@ static void end_report(unsigned long *flags, void *addr)
>  static void print_error_description(struct kasan_report_info *info)
>  {
>  	if (info->type == KASAN_REPORT_INVALID_FREE) {
> -		pr_err("BUG: KASAN: double-free or invalid-free in %pS\n",
> -		       (void *)info->ip);
> +		pr_err("BUG: KASAN: invalid-free in %pS\n", (void *)info->ip);
> +		return;
> +	}
> +
> +	if (info->type == KASAN_REPORT_DOUBLE_FREE) {
> +		pr_err("BUG: KASAN: double-free in %pS\n", (void *)info->ip);
>  		return;
>  	}
>  
> @@ -433,7 +437,7 @@ static void print_report(struct kasan_report_info *info)
>  	}
>  }
>  
> -void kasan_report_invalid_free(void *ptr, unsigned long ip)
> +void kasan_report_invalid_free(void *ptr, unsigned long ip, enum kasan_report_type type)
>  {
>  	unsigned long flags;
>  	struct kasan_report_info info;
> @@ -448,7 +452,7 @@ void kasan_report_invalid_free(void *ptr, unsigned long ip)
>  
>  	start_report(&flags, true);
>  
> -	info.type = KASAN_REPORT_INVALID_FREE;
> +	info.type = type;
>  	info.access_addr = ptr;
>  	info.first_bad_addr = kasan_reset_tag(ptr);
>  	info.access_size = 0;
> -- 
> 2.18.0
> 

