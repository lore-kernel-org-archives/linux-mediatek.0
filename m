Return-Path: <SRS0=BNI/=IS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACEFC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 10:59:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53357619A6
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53357619A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vlVudZM+M2pmdRXbfFC3+Vgus+8XFgofuzJO2NTs/As=; b=WwaXX8RGdvbLLgaHQIWALYcHk
	H6nv9EQsKHJIb39d12PNFM4LAAzPyFxGCErvRR5K0Z3AdUH0mQXX4KaiT4cDgUalhISvcevVrhPQm
	9FbNGZMLdk3adMC5IV655NBRGElx1HmJq7sDaCYRR4XbMU5waJjycAO4DTxO6KqNaang7zadI+WB0
	cg0hicC5TjVsAxl3J+Mze/8NzHq+uZigACxkFj5ZAbrGDn5NRCEjv9ljFJVlLZxc5KgHdm2F1a0Hk
	C6M9UXNTnOiWWisBqAEkkq0w1Nlou93WFpEB3kMcKOrL4Lvl1dZ25UKnxHT3gDbC4qTeUO/QMGvYL
	N3Bkh4zYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNZK0-008khx-MY; Sat, 20 Mar 2021 10:59:08 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNZJq-008kh9-Ay; Sat, 20 Mar 2021 10:59:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7965805pjh.1; 
 Sat, 20 Mar 2021 03:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5zI2N5eJsydBU4Kcf42YOrHjn6io9gty356v6rFjA8=;
 b=MFdk55cDiztRPczRYLRP549RjuIeKF0AIp4SjgX3MPitKrAiBQmL+3B6fDVdbGp29b
 PUaECFdwPWjub31RPKSP6hd4Jdkx6Pw6nQGXqm6vdhrgJpFFmhm/NSU2GoTaoVES08Zn
 sys1uEQxBK19w7AUJq4OlzAFlbyVUow+on8U23bB2Pke+QYFfkoO4LkLn7RjGza2L471
 Xbm+XNbYu9NuylDY3GjwEqdbXivxL5Xwvx0jPKiVHLBoakvxkz/TWvLKo0KKnDgZujyO
 aedAeAQdlZ5VTti+ng3DIhL8don6SVSSK9WO2slXEnNv9fiu4wm435pLTWvA3LgWyQfw
 xd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5zI2N5eJsydBU4Kcf42YOrHjn6io9gty356v6rFjA8=;
 b=OLoWzDbs6psnqBPe2YWCgWXnbvxLnBqLjmfE/bo1RRfJYACn4tQJ8ZTZdUUomMHVNF
 7aBSblmq4Yio5enRQKv5DpNJU05zzyqe/N7EbyGHyTv9xeSdTQEoUnn0qA0nwr8D31MN
 8MGZQ5p1qa+4xjjpTNGKe7jBjSAqgyBsXzY+EahXb+jKs23Jd4hiiqwlIwfqviJqcNrI
 bb9kBMovsqhuARgZwiKCVOv38YARZGAln66VrnUpWwLr6za3OjPF5iZ9beHCPFkqRhKQ
 bIM07DqXPKYO0raty4dV5fIJZkqyPvX5hMSR1CF1j0Hx/Y1mcIbeqov5F7mlbrQ43a1r
 Zbbw==
X-Gm-Message-State: AOAM5321dMsQt8n5Iju2Ie2ToiQC4LuX0wvMxgARvT+SLr5lZ+PfLvwR
 5WA3XjHmn6rS/ix/yCpco1fCWUS6iSH2YdRdFCA=
X-Google-Smtp-Source: ABdhPJw5kUIy++IOlDbOtcj6eYptzIgzQj2SAi2MSa+Ei/4lyq8DnBYoDk+j/GWGOqnzZS7ad9KYgr8Mgjtv7vnRJWM=
X-Received: by 2002:a17:902:f242:b029:e4:6dfc:8c1f with SMTP id
 j2-20020a170902f242b02900e46dfc8c1fmr17927976plc.0.1616237936028; Sat, 20 Mar
 2021 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
 <20210319174108.GD6832@arm.com>
In-Reply-To: <20210319174108.GD6832@arm.com>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Sat, 20 Mar 2021 18:58:45 +0800
Message-ID: <CANr2M19+FtoAiEgKecJFdkdhaBLidiGjFvNY1f1kOMsvdQZEVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 kasan-dev@googlegroups.com, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will@kernel.org>, 
 dan.j.williams@intel.com, aryabinin@virtuozzo.com, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mediatek@lists.infradead.org, 
 yj.chiang@mediatek.com, ardb@kernel.org, 
 Andrey Konovalov <andreyknvl@google.com>, broonie@kernel.org,
 linux@roeck-us.net, 
 rppt@kernel.org, tyhicks@linux.microsoft.com, robin.murphy@arm.com, 
 vincenzo.frascino@arm.com, gustavoars@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_105858_495359_1E5246EF 
X-CRM114-Status: GOOD (  15.30  )
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

On Sat, Mar 20, 2021 at 1:41 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Hi Lecopzer,
>
> On Sat, Feb 06, 2021 at 04:35:47PM +0800, Lecopzer Chen wrote:
> > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> >
> > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > by not to populate the vmalloc area except for kimg address.
>
> Do you plan an update to a newer kernel like 5.12-rc3?
>

Yes, of course. I dealt with some personal matters so didn't update
these series last month.

> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > Acked-by: Andrey Konovalov <andreyknvl@google.com>
> > Tested-by: Andrey Konovalov <andreyknvl@google.com>
> > Tested-by: Ard Biesheuvel <ardb@kernel.org>
>
> You could move these to individual patches rather than the cover letter,
> assuming that they still stand after the changes you've made. Also note
> that Andrey K no longer has the @google.com email address if you cc him
> on future patches (replace it with @gmail.com).
>

Ok thanks for the suggestion.
I will move them to each patch and correct the email address.


Thanks,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
