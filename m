Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB491C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 17:44:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731D921973
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 17:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731D921973
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iOYV8rCap2CQFBURgVr/PR75HTQD+I9wkUEHU35KqGk=; b=Et3HKV8YVCSmpJlUIrWdA+zv8
	CaSeJ96fGaNL0Vp8KSkLr6hytXBdWTd9/sqgavO7F/wuoXGSf3YMShZXWXXoA4PFgylyG6U/HNBvl
	fudTWHiarh7/FaJxKvWQSv0tastz7TMUOYYX4l86EtZ+7E5KIlGv7ItReQUbPV18MczdgH/Hc5UIV
	2ZmqN1PubDY1gwfdLjy6uWDTYW53uE/qR94sunkpLU+GuoGQMM/YFdd0NarR/cb3y4psTHsTtfV5U
	UfUE+1T/vVV0PL15Y8Gfvk7JH9AfuHJBa/7YQoAYA7OYDVHQC8W00+bh6fcJ19tkmupS5ROtLpbPN
	MciVMdg6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2e0X-0005FE-3R; Thu, 21 Jan 2021 17:44:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2e0Q-0005Cm-VK
 for linux-mediatek@lists.infradead.org; Thu, 21 Jan 2021 17:44:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id m25so3680612lfc.11
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Jan 2021 09:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGFFrNGI7jcGt2Ckr0yJXz+AGAE1X7qRw3reHpjfkCo=;
 b=J12Eeog0Fmap+TFn4o/BsRtL7RlGoYr9aj69/43ryqDeIrWZz8O6eH3sz5fK53lCfO
 qnr/dqzpguIc3RrhDca00qs4rrR0tqou94HFCsKOtEhd6HDtMGGi54t6i46TsgWVebuX
 jKtbmWIYK6O0f/MtgRBg3y4uGtbSbHc2ls/2t51tJbSZYZRBJXCaPqDZnq6snLtBxBEi
 hMB6HkZ19FL5DDJDI2OYkePCcK2PizBGXnk+KQuX26g1Qc6qJyN4wPWHML2sUt4qKUHq
 HxWsl17O7gfL/vzw25lb5ywfX54GGxZK23gwpTeixXxKkOCl/TYKKeCU11uxcI60XHEC
 /vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGFFrNGI7jcGt2Ckr0yJXz+AGAE1X7qRw3reHpjfkCo=;
 b=k8rcP42r3zTNsEtUXFY2Lft8mwm+nrB9swQ2fM9S+x4Wh96H1zYO/H+0hC9gcENYy1
 7gjz3BFRhGhbcrQWS65ID2uNYkxc3MsvvW+0iL0QEYDwWGODpJbpl81Dylqtu1OVQh/I
 b5/UlmfMBCV0AzkQIkfcRP2snxOBWkeLUp0ipWo8okjL3yh+QBXi4a7KYt5vi3XNY1rN
 BWOgQ9iG1vq52DqoE7hFm3+DP1qMvxt0MVBTqIi8xN1nrjK7QCyh/aklA+FZHL4seNxa
 JsNZHu3R5hp4z77DVl2vjN8EPmcXXLdiB1yJmpO5zueOQfkLahVXKBPEQSKSfqN6IXwg
 56MQ==
X-Gm-Message-State: AOAM532tMJVLAPglaM3HLwpKXuknYqWsvD5b8pXTxiiZO9V4akQfknn1
 JaaWyhEHxFrP9qBLRkt3uXVHp/e5SYW8Yb7houJ7oQ==
X-Google-Smtp-Source: ABdhPJz1rdXjr4kjJRfAIPtA5v/PBKyGfr+IQ8wFx1vJw2FImN+X5pXM0D8QGr3CCQmd07fO+vj8gob8yfyQ4f+xWfg=
X-Received: by 2002:a19:434e:: with SMTP id m14mr162866lfj.73.1611251065593;
 Thu, 21 Jan 2021 09:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20210109103252.812517-1-lecopzer@gmail.com>
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 21 Jan 2021 18:44:14 +0100
Message-ID: <CAAeHK+z3oYx4WqX7Xor7gD=eqYkzW0UBS4h4is00HnfNnNkpDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_124427_098694_A509C529 
X-CRM114-Status: GOOD (  14.75  )
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
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, tyhicks@linux.microsoft.com,
 Alexander Potapenko <glider@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, yj.chiang@mediatek.com,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Guenter Roeck <linux@roeck-us.net>,
 Lecopzer Chen <lecopzer@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Dmitry Vyukov <dvyukov@google.com>,
 gustavoars@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 9, 2021 at 11:33 AM Lecopzer Chen <lecopzer@gmail.com> wrote:
>
> Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
>
> Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> by not to populate the vmalloc area except for kimg address.
>
> Test environment:
>     4G and 8G Qemu virt,
>     39-bit VA + 4k PAGE_SIZE with 3-level page table,
>     test by lib/test_kasan.ko and lib/test_kasan_module.ko
>
> It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL
> and randomize module region inside vmalloc area.
>
>
> [1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")
>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Acked-by: Andrey Konovalov <andreyknvl@google.com>
> Tested-by: Andrey Konovalov <andreyknvl@google.com>
>
>
> v2 -> v1
>         1. kasan_init.c tweak indent
>         2. change Kconfig depends only on HAVE_ARCH_KASAN
>         3. support randomized module region.
>
> v1:
> https://lore.kernel.org/lkml/20210103171137.153834-1-lecopzer@gmail.com/
>
> Lecopzer Chen (4):
>   arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC
>   arm64: kasan: abstract _text and _end to KERNEL_START/END
>   arm64: Kconfig: support CONFIG_KASAN_VMALLOC
>   arm64: kaslr: support randomized module area with KASAN_VMALLOC
>
>  arch/arm64/Kconfig         |  1 +
>  arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
>  arch/arm64/kernel/module.c | 16 +++++++++-------
>  arch/arm64/mm/kasan_init.c | 29 +++++++++++++++++++++--------
>  4 files changed, 41 insertions(+), 23 deletions(-)
>
> --
> 2.25.1
>

Hi Will,

Could you PTAL at the arm64 changes?

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
