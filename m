Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7AFC7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=; b=jlEG1fWY/COPOOwjLlYFdz+rkM
	2JBYin6ApKAh0XoRKE5tKaSy927TeBOJrMYTAjtdiK0zL4Q0v55t0vjtkDc0EzULIJd+nxXklCcwB
	au9mH10WEKDtFc0LgWG1WeLnDkiYCVLAEFtA8pO0DHppAAUb07v7hPF9m7lE0iQQSLZjz+dEj+4yp
	Nkf/OBP+5iVPdaVQzeiWpZpfG887NnZc/Kg5nzZ7UtmlFQWi+fEeY2aVPBGHKeSdp4LW67uO3sMHw
	wcNAxDd7FIblatwn6FZ/OeLiFgV2j85zHKPhtqeJTEGtuTOoIl8354ZxB4rjzcWJgZvq7G6Ts/eUU
	3Ega9J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqy3f-00Gh9J-2u;
	Mon, 24 Apr 2023 15:24:51 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqy3c-00Gh82-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 15:24:50 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-329465f10fbso12243705ab.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682349877; x=1684941877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=;
        b=ZOHDrxCWSTD3Ev+Yjo00DTdfoFeaLvem8pOVb2HVba/XWjjEtNRItIcHEbNehcSb6H
         bw+q2E+3WneHy+fEggR8KA2P85b2YEDALeLWPUqfe+PyLwyukW+3VqiTWnVJZi4pqIqN
         dbQnuj0CoZ7JN+njC+4g4gtTh/uu5kMx3xsCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682349877; x=1684941877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQQ0l1rf0aXXyplq/mgF2Rjc0pUjLq2PlqK5LzTpLjw=;
        b=BK3XWkE2ZY+cqc0l2Xf+r9UNroj+JkHKofWxOFDsFCfDVO06+s+DmpKFBisHrcD+Zh
         yb1EjCcoIaR1wzIUSkeGhtUtlNPzBqGQ8r1ieariD8eFpVC4XwPdlPGiFD+QVDy2xly4
         LemNzIL3eatVAF9OhhP1w+pAHnzMDr50aKkOZqvs5zvYacvBVjHmovjs2BcSVuVP4GR5
         aL+W0rvqYGmOjLpE+nZs/t0pFsqWexGhb1JKAcqealYizG7k/BZilp4pSIhKFKouJPrr
         C57oHrQbya5pAmCY1sUOdJ3l7VTCWlUXJ9PpQ/I5eDG6OV7bmXX2fIFoAnmi1K5A2CfZ
         odsQ==
X-Gm-Message-State: AAQBX9eG7od+cfjOeXv7LJtwGIYjh20u7bW7l923PwiKz4YdTQwkDXim
	ja4jynHRF0Goazez8pk3hrgeY4BdzQUc67Vo3/8=
X-Google-Smtp-Source: AKy350YmdBRKXBcn4eXcRYgjZ5yHSDyyabAVMAPMPY1AsScvOs9N1adSV0G5u0I1FXUiCkAzBNhK2w==
X-Received: by 2002:a92:d344:0:b0:324:7d63:8622 with SMTP id a4-20020a92d344000000b003247d638622mr5493844ilh.2.1682349877585;
        Mon, 24 Apr 2023 08:24:37 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id y4-20020a92d804000000b0032e97ae59adsm286610ilm.29.2023.04.24.08.24.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 08:24:36 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-325f728402cso1065395ab.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 08:24:34 -0700 (PDT)
X-Received: by 2002:a92:ca0a:0:b0:32a:7910:6ea6 with SMTP id
 j10-20020a92ca0a000000b0032a79106ea6mr527671ils.5.1682349853334; Mon, 24 Apr
 2023 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
In-Reply-To: <CAP-5=fUB1e=bJk-w0i8+MEo4sLOZtb_Eb7FMy4u7ky7D2AZm6A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 08:23:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
Message-ID: <CAD=FV=Xuuefi9XBQA7z7sbe+Qw0=WeZ956gLGCoFGHBg6GBftg@mail.gmail.com>
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy) cpus
To: Ian Rogers <irogers@google.com>
Cc: ravi.v.shankar@intel.com, Andi Kleen <ak@linux.intel.com>, ricardo.neri@intel.com, 
	Stephane Eranian <eranian@google.com>, Petr Mladek <pmladek@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
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
X-CRM114-CacheID: sfid-20230424_082448_924587_03039152 
X-CRM114-Status: GOOD (  38.12  )
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

On Fri, Apr 21, 2023 at 6:20=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Fri, Apr 21, 2023 at 3:54=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
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
> >
> > NOTE: the buddy system is not really useful to enable on any
> > architectures that have a better mechanism. On arm64 folks have been
> > trying to get a better mechanism for years and there has even been
> > recent posts of patches adding support [3]. However, nothing about the
> > buddy system is tied to arm64 and several archs (even arm32, where it
> > was originally developed) could find it useful.
> >
> > [1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.=
org
> > [2] https://issuetracker.google.com/172213129
> > [3] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lec=
opzer.chen@mediatek.com/
>
> There is another proposal to use timers for lockup detection but not
> the buddy system:
> https://lore.kernel.org/lkml/20230413035844.GA31620@ranerica-svr.sc.intel=
.com/
> It'd be very good to free up the counter used by the current NMI watchdog=
.

Thanks for the link!

Looks like that series is x86 only, so I think that ${SUBJECT} patch
should still move forward since it provides a solution that is generic
across any platform. I guess the question is: if the buddy system gets
landed then is the HPET series still worthwhile? I guess the answer to
that would depend on whether the HPET-based watchdog has any
advantages over the buddy system.

I'd imagine that there could be some cases where the HPET system could
detect lockups that the buddy system can't. If _all_ CPUs in the
system have interrupts disabled then the buddy system won't be able to
run, but the HPET system could run. That's a win for the HPET system.
That being said, I guess I could imagine that there could be lockups
that the buddy system could detect that the HPET system couldn't. The
HPET system seems to have a single CPU in charge of processing the
main NMI and then that single CPU is in charge of checking all the
others. If that single CPU goes out to lunch then the system couldn't
detect hard lockups.

In any case, I'm happy to let others debate about the HPET system. For
now, I'll take my action items to be:

1. Modify the patch description and KConfig to include some of the
same advantages that the HPET patch series talks about (freeing up
resources).

2. Increase my CC list for the next version even more to include the
people you added to this thread who have been working on the HPET
patch series.

-Doug

