Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC7E8FDAF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 19:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh6wv2Il5nLts+wBFpVl+3wL/iLN2HmUHrpokxeXnKk=; b=QDclOtEMWnGBbwFZwi2wvpJT2S
	ul3qfp8SyYLiOcknX57Ty1aM0aabnaV9tjG9tl3JQN8R1dj/jIVJomGPvlpEpUvWsLmn0tez3qZ9G
	WN1P4t4F+BFUXD7GPy5G03OlqC3uuquj4aOkpEYSzTww1vDFDakrbdageCm1Gx3FdYXR9wpniXHab
	hWe2eGAgG0hJBia28vYfs3EL4wQLW3EcMl6xitC2Y11wUnz4T/upxo+fVvgOEypO24DfHkItRY+GT
	1frEML7O3tyr59rpks0ornvdGYsqjXh6ylHQnV77WArMXemZGZoJJHi8x/xs3vFoWm4qQbh5RDzN+
	OCBPUniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlG6-00FCO0-3D;
	Tue, 03 Oct 2023 19:40:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnlG4-00FCMs-0i
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 19:40:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso238700466b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696362031; x=1696966831; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh6wv2Il5nLts+wBFpVl+3wL/iLN2HmUHrpokxeXnKk=;
        b=D/CSyPvmIxNWKWKW+JIDnN0w8cNXGRzfMS5FxUpM7LzGFm77ZdORdHcbRC6xz1Zz8r
         O2okkSSWe/sRNnm+Hp6G57q6c/NhcctNoCH3nSjBAF55sp+U+69bLHGDnEmoZ5F2Toa0
         xVA8DVWyetenhpUwxfW9EdXWEprcapenx7Nwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696362031; x=1696966831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh6wv2Il5nLts+wBFpVl+3wL/iLN2HmUHrpokxeXnKk=;
        b=tNyVIO8YYI89hff0zeXm7sbppZQhLR9/fWN/t6P5AMbEYITwSQGeLYuh0N6XiZmEel
         T2HWPXLqbIDOs9PGaXsmpoNMOzxhbXaDQYgMETt+N7dkCdlobP54jxF7GCyIE6sE1TW7
         MYHEQCFOFUmX0MQtBFEac22kL1OocoYBCoCBXALZ/SrxfuW2UCuTsGeiaCMtH142Kl2i
         7Fvzk0ph2nIzGcOMHXHEXIWojNiXd8l5OAnDaIfqnvBjo/hV3Oz6O1JZIU4Hz02A9fsq
         UwrLKfGlQh1HeJEB5rUkOjgX+HzkCy21rLDduh+o1pA/RLVPrQRHWgG9sYKJYVf+R4uG
         Crmw==
X-Gm-Message-State: AOJu0YykHIayuQ/mzaziufRTngikAF+FJbRq9y5Ubh0JlwPU83dGt3VV
	xAK4MW3sRRLd05AFb1+ztHmDELBz5ZhxEtfLqVSpck0d
X-Google-Smtp-Source: AGHT+IE9h76vJKwig4fT5jkGx6scZWIWURkGCzZ5LKBvIHjsmcp0V/y3VYbXljN+HsYlO/qoSFcljw==
X-Received: by 2002:a17:907:7854:b0:9b2:d367:d818 with SMTP id lb20-20020a170907785400b009b2d367d818mr138532ejc.38.1696362031557;
        Tue, 03 Oct 2023 12:40:31 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id r19-20020a170906365300b009a2235ed496sm1542341ejb.141.2023.10.03.12.40.31
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 12:40:31 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so203a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 12:40:31 -0700 (PDT)
X-Received: by 2002:a05:600c:5108:b0:404:7462:1f87 with SMTP id
 o8-20020a05600c510800b0040474621f87mr16737wms.6.1696361574298; Tue, 03 Oct
 2023 12:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N> <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N>
In-Reply-To: <ZRxCCZxZWCG0NBur@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Oct 2023 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
Message-ID: <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Valentin Schneider <vschneid@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Misono Tomohiro <misono.tomohiro@fujitsu.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_124040_265539_27AD3BEB 
X-CRM114-Status: GOOD (  61.10  )
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

On Tue, Oct 3, 2023 at 9:32=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Tue, Oct 03, 2023 at 06:43:07AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Oct 3, 2023 at 5:29=E2=80=AFAM Mark Rutland <mark.rutland@arm.c=
om> wrote:
> > >
> > > On Mon, Oct 02, 2023 at 12:16:17PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Mon, Oct 2, 2023 at 10:24=E2=80=AFAM Mark Rutland <mark.rutland@=
arm.com> wrote:
> > > > >
> > > > > On Mon, Oct 02, 2023 at 09:45:29AM -0700, Douglas Anderson wrote:
> > > > > > Some mediatek devices have the property
> > > > > > "mediatek,broken-save-restore-fw" in their GIC. This means that=
,
> > > > > > although the hardware supports pseudo-NMI, the firmware has a b=
ug
> > > > > > that blocks enabling it. When we're in this state,
> > > > > > system_uses_irq_prio_masking() will return true but we'll fail =
to
> > > > > > actually enable the IRQ in the GIC.
> > > > > >
> > > > > > Let's make the code handle this. We'll detect that we failed to
> > > > > > request an IPI as NMI and fallback to requesting it normally. T=
hough
> > > > > > we expect that either all of our requests will fail or all will
> > > > > > succeed, it's just as cheap to keep a per-IPI bitmap and that k=
eeps us
> > > > > > robust.
> > > > > >
> > > > > > Fixes: 331a1b3a836c ("arm64: smp: Add arch support for backtrac=
e using pseudo-NMI")
> > > > > > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > Closes: https://issuetracker.google.com/issues/197061987#commen=
t68
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > ---
> > > > > >
> > > > > >  arch/arm64/kernel/smp.c | 19 ++++++++++++-------
> > > > > >  1 file changed, 12 insertions(+), 7 deletions(-)
> > > > >
> > > > > I'm not too keen on falling back here when we have no idea why th=
e request failed.
> > > > >
> > > > > I'd prefer if we could check the `supports_pseudo_nmis` static ke=
y directly to
> > > > > account for the case of broken FW, e.g. as below.
> > > > >
> > > > > Mark.
> > > > >
> > > > > ---->8----
> > > > > From 72fdec05c64a74f21871b44c7c760bbe07cac044 Mon Sep 17 00:00:00=
 2001
> > > > > From: Mark Rutland <mark.rutland@arm.com>
> > > > > Date: Mon, 2 Oct 2023 18:00:36 +0100
> > > > > Subject: [PATCH] arm64: smp: avoid NMI IPIs with broken MediaTek =
FW
> > > > >
> > > > > Some MediaTek devices have broken firmware which corrupts some GI=
CR
> > > > > registers behind the back of the OS, and pseudo-NMIs cannot be us=
ed on
> > > > > these devices. For more details see commit:
> > > > >
> > > > >   44bd78dd2b8897f5 ("irqchip/gic-v3: Disable pseudo NMIs on Media=
tek devices w/ firmware issues")
> > > > >
> > > > > We did not take this problem into account in commit:
> > > > >
> > > > >   331a1b3a836c0f38 ("arm64: smp: Add arch support for backtrace u=
sing pseudo-NMI")
> > > > >
> > > > > Since that commit arm64's SMP code will try to setup some IPIs as
> > > > > pseudo-NMIs, even on systems with broken FW. The GICv3 code will
> > > > > (rightly) reject attempts to request interrupts as pseudo-NMIs,
> > > > > resulting in boot-time failures.
> > > > >
> > > > > Avoid the problem by taking the broken FW into account when decid=
ing to
> > > > > request IPIs as pseudo-NMIs. The GICv3 driver maintains a static_=
key
> > > > > named "supports_pseudo_nmis" which is false on systems with broke=
n FW,
> > > > > and we can consult this within ipi_should_be_nmi().
> > > > >
> > > > > Fixes: 331a1b3a836c0f38 ("arm64: smp: Add arch support for backtr=
ace using pseudo-NMI")
> > > > > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > Closes: https://issuetracker.google.com/issues/197061987#comment6=
8
> > > > > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > > > > Cc: Douglas Anderson <dianders@chromium.org>
> > > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > > ---
> > > > >  arch/arm64/kernel/smp.c      | 5 ++++-
> > > > >  drivers/irqchip/irq-gic-v3.c | 2 +-
> > > > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > Sure, this is OK w/ me as long as folks don't mind accessing the
> > > > global here, it's OK w/ me:
> > > >
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > It seems to work for me, thus:
> > > >
> > > > Tested-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > >
> > > > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > > > index 814d9aa93b21b..061c69160f90f 100644
> > > > > --- a/arch/arm64/kernel/smp.c
> > > > > +++ b/arch/arm64/kernel/smp.c
> > > > > @@ -964,7 +964,10 @@ static void smp_cross_call(const struct cpum=
ask *target, unsigned int ipinr)
> > > > >
> > > > >  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
> > > > >  {
> > > > > -       if (!system_uses_irq_prio_masking())
> > > > > +       DECLARE_STATIC_KEY_FALSE(supports_pseudo_nmis);
> > > > > +
> > > > > +       if (!system_uses_irq_prio_masking() ||
> > > > > +           !static_branch_likely(&supports_pseudo_nmis))
> > > >
> > > > One thought, actually, is whether we should actually change
> > > > system_uses_irq_prio_masking() to return the correct value. What do
> > > > you think?
> > >
> > > I don't think we should add this to system_uses_irq_prio_masking(); t=
hat's used
> > > by the low-level flags manipulation code that gets inlined all over t=
he place,
> > > and that code will work regarldess of whether we actually use NMI pri=
orities.
> > >
> > > If we want to avoid using PMR masking *at all* on these platforms, we=
'd need to
> > > detect that within can_use_gic_priorities() or early_enable_pseudo_nm=
i().
> >
> > I suspect that anyone trying to use PMR masking on these systems for
> > any purpose will be unhappy. The issue is talked about in:
> >
> > https://issuetracker.google.com/281831288
> >
> > ...where you can see that the firmware on these systems isn't properly
> > saving/restoring some registers, including GICR_IPRIORITYR.
>
> Ok, then that's a latent bug even before the IPI changes, going back to t=
he
> original workaround in commit:
>
>   44bd78dd2b8897f5 ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devi=
ces w/ firmware issues")
>
> For the sake of those reading the archive, can we have a better descripti=
on of
> what exactly happens on these boards?
>
> IIUC on these boards the firmware fails to save+restore (some?) GICR regi=
sters
> across (some?) PSCI CPU_SUSPEND idle states.
>
> Which registers does it save+restore?
>
> Does it reset other registers into a specific state?

Though I'm not an expert in this area, my understanding is that in
some of the deeper idle states then GICR registers are lost. That
matches a thread [0] I found. In early investigation I found that I
could comment out `cpu-idle-states` in the device tree to avoid the
problems [1]. I believe this is fully expected which is why firmware
is supposed to save/restore these registers whenever a low power is
entered/exited. I'd presume that any register not properly
saved/restored comes up in whatever its default state is.

As far as pseudo-NMI was concerned, all I really needed to
save/restore was "GICR_NUM_IPRIORITYR" [2], but Marc Zyngier looked at
the code and identified [3] at least these in addition:
* GICR_CTLR
* GICR_ISPENDR0
* GICR_ISACTIVER0
* GICR_NSACR

That list seems to match the Arm Trusted Firmware patch that fixed the
issue [4]. ...but it will be impossible to ever get the fix rolled out
to all devices. Even if we could get firmware spins Qualified for
every device there will still be cases where we'll boot with the old
firmware. Since we _don't_ bundle the device tree with the firmware,
we believe that the quirk mechanism that we came up with (add a quirk
in never device trees and firmware removes the quirk when we have a
fix) is at least a robust/reliable way to detect the issue.

The whole issue seems rather concerning, but (apparently) it never
caused issues in the kernel until we tried to use pseudo-NMI.

[0] https://github.com/ARM-software/tf-issues/issues/464
[1] https://issuetracker.google.com/issues/197061987#comment27
[2] https://crrev.com/c/4519877
[3] https://issuetracker.google.com/issues/281831288#comment5
[4] https://github.com/ARM-software/arm-trusted-firmware/commit/1c62cc7fbdf=
2ec2a7e69b3c027d507fcafdcaa12

