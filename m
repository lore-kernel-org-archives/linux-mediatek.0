Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABE2C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC90961357
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 13:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC90961357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pL527O3e6Pped3vTt015NlVb3gn+ctqbOcvolRR6siE=; b=m59AYNvKy5Lg9W
	mdm2hoRkjOMfs5KU0xcfD6EXrGx8xfK8QSlxUUEQoCVVMNDCiMikNtRd/UxbuKBxh5G2CxbbNMaUN
	kw4EzeUbIc1/AgtsWrNGALrqmsTcHUHssdxeFQr9OKLxQCryCxyRl+AHmHL08MDq7OLFDoOS/JoQt
	jxOtxStcvmqXke56ujeflQ2MnCyFHDlEi5TMigbdvT9zN66xaT6FNVArKRwmuuS8fSv15n5oAz0UJ
	OSELzsZO8T4gqexrEOn+v4pCmdNUcAS8PV1qjPSQ8eNsMxF5uYc2II0WU9KSHzjRrQOYdiwSIuEm9
	s6/tBg55d7+bcnerDMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvgsB-007NO2-Fo; Tue, 22 Jun 2021 13:55:27 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvgrv-007NGV-5b; Tue, 22 Jun 2021 13:55:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id dm5so22298409ejc.9;
 Tue, 22 Jun 2021 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtJ7IslezInr0IjO/y83W5WcZUNJEOAxkSrY2hYdtzo=;
 b=ouzNwjxRs/VrHBOHszXWY5PYOroSfuMEQLOgkPv2T2sBOAAqq1bbesJtm4/x4LeO51
 s0iC/H3jnz7pxYyEU9K2qYA2WiEhPA3Ie2IcjdFaCHe8U+Pn8B43G+c4QuwcGNmOnWzq
 79fytTdJ2RJp6CSJHX/AuhFHicasprVa7MVyTD6xUsasGN0aqGbfs5NX8gZ35EG40GnQ
 y/M98oBs7KeKKgfJ/UhqYPs8vkzUWK2OSsHn9HayOtQjKvQjYKMFKiSURfqYXfLTmsHj
 3W7LL56gEerLDVBr3/hzQVk6YwmqovsdPmu0pBNcnhjUFli5jk1XWnqJKVvNetqm4MvU
 HLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtJ7IslezInr0IjO/y83W5WcZUNJEOAxkSrY2hYdtzo=;
 b=BfveR3HFigNDd/4EuLhmFCJMxi3Q9dV6kb83RgrXpuZD9FPsJktm3bnEoiFZauX+Rb
 PdIGZn6Iyi2ysjdkB268bE58stxd1yjLHQUYEkE0au7MzwfiVXmnzfUuaQCCauuTEmCl
 /vMV2ZdcUSNMDzBA8zlQQwzq0R87IhedGA5dOmDvsxuNoJvcfPKkoDqgf4I5Rx6rtTIZ
 VdsHG3L1XhRfppU0d2goEZL2wJ8GazYrZJnpVbjQq9wmIpgiOkorbwaa+VEe5eYvRxwG
 R0iqVrHTiKaSHnjCzJtLVq95P3Eb+0pXcT05wy969CnLa+hkXc5m7Sk6Ifw5HQVg1xAv
 8p+w==
X-Gm-Message-State: AOAM531s4+VoUgS4i5eByq5EhPrAJ6VOXDC+Qili5tU9OS1pmyoRAaU4
 5q8hmOmXCuGLao0uDBhOKhMTVbLjnauhboAngWM=
X-Google-Smtp-Source: ABdhPJy9JElAxjoK8FcIuAfranbHc7RCHMPcqWtQgY9B1Es9IrHjC2++p6pEUqWueW0g9YbeuzEqNkP9tcB/MRGNCSM=
X-Received: by 2002:a17:906:17c4:: with SMTP id
 u4mr4217576eje.481.1624370109577; 
 Tue, 22 Jun 2021 06:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-4-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-4-Kuan-Ying.Lee@mediatek.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 22 Jun 2021 16:54:49 +0300
Message-ID: <CA+fCnZcSy6LqqhbYfiC8hn16+T640uw_rnUzNPg1zsvg_RwYzw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kasan: add memory corruption identification
 support for hardware tag-based mode
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
X-CRM114-CacheID: sfid-20210622_065511_267067_3EBEB8CE 
X-CRM114-Status: GOOD (  17.84  )
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
> Add memory corruption identification support for hardware tag-based
> mode. We store one old free pointer tag and free backtrace.

Please explain why only one.

> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  lib/Kconfig.kasan | 2 +-
>  mm/kasan/kasan.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 6f5d48832139..2cc25792bc2f 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -157,7 +157,7 @@ config KASAN_STACK
>
>  config KASAN_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> -       depends on KASAN_SW_TAGS
> +       depends on KASAN_SW_TAGS || KASAN_HW_TAGS
>         help
>           This option enables best-effort identification of bug type
>           (use-after-free or out-of-bounds) at the cost of increased
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index b0fc9a1eb7e3..d6f982b8a84e 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -153,7 +153,7 @@ struct kasan_track {
>         depot_stack_handle_t stack;
>  };
>
> -#ifdef CONFIG_KASAN_TAGS_IDENTIFY
> +#if defined(CONFIG_KASAN_TAGS_IDENTIFY) && defined(CONFIG_KASAN_SW_TAGS)
>  #define KASAN_NR_FREE_STACKS 5
>  #else
>  #define KASAN_NR_FREE_STACKS 1
> --
> 2.18.0
>

Other than that:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
