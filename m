Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB5BC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D59861057
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D59861057
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+vT/bLhLAoSrOlHEJb9AG98mE+IkKykkSOyNrUNUao=; b=YvPrI7JrMnuzxT
	t9YBawG8STPtmGpkUpam5UxxfIFGSB8kFjrzFKowwyU8AC/UR+3IJYMcyMjuWTUv3hOzi1fwv4Pxu
	QYvyaBgJLkgxWuRcJFhmct7WAkNFeL0FHCaLA5COnBa5SVaD4vdYWSj5DKXbGxxGqf3MQXfDkP3qs
	rpPmt3rjoj8+1/jw8Do/1cdcMYzCBPiwirQWTFHkne8b7/wG8yVwlMyXuZARlB1fPVEhrRuRKFyW+
	T+c4gqc+eFefsKg8OIpPuDy2i/oSzc+mTL/tWVCnbafYYAvkUCfozECYOpRlmdSoU+dQSZyIOZlYn
	/ES/HYexL4Q3w79cpbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcpsk-001VRS-TX; Tue, 19 Oct 2021 14:14:22 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcpsh-001VPS-N4
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 14:14:21 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so2454707otl.11
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdUwBl5vJzEY+z2qLVViXJz11eLRD5JHwkOtv2fvRgE=;
 b=cMEnDjIU2XKJz3D6ETstKbABN6h98BoKqPSIUExxaBux+KRqxBD1esjs4Zt+81sYag
 o60Jd9Q2a/g4vXwLpgV90U9tcSxWLkJAX+tzXuJsJNufLayspRr+IQpm31t7xdok2iGS
 khYa7YeiKqPi4mWkBiaUYVKCAWoJy6fRu583uWwk2MPv7Md6PJ0gNaKxiy+kc/pl86aQ
 oFomgwLJORiZCoahGnEHTkcKCAxO9JCoW5eKhmKv8AUUdKXsHZzXVQhpZCfISYmbxlZZ
 XGlbKogtACpQRcDQ5jUL9QN0JWln+qPEBuSiLVtHxH7yNrXS+yGQwaew5A7DHuHEGBB4
 6zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdUwBl5vJzEY+z2qLVViXJz11eLRD5JHwkOtv2fvRgE=;
 b=Y7VlndKxku4vwtsjBIFC0zvbmA5bkEMiRkWxQrfjKtb8wby48wvdA12985bVhyry6x
 v7OrmprEjs/LZ8DzmtAF6lBOP7A8dDiFlNUDN5mdfEna65HkLemaxDZeL+FM/FlZX7qt
 f4w+thePAw7HKCroEdpIopvsGlDVXI5pwt/qZUF0YD1ax9CV82PASXToVbXE5U5Y81E3
 mAi2fsPHPf1w49wOfjDffsgw3LDT/T0+eoiBTz8eKJHjgckqw3qHc4OETjhOeVFOjNT1
 4hJNvlC7HFszIPEJ8MrClY1VIWkNDMLUwgQBRPhbt5R+zCJHnP7sYIprXyZ+A/MCfIjk
 tVkg==
X-Gm-Message-State: AOAM531NrzthOdOFSnTy16sfw2E0z0gPLHc1d0EQCyOEMIhsLdqUagdr
 tXRrA3ShTI/4Yj86gt8nA468B2qo2zq6vqiorbzSaQ==
X-Google-Smtp-Source: ABdhPJzcbeAOpjyW1S4YoHYPGo8bxdP1x33eMLvRUwm9vgeXwvguOGMloQ1gSlkUcmDSxFg+vrzr2SOOQI/XXQsNKwQ=
X-Received: by 2002:a05:6830:1092:: with SMTP id
 y18mr5449783oto.329.1634652857393; 
 Tue, 19 Oct 2021 07:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211019120413.20807-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20211019120413.20807-1-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 19 Oct 2021 16:14:05 +0200
Message-ID: <CANpmjNMMQUHhFTdaqfx6HErnv0aXkCJn+eBGN-kfeznN8H+f3g@mail.gmail.com>
Subject: Re: [PATCH] kasan: add kasan mode messages when kasan init
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
X-CRM114-CacheID: sfid-20211019_071419_794009_819654DC 
X-CRM114-Status: GOOD (  17.22  )
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

On Tue, 19 Oct 2021 at 14:04, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> There are multiple kasan modes. It make sense that we add some messages
> to know which kasan mode is when booting up. see [1].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

Looks good, however, you need to rebase to -next because of "kasan:
Extend KASAN mode kernel parameter"...

> ---
>  arch/arm64/mm/kasan_init.c | 2 +-
>  mm/kasan/hw_tags.c         | 4 +++-
>  mm/kasan/sw_tags.c         | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 61b52a92b8b6..b4e78beac285 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -293,7 +293,7 @@ void __init kasan_init(void)
>         kasan_init_depth();
>  #if defined(CONFIG_KASAN_GENERIC)
>         /* CONFIG_KASAN_SW_TAGS also requires kasan_init_sw_tags(). */
> -       pr_info("KernelAddressSanitizer initialized\n");
> +       pr_info("KernelAddressSanitizer initialized (generic)\n");
>  #endif
>  }
>
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 05d1e9460e2e..3e28ecbe1d8f 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -168,7 +168,9 @@ void __init kasan_init_hw_tags(void)
>                 break;
>         }
>
> -       pr_info("KernelAddressSanitizer initialized\n");
> +       pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, stacktrace=%s)\n",
> +               kasan_flag_async ? "async" : "sync",

... which means this will have a 3rd option "asymm".

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
