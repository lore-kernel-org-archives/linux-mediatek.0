Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4256C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F2561C34
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F2561C34
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaaaIHoB5S87su1HqLAz2o1Vmden2/3WDbszRvahnpU=; b=hlk0ZzhxpcnW2M
	P5vMTJlCNRYsCawPacPodlbbHDZbbioZtU2p8gSUQ4gVcgycPZaSy3+S5EK5Gs3D8XObG9Kwxwt4U
	TL4tdZN9HRuT9onxYJ/zpAzuNsmLA7nTBuH+B5f92Moq3WTWo8NB88mel2/+oz2lTEJMlUXTfRpnS
	pLHxeqqPT72yfucgdDaVwsNW+9kyvAMXGHLMXZl2kR5OBdTeiGWysP3CMx5p0EC+VG8AixvW+wZhf
	uf4/OPdkqhOGHZCETQ+PgKULLu0h4CvnZfy49TmN5ACIWECiqX6ncYsRHvt8UmCHXkCZZ3ebXlVvx
	0GTi6f1ugI8orTVR0+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxkJl-006v1F-Oh; Mon, 28 Jun 2021 06:00:25 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxkJi-006uzM-Bp
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 06:00:24 +0000
Received: by mail-oi1-x22f.google.com with SMTP id t40so20738299oiw.8
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Jun 2021 23:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxWWpaIFrA1MZdBiGZNBP423mwRSvrkYLeFkLxi+psE=;
 b=LMUpZBEyoJQnBtAQ8SeofxWWGMQdCIhgV/12CUm7166Cn94MsSRbJqn1hSoEAYl+Et
 Bm+iirwqCVPLotrlInWQgdyT9JBMMS645aOU3F8aPbMHfI0N8MA9VGFm0sPU7RqJxyHN
 wG7AdpdAKNj/zNyjwgLIVa03j4ih5laE+WvZ6PV4zu/AI7JKejTi2ScC6+qEtb02JyIc
 jeiA3Sux/OM7PfWw29g/o/CdeqN5RDkEvvCGQQmhhykp1DpGaWVeFVUnti+ZEqzKd3yY
 dky0y+WveAm1wwgBKioF9IE1tJ+Ykya0kNBrTC+OHy4rSnf56FPsJcKoPB6XRvTSxfrs
 1BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxWWpaIFrA1MZdBiGZNBP423mwRSvrkYLeFkLxi+psE=;
 b=FHcOQgrWIxNfKYuSBFKpjuniOppI9Nzf+z1q7X3IDsNuuFb0+f9QSh6nDikpDR9BUo
 owkeEISlU1c4AorPFX6oAxZPre93MNixNnR/Lcqix4MOAKRjtjaxgP45wBwvlkNRVG/x
 IN/4i+oiFnjju17wR/wDEwktT5o1705TjU3GwkzqoSH3lkX4kecL3aVo7FDUg/rdil73
 PZO8JcCBfrx+ID4rFDRWzRkDKdhjZTlDIKMsC4CPFWYrOfQn3GO/wF6bIS7nhDyEAP06
 g7avfgVXhj05hRSZyYZdWSClNBlDz+N6cMaLKOaC39CZE6/BKRRZC7BoilZI2Q+ONFwE
 j5jw==
X-Gm-Message-State: AOAM531Qon12mZtTpv5NILOjZ+wuoHwK90LpjRmqmFjIPgXwbwTpCnt0
 mpuXgXZgI0qtogxX3vD92OaH2LZUYHvvOxYObL+Gow==
X-Google-Smtp-Source: ABdhPJxqhFj8BmcDYjY03LVKniU00V6a9H9F3IfGZ6CZRYiwE68CJG4CI1RaEcWvHwvAkHNXok4eZ8Ddb4luicY15Ys=
X-Received: by 2002:aca:ba06:: with SMTP id k6mr16229848oif.70.1624860018200; 
 Sun, 27 Jun 2021 23:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
 <20210626100931.22794-2-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210626100931.22794-2-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jun 2021 08:00:00 +0200
Message-ID: <CANpmjNO6k5=0HMf-Y3j70iTKLKY8XJAiLDDrfNf4-3cLASxHOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
 CONFIG_KASAN_TAGS_IDENTIFY
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 wsd_upstream@mediatek.com, chinwen.chang@mediatek.com, 
 nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_230022_487273_5B8C3CB6 
X-CRM114-Status: GOOD (  25.72  )
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

On Sat, 26 Jun 2021 at 12:09, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> This patch renames CONFIG_KASAN_SW_TAGS_IDENTIFY to
> CONFIG_KASAN_TAGS_IDENTIFY in order to be compatible
> with hardware tag-based mode.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  lib/Kconfig.kasan         | 2 +-
>  mm/kasan/kasan.h          | 4 ++--
>  mm/kasan/report_sw_tags.c | 2 +-
>  mm/kasan/sw_tags.c        | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index c3b228828a80..fdb4a08dba83 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -167,7 +167,7 @@ config KASAN_STACK
>           instrumentation is also disabled as it adds inline-style
>           instrumentation that is run unconditionally.
>
> -config KASAN_SW_TAGS_IDENTIFY
> +config KASAN_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
>         depends on KASAN_SW_TAGS
>         help
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 7b45b17a8106..952df2db7fdd 100644
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
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210626100931.22794-2-Kuan-Ying.Lee%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
