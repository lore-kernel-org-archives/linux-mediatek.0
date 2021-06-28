Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67852C11F64
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 18:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C16D61C8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 18:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C16D61C8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSy7PfG38cARQUZG2R3EP8A7WQVLtek8lnEz173xSiA=; b=PgsLKI264MYXlL
	ZaVpbV3NiQA0jhKJ5LvjYuiNmjAkBQ9Dq+j9eY3+H6Oed8OuTmI2b/TATqoW28U5RNIN0s9iNjP24
	DUKW6chg/W/Xncg7imKtIGx/S59PMXDyVPFSkbZFCTfy4B0ptdo21BJ97GpM4Ty2/Fmngu8alHuGp
	pqJsuS+nD9JpGoKjcTfikhMIoZZ2vOlEkXxCnC7++WVp6gdbEP8oos7YFT0mrSBX54tzxfBAOHAwR
	+/GEqQB1j1b28Iq4Ie6vb9E1jaeXZefe7sj+vkDT+d+d/oOny91HkE1H2v3/WqDh6kLdu4zOTZNpB
	HH38Drvow6+m/mLjpqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxwCw-008vvV-Nw; Mon, 28 Jun 2021 18:42:10 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxwCu-008vtn-4k
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 18:42:09 +0000
Received: by mail-oi1-x22a.google.com with SMTP id w127so23080611oig.12
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGZGjPN7zJUyktr/g4knlZGNk67FduIZ8wWgBMyrHK8=;
 b=vfK499WWN0RN0+aNfv40Ss48p8O7oyXyekRGgjGLgvESsOLtJsfv/nTxXucuXl/5+j
 5xmsS3V52nf3qx3GjTm9KWyAo17IpbR1SSSXQ12oFpJBA1Cn/7ZbzGw8g/Uv1zKFmiFw
 ssBnRiGSw7gNhHGAVXqnqYfFboORp62t7dKkygt8wHzENgoYpGVvu5HF+A7aeBEWPrUX
 mZKia3FgocxKXGiclhYu6DTlDUQWj0IFQo2jz0zO77yeW+qvpmTClekIbW/QKHfHQ/VV
 zaD+2UCc15DFyNuquakS2AgKuzVQtx/mkQcKSdmaTkDa/s/jIPOPANa7XnRSWWV7sTC0
 x8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGZGjPN7zJUyktr/g4knlZGNk67FduIZ8wWgBMyrHK8=;
 b=lNtZ9822JBOui/e9a9c8SrWEzINgffOqEsq/znpHgoshP56J21+YYBN27vznfGNMGW
 Czlz4Y1YgUZJEQ0VFKcTTumGspofmvGA4T6zdkkqyHxcccfjfesUTLYpAgPFfgZ7fFcQ
 mVV+A/h420trjibQXB1ntfi3Jc6ekZDfsJm9kajFZIzSIMtkMRNqR4hFtn78JeAXFO0l
 eIU66t2aFkoamusNnEtIE4qeTmonKNyE4C6xdd2r0Q4P49WARRRsmjqEqnd8Cfhd3b3F
 y+Nce/rtHG8oGIM6T3XcKW3MOa4DYJys4iyUbf3LLIvxAkboYlP1YZsT9QSRZAphn9Su
 40ug==
X-Gm-Message-State: AOAM5318XyylSy8c6ft0MwOgGySweV37UA6sSinnW53gN9T9Wopb+MgG
 XN+j7DL4kXwJf+7ArAHNUfge47eK030wc9Lf/YOW+A==
X-Google-Smtp-Source: ABdhPJwXH+qlDq1Ccbwh0SDU8S40lYUQh7EdnnpUvf36P4mj6in5L6ehZiQWwGjkfwAvK3KRSkAJC4PBV3oNg6meIK8=
X-Received: by 2002:a05:6808:7c8:: with SMTP id
 f8mr6642152oij.121.1624905726971; 
 Mon, 28 Jun 2021 11:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210624112624.31215-1-yee.lee@mediatek.com>
 <20210624112624.31215-2-yee.lee@mediatek.com>
In-Reply-To: <20210624112624.31215-2-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jun 2021 20:41:55 +0200
Message-ID: <CANpmjNPSh4NephPOm08H_etX_FbDAebowE4rW3VJK_Fgb9auHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] kasan: Add memzero init for unaligned size under
 SLUB debug
To: yee.lee@mediatek.com
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_114208_238215_129D3872 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, 24 Jun 2021 at 13:27, <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone of object with unaligned size.
>
> An additional memzero_explicit() path is added to replacing init by
> hwtag instruction for those unaligned size at SLUB debug mode.
>
> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..d1054f35838f 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,6 +387,12 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>
>         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>                 return;
> +#if IS_ENABLED(CONFIG_SLUB_DEBUG)

Avoid the #if. I think none of the stuff referenced here is only
available if CONFIG_SLUB_DEBUG. In that case, please just write:

if (IS_ENABLED(CONFIG_SLUB_DEBUG) && init && .........) {

The compiler will correctly optimize out the branch if the config
option is not enabled. But the benefit is we compile-test this code
with all configs.

> +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +               init = false;
> +               memzero_explicit((void *)addr, size);
> +       }
> +#endif

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
