Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14E160FE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F14E160FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5AzJRZSVTXB88YwFe/wbDGUTjrhqBZ8fHm9oVr6vRE=; b=492X5Cqrfh9/pD
	nFM928KGxH3YePMhfJLH1SN9H3RY9izocGFN0YPsFMtqAkS3gxXLXfB3Sg+6vFAKjVFv4GDPHV+E0
	lFpGmEz+ROCkrphdy7gsupkTQuxU0Kw3FBGQ2DSt9Nq839tGRxjcyR4CXhle3x45+5QFz9QKGbiuf
	sKrFbtnS8ah+Xwesqli2CMu9OFZJXpwM2OeC4dmjY6bANORnllspCS4yKEFgGc3LN+J/ArFZJ8dm8
	/eG5OxpMU2rrCd6Kuhu5dYZve7y+sqpklnREACAcekqZFjxTUpCiT2MC0+K6wMls6zjxPv2nzrTe7
	aD4WTz7ZrpAGDuA8HsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md8Mu-0045Za-01; Wed, 20 Oct 2021 09:58:44 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md8Mp-0045Xa-QA
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 09:58:42 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so7592708otr.7
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Oct 2021 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/MXj6rprc3vo+rohvgYqe3T54Ggc+J0xvFrcFXcAdLY=;
 b=jgc+NSn/FrAvNhiM6EigcGhOPwxLJD01UhblZ9Huaty8vGGXwjW4h8ZJQhXXeTwcFW
 hlVik+C0gnFGhtI8/Uzr/N9UCEjhHBZ2W7pvlKCk0cpocnky1AAiW8GF/yHMhwn1fEXF
 FUfllrMWO3L0KRvV3hF9H545urR9N013GRelK99vV5vJPh6R/ZhYuUa9GIaZ/iOIKdZT
 IaS/JPXRcw8Wfd1z3cHmwFsJQT/MsQ2IZSaMEyUY3bwNA6/Q4iH2fiDhW98J8Y5X1uqV
 S2ZpAdyTQNqhbG5ahUSD2mJAnjePjPRsaWRnvbT8xhIsrbMH6+jV6WP8gjd1+rm7ehSQ
 Wzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/MXj6rprc3vo+rohvgYqe3T54Ggc+J0xvFrcFXcAdLY=;
 b=ui3715bq+df4zBGIu8iM3Dkkl228QsA3v6Fu84aroV2ibyoUMH+q9gnAFsvwrr3C2h
 pk47eHVUciLFtiIkDfOxnRa094k1DutRsqG87aF5wGRaImkGHQAMy9nN3/V2smrxd6lq
 f5VlJpaUZwAe5G1lgs7VZigjvtyJ4UkOhl3TAE9fcDzHkv+51dmr+qEMWsV2TqIxtkB4
 nQw6zGvg9lXV4rI3UjsD0wpY7Bp2YZskuDBTKRp+Ujwa2AV0JmKTgLbtZo1q2ZZqBTY7
 Q/YgCPZNLn9CuggOxsoqXBPOG9sUHQOc6GyCIobEuCnW4KlpGapav0T8OrSkycIcSvPd
 Yj8Q==
X-Gm-Message-State: AOAM5329AfbA2zJdk/tGkhqt2GQLrJv4lJc7XY6+PzJWZ+7GJV2ffqyI
 LgAP6j4Jv0o74ihoJtunLr5Hmw1E6PCQQWVZXt0xUg==
X-Google-Smtp-Source: ABdhPJyt4FTPQc//xLDZCUzdp8LQGxbGS81ohYqcX1wLfbpWMg/6AW9oD7bnAsKaC+F3b2lsjJCIgJtkOE2rJb57SyA=
X-Received: by 2002:a9d:71cf:: with SMTP id z15mr10021143otj.157.1634723918292; 
 Wed, 20 Oct 2021 02:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Wed, 20 Oct 2021 11:58:26 +0200
Message-ID: <CANpmjNMk-2pfBjD3ak9hto+xAFExuG+Pc-_vQRa6DSS=9-=WUg@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: add kasan mode messages when kasan init
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 chinwen.chang@mediatek.com, yee.lee@mediatek.com, nicholas.tang@mediatek.com, 
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_025839_879835_C9133F63 
X-CRM114-Status: GOOD (  24.72  )
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

On Wed, 20 Oct 2021 at 11:48, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> There are multiple kasan modes. It makes sense that we add some messages
> to know which kasan mode is when booting up. see [1].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Reviewed-by: Marco Elver <elver@google.com>

Thank you.

Because this is rebased on the changes in the arm64 tree, and also
touches arch/arm64, it probably has to go through the arm64 tree.

> ---
> v3:
>  - Rebase to linux-next
>  - Move kasan_mode_info() into hw_tags.c
> v2:
>  - Rebase to linux-next
>  - HW-tag based mode need to consider asymm mode
>  - Thanks Marco's suggestion
>
>  arch/arm64/mm/kasan_init.c |  2 +-
>  mm/kasan/hw_tags.c         | 14 +++++++++++++-
>  mm/kasan/sw_tags.c         |  2 +-
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 5b996ca4d996..6f5a6fe8edd7 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -309,7 +309,7 @@ void __init kasan_init(void)
>         kasan_init_depth();
>  #if defined(CONFIG_KASAN_GENERIC)
>         /* CONFIG_KASAN_SW_TAGS also requires kasan_init_sw_tags(). */
> -       pr_info("KernelAddressSanitizer initialized\n");
> +       pr_info("KernelAddressSanitizer initialized (generic)\n");
>  #endif
>  }

Note: Other architectures may want to update their message once they
support any one of the tags modes. But currently that's not yet the
case.

You could also consider leaving out the "(generic)" bit if it's the
generic mode to avoid adding this to all arch/**/kasan_init.c. Both is
fine with me. I leave it to you.

> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index dc892119e88f..7355cb534e4f 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -106,6 +106,16 @@ static int __init early_kasan_flag_stacktrace(char *arg)
>  }
>  early_param("kasan.stacktrace", early_kasan_flag_stacktrace);
>
> +static inline const char *kasan_mode_info(void)
> +{
> +       if (kasan_mode == KASAN_MODE_ASYNC)
> +               return "async";
> +       else if (kasan_mode == KASAN_MODE_ASYMM)
> +               return "asymm";
> +       else
> +               return "sync";
> +}
> +
>  /* kasan_init_hw_tags_cpu() is called for each CPU. */
>  void kasan_init_hw_tags_cpu(void)
>  {
> @@ -177,7 +187,9 @@ void __init kasan_init_hw_tags(void)
>                 break;
>         }
>
> -       pr_info("KernelAddressSanitizer initialized\n");
> +       pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, stacktrace=%s)\n",
> +               kasan_mode_info(),
> +               kasan_stack_collection_enabled() ? "on" : "off");
>  }
>
>  void kasan_alloc_pages(struct page *page, unsigned int order, gfp_t flags)
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index bd3f540feb47..77f13f391b57 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -42,7 +42,7 @@ void __init kasan_init_sw_tags(void)
>         for_each_possible_cpu(cpu)
>                 per_cpu(prng_state, cpu) = (u32)get_cycles();
>
> -       pr_info("KernelAddressSanitizer initialized\n");
> +       pr_info("KernelAddressSanitizer initialized (sw-tags)\n");
>  }
>
>  /*
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
