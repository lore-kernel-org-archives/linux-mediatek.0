Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EB420708
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrcgSmoI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Kb5GyZA+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66EB420708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eDV+2Eifca0+VIHgvaS+Xk1E/GP8O2B4MOjc88Le4Zo=; b=lrcgSmoIUXn58/+TS+diama0d
	pgAS4+mlLvEpALFmbAbK5Baif4B+kRq/wNMVFtxmCXS/sWxdPtObFnHn4gIl29o4BsanKu70Bi2Q2
	U9tIatJt8AB4sBAs1LWegro19rjCRshQdP7bv0bKmaCs2cjPpDg1BrhD/Ep/prJ38SjlFf6tyDxhO
	lW592vr6YABzxxYgA7he592gjuFAamDHotWXmjqwz9eX+RjYhqle92H/Poi56R2JHbECrc+Xd/K/q
	0P8W9UVj5WGCKvcqr1+vcqPnkJISSXKqup4lZjn2Rt5C3kgzstjVY8tjmfDmH8Em1Xs4E4r+EKSLb
	jle50bPRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsKTo-0000Iq-3j; Mon, 06 Jul 2020 06:19:52 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsKTl-0000FU-1z
 for linux-mediatek@lists.infradead.org; Mon, 06 Jul 2020 06:19:50 +0000
Received: by mail-qk1-x741.google.com with SMTP id 80so33836892qko.7
 for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2020 23:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8GSicWISxuLf8SI+byIF+xMxTNvfdYQixlttIglDVo=;
 b=Kb5GyZA+RJu/iVN8HUtF7SZb/AesZh0MC1s2Up/L6gZO8CAX69QBX/18QLSEWJcaQm
 bV7234iQyfobwViOUP11+RW17wTqDvAX9lQ/LE2y9YLRWlcKoAPKQW+h3hPzjnGF9F9L
 VGT8cnzbQIlczAjUu/gpZE6GJbtQ1c9wnxnnXylraSfK67Kz3CRTdLE/6cWI1PJBO2m3
 0dnqBtOtUuC0f6DT2TRVMuZKkS2IdppDH3Okra7WpEYhKJYB3HuNs0o4Y3Mftwob2M/D
 T4pZRiMkxbGZ8tMKR9UxafTx4d/K3TR2NsxGH67l2E09lNBJ2FgKwvW0py2Uii2yttD7
 Uxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8GSicWISxuLf8SI+byIF+xMxTNvfdYQixlttIglDVo=;
 b=IQ0LNj3vJxbiAZj3pDPNGs2bkPExELdV2eSPt0CIjA9NKqapWIHXW5SteIIJpyngJY
 i3ItSIdDIVe3Rq/JOohU5nlWTG32A92rWuZt+kNJzvM9VTBP4EgfAPETKq65y7qYzZgn
 nR494RhEx014T8vsFNAvtdcKFFk4YiEJeuTVeUkDOl5XutOCdcuQiDBe+G29ZswOm2Jh
 NhsPaIC0n4frsauhLxyCK11CjGEiAY6Xs2+liy3V+eVvTCnWx0IE39i56EWLyA1QWY//
 FY+rP0y7+ekRbGC/LnZKIm7tLZ41nWYAPA7y8C+gaZsTYDoThtc7YCmOG93YK6dMS3ns
 8aPg==
X-Gm-Message-State: AOAM5334MEGAPNrJqcB4wjp0dHrd0sl/DKvGLO7Fb1NwZeCvluJ/nqho
 W+MUe78YaSVyqt+ZsCyRA78WaMU2nF0Nch8fgvEHUQ==
X-Google-Smtp-Source: ABdhPJxlC97uRvdNje6Yxi/b5Fq8p0PnY4Y6DnkuEjMt/sh0vf2nWbgdvCADjv0hclufOA80J/fDvD6J6xJwxhe0Nqo=
X-Received: by 2002:a37:67d4:: with SMTP id
 b203mr19900712qkc.407.1594016385214; 
 Sun, 05 Jul 2020 23:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200706022150.20848-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200706022150.20848-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 6 Jul 2020 08:19:33 +0200
Message-ID: <CACT4Y+akZ5iu2ohQhRqiUd8zkew-NmrUPrA=xYtS1xxHWZ60Og@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: fix KASAN unit tests for tag-based KASAN
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_021949_164146_7B91A936 
X-CRM114-Status: GOOD (  25.23  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux-MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 6, 2020 at 4:21 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> We use tag-based KASAN, then KASAN unit tests don't detect out-of-bounds
> memory access. They need to be fixed.
>
> With tag-based KASAN, the state of each 16 aligned bytes of memory is
> encoded in one shadow byte and the shadow value is tag of pointer, so
> we need to read next shadow byte, the shadow value is not equal to tag
> value of pointer, so that tag-based KASAN will detect out-of-bounds
> memory access.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>
> changes since v1:
> - Reduce amount of non-compiled code.
> - KUnit-KASAN Integration patchset are not merged yet. My patch should
>   have conflict with it, if needed, we can continue to wait it.
>
> ---
>
>  lib/test_kasan.c | 81 ++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 17 deletions(-)
>
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index e3087d90e00d..660664439d52 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -40,7 +40,11 @@ static noinline void __init kmalloc_oob_right(void)
>                 return;
>         }
>
> -       ptr[size] = 'x';
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               ptr[size] = 'x';
> +       else
> +               ptr[size + 5] = 'x';
> +

Hi Walter,

Would if be possible to introduce something like:

#define OOB_TAG_OFF (IS_ENABLED(CONFIG_KASAN_GENERIC) ? 0 : 8)

and then add it throughout as

        ptr[size + OOB_TAG_OFF] = 'x';

?
The current version results in quite some amount of additional code
that needs to be read, extended  and maintained in the future. So I am
thinking if it's possible to minimize it somehow...

>         kfree(ptr);
>  }
>
> @@ -92,7 +96,11 @@ static noinline void __init kmalloc_pagealloc_oob_right(void)
>                 return;
>         }
>
> -       ptr[size] = 0;
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               ptr[size] = 0;
> +       else
> +               ptr[size + 6] = 0;
> +
>         kfree(ptr);
>  }
>
> @@ -162,7 +170,11 @@ static noinline void __init kmalloc_oob_krealloc_more(void)
>                 return;
>         }
>
> -       ptr2[size2] = 'x';
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               ptr2[size2] = 'x';
> +       else
> +               ptr2[size2 + 13] = 'x';
> +
>         kfree(ptr2);
>  }
>
> @@ -180,7 +192,12 @@ static noinline void __init kmalloc_oob_krealloc_less(void)
>                 kfree(ptr1);
>                 return;
>         }
> -       ptr2[size2] = 'x';
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               ptr2[size2] = 'x';
> +       else
> +               ptr2[size2 + 2] = 'x';
> +
>         kfree(ptr2);
>  }
>
> @@ -216,7 +233,11 @@ static noinline void __init kmalloc_oob_memset_2(void)
>                 return;
>         }
>
> -       memset(ptr+7, 0, 2);
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               memset(ptr+7, 0, 2);
> +       else
> +               memset(ptr+15, 0, 2);
> +
>         kfree(ptr);
>  }
>
> @@ -232,7 +253,11 @@ static noinline void __init kmalloc_oob_memset_4(void)
>                 return;
>         }
>
> -       memset(ptr+5, 0, 4);
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               memset(ptr+5, 0, 4);
> +       else
> +               memset(ptr+15, 0, 4);
> +
>         kfree(ptr);
>  }
>
> @@ -249,7 +274,11 @@ static noinline void __init kmalloc_oob_memset_8(void)
>                 return;
>         }
>
> -       memset(ptr+1, 0, 8);
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               memset(ptr+1, 0, 8);
> +       else
> +               memset(ptr+15, 0, 8);
> +
>         kfree(ptr);
>  }
>
> @@ -265,7 +294,11 @@ static noinline void __init kmalloc_oob_memset_16(void)
>                 return;
>         }
>
> -       memset(ptr+1, 0, 16);
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               memset(ptr+1, 0, 16);
> +       else
> +               memset(ptr+15, 0, 16);
> +
>         kfree(ptr);
>  }
>
> @@ -281,7 +314,11 @@ static noinline void __init kmalloc_oob_in_memset(void)
>                 return;
>         }
>
> -       memset(ptr, 0, size+5);
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               memset(ptr, 0, size+5);
> +       else
> +               memset(ptr, 0, size+7);
> +
>         kfree(ptr);
>  }
>
> @@ -415,7 +452,11 @@ static noinline void __init kmem_cache_oob(void)
>                 return;
>         }
>
> -       *p = p[size];
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               *p = p[size];
> +       else
> +               *p = p[size + 8];
> +
>         kmem_cache_free(cache, p);
>         kmem_cache_destroy(cache);
>  }
> @@ -497,6 +538,7 @@ static noinline void __init copy_user_test(void)
>         char __user *usermem;
>         size_t size = 10;
>         int unused;
> +       size_t oob_size;
>
>         kmem = kmalloc(size, GFP_KERNEL);
>         if (!kmem)
> @@ -511,26 +553,31 @@ static noinline void __init copy_user_test(void)
>                 return;
>         }
>
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               oob_size = 1;
> +       else
> +               oob_size = 7;
> +
>         pr_info("out-of-bounds in copy_from_user()\n");
> -       unused = copy_from_user(kmem, usermem, size + 1);
> +       unused = copy_from_user(kmem, usermem, size + oob_size);
>
>         pr_info("out-of-bounds in copy_to_user()\n");
> -       unused = copy_to_user(usermem, kmem, size + 1);
> +       unused = copy_to_user(usermem, kmem, size + oob_size);
>
>         pr_info("out-of-bounds in __copy_from_user()\n");
> -       unused = __copy_from_user(kmem, usermem, size + 1);
> +       unused = __copy_from_user(kmem, usermem, size + oob_size);
>
>         pr_info("out-of-bounds in __copy_to_user()\n");
> -       unused = __copy_to_user(usermem, kmem, size + 1);
> +       unused = __copy_to_user(usermem, kmem, size + oob_size);
>
>         pr_info("out-of-bounds in __copy_from_user_inatomic()\n");
> -       unused = __copy_from_user_inatomic(kmem, usermem, size + 1);
> +       unused = __copy_from_user_inatomic(kmem, usermem, size + oob_size);
>
>         pr_info("out-of-bounds in __copy_to_user_inatomic()\n");
> -       unused = __copy_to_user_inatomic(usermem, kmem, size + 1);
> +       unused = __copy_to_user_inatomic(usermem, kmem, size + oob_size);
>
>         pr_info("out-of-bounds in strncpy_from_user()\n");
> -       unused = strncpy_from_user(kmem, usermem, size + 1);
> +       unused = strncpy_from_user(kmem, usermem, size + oob_size);
>
>         vm_munmap((unsigned long)usermem, PAGE_SIZE);
>         kfree(kmem);
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200706022150.20848-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
