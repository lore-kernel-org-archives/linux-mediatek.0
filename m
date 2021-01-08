Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ADDC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:42:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E8023A5A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12E8023A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I/0J3dZK/Vic3zj9NlkEy5YNmDH96iRhrhIt1n8gFN0=; b=LOfQwsAcV8Pi/z2q/VPsIzAaU
	acn6+W3tescERMMfVyTnmJYjygmOoZ3IUInj/ofe4T87HMBED0q18EIrQT/HCUWMrUrPcNz347MZ9
	fhyjnC9Hgo/sT6hiaFuT0p/1w1MNBcxVt8o6JIA4sOWoHbPZo9zjlcCe51X7j8kcDodJZofshG0QW
	cuFENerrgEAAe8s/ArOyf/jGyPxiYKL7uDsuKMjj/I83XFnIDWIpNlLDKb1Q/iCM2dNNyOeccSVSX
	za9xndC9ubNHQrHoLQioLZ/qoxsqcX4O9N46m3MzwEiFl7CxbP0GfUh9ylaodynQSQK8Vmj3aJDYY
	joz2yNh+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwhv-0008No-Pi; Fri, 08 Jan 2021 18:41:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwhq-0008MT-Ut; Fri, 08 Jan 2021 18:41:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DCB223A7F;
 Fri,  8 Jan 2021 18:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610131309;
 bh=tkonPwlabkLXLyMxiiESIjCklszdN86fUImv8DVDBWE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IKNY7oVKNuPzRros5fM/7vBHlMCNd4HwHKfOex1gRPKTK/iE9/h3miejxLoeRK+hV
 gov7ITt3IDhunwKV/Iz3vOI5SlXIaYPrwvIdhyRzrdYlw1XSozjVOc6qCP5P8WdLwI
 7Lwz9a8ssTBS9ZW4gzUcskhNHOiS+arAsFVxq9eqJ1dI2JsFRaJdTSzH6EQEF1zkru
 ysWcgcurunZxBLSj6LwtoTQN+67QHuwoH5st5XI1lCeR7qjxFv6ENJYmHY7wm5M8BB
 ruvlLpCCbDMM0LhohoDGaL6NOOj+7OnHxIwwCeRItOgSALMPRJ+qb+Rj+Y1jIgWm7L
 F4fr9OSbx+cxA==
Received: by mail-oi1-f182.google.com with SMTP id f132so12348645oib.12;
 Fri, 08 Jan 2021 10:41:49 -0800 (PST)
X-Gm-Message-State: AOAM531wyDPwFeiK+DYrBsRz7T8fA6uR3CTmKyxwojGytUlMUucdRkhe
 pCWIUN+E7gpQc87u36UI2TSi2U0cTQ1Afb4Wdgc=
X-Google-Smtp-Source: ABdhPJyF6RpCzxKa/lecY4GdxCfZbTUh3I+6FsPQwG/WCqXte4+mxyac9+wbRo4e2HSt3x5nd8cXBeC7aZkaX3l5ptc=
X-Received: by 2002:aca:d98a:: with SMTP id q132mr3228281oig.33.1610131308441; 
 Fri, 08 Jan 2021 10:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20210103171137.153834-1-lecopzer@gmail.com>
 <CAAeHK+y=vEuSe-LFOhxkEu4x0Dy2jYts18R0V6Pbv1-5Cwg9_g@mail.gmail.com>
In-Reply-To: <CAAeHK+y=vEuSe-LFOhxkEu4x0Dy2jYts18R0V6Pbv1-5Cwg9_g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 8 Jan 2021 19:41:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHFOQMV_4pYp9u9u++2jjQbHuLU95KeJTzrWXZWQTe_Tg@mail.gmail.com>
Message-ID: <CAMj1kXHFOQMV_4pYp9u9u++2jjQbHuLU95KeJTzrWXZWQTe_Tg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
To: Andrey Konovalov <andreyknvl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_134151_148021_9D592D38 
X-CRM114-Status: GOOD (  18.27  )
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
 Linux Memory Management List <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>, yj.chiang@mediatek.com,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Lecopzer Chen <lecopzer@gmail.com>, linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dan Williams <dan.j.williams@intel.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 8 Jan 2021 at 19:31, Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Sun, Jan 3, 2021 at 6:12 PM Lecopzer Chen <lecopzer@gmail.com> wrote:
> >
> > Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> > ("kasan: support backing vmalloc space with real shadow memory")
> >
> > Acroding to how x86 ported it [1], they early allocated p4d and pgd,
> > but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
> > by not to populate the vmalloc area except for kimg address.
> >
> > Test environment:
> >     4G and 8G Qemu virt,
> >     39-bit VA + 4k PAGE_SIZE with 3-level page table,
> >     test by lib/test_kasan.ko and lib/test_kasan_module.ko
> >
> > It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL,
> > but not test for HW_TAG(I have no proper device), thus keep
> > HW_TAG and KASAN_VMALLOC mutual exclusion until confirming
> > the functionality.
> >
> >
> > [1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")
> >
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
>
> Hi Lecopzer,
>
> Thanks for working on this!
>
> Acked-by: Andrey Konovalov <andreyknvl@google.com>
> Tested-by: Andrey Konovalov <andreyknvl@google.com>
>
> for the series along with the other two patches minding the nit in patch #3.
>
> Will, Catalin, could you please take a look at the arm changes?
>
> Thanks!
>


If vmalloc can now be backed with real shadow memory, we no longer
have to keep the module region in its default location when KASLR and
KASAN are both enabled.

So the check on line 164 in arch/arm64/kernel/kaslr.c should probably
be updated to reflect this change.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
