Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5624C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=; b=CWDN3qcBC2WR3kCOfiidzY+7w+
	DHYIqkrhSkNMUdJ7+iQ4bw2jYVnXz8oO0yr87IxX4VrtiS92GkKxVlDfo/gE7u9jsuGL/VeLXIDbL
	b/YV3wjM7MMy9nDJl4FIGnK5Bhpj9G4XM9eZ3VtXJsjkBkGNyGCxTIYTWHbNRu/9Ozah2rfaz/5XH
	8NyHrQHXmLlIEC4bSq15QeJFzHwGuEzaTLpmm8DXwrNB37ZSUpQ2OtKXHyrED2k3s7Ju6Q8ewCy+g
	Sgzh0KtaGkutSPz2710maj0ZWnnNqZJLpXQchA00ObSfYW6NKuwbqmKvPWPY4Md1REVF6Z8ulRbEE
	bv8kejPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqyKQ-00Givl-0n;
	Mon, 24 Apr 2023 15:42:10 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqyKN-00Giuh-0f
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 15:42:08 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-76073fb4511so100369339f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682350925; x=1684942925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=;
        b=hHYQc29xYc0+ez0n0gxPaHPhBIuwJH5yRsYC58a/hCmWlnOnldtEuYw0pYW0cfX52W
         Y695ymaGQtV4o5/Tahis8uUDjd6tjdN0gu5T3g8kwneBuPSt2WewI+1pOb2QfuwWGoB2
         EQPE0SBT7IvZnNo0mcjIbBaRLv7/YFHaFU0yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350925; x=1684942925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxcjgeLi5mR/+Rnc6mrQlDv9TmBqIx7WXWMzAgilAKE=;
        b=ZuoCMuhptH6DR4Q7zG3/8OLaJvLp4HKClq8yu9n191yUIVb9xJGs81hzI9SKdGsKP8
         JtVXvtSAhod1m8iEApM8IThT3qJ78R5Bpu77xPJx6+ZaS+mR0vV4olLqhZ+X6yIPva71
         3wYWI6umelvjt7DtzCfpSQWAB4Oy+Y5Z9A59srWnnmDbOviFb8RMC4/b2PnB0hvDEMFy
         RtAy8DVAbfE7o1GpqA4x+ekvldPdCaCO7MfjD54qcw6LN6KYzSO3mAjPsF5UKktR2V/M
         T0MWXO/O2yADcvr5uvWgY3iBUJ5xpYMq+/mBJzl8BHyp1w/EZJX3Yuh1Tz94ktk0TSSf
         hsXg==
X-Gm-Message-State: AAQBX9dMLL+Q3sE24K/XjmBuD386HcyemInYFW9H7Neljc7yAgvV1JGh
	lUcHqfurSU9h1Q7lJxntcVV6tPvDYxV/nx6GpJ8=
X-Google-Smtp-Source: AKy350bfVz7p8OQCKQOz+NSRvKAhi/8eu7Ax7YogIwT3lzTHm+bv8ynaj75A2y0Ok2VHv4HPj32l1Q==
X-Received: by 2002:a92:b0a:0:b0:325:da54:ae8b with SMTP id b10-20020a920b0a000000b00325da54ae8bmr6305810ilf.9.1682350925364;
        Mon, 24 Apr 2023 08:42:05 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id q31-20020a056638345f00b0040f91a65669sm3468090jav.21.2023.04.24.08.42.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 08:42:02 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-328cb023b1dso1063115ab.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 08:42:02 -0700 (PDT)
X-Received: by 2002:a05:6e02:1606:b0:315:8e3a:f546 with SMTP id
 t6-20020a056e02160600b003158e3af546mr480218ilu.6.1682350901412; Mon, 24 Apr
 2023 08:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan>
In-Reply-To: <20230424125355.GA4054@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 08:41:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
Message-ID: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy) cpus
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Stephen Boyd <swboyd@chromium.org>, 
	Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, 
	kgdb-bugreport@lists.sourceforge.net, Marc Zyngier <maz@kernel.org>, 
	linux-perf-users@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>, ito-yuichi@fujitsu.com, 
	Sumit Garg <sumit.garg@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Colin Cross <ccross@android.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, 
	Alexander Potapenko <glider@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ingo Molnar <mingo@kernel.org>, John Ogness <john.ogness@linutronix.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Liam Howlett <liam.howlett@oracle.com>, 
	Marco Elver <elver@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sami Tolvanen <samitolvanen@google.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_084207_248071_3BA2EBE4 
X-CRM114-Status: GOOD (  29.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Apr 24, 2023 at 5:54=E2=80=AFAM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
> > From: Colin Cross <ccross@android.com>
> >
> > Implement a hardlockup detector that can be enabled on SMP systems
> > that don't have an arch provided one or one implemented atop perf by
> > using interrupts on other cpus. Each cpu will use its softlockup
> > hrtimer to check that the next cpu is processing hrtimer interrupts by
> > verifying that a counter is increasing.
> >
> > NOTE: unlike the other hard lockup detectors, the buddy one can't
> > easily provide a backtrace on the CPU that locked up. It relies on
> > some other mechanism in the system to get information about the locked
> > up CPUs. This could be support for NMI backtraces like [1], it could
> > be a mechanism for printing the PC of locked CPUs like [2], or it
> > could be something else.
> >
> > This style of hardlockup detector originated in some downstream
> > Android trees and has been rebased on / carried in ChromeOS trees for
> > quite a long time for use on arm and arm64 boards. Historically on
> > these boards we've leveraged mechanism [2] to get information about
> > hung CPUs, but we could move to [1].
>
> On the Arm platforms is this code able to leverage the existing
> infrastructure to extract status from stuck CPUs:
> https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html

Yup! I wasn't explicit about this, but that's where you end up if you
follow the whole bug tracker item that was linked as [2].
Specifically, we used to have downstream patches in the ChromeOS that
just reached into the coresight range from a SoC specific driver and
printed out the CPU_DBGPCSR. When Brian was uprevving rk3399
Chromebooks he found that the equivalent functionality had made it
upstream in a generic way through the coresight framework. Brian
confirmed it was working on rk3399 and made all of the device tree
changes needed to get it all hooked up, so (at least for that SoC) it
should work on that SoC.

[2] https://issuetracker.google.com/172213129

