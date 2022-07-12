Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/kf7WpiJhpV7S8Lv6B6nSloUE3ZIK760tIURsCB2pw=; b=WrrjL3hlMHZGHQAAWFOV4aeXtZ
	k/9IPk2afrbGQcoYIPXh7bGIuvXnmjyALZb4xFa8MDl2T6TPCrCPJpl44q3yHJiYOeYL95AKVK/C2
	BYqilJEJBhaJs4Iu9+2Bj4lWVLDVmd/OWg8Z8ua4xtplH7Kh4pn2EJHevtMt1q4UDJR1b7DtBWKBy
	Yl/MLtYa02veZVLw0CWYzdBI3bTcupoh7F139lkbIlsOBg9xymnZ8AcQz5f4hPJ2kt945HgZNBjit
	6/DLPE/bb06ipEQIih5XtuHDdqLchJklLXA7Ws/9A6tzPcVPR/G7gLbLLSx/jeGUU4avPfa4ixpru
	t+dS5NoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMcy-00EcKm-Nb; Tue, 12 Jul 2022 20:37:04 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMcn-00EcFh-PB; Tue, 12 Jul 2022 20:36:55 +0000
Received: by mail-io1-xd36.google.com with SMTP id l24so9021009ion.13;
        Tue, 12 Jul 2022 13:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y/kf7WpiJhpV7S8Lv6B6nSloUE3ZIK760tIURsCB2pw=;
        b=HK+0DWTz7CWIFl+SYCiY0c1eT23V1rfCJ2QRHvfA8bSUNlP5B7cbxj+fSAo0QWdQZF
         L4916vyqIJ6hBECNHpwM9VpomRkI9oU7ux781zK8Ag6wUNbvi0zH1theP+ClUZe+WfHY
         bB29E+meNCNUo/BX9CrmNicvZbvo7Dsb1noCwXeeg8uBLkIOTzOd2JFGDmLPi5Fxrwdh
         pVPnnhlFhQXWdSntoI9CvaNMVywddCOqtSosLlEXuaU9ngzuYPqFAR4H3H3Z9UHakffi
         K5w8ACxyuEOxAhWUkNEfCxymzEHp020sUAC2tCxdWfJj6r37lwRMsOlfEC07Le2qsU6U
         hBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y/kf7WpiJhpV7S8Lv6B6nSloUE3ZIK760tIURsCB2pw=;
        b=Y3e0H5QBpEwEbQvE2c6lqfZgdwm/hQh2lTbbCHPWt2JTZerBNZL42Zntx8SVUXE48M
         U8NuF4L01RLhjdpvJhzqOkGqgI2Dz93LZey29UG/mIEELZULAuOk5L0mMWiRZuwTouOS
         OM2PyU5NsFCd5UFsb/iAE8W6OvJ0NbdULiDxTqGbiU57l6oH2HY7aA9JZswXEbKV5bAv
         X1e+191uB0/+HbQyE3XV7KUujn9QUfwuqwdPbAurLCc3MR29gt3Brs7h4Y6App9p5TnS
         tlLvASH4woVznn5VvOcWr8YNmVzG5wGhmzEIAslXuF1cI3lWcMks3iZYSts29uEhaFHu
         K8JA==
X-Gm-Message-State: AJIora9FEgfBCQjG3VH3x3iDIrvLSp32wPgf32SYInQn0ZQ5XRGqlZB/
	HL/iYEnvaTekpsQeKehZCDy2nZRM/3od3dR9Ijo=
X-Google-Smtp-Source: AGRyM1vcVt7E6J7CXFHWcDWieOMzcW12/B3aaLXom2LHjUZJ7rjCMBYmaxd73fcDTKZ0bf0NWkgwf+myIsxTC/h2scA=
X-Received: by 2002:a05:6638:3812:b0:33f:4a06:ad48 with SMTP id
 i18-20020a056638381200b0033f4a06ad48mr9488946jav.71.1657658210925; Tue, 12
 Jul 2022 13:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220615062219.22618-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20220615062219.22618-1-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 12 Jul 2022 22:36:40 +0200
Message-ID: <CA+fCnZc_sqfp4NOZPMWig9t01-yz2HOswoesTVfzGubrvqECDw@mail.gmail.com>
Subject: Re: [PATCH] kasan: separate double free case from invalid free
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, =?UTF-8?B?WWVlIExlZSAo5p2O5bu66Kq8KQ==?= <yee.lee@mediatek.com>, 
	casper.li@mediatek.com, Andrew Yang <andrew.yang@mediatek.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_133653_892047_59FEAF90 
X-CRM114-Status: GOOD (  21.40  )
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

On Wed, Jun 15, 2022 at 8:22 AM 'Kuan-Ying Lee' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Currently, KASAN describes all invalid-free/double-free bugs as
> "double-free or invalid-free". This is ambiguous.
>
> KASAN should report "double-free" when a double-free is a more
> likely cause (the address points to the start of an object) and
> report "invalid-free" otherwise [1].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=212193
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>  mm/kasan/common.c |  8 ++++----
>  mm/kasan/kasan.h  |  3 ++-
>  mm/kasan/report.c | 12 ++++++++----
>  3 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index c40c0e7b3b5f..707c3a527fcb 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -343,7 +343,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>
>         if (unlikely(nearest_obj(cache, virt_to_slab(object), object) !=
>             object)) {
> -               kasan_report_invalid_free(tagged_object, ip);
> +               kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_INVALID_FREE);
>                 return true;
>         }
>
> @@ -352,7 +352,7 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>                 return false;
>
>         if (!kasan_byte_accessible(tagged_object)) {
> -               kasan_report_invalid_free(tagged_object, ip);
> +               kasan_report_invalid_free(tagged_object, ip, KASAN_REPORT_DOUBLE_FREE);
>                 return true;
>         }
>
> @@ -377,12 +377,12 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object,
>  static inline bool ____kasan_kfree_large(void *ptr, unsigned long ip)
>  {
>         if (ptr != page_address(virt_to_head_page(ptr))) {
> -               kasan_report_invalid_free(ptr, ip);
> +               kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
>                 return true;
>         }
>
>         if (!kasan_byte_accessible(ptr)) {
> -               kasan_report_invalid_free(ptr, ip);
> +               kasan_report_invalid_free(ptr, ip, KASAN_REPORT_DOUBLE_FREE);
>                 return true;
>         }
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 610d60d6e5b8..01c03e45acd4 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -125,6 +125,7 @@ static inline bool kasan_sync_fault_possible(void)
>  enum kasan_report_type {
>         KASAN_REPORT_ACCESS,
>         KASAN_REPORT_INVALID_FREE,
> +       KASAN_REPORT_DOUBLE_FREE,
>  };
>
>  struct kasan_report_info {
> @@ -277,7 +278,7 @@ static inline void kasan_print_address_stack_frame(const void *addr) { }
>
>  bool kasan_report(unsigned long addr, size_t size,
>                 bool is_write, unsigned long ip);
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
>         if (info->type == KASAN_REPORT_INVALID_FREE) {
> -               pr_err("BUG: KASAN: double-free or invalid-free in %pS\n",
> -                      (void *)info->ip);
> +               pr_err("BUG: KASAN: invalid-free in %pS\n", (void *)info->ip);
> +               return;
> +       }
> +
> +       if (info->type == KASAN_REPORT_DOUBLE_FREE) {
> +               pr_err("BUG: KASAN: double-free in %pS\n", (void *)info->ip);
>                 return;
>         }
>
> @@ -433,7 +437,7 @@ static void print_report(struct kasan_report_info *info)
>         }
>  }
>
> -void kasan_report_invalid_free(void *ptr, unsigned long ip)
> +void kasan_report_invalid_free(void *ptr, unsigned long ip, enum kasan_report_type type)
>  {
>         unsigned long flags;
>         struct kasan_report_info info;
> @@ -448,7 +452,7 @@ void kasan_report_invalid_free(void *ptr, unsigned long ip)
>
>         start_report(&flags, true);
>
> -       info.type = KASAN_REPORT_INVALID_FREE;
> +       info.type = type;
>         info.access_addr = ptr;
>         info.first_bad_addr = kasan_reset_tag(ptr);
>         info.access_size = 0;
> --
> 2.18.0

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks for the patch!

