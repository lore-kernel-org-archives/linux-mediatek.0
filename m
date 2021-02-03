Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0877DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 18:31:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A55864DD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 18:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A55864DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WKV68k8SF/vJ84a+LySvdrKA9n1qllgu+jy8fLqmrOE=; b=SGsJrF/cPKXhMqvNgtR3EU5lg
	zX6PuJM4LKhQ6FRks68D9qU7JZW/5UVv8cZi67JbiphXkitJXf/ZvNcfF4saD/Ombv7LxkCXfDhbA
	eHxO4O/cSd6ixegK3yQiWhfTyJUnwtT+QmwuMz34/nishNYwH2WI60taYszBJ0ReTMDjfUUj6TQxh
	UoiQY3bd+GUwS9U5ccViS/sQG2neJ2V+xmKK7rzjr5A3Vu7KihGTUjfXXVnSGYmu8pUiMpip5BjG5
	yZXEetySfp5ASubeJPAEWo4Ear77snXAUj4pM1+EUVtBXWEprKNW0XUop/MbaHTgIafSi02XlXQ/K
	klwe3FDsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Mvy-0005Om-Pt; Wed, 03 Feb 2021 18:31:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Mvv-0005Nz-6O; Wed, 03 Feb 2021 18:31:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C53A64E4A;
 Wed,  3 Feb 2021 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612377076;
 bh=qgQXHCOO+dJ+yb7nrlrPLjaNfhwMNTK/2D37AWkM2GU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b4uhGDj52vIKbtPiEWqq6RhUatbEdurtjYlGgyr7LWPklmvbj2u1z3+Lx/k8RQt1T
 HZyqx68WLYsu0TznjDJ4lHXrDYntGoKDBbhRJbobky+2Wimi2VREIb0PAqlN2675og
 yel0vm/LPzBvVmayjkxbnfd1aLeDkst1I/ksdo8xNE7QQiN++Vk5S9f6/rE0g7RxVW
 CNsnE3vQA9eiJdh+dYpOaM1CJzZRrh8QDUsYjDhbx83MMfxkt4LlijKd+Ye5miJ6dO
 32WsIbWjST/lwfcIqaPl5Q31R+Sr31uywgKs8ywZ/frDesQ3LJQKNykE3EdgTCIbqe
 qcRKP1h0Vzd9w==
Received: by mail-oo1-f52.google.com with SMTP id y21so105147oot.12;
 Wed, 03 Feb 2021 10:31:16 -0800 (PST)
X-Gm-Message-State: AOAM533+E+EaGZpg4WoV74ujzmhPB06eHZtFxzAEYCZC8ff2vDBBUNMy
 +3gjrpC4C1PJsvggOWQvAGU0S/og3UAZtKG5DO8=
X-Google-Smtp-Source: ABdhPJzwd5KGkhGPt/OEU87BbYt91cpEEmblkRtD+YcxL6JmFSvKeQgDP7VxawLeDkwKP+ZjxzWQ0TT7IuF1t2mYdTQ=
X-Received: by 2002:a05:6820:283:: with SMTP id
 q3mr2987191ood.13.1612377075690; 
 Wed, 03 Feb 2021 10:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20210109103252.812517-1-lecopzer@gmail.com>
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Feb 2021 19:31:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE3NHBt2YdQ4ESygRZUdUZbpD66rZ6wziPi8OAqfKvNJQ@mail.gmail.com>
Message-ID: <CAMj1kXE3NHBt2YdQ4ESygRZUdUZbpD66rZ6wziPi8OAqfKvNJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Lecopzer Chen <lecopzer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_133119_413874_9FC0306C 
X-CRM114-Status: GOOD (  14.09  )
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
 Catalin Marinas <catalin.marinas@arm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Tyler Hicks <tyhicks@linux.microsoft.com>,
 Alexander Potapenko <glider@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 yj.chiang@mediatek.com, kasan-dev <kasan-dev@googlegroups.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Guenter Roeck <linux@roeck-us.net>,
 Andrey Konovalov <andreyknvl@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 9 Jan 2021 at 11:33, Lecopzer Chen <lecopzer@gmail.com> wrote:
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

I failed to realize that VMAP_STACK and KASAN are currently mutually
exclusive on arm64, and that this series actually fixes that, which is
a big improvement, so it would make sense to call that out.

This builds and runs fine for me on a VM running under KVM.

Tested-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
