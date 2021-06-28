Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F57C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACDF613C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ACDF613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PU7nafRSaS3IvesU3IQL+ucxkIErS8X3mReSqe0vfM=; b=aBFjA5ATffaEFa
	gQVxQZnMOz1kfBh7oJ+FmuDCB7ZxsvEGYcjaC4zC6cCu5tZ7aKMtuwwgXhYo8mx/AOEdS0mfjp/bM
	Rlc/l9In/TQ5R8JkD5ann3LvXXxUTwhwCNcAcqsQnA7IsT07XKOLRXF1Cwhuw1jSCmpDrS4iZZRJW
	Oy65A2kRzBdnUfNTj9h6XY6fOQ/pZi2gUYmEiGRcvgLKaaujfjH0haxCNljs3ugJaU2Hh2mby16IT
	rJvUf3Lfj/n+OVJkCcHxs1KI0XoiaRKuzvtHQC43L+0nNfI/Ot2DhttmlxmyE6FoEYk2S4oxGj1K7
	w//niYBZX2gwOUdMYrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxkKn-006vLY-JJ; Mon, 28 Jun 2021 06:01:29 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxkKj-006vJQ-IF
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 06:01:27 +0000
Received: by mail-oi1-x233.google.com with SMTP id t40so20741438oiw.8
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Jun 2021 23:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3eoMbUJoUpBqjeLK9yBay7/GW88cz7V1P5CryiYnRUc=;
 b=J8O8csduHCymdY8XfO0RVZLJRr4hRLUgwxNepl6Atq+rB0+W5XLcelj4QYEBXC1n9d
 GF0w2QcynCMaGY+VzxfLV4K8Uu/SqweIeov3c3s9iHIyee7wiZ0WDSJrpYUax6SDiQg+
 kLj+6ijATACxk6+1ulRD0hZL3G5VwYOGVQ07Mh19QqyolZpf/QwRj9FwW2cyqc+K2Nu9
 7x9TPZtuoivyd/9GsmW3q5uCut1l8StFHe5oHgix4JKmZsnOsFBaWIzkFccKukwiGi8U
 GNrLydbyjRXaBaIgo5GzNDp7lSxj2245oVXqbgmyNlXAq5qO7Zy+MUz7S3JbLdic6Vp7
 065Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3eoMbUJoUpBqjeLK9yBay7/GW88cz7V1P5CryiYnRUc=;
 b=AXf2r8YFy7Uub8gCeFX3AVoqSK5jhbLW1bRDQCLvAtXtjs95F0A7MZe5GLnjwfdeye
 w6YOQmMQYhiQRy5EjtruLEN9QXQUFyV5oG2e++RNIdn9kAnRhiPzCSqBT7dAfbUn2Qev
 4y2EvG+jrBLafzpkxPlLKTJbfXYS1HRs2c0UU0u3D14XcVaQEzgQ2uxnULrhqBBZpfn6
 nXYs0NTs7+PhQzjlaIPBQG5sAPdoPLmxwrgeE2l9xm4eUluuG+4xodB/Sop1avrBfblI
 Nwm05enA/Cw+nCITJgFx61Z8IrLZO8D0u2XULWk4RH3GEFfiDx38ZjnphHOkvAVMd6H9
 34Cw==
X-Gm-Message-State: AOAM532yKYFep37WmTTCPjI7/hFa9RaqMCfFbm/oHNkS2YV5tgPDbAKq
 DSgD4VKmTMrDNLLISXZRc1PKLIFNzY64jCorKWFRNQ==
X-Google-Smtp-Source: ABdhPJzsU3jCobviaf98Fdqeq3OWjtnCAdAy7cMWzNILO5gKNRlbIaIlW8OeNQH7gdmWmGmtmuZWOcB52mJfeobr3Cs=
X-Received: by 2002:aca:ba06:: with SMTP id k6mr16233354oif.70.1624860084112; 
 Sun, 27 Jun 2021 23:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
 <20210626100931.22794-4-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210626100931.22794-4-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jun 2021 08:00:00 +0200
Message-ID: <CANpmjNMyHQuUF1KwGj7cMgWVL-TifC52uZu54GgtS9SziyuXdg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] kasan: add memory corruption identification
 support for hardware tag-based mode
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
X-CRM114-CacheID: sfid-20210627_230125_685430_E5412714 
X-CRM114-Status: GOOD (  19.29  )
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
> Add memory corruption identification support for hardware tag-based
> mode. We store one old free pointer tag and free backtrace instead
> of five because hardware tag-based kasan only has 16 different tags.
>
> If we store as many stacks as SW tag-based kasan does(5 stacks),
> there is high probability to find the same tag in the stacks when
> out-of-bound issues happened and we will mistake out-of-bound
> issue for use-after-free.
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
>  lib/Kconfig.kasan | 2 +-
>  mm/kasan/kasan.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index fdb4a08dba83..1e2d10f86011 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -169,7 +169,7 @@ config KASAN_STACK
>
>  config KASAN_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> -       depends on KASAN_SW_TAGS
> +       depends on KASAN_SW_TAGS || KASAN_HW_TAGS
>         help
>           This option enables best-effort identification of bug type
>           (use-after-free or out-of-bounds) at the cost of increased
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 952df2db7fdd..f58672f6029a 100644
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
