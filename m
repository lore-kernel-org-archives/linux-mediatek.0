Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B509C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:30:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49EE23A7F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49EE23A7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0mTFVCQb3lI0Fa4vBYiiBwbSZPbkvYot4953+6uOi0U=; b=stmt1RYvuqo3k06IjGHFC4NE7
	MQ9KcTPjiQkfVTIa4wFXMTHYAi1/Elov8lDZbtvqlPq76CL+UoALqxejbyN6Q4WGBxm6b0B/A4Xcv
	Vkd4V/leXOjBtMt93+TIKI3+bjWturES0g5ofytiEMoilM2KySRAace8Ni3jyGOpg82wbUqPbaPaw
	DgtgYUQEvA/gUHvmLeGde0CTENzl3WW6VcJLSGNncdoieNjnagaQJWVxmywiXGZjPxNNYhHfZyYDc
	auJcO3BwR00vYoNCL6bLrguIsDEwZnYBToQkD31Wy/8+xoJmYmn2BC4pF8Ar/Ww5QSVHaF6Tk6FWS
	kNOxXbz8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwWF-0005kT-JF; Fri, 08 Jan 2021 18:29:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwWC-0005ix-Ip
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:29:49 +0000
Received: by mail-pf1-x430.google.com with SMTP id x126so6771083pfc.7
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImNmyS8KVcMriGTOlK4oD0X1A4b7wVMix0T8JHsJDBw=;
 b=Y0K7rPxt7Xxsk60fVNg19jFZvTgygV+/JV0g08lleOn3I3xFx3/pVCAHl2K20exays
 bgRQx37jUuscIru6TAY1YUB2MKnooMRFygwz/6ktZwf+kkg0C/SQON+OfJ/oW7W2WStE
 JrKrTtAiBZ7Y8ECm9juQWdQftv9s19Paay+kdH2j7DBXXHhQAmtvnmCjJUZc5zzRxONO
 nPGaC3wuxqbMV0eV2bCZtiHWCCJ46Nh2RHPMv8f7Il+0yQw+vDeyKJtnEhu/3+gFdvWl
 Fej5Denqp+sQyYl++MVYFHzquIrTUG6S36GHtVpIR744TONmjxbFaHGGsKk9DLgeXNOM
 cObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImNmyS8KVcMriGTOlK4oD0X1A4b7wVMix0T8JHsJDBw=;
 b=qSgFgLwzJk5HOlbykdHtxxxcjAzEJ2roDeovGoSnGqxePmWQSI402+CLVKMfiHXCs8
 b8OPg7S1WD8an57IM3AypRXp7RCGoVHxrWefPRFD4OLleDAyJS+YBwC9w1/pFsBxV3UP
 K2dttGyjKKExxbwrUw2p/9QZMYRJQrVfdP9kbBEJuu1eQ61rczrLl259l+n52QbCCZr4
 J3vZ0a3hCJbIHVmutSBIDqPjF656hWvSRm7dGvxaLNIlAaHeDmx6F9sOMdekWNdfQ63Q
 WrjOGv4YQpE1aNkLwJOA74Gj/nsTYbtbLnTbS03s6WD9rFtERlK32gKzlODFnOlkZQ8y
 BKrw==
X-Gm-Message-State: AOAM532mmb2Ew3qCImULqUwd3uGQR6BhvXs9m1Trtxr1TsH6bOOLGySn
 UZNAsUSFrPKusm711ltgGpdEYqHTNhh2VUmYr1Oesw==
X-Google-Smtp-Source: ABdhPJwRVQkqjw+eGZx3kmV8ynRpiyG2GnMECRiKr0qdFfd6rO/yKeaxlSxN3DB3SIBtCjRla8iMWhyfoyRubShuGWM=
X-Received: by 2002:a62:14c4:0:b029:19d:d3f5:c304 with SMTP id
 187-20020a6214c40000b029019dd3f5c304mr4738308pfu.55.1610130586296; Fri, 08
 Jan 2021 10:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20210103171137.153834-1-lecopzer@gmail.com>
 <20210103171137.153834-4-lecopzer@gmail.com>
In-Reply-To: <20210103171137.153834-4-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:29:35 +0100
Message-ID: <CAAeHK+wc-DU2pUma43JtomOSy0Z6smGKwQoG_R+uKzByu3oZ9w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: Kconfig: support CONFIG_KASAN_VMALLOC
To: Lecopzer Chen <lecopzer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_132948_642862_46FF8D88 
X-CRM114-Status: GOOD (  20.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, yj.chiang@mediatek.com,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 6:13 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> Now I have no device to test for HW_TAG, so keep it not selected
> until someone can test this.
>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 05e17351e4f3..29ab35aab59e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -136,6 +136,7 @@ config ARM64
>         select HAVE_ARCH_JUMP_LABEL
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
> +       select HAVE_ARCH_KASAN_VMALLOC if (HAVE_ARCH_KASAN && !KASAN_HW_TAGS)

KASAN_VMALLOC currently "depends on" KASAN_GENERIC. I think we should
either do "HAVE_ARCH_KASAN && KASAN_GENERIC" here as well, or just do
"if HAVE_ARCH_KASAN".

>         select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
>         select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
>         select HAVE_ARCH_KGDB
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210103171137.153834-4-lecopzer%40gmail.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
