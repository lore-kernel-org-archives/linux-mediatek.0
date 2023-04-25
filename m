Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA62C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=; b=Otg801QqhIwDp6fkaRdM6qrA+I
	8Q5t85MoUIjmCWRLHPq/TIsFowfWacYdr+tqfbmGfx+jGK783ZlrY3+nYkRkastRT8jyantQ/G2ml
	BwvaH0I2/WlR1lai6J4B3isz1p8osVaMqtA0XFsNnedVbp2M73Z7WWa44a/B7tEC8TDvtk4lxEXB9
	vh2mGk+Ca8yZChuq86rRbX0iZQU3XIRBkjN718WaBQf3Wjkmrh8ZApIprvxnAb7r1goguXY0SFkxG
	u9s43VEgw5V1O8N+1o8xySz54gIDLhtiRNBoRm0C+HDFgei+tsuQgtZZix2gSH6RZ3nLbI+n+QgXv
	igVYYWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prAkt-000Bfh-0A;
	Tue, 25 Apr 2023 04:58:19 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prAko-000Bdh-04
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 04:58:15 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-77106047c7dso1828309241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 21:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682398693; x=1684990693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=;
        b=k3XV60WtJ8YMysqovT9YhRYgpEd3fPrfMP8xP3WyLDFZswa8v2GYB46Ev5DxbFD5nc
         RuJKXezVmmJrdgkFAt9iWF3YEjqeJSXMunLkaukhgkH8zzrAF+ez39Pawp5HK7feOZ1N
         IN4GC6aVG+FvqSXZGlA858GGNB3CYrsr8ZCac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682398693; x=1684990693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKKkeNYy26t1TjKVwBgMLbds1eKVkw1hMyFByHcDzQ8=;
        b=UPIsrvS21pRbiVwS7PuTO8y7JFsvIfA3TffSRnCVKQxHUcRJBTj2HpeVE5bvpnXKC3
         hMQP0XnGrGl5zEz08P54trQmz7SWR6Fl3bPH66yxVyBT7lGKtJzjDkd4kQfY28jY/XAG
         rgtEt0IK9c1HSECPmsBR8UrDeROA11Z9DRdbta4c3+TFG4829//RVWSlzEXqhmMbOdGP
         lJ8sw4BTcxZHD2DI2oGka2kbxYx1nGpkD1/14i9yqYyU8obKho+/BqoDZHUCJ0RsPpP8
         UEdtAQirtKKGVoqvl7u9KRfLEIGmXc65yaBzHK8ZqXgQ4m3/o92F5Z93j9m7mQpzt57M
         85Vg==
X-Gm-Message-State: AAQBX9fJjiOOhGEWos+UEuLThhhXebb3RUr4vUII5w+OaX493s2QhWgT
	P1+EAdmcItG7tKgF+XwVgfmXTTXeWuzRAM930M8pGA==
X-Google-Smtp-Source: AKy350YV9yq/BYIVC0vQ1BiX8lbq0Q/kk/Y+qtOenk4wtXVHcFqYgVVennu93j8KBIiSa0redLYnm3nczDpo6ZTYECw=
X-Received: by 2002:a1f:cb02:0:b0:43f:a097:5e8c with SMTP id
 b2-20020a1fcb02000000b0043fa0975e8cmr3429523vkg.16.1682398692723; Mon, 24 Apr
 2023 21:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan> <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
In-Reply-To: <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 12:58:01 +0800
Message-ID: <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy) cpus
To: Doug Anderson <dianders@chromium.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, 
	Stephen Boyd <swboyd@chromium.org>, Chen-Yu Tsai <wens@csie.org>, 
	linux-arm-kernel@lists.infradead.org, kgdb-bugreport@lists.sourceforge.net, 
	Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, 
	Will Deacon <will@kernel.org>, ito-yuichi@fujitsu.com, 
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
X-CRM114-CacheID: sfid-20230424_215814_130295_5DCD6073 
X-CRM114-Status: GOOD (  33.36  )
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

On Mon, Apr 24, 2023 at 11:42=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Mon, Apr 24, 2023 at 5:54=E2=80=AFAM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
> > > From: Colin Cross <ccross@android.com>
> > >
> > > Implement a hardlockup detector that can be enabled on SMP systems
> > > that don't have an arch provided one or one implemented atop perf by
> > > using interrupts on other cpus. Each cpu will use its softlockup
> > > hrtimer to check that the next cpu is processing hrtimer interrupts b=
y
> > > verifying that a counter is increasing.
> > >
> > > NOTE: unlike the other hard lockup detectors, the buddy one can't
> > > easily provide a backtrace on the CPU that locked up. It relies on
> > > some other mechanism in the system to get information about the locke=
d
> > > up CPUs. This could be support for NMI backtraces like [1], it could
> > > be a mechanism for printing the PC of locked CPUs like [2], or it
> > > could be something else.
> > >
> > > This style of hardlockup detector originated in some downstream
> > > Android trees and has been rebased on / carried in ChromeOS trees for
> > > quite a long time for use on arm and arm64 boards. Historically on
> > > these boards we've leveraged mechanism [2] to get information about
> > > hung CPUs, but we could move to [1].
> >
> > On the Arm platforms is this code able to leverage the existing
> > infrastructure to extract status from stuck CPUs:
> > https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
>
> Yup! I wasn't explicit about this, but that's where you end up if you
> follow the whole bug tracker item that was linked as [2].
> Specifically, we used to have downstream patches in the ChromeOS that
> just reached into the coresight range from a SoC specific driver and
> printed out the CPU_DBGPCSR. When Brian was uprevving rk3399
> Chromebooks he found that the equivalent functionality had made it
> upstream in a generic way through the coresight framework. Brian
> confirmed it was working on rk3399 and made all of the device tree
> changes needed to get it all hooked up, so (at least for that SoC) it
> should work on that SoC.
>
> [2] https://issuetracker.google.com/172213129

IIRC with the coresight CPU debug driver enabled and the proper DT nodes
added, the panic handler does dump out information from the hardware.
I don't think it's wired up for hung tasks though.

ChenYu

