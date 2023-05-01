Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44382C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=; b=le48u+PqtcQSM/p9RRL24skuek
	OlOdV+tJHgdWJmA1cLqdv8wH10bqaBKAbpwrJPclO58Mk1tDJKcLc4uhcWn+LkHnUKz5UNeu6P0tx
	D856TughNfHhbI6WVWgJlbOmqOMIjvo/p1V8pu86QhXjgHPUzdqHV7yigmtlLM8Ru0WOX6aBooyMN
	5t+wBc9A+tDVexgGIA/cxZKGhhSZA9iUUcnFtJhepj1zHZ8LJ2k4MsFLXVFXr8FGGViBM57NElXeq
	pG9j661L+yvkUf9p240R7z2UJj+ZuAC8XQzWhwKsvpUv3d+0iuuSVx6BsNEPFDsrS5GhQiFaiswLg
	tjxb4/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVFc-00GDEw-1b;
	Mon, 01 May 2023 15:15:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVFZ-00GDET-0h
	for linux-mediatek@lists.infradead.org;
	Mon, 01 May 2023 15:15:38 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a8a59daec5so24333091fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 01 May 2023 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682954134; x=1685546134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=;
        b=WeuMxcmt6zuOxyqNqOnRrnXRypbjzJaj4bRVY9J0GIxqTKtD76Hz7R089Ce30/rLJ/
         gHajBhxqrJ6veopXCMW5x7TKRUNijyBlnEKyGJ8aj90wzHdKH6n7NiPSZIsvqK4cAcJl
         vmDfbrK1AnSo93T5nMGCDIqgBVFKJjcOs8FMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954134; x=1685546134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQb1XVaufUW5DJA/7lHcfBPSDH2dGqwat0C76pMtYrg=;
        b=DCivHAIwVcpF08nsFiGUpTVav6qDII3V4lBxEBwmzEjexKaImnBpqcYp0eh0rR6JOQ
         RIm4vUlkFYK8xkKlVXescUmomOCsgIcelGsjlcFtVo8xOBnEs7Cd0dHX4xrJvL05QVBn
         2v6p0zNFc2buq+mlgBIjv54NhiJ0HUlSqOXe8DUX8b/uh6YhpLIkQs6pc+h3JU9tXMC2
         b/D6BtqcV7+7FJ7AZvkDKte7OcIm6AugS55ydYf4WEedxiZRw0oduDThtZaMDGVcm9Fo
         TLeStkOJWf5V7H20pRIJshSxwFcqtTmrGVdFcek+lQSF6Bj0b1C7uzzw6aPfVU+asdca
         bOvQ==
X-Gm-Message-State: AC+VfDzBdRQBkAy717p1yunu1n1V008f6XphBX9zW6leXjRSFd7p5l8G
	DKTL4rj6a+9HqxIa7INRoMEqdSRBicHUVuNVaLK7+rg8
X-Google-Smtp-Source: ACHHUZ4PhwiFpGplFmqro0ho3n3O603x9YSCqURHojNQdGRitKOUYwrXBhz4UN8nbv+gUheZCxy12Q==
X-Received: by 2002:a2e:9658:0:b0:2a8:d021:4121 with SMTP id z24-20020a2e9658000000b002a8d0214121mr4035787ljh.26.1682954132816;
        Mon, 01 May 2023 08:15:32 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id a23-20020a19f817000000b004ee85d1444esm4788625lff.208.2023.05.01.08.15.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 08:15:32 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4edc63e066fso22467e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 May 2023 08:15:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3d87:b0:3f1:74cf:8563 with SMTP id
 bi7-20020a05600c3d8700b003f174cf8563mr484739wmb.5.1682953706729; Mon, 01 May
 2023 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUJJ-JBxWuHm573jRDcrLCp4kRUhvOSw3jjsMAc5VbdMg@mail.gmail.com>
In-Reply-To: <CAP-5=fUJJ-JBxWuHm573jRDcrLCp4kRUhvOSw3jjsMAc5VbdMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 May 2023 08:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xpmkju4g8fWnh3AahgqtMRkCfkUtfEsgm_z23W+7BY+A@mail.gmail.com>
Message-ID: <CAD=FV=Xpmkju4g8fWnh3AahgqtMRkCfkUtfEsgm_z23W+7BY+A@mail.gmail.com>
Subject: Re: [PATCH v2] hardlockup: detect hard lockups using secondary
 (buddy) CPUs
To: Ian Rogers <irogers@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andi Kleen <ak@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Stephane Eranian <eranian@google.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-perf-users@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com, 
	ravi.v.shankar@intel.com, Masayoshi Mizuma <msys.mizuma@gmail.com>, ricardo.neri@intel.com, 
	Stephen Boyd <swboyd@chromium.org>, Colin Cross <ccross@android.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@chromium.org>, Alexander Potapenko <glider@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Gow <davidgow@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ingo Molnar <mingo@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Liam Howlett <liam.howlett@oracle.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sami Tolvanen <samitolvanen@google.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_081537_277941_BB91474D 
X-CRM114-Status: GOOD (  43.73  )
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

On Sat, Apr 29, 2023 at 2:22=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Fri, Apr 28, 2023 at 4:41=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > From: Colin Cross <ccross@android.com>
> >
> > Implement a hardlockup detector that doesn't doesn't need any extra
> > arch-specific support code to detect lockups. Instead of using
> > something arch-specific we will use the buddy system, where each CPU
> > watches out for another one. Specifically, each CPU will use its
> > softlockup hrtimer to check that the next CPU is processing hrtimer
> > interrupts by verifying that a counter is increasing.
> >
> > NOTE: unlike the other hard lockup detectors, the buddy one can't
> > easily show what's happening on the CPU that locked up just by doing a
> > simple backtrace. It relies on some other mechanism in the system to
> > get information about the locked up CPUs. This could be support for
> > NMI backtraces like [1], it could be a mechanism for printing the PC
> > of locked CPUs at panic time like [2] / [3], or it could be something
> > else. Even though that means we still rely on arch-specific code, this
> > arch-specific code seems to often be implemented even on architectures
> > that don't have a hardlockup detector.
> >
> > This style of hardlockup detector originated in some downstream
> > Android trees and has been rebased on / carried in ChromeOS trees for
> > quite a long time for use on arm and arm64 boards. Historically on
> > these boards we've leveraged mechanism [2] / [3] to get information
> > about hung CPUs, but we could move to [1].
> >
> > Although the original motivation for the buddy system was for use on
> > systems without an arch-specific hardlockup detector, it can still be
> > useful to use even on systems that _do_ have an arch-specific
> > hardlockup detector. On x86, for instance, there is a 24-part patch
> > series [4] in progress switching the arch-specific hard lockup
> > detector from a scarce perf counter to a less-scarce hardware
> > resource. Potentially the buddy system could be a simpler alternative
> > to free up the perf counter but still get hard lockup detection.
> >
> > Overall, pros (+) and cons (-) of the buddy system compared to an
> > arch-specific hardlockup detector:
> > + Usable on systems that don't have an arch-specific hardlockup
> >   detector, like arm32 and arm64 (though it's being worked on for
> >   arm64 [5]).
> > + May free up scarce hardware resources.
> > + If a CPU totally goes out to lunch (can't process NMIs) the buddy
> >   system could still detect the problem (though it would be unlikely
> >   to be able to get a stack trace).
> > - If all CPUs are hard locked up at the same time the buddy system
> >   can't detect it.
> > - If we don't have SMP we can't use the buddy system.
> > - The buddy system needs an arch-specific mechanism (possibly NMI
> >   backtrace) to get info about the locked up CPU.
>
> Thanks for this list, it is really useful! Is it worth mentioning the
> behavior around idle? Could this approach potentially use more power?

Sure, I'll add some text in there. If I'm analyzing the code properly,
my belief is that, if anything, the buddy detector should be better
for idle/power than some other detectors.

Specifically, note that the main "worker" of the buddy detector is
called from watchdog_timer_fn(). The timer function is the same one
that runs for other hard lockup detectors, but in those cases it
_only_ pets the watchdog of the running CPU. With the buddy detector
it pets the running CPU's watchdog and then checks on the buddy's
watchdog. There is no separate wakeup / interrupt that needs to run
periodically to look for hard lockups.

I'm about to send a v3 to fix the cpu=3D>CPU that I missed on v2. I'll
add text similar to the above to the commit message.

-Doug

