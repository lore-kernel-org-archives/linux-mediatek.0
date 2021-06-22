Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C70EC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D6261374
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D6261374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlnJVSAOXBGEH6d4e2xEJZZswa4V3zMEFhRQeZK8svA=; b=37DWeNLF2R8S1q
	MfiV2WBcKMHNItiVVpfZ4Ra7Coty9Vxxs5CGASvAggWHyubBDxoSR19OR03KPMQnmcQx7wwiL9N14
	gFyrmPUXgIxxkkHPf85/+f2W6qvoDP3zwEBS1B07VHnSPUQRMgQ7qCAbc2n+Uc9FdVvWk7SXGTNLZ
	F4Ungj13pbyM2fKL0+EXYCbmDMHyNu07RqaS8xtUX82k+bi3Dx2cHpzViD7tpvvA/BBrKx6x4JlG1
	CnVt15I4D/REndox15zxD8jXtgty9Cudtt2JqF48SAs3fv5IjbGIyXVK1k+geuUeC2xaw4E4gwRLD
	Ast82DTitBkFui95F7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvgra-007NA5-SN; Tue, 22 Jun 2021 13:54:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgrM-007N6D-BP; Tue, 22 Jun 2021 13:54:39 +0000
Received: by mail-ej1-x62e.google.com with SMTP id nd37so34724442ejc.3;
 Tue, 22 Jun 2021 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FByLAh6Nf6CrO0CmfvZoHDR68Ruso4bZUuWvxrdb7+g=;
 b=tA5vW637kCakI7hlfEOyVaNxytSpmD41CBKAyDpRHd4Nn3k0+ZOuUy4ktkdPl1/o62
 P+dR7c0sevpmjUYfYJL03s+RVXxoH8OjCLZnvrA9iibyuUPgCllBgCyDKYuVeZ0+XBrg
 TWGcLxJPYLoXL9c17cezS9A2eVBZVnfY8tO5BCG1XwIwj/oCs+dekgk5yel8P2qPaAnw
 S7g3Xkr+GY7P/VEoaR9DljrLM+euVjfN1bu2FzbOvQBjjdqMjGm1kC+onLxtNjs2aEdp
 4QSwPemSPqTKNGJMGn5YQEyTFYebMUjFjZYlfhczM2OPyFwDUaL/iKO6JiRPrZw78FjM
 dFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FByLAh6Nf6CrO0CmfvZoHDR68Ruso4bZUuWvxrdb7+g=;
 b=CqrvKcEYAKKJ4vOqml0XVaRy81tyBywBpUiXB+6ooQ4Vzr8MR+aK4Yff7/anDRc2EC
 8CnkBbwI9YtFKoTcMTFXYUYPapxShIIZAZqnwZKx0GoYKwwe6Xl4JABNBiTVtr1o/Y8e
 UcHebigjSzGxeqcnhZkIeZnihOs6m2KaIGprOgLJox/TuMQiCB0kRUzwtM4PEp9Cp+8e
 kjube8Ej8CBglcpjGvkVZhkwQ6r0XXE163jVWrIuUfrF5hiEHLMPJ7BwgHd+PFOrHSz1
 +bIhzAJsPTyJVsRm08gmt54UftCz2NWMpjkWcSBAdAdLLQckcCY9pyK2kIRYRpiddYvO
 06Pg==
X-Gm-Message-State: AOAM530sVVxYIYS0Sgslfof92x8MBSnsYKez2Phxnra7UTmA9MJrIzJy
 p5kpm43tMazMD9dQY0/uC6rywcdNhXEq7XJ5qLQ=
X-Google-Smtp-Source: ABdhPJx/V5oszBpwip0SxZHN++QihYaRpmfEKLkSDaCjMEhM4cmOUiXuiBz3yinojddOmwomdd+B4Q2fYeZRyy2KxAU=
X-Received: by 2002:a17:906:2f91:: with SMTP id
 w17mr4164114eji.443.1624370074257; 
 Tue, 22 Jun 2021 06:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-2-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-2-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 22 Jun 2021 16:54:14 +0300
Message-ID: <CA+fCnZcFxNwVd7oCLn4an-c6sx=3tQbZAB7Zu4jSPVqr6xDrVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
 CONFIG_KASAN_TAGS_IDENTIFY
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_065436_440112_A4B0600E 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 20, 2021 at 2:48 PM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> This patch renames CONFIG_KASAN_SW_TAGS_IDENTIFY to
> CONFIG_KASAN_TAGS_IDENTIFY in order to be compatible
> with hardware tag-based mode.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  lib/Kconfig.kasan         | 2 +-
>  mm/kasan/kasan.h          | 4 ++--
>  mm/kasan/report_sw_tags.c | 2 +-
>  mm/kasan/sw_tags.c        | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..6f5d48832139 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -155,7 +155,7 @@ config KASAN_STACK
>           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
>           to use and enabled by default.
>
> -config KASAN_SW_TAGS_IDENTIFY
> +config KASAN_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
>         depends on KASAN_SW_TAGS
>         help
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..b0fc9a1eb7e3 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -153,7 +153,7 @@ struct kasan_track {
>         depot_stack_handle_t stack;
>  };
>
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
>  #define KASAN_NR_FREE_STACKS 5
>  #else
>  #define KASAN_NR_FREE_STACKS 1
> @@ -170,7 +170,7 @@ struct kasan_alloc_meta {
>  #else
>         struct kasan_track free_track[KASAN_NR_FREE_STACKS];
>  #endif
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
>         u8 free_pointer_tag[KASAN_NR_FREE_STACKS];
>         u8 free_track_idx;
>  #endif
> diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
> index 3d20d3451d9e..821a14a19a92 100644
> --- a/mm/kasan/report_sw_tags.c
> +++ b/mm/kasan/report_sw_tags.c
> @@ -31,7 +31,7 @@
>
>  const char *kasan_get_bug_type(struct kasan_access_info *info)
>  {
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
>         struct kasan_alloc_meta *alloc_meta;
>         struct kmem_cache *cache;
>         struct page *page;
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index 9362938abbfa..dd05e6c801fa 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -177,7 +177,7 @@ void kasan_set_free_info(struct kmem_cache *cache,
>         if (!alloc_meta)
>                 return;
>
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
>         idx = alloc_meta->free_track_idx;
>         alloc_meta->free_pointer_tag[idx] = tag;
>         alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
> @@ -196,7 +196,7 @@ struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
>         if (!alloc_meta)
>                 return NULL;
>
> -#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
> +#ifdef CONFIG_KASAN_TAGS_IDENTIFY
>         for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
>                 if (alloc_meta->free_pointer_tag[i] == tag)
>                         break;
> --
> 2.18.0
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
