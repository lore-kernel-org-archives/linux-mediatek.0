Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7265DE7B5E3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb+bw7+oRtg4GgltRa7kRlWLiBrf0HlhYLQTRaduXtY=; b=YqBRP0i7HsP9lQF587vfNxwqgx
	rHkrVmGY7lQqGjbhP7QngUaDT/vk8I8WT+Dfo4a3s7ge0zUGDI8L7/EmU31av9o0nYdzLmzR506r0
	kcfXFA6WUaOjEYItONt6n99nB4jJ7bwrxEe1sGn9AvkvyNmYcWcdkdVNUSdrdfNd/PxAoj9Au4E4n
	aTzp4+F/S6ssBL9IcOgSAnKi/kSrIzjcbz6JDjejvfDZeHF2fD3Nm9AMyBGz/NBJQcxmW6Pw4Xxdb
	hoMorMoXE/l5J8biIxbIJmoR0txJBJ5gs5H0EoqmO6+mPbY3MO2dNqlCmXbWhEMRnTDpPn/ttKHZy
	iTbSsJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyfm-00HA4Q-0H;
	Wed, 04 Oct 2023 10:00:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyfi-00HA2U-18;
	Wed, 04 Oct 2023 10:00:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89ACDA7;
	Wed,  4 Oct 2023 03:00:38 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.95.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56DB53F5A1;
	Wed,  4 Oct 2023 02:59:57 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:59:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Misono Tomohiro <misono.tomohiro@fujitsu.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek
 FW
Message-ID: <ZR03liCodnTQWs7s@FVFF77S0Q05N>
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N>
 <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N>
 <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_030002_488273_585D1E31 
X-CRM114-Status: GOOD (  68.48  )
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

On Tue, Oct 03, 2023 at 12:32:39PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 3, 2023 at 9:32 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Tue, Oct 03, 2023 at 06:43:07AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Oct 3, 2023 at 5:29 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > On Mon, Oct 02, 2023 at 12:16:17PM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Oct 2, 2023 at 10:24 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > > > >
> > > > > > On Mon, Oct 02, 2023 at 09:45:29AM -0700, Douglas Anderson wrote:
> > > > > > > Some mediatek devices have the property
> > > > > > > "mediatek,broken-save-restore-fw" in their GIC. This means that,
> > > > > > > although the hardware supports pseudo-NMI, the firmware has a bug
> > > > > > > that blocks enabling it. When we're in this state,
> > > > > > > system_uses_irq_prio_masking() will return true but we'll fail to
> > > > > > > actually enable the IRQ in the GIC.
> > > > > > >
> > > > > > > Let's make the code handle this. We'll detect that we failed to
> > > > > > > request an IPI as NMI and fallback to requesting it normally. Though
> > > > > > > we expect that either all of our requests will fail or all will
> > > > > > > succeed, it's just as cheap to keep a per-IPI bitmap and that keeps us
> > > > > > > robust.
> > > > > > >
> > > > > > > Fixes: 331a1b3a836c ("arm64: smp: Add arch support for backtrace using pseudo-NMI")
> > > > > > > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > > Closes: https://issuetracker.google.com/issues/197061987#comment68
> > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > ---
> > > > > > >
> > > > > > >  arch/arm64/kernel/smp.c | 19 ++++++++++++-------
> > > > > > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > I'm not too keen on falling back here when we have no idea why the request failed.
> > > > > >
> > > > > > I'd prefer if we could check the `supports_pseudo_nmis` static key directly to
> > > > > > account for the case of broken FW, e.g. as below.
> > > > > >
> > > > > > Mark.
> > > > > >
> > > > > > ---->8----
> > > > > > From 72fdec05c64a74f21871b44c7c760bbe07cac044 Mon Sep 17 00:00:00 2001
> > > > > > From: Mark Rutland <mark.rutland@arm.com>
> > > > > > Date: Mon, 2 Oct 2023 18:00:36 +0100
> > > > > > Subject: [PATCH] arm64: smp: avoid NMI IPIs with broken MediaTek FW
> > > > > >
> > > > > > Some MediaTek devices have broken firmware which corrupts some GICR
> > > > > > registers behind the back of the OS, and pseudo-NMIs cannot be used on
> > > > > > these devices. For more details see commit:
> > > > > >
> > > > > >   44bd78dd2b8897f5 ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues")
> > > > > >
> > > > > > We did not take this problem into account in commit:
> > > > > >
> > > > > >   331a1b3a836c0f38 ("arm64: smp: Add arch support for backtrace using pseudo-NMI")
> > > > > >
> > > > > > Since that commit arm64's SMP code will try to setup some IPIs as
> > > > > > pseudo-NMIs, even on systems with broken FW. The GICv3 code will
> > > > > > (rightly) reject attempts to request interrupts as pseudo-NMIs,
> > > > > > resulting in boot-time failures.
> > > > > >
> > > > > > Avoid the problem by taking the broken FW into account when deciding to
> > > > > > request IPIs as pseudo-NMIs. The GICv3 driver maintains a static_key
> > > > > > named "supports_pseudo_nmis" which is false on systems with broken FW,
> > > > > > and we can consult this within ipi_should_be_nmi().
> > > > > >
> > > > > > Fixes: 331a1b3a836c0f38 ("arm64: smp: Add arch support for backtrace using pseudo-NMI")
> > > > > > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > Closes: https://issuetracker.google.com/issues/197061987#comment68
> > > > > > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > > > > > Cc: Douglas Anderson <dianders@chromium.org>
> > > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > > ---
> > > > > >  arch/arm64/kernel/smp.c      | 5 ++++-
> > > > > >  drivers/irqchip/irq-gic-v3.c | 2 +-
> > > > > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > Sure, this is OK w/ me as long as folks don't mind accessing the
> > > > > global here, it's OK w/ me:
> > > > >
> > > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > It seems to work for me, thus:
> > > > >
> > > > > Tested-by: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > >
> > > > > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > > > > index 814d9aa93b21b..061c69160f90f 100644
> > > > > > --- a/arch/arm64/kernel/smp.c
> > > > > > +++ b/arch/arm64/kernel/smp.c
> > > > > > @@ -964,7 +964,10 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
> > > > > >
> > > > > >  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
> > > > > >  {
> > > > > > -       if (!system_uses_irq_prio_masking())
> > > > > > +       DECLARE_STATIC_KEY_FALSE(supports_pseudo_nmis);
> > > > > > +
> > > > > > +       if (!system_uses_irq_prio_masking() ||
> > > > > > +           !static_branch_likely(&supports_pseudo_nmis))
> > > > >
> > > > > One thought, actually, is whether we should actually change
> > > > > system_uses_irq_prio_masking() to return the correct value. What do
> > > > > you think?
> > > >
> > > > I don't think we should add this to system_uses_irq_prio_masking(); that's used
> > > > by the low-level flags manipulation code that gets inlined all over the place,
> > > > and that code will work regarldess of whether we actually use NMI priorities.
> > > >
> > > > If we want to avoid using PMR masking *at all* on these platforms, we'd need to
> > > > detect that within can_use_gic_priorities() or early_enable_pseudo_nmi().
> > >
> > > I suspect that anyone trying to use PMR masking on these systems for
> > > any purpose will be unhappy. The issue is talked about in:
> > >
> > > https://issuetracker.google.com/281831288
> > >
> > > ...where you can see that the firmware on these systems isn't properly
> > > saving/restoring some registers, including GICR_IPRIORITYR.
> >
> > Ok, then that's a latent bug even before the IPI changes, going back to the
> > original workaround in commit:
> >
> >   44bd78dd2b8897f5 ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues")
> >
> > For the sake of those reading the archive, can we have a better description of
> > what exactly happens on these boards?
> >
> > IIUC on these boards the firmware fails to save+restore (some?) GICR registers
> > across (some?) PSCI CPU_SUSPEND idle states.
> >
> > Which registers does it save+restore?
> >
> > Does it reset other registers into a specific state?
> 
> Though I'm not an expert in this area, my understanding is that in
> some of the deeper idle states then GICR registers are lost. That
> matches a thread [0] I found. In early investigation I found that I
> could comment out `cpu-idle-states` in the device tree to avoid the
> problems [1]. I believe this is fully expected which is why firmware
> is supposed to save/restore these registers whenever a low power is
> entered/exited. I'd presume that any register not properly
> saved/restored comes up in whatever its default state is.
> 
> As far as pseudo-NMI was concerned, all I really needed to
> save/restore was "GICR_NUM_IPRIORITYR" [2], but Marc Zyngier looked at
> the code and identified [3] at least these in addition:
> * GICR_CTLR
> * GICR_ISPENDR0
> * GICR_ISACTIVER0
> * GICR_NSACR

Looking at the GIC spec (Arm IHI 0069H), page 12-673, I see for all of the
GICR_IPRIORITYR<n>.Priority_offset_*B fields:

| The reset behavior of this field is:
| • On a GIC reset, this field resets to an architecturally UNKNOWN value.

... so at least per the architecture these could be reset to arbitrary values,

and that priority might permit SGI/PPIs to be taken IRQs are priority-masked,
or to prevent SGI/PPIs to be taken when priority-unmasked.

I also see for GICR_CTLR that EnableLPIs would be reset to 0, and IIUC that
means LPIs won't work on these parts, which seems like a problem.

> That list seems to match the Arm Trusted Firmware patch that fixed the
> issue [4]. ...but it will be impossible to ever get the fix rolled out
> to all devices. Even if we could get firmware spins Qualified for
> every device there will still be cases where we'll boot with the old
> firmware. Since we _don't_ bundle the device tree with the firmware,
> we believe that the quirk mechanism that we came up with (add a quirk
> in never device trees and firmware removes the quirk when we have a
> fix) is at least a robust/reliable way to detect the issue.
> 
> The whole issue seems rather concerning, but (apparently) it never
> caused issues in the kernel until we tried to use pseudo-NMI.

Given you haven't seen any issues, I suspect those are getting reset to fixed
values that happens to work out for us, but it is a bit worrisome more
generally (e.g. the LPI case above).

Mark.

> 
> [0] https://github.com/ARM-software/tf-issues/issues/464
> [1] https://issuetracker.google.com/issues/197061987#comment27
> [2] https://crrev.com/c/4519877
> [3] https://issuetracker.google.com/issues/281831288#comment5
> [4] https://github.com/ARM-software/arm-trusted-firmware/commit/1c62cc7fbdf2ec2a7e69b3c027d507fcafdcaa12

