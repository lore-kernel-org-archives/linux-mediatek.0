Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35ECC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=; b=0MUTTRr7ptE0H4NxXuyV+Wxe/g
	L613rMKYVxlDrY1lGh3ESVSfkkHqHrOpe7x0KT5nuOh6LvLUmYmsGTKfrzHixGM8ctB/nB+APl6aG
	8xkcz15hmVzM0u3RYetg+QmOTPoQ9BPvJPyb7uhmrt9t/PI4ta/TvmtYI+OaNn2LAmftz137WHZap
	wAn16Vy17CuiV9D4jvHoi0wJR+k0TNr8ilBcRFQC7lrlQY1lHg7pxVXtgrHLr9E7A00nh0KJ5kpmJ
	EzI6F5SZQ0pftN5zMmFPI7CpcZ4qPnearRYfC+TGjwyb1DWiJLgKJEb1FH0GQ1qC9d+2pq0yGR6+a
	DDMvrg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptU9e-00G7BF-2M;
	Mon, 01 May 2023 14:05:26 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptU9b-00G7AT-2K
	for linux-mediatek@lists.infradead.org;
	Mon, 01 May 2023 14:05:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50a14564d17so39888010a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 01 May 2023 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682949921; x=1685541921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=;
        b=OpXyPNmHeiTzE7/eyJMme+3JNljIdrnQElpHeEqmiZZcF0jJ03YykVxBvERl3d0acP
         vPrpDuS6cUFK6dlPLTIRjinQ6jnPvZ1FbDcXCxI6C9L1LVGSviXN5mlNvbabsMKH5Hvu
         kjE1cwSZWphEix6FK/LAStG8nWR9ACxVIT6rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682949921; x=1685541921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz6FJXzkJkqPDcrEIjMfZPfzlnpS0r8oHDAuwuJCMM8=;
        b=jicaObYIheQz1qe8Yxo/4FerxQAw4uycbZZCwPoAAS19ruZsR9AgD9jt+ZwTGN6TtS
         Y+0k+1uMn0ucU8PUkqhx/7/FdPbiWOPjSZFgr0anoVSeLvHyeNqXxUuWXuqP6ggYpZwI
         5NCtrnmub88KDElxNjaGIY7YTBm+9ybav7weI/5TSEUVdi88Rhxt16220ROQXThsOBX3
         tcRvBJhd6FhlpUGNgfXULEibFJHdhhBgAAQsDBB3jQ7g6j8SuJRhBgTsGiQXp35nAd98
         n0ZKywacNV1wBIUh1Z3yyXlQCg3GKMFpH4+Ds2xbaXLoYmxsY+6QxH0M+78Mc83rMLPX
         TXFw==
X-Gm-Message-State: AC+VfDxrW5kH5n8U/Gm0YZkJHkSBgQvSe9G72z0+dOWQHI39Pxwp5eAI
	1gKOQsrLuymExl3FS72hcv1l1KFHHonB9C6iBvms8aO+
X-Google-Smtp-Source: ACHHUZ7wMg8yTfrSnRr0cNaS7FlZiVnvnMm9o/pvtP0HvEZtHpevM+zvk32UzIw19f2ybuxQWC6Pbw==
X-Received: by 2002:a17:906:4e1a:b0:946:c1d2:8b5d with SMTP id z26-20020a1709064e1a00b00946c1d28b5dmr17504224eju.17.1682949920986;
        Mon, 01 May 2023 07:05:20 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id t20-20020a1709060c5400b0094ebc041e20sm14694777ejf.46.2023.05.01.07.05.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 07:05:19 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-4d9b2045e1cso35345a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 May 2023 07:05:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3c84:b0:3f1:9396:6fbf with SMTP id
 bg4-20020a05600c3c8400b003f193966fbfmr531828wmb.4.1682949899295; Mon, 01 May
 2023 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230428163507.v2.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <217e697c-ad13-96ca-3829-a046469fd86a@infradead.org>
In-Reply-To: <217e697c-ad13-96ca-3829-a046469fd86a@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 May 2023 07:04:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0tzeqCrFUrytbe0OByYkC23i61H+jdgZRXfMKbShMcA@mail.gmail.com>
Message-ID: <CAD=FV=V0tzeqCrFUrytbe0OByYkC23i61H+jdgZRXfMKbShMcA@mail.gmail.com>
Subject: Re: [PATCH v2] hardlockup: detect hard lockups using secondary
 (buddy) CPUs
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andi Kleen <ak@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, Stephane Eranian <eranian@google.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-perf-users@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	kgdb-bugreport@lists.sourceforge.net, ito-yuichi@fujitsu.com, 
	ravi.v.shankar@intel.com, Masayoshi Mizuma <msys.mizuma@gmail.com>, ricardo.neri@intel.com, 
	Ian Rogers <irogers@google.com>, Stephen Boyd <swboyd@chromium.org>, 
	Colin Cross <ccross@android.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, 
	Alexander Potapenko <glider@google.com>, 
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
X-CRM114-CacheID: sfid-20230501_070523_765104_7A23EF94 
X-CRM114-Status: GOOD (  47.57  )
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


On Fri, Apr 28, 2023 at 5:36=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi--
>
> On 4/28/23 16:37, Douglas Anderson wrote:
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
> >
> > [1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.=
org
> > [2] https://issuetracker.google.com/172213129
> > [3] https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
> > [4] https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-ca=
lderon@linux.intel.com/
> > [5] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lec=
opzer.chen@mediatek.com/
> >
> > Signed-off-by: Colin Cross <ccross@android.com>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Signed-off-by: Guenter Roeck <groeck@chromium.org>
> > Signed-off-by: Tzung-Bi Shih <tzungbi@chromium.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This patch has been rebased in ChromeOS kernel trees many times, and
> > each time someone had to do work on it they added their
> > Signed-off-by. I've included those here. I've also left the author as
> > Colin Cross since the core code is still his.
> >
> > I'll also note that the CC list is pretty giant, but that's what
> > get_maintainers came up with (plus a few other folks I thought would
> > be interested). As far as I can tell, there's no true MAINTAINER
> > listed for the existing watchdog code. Assuming people don't hate
> > this, maybe it would go through Andrew Morton's tree?
> >
> > Changes in v2:
> > - cpu =3D> CPU.
> > - Reworked description and Kconfig based on v1 discussion.
>
> or at least some of the comments from v1. :(

Oh no! My email program confused me and I thought all of your cpu=3D>CPU
stuff was in the patch description, not in the Kconfig. I'll whip up a
quick v3.

-Doug

