Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F550C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 20:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60FE23A9C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 20:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E60FE23A9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/e8MF8CSOwNW4Hc56z+hT5eoBSWqoXXo5klqXVbxRQ=; b=KpY+pOIflWlY0kjNuuyAGE37t
	fw8hR1P/JK62qjXHDfqSEb0jnMGWF6qM1uZI6bbh3zW00qOkEoC18RwXJRgr1lHvt2Pz2xATYkDiL
	+HwPC07z4FfmO0f8m/a5kU/rmWq99kxo1MG9i5ORyKV2EZWaC7d8PpFchCx3pzETJ1mXhxUunXOj3
	IwMYK1VuZe3EMj5s44ytcBGQ9ZZPUxmDDNCjfLpwQ/UJma8aWxNSdo8BQ2wwWq5zmX7FGZ69h5JnP
	ZFHJPcgYiyLvpI6dtuSVyPe9MhGmBQRJx8JKJFGMBX5UxVK6ccDiXFG9hq2K0sDBFJVLPxMe0pFQI
	nJNTTxKPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxyPk-00056S-OG; Fri, 08 Jan 2021 20:31:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxyPf-00054a-9l; Fri, 08 Jan 2021 20:31:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 808DC23AF8;
 Fri,  8 Jan 2021 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610137870;
 bh=dN/vCuTfi01My7gqxrmbsoNneHB7mr8tZmJby3DM2Ts=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CK8hMSmJlda2+nQd/elAbLb6PsPulkmBsfLI7uMcP/u5n2IrnaEt6BIOaRTYJxiwY
 LBj5ATT03OE7SXXkvjFHc+eADEWghwWQKrpuKdFN3I/CzOpVcQan+Atg0NaHa47OtK
 LmzxK/798PUNYHO/fGwACW0KH8Hi+652iL6SuDv9yndLXV2iiLwzJVi2Oz69n1Y4Sj
 N4pQqvohaveCDIzjwey5Z4V1PB75s0hXmo0GQO22OxC/+55xIxTHx9KeACIS2j/3r9
 ye3R2dyzshr3vWK4ht96ESK7jnEbEUFyFgrCrJjEFGnE/hffyiVcsF/VVMJslTZ68Y
 379cIu9sAq4Gw==
Received: by mail-oi1-f172.google.com with SMTP id q205so12713384oig.13;
 Fri, 08 Jan 2021 12:31:10 -0800 (PST)
X-Gm-Message-State: AOAM530WpaW9Uy7Bk/cbmRJwPaGethvV8D/cy3+0eA3GcQUAZMLUT48V
 ge4LDA/SCAi6WnXWXYK7g3rTLrYM5ATA9fkIf80=
X-Google-Smtp-Source: ABdhPJwYZTJvr7kFzDF/qWiLnN5DYHOF+FSG0HkLBoXAW+tr4GMnTQfrliSZqYEPhR50hYyWxogqt+5hi3LKcOotPiU=
X-Received: by 2002:aca:44d:: with SMTP id 74mr3515461oie.4.1610137869802;
 Fri, 08 Jan 2021 12:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+wW3bTCvk=6v_vDQFYLC6=3kunmprXA-P=tWyXCTMZjhQ@mail.gmail.com>
In-Reply-To: <CAAeHK+wW3bTCvk=6v_vDQFYLC6=3kunmprXA-P=tWyXCTMZjhQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 21:30:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FakV-Y9xkoy_fpYKBNkMvcO7DPOQC8R7ku7yPcgDw3g@mail.gmail.com>
Message-ID: <CAK8P3a3FakV-Y9xkoy_fpYKBNkMvcO7DPOQC8R7ku7yPcgDw3g@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
To: Andrey Konovalov <andreyknvl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_153111_455247_2E1936A8 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 7:56 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> On Fri, Jan 8, 2021 at 5:09 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:

> > @@ -2,6 +2,12 @@
> >  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
> >  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
> >
> > +ifdef CONFIG_KASAN_STACK
> > +       stack_enable := 1
> > +else
> > +       stack_enable := 0
> > +endif
> > +
>
> AFAIR, Arnd wanted to avoid having KASAN_STACK to be enabled by
> default when compiling with Clang, since Clang instrumentation leads
> to very large kernel stacks, which, in turn, lead to compile-time
> warnings. What I don't remember is why there are two configs.
>
> Arnd, is that correct? What was the reason behind having two configs?

I think I just considered it cleaner than defining the extra variable in the
Makefile at the time, as this was the only place that referenced
CONFIG_KASAN_STACK.

The '#if CONFIG_KASAN_STACK' (rather than #ifdef) that got added
later do make my version more confusing though, so I agree that
Walter's second patch improves it.

Acked-by: Arnd Bergmann <arnd@arndb.de>

On a related note: do you have any hope that clang will ever fix
https://bugs.llvm.org/show_bug.cgi?id=38809 and KASAN_STACK
can be enabled by default on clang without risking stack
overflows?

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
