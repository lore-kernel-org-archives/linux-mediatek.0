Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA21C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=; b=prUCZ0oL+o2lWI3bQa113XPYc3
	GG4WdoqE4AntEXYVlLVrl194fuZEwsVv9r4WVHu2t+ORtyFWr2qFaVwDyyB0x5GIQZdig5b0XXpW4
	MVdJrq4f6sUqkuTq1P/O18SEW0HsX0d5i7n1lEY7yH5Hjk+6ZyTWq1xOVZEoo4+F8Bw3D8xjALVk+
	9kUrndBC7PTwZrL9vAQPxaLZzt/ml1cm0fNqoQSOh4YabFndD3JWK7KiKLTItuVpI5FvibUb8+kj9
	luxqL83A0olzrmoGr9plG5FRsFAtDItOJoxg9vAkP30fIqsz9cN3Y7VPndblscrJO+pY9RZq1qhHQ
	GtZWdOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prKfs-001XsD-0S;
	Tue, 25 Apr 2023 15:33:48 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prKfo-001Xrg-38
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 15:33:46 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-5f95cedb135so25728006d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682436822; x=1685028822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=;
        b=hy2frPeQl3HckdF5mcBBEaZOBiHfg71ap1gXut0GzSl+2zO/LJkrdw/78thc/eVMYm
         4eMdE+QxW/cn5wgNvp6EYDJHXui7VoVaQOMt5cLZKqhZiJWdcMRuKgvCXrPPLt07f8CI
         +9P9b06X5ZkGKIye057ptJeWwemx3BYruTgwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682436822; x=1685028822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cyqk2sw07jP79tLlZQcGC2Yi7zdVZiomYulq2SQLWdw=;
        b=ZpGElDKZ+i127Yju8NGzwWqW9DRPTaSELNb6tuc2U5VJ99c0PcO5nre4hbkoMuGXxh
         R4UEDmXpzfkn/EmobpXSdMDe/ek2CvXhl3XdoBgZEbcYRPUN4K2EgqFfQh3kz+Shdg6j
         zNAuUs2pXFiHpZEGbjV/AQCPOZfQA+C77D/5gum8rnrKNPv3TBdUk7QtFyFl2T6GC7gY
         wcz6BVysIBpZuGjGi9Ep9tK/H56jsmcA0NtQqjs5sSH+50iCP5RGD+vi/oI4rgqX/l9C
         NIWiLjvubuBEnHscbWMvukNfuEmDSf2DfeH7oaa9JnOZNFe6GYmRx+6LPWfMf4lRWfIa
         R4ww==
X-Gm-Message-State: AAQBX9fg6+zxRzvAeNipU+lwIAZw0y41j8N1ql54GwWggSbH//Jz2OZv
	Ae26Mhu+DnxJteDdk/MUzMqx1j7OolokK7pQCgQ=
X-Google-Smtp-Source: AKy350aCTWEQKMlthDO+i9t1k8nMMmC+MKyRnS8PSMJHRLop5iMQwj3BVMdlGxkj3xb4LGwS36btjA==
X-Received: by 2002:ad4:594b:0:b0:5dd:7c9c:40e8 with SMTP id eo11-20020ad4594b000000b005dd7c9c40e8mr26405870qvb.49.1682436822024;
        Tue, 25 Apr 2023 08:33:42 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id a15-20020a0cb34f000000b005ef6ba1f4afsm4154382qvf.134.2023.04.25.08.33.41
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 08:33:41 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3ef31924c64so134621cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 08:33:41 -0700 (PDT)
X-Received: by 2002:a92:cd8b:0:b0:32b:3dd3:4c9a with SMTP id
 r11-20020a92cd8b000000b0032b3dd34c9amr264823ilb.15.1682436387051; Tue, 25 Apr
 2023 08:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <20230424125355.GA4054@aspen.lan> <CAD=FV=W2f37XUSWgSrr9AjGZ5WLBm-+6EkGx6YiOEPDsyYQn=w@mail.gmail.com>
 <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
In-Reply-To: <CAGXv+5Gbph1r0u_NVBS7Lg8w8X4Qw0Q=yxmEkJDs4ptOJu2NVA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Apr 2023 08:26:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-ftcnO+jUw9_cBOPjcpFcUGcOOKuq+XRNyRjUGNSQow@mail.gmail.com>
Message-ID: <CAD=FV=W-ftcnO+jUw9_cBOPjcpFcUGcOOKuq+XRNyRjUGNSQow@mail.gmail.com>
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy) cpus
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20230425_083345_016234_1A1FBE4B 
X-CRM114-Status: GOOD (  38.92  )
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

On Mon, Apr 24, 2023 at 9:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Apr 24, 2023 at 11:42=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
> >
> > Hi,
> >
> > On Mon, Apr 24, 2023 at 5:54=E2=80=AFAM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
> > > > From: Colin Cross <ccross@android.com>
> > > >
> > > > Implement a hardlockup detector that can be enabled on SMP systems
> > > > that don't have an arch provided one or one implemented atop perf b=
y
> > > > using interrupts on other cpus. Each cpu will use its softlockup
> > > > hrtimer to check that the next cpu is processing hrtimer interrupts=
 by
> > > > verifying that a counter is increasing.
> > > >
> > > > NOTE: unlike the other hard lockup detectors, the buddy one can't
> > > > easily provide a backtrace on the CPU that locked up. It relies on
> > > > some other mechanism in the system to get information about the loc=
ked
> > > > up CPUs. This could be support for NMI backtraces like [1], it coul=
d
> > > > be a mechanism for printing the PC of locked CPUs like [2], or it
> > > > could be something else.
> > > >
> > > > This style of hardlockup detector originated in some downstream
> > > > Android trees and has been rebased on / carried in ChromeOS trees f=
or
> > > > quite a long time for use on arm and arm64 boards. Historically on
> > > > these boards we've leveraged mechanism [2] to get information about
> > > > hung CPUs, but we could move to [1].
> > >
> > > On the Arm platforms is this code able to leverage the existing
> > > infrastructure to extract status from stuck CPUs:
> > > https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
> >
> > Yup! I wasn't explicit about this, but that's where you end up if you
> > follow the whole bug tracker item that was linked as [2].
> > Specifically, we used to have downstream patches in the ChromeOS that
> > just reached into the coresight range from a SoC specific driver and
> > printed out the CPU_DBGPCSR. When Brian was uprevving rk3399
> > Chromebooks he found that the equivalent functionality had made it
> > upstream in a generic way through the coresight framework. Brian
> > confirmed it was working on rk3399 and made all of the device tree
> > changes needed to get it all hooked up, so (at least for that SoC) it
> > should work on that SoC.
> >
> > [2] https://issuetracker.google.com/172213129
>
> IIRC with the coresight CPU debug driver enabled and the proper DT nodes
> added, the panic handler does dump out information from the hardware.
> I don't think it's wired up for hung tasks though.

Yes, that's correct. The coresight CPU debug driver doesn't work for
hung tasks because it can't get a real stack crawl. All it can get is
the PC of the last branch that the CPU took. This is why combining
${SUBJECT} patch with the ability to get stack traces via pseudo-NMI
is superior. That being said, even with just the coresight CPU debug
driver ${SUBJECT} patch is still helpful because (assuming
"hardlockup_panic" is set) we'll do a panic which will then trigger
the coresight CPU debug driver. :-)

-Doug

