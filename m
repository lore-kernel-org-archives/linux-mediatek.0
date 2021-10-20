Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FE3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:25:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7879060524
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7879060524
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Umd9Pn0NJgJhmgFrrMpI4UJux3YydBSmykEClcfEGLY=; b=DJFqyJi08Vbg8a
	XzMZRizZkrFLXAEl13xGgS5fxHvMtEowvEesyiXTdFZqetL0hQoMQOXhMVT4NfwKrDMlJDDYegc0q
	Aa8oNoC1zCSmZ/E5XPesGLzU7lsAhWCxbDilSwPHc2kDfzPxOyXLPCvrCAKrDbXWqayLut//TnOIr
	dmLDU8O3sRqzHn26HBhz/0YpYAJ7Yh9iMbWc5C2XWgdH1XCu9wnCK+b+ydDcZHEExHuut0RkFWshq
	+mZbVqkOqXaZfVV3ktcYQ2qRDD6T+Io+Xr4BGJ0ZwwigicEwSn9WE7kAI+MPU/7gkETsZoyTTbpLI
	Hkf0IYDX9Vd/j0HphNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5y1-003cR8-FA; Wed, 20 Oct 2021 07:24:53 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5x3-003c52-Dx
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 07:23:55 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso5898226otp.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Oct 2021 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kU2IPRL8ftmwSTb+WFMJqCEa8tDzkDYqWbLRrE2BrPc=;
 b=Z9H2n0S4Jqv5TODlbAm7IEoBWEjHonzCDw5KhMOcpgcNdwafYI5hl846Do/Y9Ou8J4
 Nh9OI+lYpQzGZMNfGRO5QbZ3+xMSih4c4Sek/fz3wq3jfaA/UhQ2PmJWPIEmt6QuquOL
 TP0BXd6qyBb1af+2OwX6ri4+SwH+99imu7LTzy8zZbi5ghPzIVwiN653Ye0nq5o+rrrC
 E4zVgo7S5oKkaq+dyNLBBqBDm+vGVzYTAXQ3mV25+maP2TZbNC3ej7WdCTsqIr+v6DVp
 6eWasHRDjPiSmADHQhTkCVqLTX0SCxJjzT13WM6fvlfGRBPkhyjzxRa1lZ2XjHzTBFeA
 w0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kU2IPRL8ftmwSTb+WFMJqCEa8tDzkDYqWbLRrE2BrPc=;
 b=d3apbPqE783zYO/W9/NRELu41hFZjkRKFo12Cpx/PNj5cpOZBQY13+DV5rO8+bXI1s
 B9QdV2W1Sac2Mhcehrox9HtqscCgScdhIEM0eBYIPtLdtnqXpzexunNSJQE7gtpL191y
 bcQR89k2rXbtlmWA3vO2XPso5BcinYtgNg+2zT0N2P9aAAp4dEn44jBJk3kyq23c+LSQ
 lLmnhr4GtSEwesb6WXj7NxxT4ZVGJbY4tIjEKSDrxd9ni3dktBlU6A1R95vLwtcD13+Z
 6DY/s5pcbpLlWfWllaHbDAdoDbBQj065J2NlJMwuWsCGp8Ippv4fQtg2DmekJ+hVuFIj
 BsHw==
X-Gm-Message-State: AOAM531/PWPVWVQ2RSrRLNPb784QeU6Oc0QQaeQIOPit5K7mRoTtLlEX
 dNWnkGPIeRb0O1ZjQgXI1hH1Wtm4OVWSt8h9DpCmXw==
X-Google-Smtp-Source: ABdhPJxYaB/xUITs/EEyisEF1CX0Q9AbBpoCaL8yuO7fy/xV4PTxIosNxyf5PIF+8caN552qxFShQqzctqUgQlFvyzY=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr1361127otb.92.1634714627015; 
 Wed, 20 Oct 2021 00:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211020061248.13270-1-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20211020061248.13270-1-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Wed, 20 Oct 2021 09:23:35 +0200
Message-ID: <CANpmjNNxQRM5rSxcdxNOicpOvwQ=vsutQO3j1hUmGAfS9+pQDA@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: add kasan mode messages when kasan init
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
X-CRM114-CacheID: sfid-20211020_002353_518319_ECA87AE3 
X-CRM114-Status: GOOD (  21.55  )
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

On Wed, 20 Oct 2021 at 08:13, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> There are multiple kasan modes. It makes sense that we add some messages
> to know which kasan mode is when booting up. see [1].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
> change since v2:
>  - Rebase to linux-next
>  - HW-tags based mode need to consider asymm mode
>  - Thanks for Marco's suggestion
>
>  arch/arm64/mm/kasan_init.c |  2 +-
>  mm/kasan/hw_tags.c         |  4 +++-
>  mm/kasan/kasan.h           | 10 ++++++++++
>  mm/kasan/sw_tags.c         |  2 +-
>  4 files changed, 15 insertions(+), 3 deletions(-)
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
>
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index dc892119e88f..1d5c89c7cdfe 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -177,7 +177,9 @@ void __init kasan_init_hw_tags(void)
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
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index aebd8df86a1f..387ed7b6de37 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -36,6 +36,16 @@ static inline bool kasan_sync_fault_possible(void)
>  {
>         return kasan_mode == KASAN_MODE_SYNC || kasan_mode == KASAN_MODE_ASYMM;
>  }
> +
> +static inline const char *kasan_mode_info(void)
> +{
> +       if (kasan_mode == KASAN_MODE_ASYNC)
> +               return "async";
> +       else if (kasan_mode == KASAN_MODE_ASYMM)
> +               return "asymm";
> +       else
> +               return "sync";
> +}

This creates an inconsistency, because for
kasan_stack_collection_enabled(), kasan_async_fault_possible(), and
kasan_sync_fault_possible() there are !KASAN_HW_TAGS stubs.

A stub for kasan_mode_info() if !KASAN_HW_TAGS appears useless though,
and I wouldn't know what its return value should be.

Do you expect this helper to be used outside hw_tags.c? If not,
perhaps just move it into hw_tags.c.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
