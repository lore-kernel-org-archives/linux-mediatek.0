Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA69C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpLsmKlpKCiUIDe9SFr1Z71rXe3WR1MDQEjPMDRMDOU=; b=qsBTxzkkSHbqA6VqWR+zB5ILqd
	ei2H+wtgXhuHTfaSswsSWH3Sg0rAuTKxqUz8O3+iiSSKMy+RySwxW5QVewbac6DpCSxtL562giw3y
	7o00sd2Nda+h0uXOMM6AiR7vJZghvrWqPFVSbnwu6V463lEwjOQyBCS8wXLodHGmL0PS+DBW7l/Bb
	HF6RJTKo3Pfl8lwHCaVFsxHLequR8sJOsC0/qyxdu0gYxbp4IbeX6F0rJ/Jvs4Tgyi7RX6KvDYZaS
	ZS8zwGj/7OBaaj3s0u7UGUYqmpWJxWfThm8TNtkbLnZzuWGWnT+rIAkXJGUh5sTq52e7YAd5V9Mm1
	bb8ypFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Gmu-005p2D-Ok; Mon, 04 Jul 2022 07:46:32 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Gmk-005owm-Aj
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 07:46:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id i18so14331522lfu.8
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 00:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EpLsmKlpKCiUIDe9SFr1Z71rXe3WR1MDQEjPMDRMDOU=;
        b=c9TZYYVaWzhGJ6mrcpbLMY00AjoFY9dgMyjx9bilb0BXIcId4yURXxfKA6oYWGtz01
         PmSJnerb5jj8N+cjnRHPAfsGOfnvxBLsgTFG4mwnDA08+SCbtBP5UTHhUmDhmDewMW2Q
         RwSxPmhBuD8ddkrqYE3qsB6tbUwY0tApCJPYVt0YAFbEq/X1bSmmtnNN0PoHFXuunqbP
         VQ/ViDAAdiHFJAEPv+XrjEuyEVptRid+WTjiJPbvs37NRDavJsP3dNJPuz4nn1fs4Xbe
         qVMm4ryWBxq8puAt3JzaqirpqsKT3M/Zu/d6u0FPyfLvPbNNNN0Hhx4hj01mlz118RCv
         Qofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EpLsmKlpKCiUIDe9SFr1Z71rXe3WR1MDQEjPMDRMDOU=;
        b=FkLEv2gepQ89dhtKCqtE9fZsXQfLX68i+I8q935fyUUVe+mSBDdwf73X/UsN3+HzwB
         6JeNZ8Sbt0MLmp1VuHNbL5eCP86G4CP40axgKQqxwA66GEVt6zV6jGL2uRWVxq9fYYln
         Z6U/MeYCFNz9si4Mv6biL7XnrlbiVe6/VHDPbNniwpjBn7MTaZ5QeGdXzePNe0qGLGwc
         KAKPH8bJFi2rsR1xE9pu6+42LCpv2w8Vz05cV6zeWcAuNKIFG2uGf4nDNqPQ6phKQZiM
         9+f5UlcKq+FcHlwueDNcMnpHS7LH2c1i3yJN9aStNT26DHlFL9dloTF7pj2Iur1w79mK
         Er6A==
X-Gm-Message-State: AJIora8Hkc040rY3yXTB9etgxjwf74IuGYX7qLLRxqBqBwMymueI/tAN
	kSMEyIzW7DP2QtdptVO0thAh/jvzfg7/VA67GzlHcQ==
X-Google-Smtp-Source: AGRyM1sjAUAcmtkyEiJeoit5ySGBOChyexenC3PN4u7CokwqIER+Wu9ppdrapofaMzf3YdE/UQWvXY+yHr2Ir3aRi4Q=
X-Received: by 2002:a19:f006:0:b0:47f:ae73:abe5 with SMTP id
 p6-20020a19f006000000b0047fae73abe5mr17682143lfc.206.1656920775975; Mon, 04
 Jul 2022 00:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220615062219.22618-1-Kuan-Ying.Lee@mediatek.com> <20220703161552.6a3304c8d316e4fdcce42caa@linux-foundation.org>
In-Reply-To: <20220703161552.6a3304c8d316e4fdcce42caa@linux-foundation.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 4 Jul 2022 09:46:04 +0200
Message-ID: <CACT4Y+Y3we9jdc1gJ_rhJZg7YWXm7F6F245ZQQFMknrxXRuo7Q@mail.gmail.com>
Subject: Re: [PATCH] kasan: separate double free case from invalid free
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	chinwen.chang@mediatek.com, yee.lee@mediatek.com, casper.li@mediatek.com, 
	andrew.yang@mediatek.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_004622_399316_B408DE4A 
X-CRM114-Status: GOOD (  23.10  )
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

On Mon, 4 Jul 2022 at 01:15, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 15 Jun 2022 14:22:18 +0800 Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> > Currently, KASAN describes all invalid-free/double-free bugs as
> > "double-free or invalid-free". This is ambiguous.
> >
> > KASAN should report "double-free" when a double-free is a more
> > likely cause (the address points to the start of an object) and
> > report "invalid-free" otherwise [1].
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=212193
> >
> > ...
>
> Could we please have some review of this?


Looks reasonable to me.
Looking through git log it seems the only reason to combine them was
laziness/didn't seem important enough.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

I will update syzkaller parsing of bug messages to not produce
duplicates for existing double-frees.
Not sure if anything needs to be done for other kernel testing systems.


> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index c40c0e7b3b5f..707c3a527fcb 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -343,7 +343,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
> >
> >       if (unlikely(nearest_obj(cache, virt_to_slab(object), object) !=
> >           object)) {
> > -             kasan_report_invalid_free(tagged_object, ip);
> > +             kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_INVALID_FREE);
> >               return true;
> >       }
> >
> > @@ -352,7 +352,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
> >               return false;
> >
> >       if (!kasan_byte_accessible(tagged_object)) {
> > -             kasan_report_invalid_free(tagged_object, ip);
> > +             kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_DOUBLE_FREE);
> >               return true;
> >       }
> >
> > @@ -377,12 +377,12 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object,
> >  static inline bool ____kasan_kfree_large(void *ptr, unsigned long ip)
> >  {
> >       if (ptr != page_address(virt_to_head_page(ptr))) {
> > -             kasan_report_invalid_free(ptr, ip);
> > +             kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
> >               return true;
> >       }
> >
> >       if (!kasan_byte_accessible(ptr)) {
> > -             kasan_report_invalid_free(ptr, ip);
> > +             kasan_report_invalid_free(ptr, ip, KASAN_REPORT_DOUBLE_FREE);
> >               return true;
> >       }
> >
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index 610d60d6e5b8..01c03e45acd4 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -125,6 +125,7 @@ static inline bool kasan_sync_fault_possible(void)
> >  enum kasan_report_type {
> >       KASAN_REPORT_ACCESS,
> >       KASAN_REPORT_INVALID_FREE,
> > +     KASAN_REPORT_DOUBLE_FREE,
> >  };
> >
> >  struct kasan_report_info {
> > @@ -277,7 +278,7 @@ static inline void kasan_print_address_stack_frame(const void *addr) { }
> >
> >  bool kasan_report(unsigned long addr, size_t size,
> >               bool is_write, unsigned long ip);
> > -void kasan_report_invalid_free(void *object, unsigned long ip);
> > +void kasan_report_invalid_free(void *object, unsigned long ip, enum kasan_report_type type);
> >
> >  struct page *kasan_addr_to_page(const void *addr);
> >  struct slab *kasan_addr_to_slab(const void *addr);
> > diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> > index b341a191651d..fe3f606b3a98 100644
> > --- a/mm/kasan/report.c
> > +++ b/mm/kasan/report.c
> > @@ -176,8 +176,12 @@ static void end_report(unsigned long *flags, void *addr)
> >  static void print_error_description(struct kasan_report_info *info)
> >  {
> >       if (info->type == KASAN_REPORT_INVALID_FREE) {
> > -             pr_err("BUG: KASAN: double-free or invalid-free in %pS\n",
> > -                    (void *)info->ip);
> > +             pr_err("BUG: KASAN: invalid-free in %pS\n", (void *)info->ip);
> > +             return;
> > +     }
> > +
> > +     if (info->type == KASAN_REPORT_DOUBLE_FREE) {
> > +             pr_err("BUG: KASAN: double-free in %pS\n", (void *)info->ip);
> >               return;
> >       }
> >
> > @@ -433,7 +437,7 @@ static void print_report(struct kasan_report_info *info)
> >       }
> >  }
> >
> > -void kasan_report_invalid_free(void *ptr, unsigned long ip)
> > +void kasan_report_invalid_free(void *ptr, unsigned long ip, enum kasan_report_type type)
> >  {
> >       unsigned long flags;
> >       struct kasan_report_info info;
> > @@ -448,7 +452,7 @@ void kasan_report_invalid_free(void *ptr, unsigned long ip)
> >
> >       start_report(&flags, true);
> >
> > -     info.type = KASAN_REPORT_INVALID_FREE;
> > +     info.type = type;
> >       info.access_addr = ptr;
> >       info.first_bad_addr = kasan_reset_tag(ptr);
> >       info.access_size = 0;
> > --
> > 2.18.0
> >

