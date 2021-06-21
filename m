Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25539C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 17:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5BD861164
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 17:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5BD861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ0qVjXXHhqgC6e66TBFtotMvflozXSEmoAEpAryUhg=; b=kDn/xeK+gB6N1d
	cFoZBGcPlYzR4K0l1vpk6AdC3SZZy4TO6ZtW6eMwwBmLQ4dwyB/Z8MKHBjS3PVgZYW+4z4NYYD/J0
	EcHfXHvre2aNeqRiX/mfkw5DOhzlxTpfmEAr0QkHkKnJucqijO9o6X068unSc3afBkX8YGvcufHo0
	1kkTWKjW5je84qE0j5Y3ZGfaoSA+wIzzfzR75m0A0ZG5OKofumsmQFrSChMr/ESGyc9+sLOzPwwfI
	E4kXbpTPMqZJbEoooCxTvUBTH5eo1rQPw19qn1qSSYUiHOapUqel/Ys41tV1ToH8KGN7i3Sz0BCgM
	Xhyf8KzMtXYStTCQzIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvNx6-004IYN-2l; Mon, 21 Jun 2021 17:43:16 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvNwt-004IUk-3Z
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 17:43:04 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso18505673oto.12
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWdKmgG81sJBpjzyn6TSXwSeeJGUkRqGGWlo4fqoDn8=;
 b=CiXJ6n5GdF+RiiNqGBO8F/j8UT/qhrN72JVb6QaRtPts6IKnis1CFRapxq7H+wy4y1
 GWFo9rcHlHpgxkBuLl4FS+8nlfkbFdEK030ZBhpN6qPJyMdUafOT0hCU6NEZg+/cJrRf
 pfUzmq6g8hNiBVMMQmi5KfoIWhoTK5CYmbo4zeZ/tHEV5+AmXckA3wZ3WT3BZXuMYZhj
 NVF9LE5CuIVcXNVCX2rJkKM0UTagmKMDidAkcc234Ig0n0BY3qwZzxSC3tO838vQVzra
 HPm27NoxKSHr5adMk4M2O98++8T2eFSxAVl/o/Ma4PEiSFCcZeTUZXl2qx5wnX0IoVAk
 IjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWdKmgG81sJBpjzyn6TSXwSeeJGUkRqGGWlo4fqoDn8=;
 b=J2rL/FhFkB3eZbjLi63jsP6DOaZEaJRvnAhJsrbw/LZOk2hF12PKhqhAMVCJnzgu64
 02VNU76Mz6OUpsWrgg9kG2EscI8k8vPQpDSqgLJ+Fg6wCFZzgABSyafr9w5K3otA2ozN
 Cfwu/gn7IXtZJU9js8lDq7qYQB+6GE3orkPCyfN3f/I56wPys+YbF4Xy6o1G7560HLNX
 TXAi3us4PPeA7zt+OvO4KNhW7PfUPvYllDvDHKK8WZvqcohwjwdvQ4i20ABhvj04bh+9
 2eSUWA5AqncOxa/vfG+XiUhoYOebX8u+xRCZJuJsh1TJViEX1meXIQXImLA/8anxDHM3
 NhsA==
X-Gm-Message-State: AOAM530ohhuk8YTArP3amzDAqxJmt7ZGs9FLiKxYvi2H+rrJv4ozvO9P
 q6eJlrbDSDEFmDsWuKV5KZxE3OZi506Fi562hw/7PA==
X-Google-Smtp-Source: ABdhPJzVuQD0App46op5EoLAsOExo04ZFgTkfdf4n29jaNNRdc+/25Vd8YBFUCL3ENliNFYA0wncLG3zEOaXjjN0y5I=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr22053479oto.17.1624297381993; 
 Mon, 21 Jun 2021 10:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210621154442.18463-1-yee.lee@mediatek.com>
In-Reply-To: <20210621154442.18463-1-yee.lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 21 Jun 2021 19:42:50 +0200
Message-ID: <CANpmjNPYSVgmNU0gCobSb67WZ74-8s48LyN7N+sBtH15teVN3A@mail.gmail.com>
Subject: Re: [PATCH] kasan: unpoison use memset to init unaligned object size
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
X-CRM114-CacheID: sfid-20210621_104303_202425_E8CD45DE 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, 21 Jun 2021 at 17:45, <yee.lee@mediatek.com> wrote:
>
> From: Yee Lee <yee.lee@mediatek.com>
>
> This patch adds a memset to initialize object of unaligned size.

s/This patch adds/Add/

> Duing to the MTE granulrity, the integrated initialization using

s/Duing/Doing/
s/granulrity/granularity/

> hwtag instruction will force clearing out bytes in granular size,
> which may cause undesired effect, such as overwriting to the redzone
> of SLUB debug. In this patch, for the unaligned object size, function

Did you encounter a crash due to this? Was it only SLUB debug that
caused the problem?

Do you have data on what the percentage of allocations are that would
now be treated differently? E.g. what's the percentage of such
odd-sized allocations during a normal boot with SLUB debug off?

We need to know if this change would pessimize a non-debug kernel, and
if so, we'd have to make the below behave differently.

> uses memset to initailize context instead of the hwtag instruction.

s/initailize/initialize/

> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> ---
>  mm/kasan/kasan.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..d8faa64614b7 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -387,8 +387,11 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
>
>         if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
>                 return;
> +       if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
> +               init = false;
> +               memset((void *)addr, 0, size);

Should use memzero_explicit().

> +       }
>         size = round_up(size, KASAN_GRANULE_SIZE);
> -

Remove whitespace change.

>         hw_set_mem_tag_range((void *)addr, size, tag, init);
>  }

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
