Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E0C7EE21
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 22:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=; b=ESIOsoYtmSVDgXs4TZzzhG6sCb
	UrNRJHdiAAlomukujr50UQiC7wWvJx9y39My1kVKRGWsBYYWxnmSN+G/PqzFoCsDpEAuEQz+qcODx
	6FDUaxXswi+IJq7fp57O4KquwdBPTSA7cWeR+fOJXSc0fsDRxe41RQk63lT8qi26d/ZvnwTqGueEG
	1RY+3fsKjltuatgCIgJN4KBhSMc85zoRH042bfxXUHAiorcTwkhd6P3C/8FY4Ptryu5PZ2xYjjNYo
	g/Oou1DHFSVYgWTrUlb4X57MUqBj1ONDLPV4kiEdsOw9cgCGct0yLl2HnnKDdc0dkj+HM4OZmoRn0
	VKevdH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puhbd-009E6J-2j;
	Thu, 04 May 2023 22:39:21 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puhba-009E5Z-1t
	for linux-mediatek@lists.infradead.org;
	Thu, 04 May 2023 22:39:20 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3313a2200a4so2799205ab.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683239954; x=1685831954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=;
        b=EAQKg0FUlW9wPpfjU8O3uui3IwkjYQFq6i9hnZzIoSvhcZ3ZNmR/eEawx3Ys5WdrNz
         EAPgi8Lc1tSGn3PRCDYyn/PqRVLCBVLuTqVs9I1ZqmBpzArC7ZmoO9PFd3SeH8GTvJp2
         Bk/+T17zdAvO1SqzH9pS5MpJv9MFESO2wHzVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683239954; x=1685831954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rN99MG5d6M+UabPVww+w9dMJG2WFhR6z4xfKsLbvtE=;
        b=UGjcviR6B7WT16p/tcavyX/bYQd/esWLbY6ga8DKD9OMMwWJeAO1k0Rg+N6wY53y33
         DM/XqI+k+2sT13kIjtc4hAF4Pzm0CiRZDaMLY1GFTo9+dVx9T0kXQrWJFtOdI7kxP35m
         aoBPVF/bKb4hDwJVKYsEqO1qfSOCM9u5MYchfhxbhASc/kspL++qJ7ebWdwAYEZtKQ9N
         fHGtADxP4MJaQFMnmniq6AUnz6bOyK+SGm9wuSwY62GlPqScJgleaho9jLTAHP08UVVN
         0QS8E7yHddilrw8frYxR66kaV1nv+tzNDrHxC+1Kk00ATVhFp5sAPnwphMHRACDq+gYv
         kK/A==
X-Gm-Message-State: AC+VfDw33HONcQClUukwsF4f0J3mOw+q+ZN2Eo719kRszgMeL/WbFKv5
	pqqnR2ppdF2IC0+sFOx8it7iXvIw7hLLe4tCQoc=
X-Google-Smtp-Source: ACHHUZ68AtrAuFhm7Wfo9fOB1Ufq7fnupxrYymNEO9Z9XzMPBh8VS76mbkE6gDZJg9f3Ct781kS9wA==
X-Received: by 2002:a92:6c06:0:b0:32b:26aa:ce3a with SMTP id h6-20020a926c06000000b0032b26aace3amr221965ilc.27.1683239954596;
        Thu, 04 May 2023 15:39:14 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id z3-20020a92bf03000000b0032b72b5c1c3sm74057ilh.9.2023.05.04.15.39.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 15:39:14 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-32f4e0f42a7so628285ab.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:39:13 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:3ef:3510:7c3a with SMTP id
 g5-20020ac85805000000b003ef35107c3amr17232qtg.3.1683239933101; Thu, 04 May
 2023 15:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
In-Reply-To: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:38:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz8u0+WHqiLwcE-3BhbtdVVCnSQjs7bxp=-tisyYQwWw@mail.gmail.com>
Message-ID: <CAD=FV=Wz8u0+WHqiLwcE-3BhbtdVVCnSQjs7bxp=-tisyYQwWw@mail.gmail.com>
Subject: Re: [PATCH v3] hardlockup: detect hard lockups using secondary
 (buddy) CPUs
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Ian Rogers <irogers@google.com>, ravi.v.shankar@intel.com, 
	Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org, 
	Stephane Eranian <eranian@google.com>, kgdb-bugreport@lists.sourceforge.net, 
	ito-yuichi@fujitsu.com, linux-arm-kernel@lists.infradead.org, 
	Stephen Boyd <swboyd@chromium.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ricardo.neri@intel.com, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Chen-Yu Tsai <wens@csie.org>, 
	Andi Kleen <ak@linux.intel.com>, Colin Cross <ccross@android.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@chromium.org>, Alexander Potapenko <glider@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Borislav Petkov <bp@suse.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Juergen Gross <jgross@suse.com>, 
	Kees Cook <keescook@chromium.org>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Liam Howlett <liam.howlett@oracle.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_153918_625245_A052C092 
X-CRM114-Status: GOOD (  48.22  )
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

On Mon, May 1, 2023 at 8:25=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> From: Colin Cross <ccross@android.com>
>
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
>
> NOTE: unlike the other hard lockup detectors, the buddy one can't
> easily show what's happening on the CPU that locked up just by doing a
> simple backtrace. It relies on some other mechanism in the system to
> get information about the locked up CPUs. This could be support for
> NMI backtraces like [1], it could be a mechanism for printing the PC
> of locked CPUs at panic time like [2] / [3], or it could be something
> else. Even though that means we still rely on arch-specific code, this
> arch-specific code seems to often be implemented even on architectures
> that don't have a hardlockup detector.
>
> This style of hardlockup detector originated in some downstream
> Android trees and has been rebased on / carried in ChromeOS trees for
> quite a long time for use on arm and arm64 boards. Historically on
> these boards we've leveraged mechanism [2] / [3] to get information
> about hung CPUs, but we could move to [1].
>
> Although the original motivation for the buddy system was for use on
> systems without an arch-specific hardlockup detector, it can still be
> useful to use even on systems that _do_ have an arch-specific
> hardlockup detector. On x86, for instance, there is a 24-part patch
> series [4] in progress switching the arch-specific hard lockup
> detector from a scarce perf counter to a less-scarce hardware
> resource. Potentially the buddy system could be a simpler alternative
> to free up the perf counter but still get hard lockup detection.
>
> Overall, pros (+) and cons (-) of the buddy system compared to an
> arch-specific hardlockup detector:
> + The buddy system is usable on systems that don't have an
>   arch-specific hardlockup detector, like arm32 and arm64 (though it's
>   being worked on for arm64 [5]).
> + The buddy system may free up scarce hardware resources.
> + If a CPU totally goes out to lunch (can't process NMIs) the buddy
>   system could still detect the problem (though it would be unlikely
>   to be able to get a stack trace).
> + The buddy system uses the same timer function to pet the hardlockup
>   detector on the running CPU as it uses to detect hardlockups on
>   other CPUs. Compared to other hardlockup detectors, this means it
>   generates fewer interrupts and thus is likely better able to let
>   CPUs stay idle longer.
> - If all CPUs are hard locked up at the same time the buddy system
>   can't detect it.
> - If we don't have SMP we can't use the buddy system.
> - The buddy system needs an arch-specific mechanism (possibly NMI
>   backtrace) to get info about the locked up CPU.
>
> [1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.or=
g
> [2] https://issuetracker.google.com/172213129
> [3] https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
> [4] https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-cald=
eron@linux.intel.com/
> [5] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecop=
zer.chen@mediatek.com/
>
> Signed-off-by: Colin Cross <ccross@android.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch has been rebased in ChromeOS kernel trees many times, and
> each time someone had to do work on it they added their
> Signed-off-by. I've included those here. I've also left the author as
> Colin Cross since the core code is still his.
>
> I'll also note that the CC list is pretty giant, but that's what
> get_maintainers came up with (plus a few other folks I thought would
> be interested). As far as I can tell, there's no true MAINTAINER
> listed for the existing watchdog code. Assuming people don't hate
> this, maybe it would go through Andrew Morton's tree?
>
> Changes in v3:
> - More cpu =3D> CPU (in Kconfig and comments).
> - Added a note in commit message about the effect on idle.
> - Cleaned up commit message pros/cons to be complete sentences.
> - No code changes other than comments.
>
> Changes in v2:
> - cpu =3D> CPU (in commit message).
> - Reworked description and Kconfig based on v1 discussion.
> - No code changes.
>
>  include/linux/nmi.h         |  18 ++++-
>  kernel/Makefile             |   1 +
>  kernel/watchdog.c           |  24 ++++--
>  kernel/watchdog_buddy_cpu.c | 141 ++++++++++++++++++++++++++++++++++++
>  lib/Kconfig.debug           |  23 +++++-
>  5 files changed, 196 insertions(+), 11 deletions(-)

To leave breadcrumbs: I've posted v4 which is now a big series

https://lore.kernel.org/r/20230504221349.1535669-1-dianders@chromium.org

I took some people off the CC list that get_maintainers had added on
v3, mostly because it was getting unbearable. I tried to copy all
relevant mailing lists, so hopefully anyone who needs v4 can find it
somewhere where it's easy for them to reply to. If you got dropped off
the CC list and want back on for future versions, please yell and I'll
add you. Unless I messed up, I've CCed anyone who replied to previous
versions.

-Doug

