Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98C2E92FFB
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMO0y6d1gIggTjy/nwhhxTiY2T6sUr92V5iWg7Ms3S4=; b=HxgRbwuGMCv1nNXrTIuVpECFwX
	+H7F9222QtnK55T0wd7M5v0BtE87qmTLmoRdS0AsdUfVcuXba8fSBIS2+iTK09cUdvBaQXSMweO2V
	ufd8cKMgkLS/JqzHZGRqKkgmxi0YkZkWrr0eJWICtvPm04M1r3ZcHAZSHwa+gdu5WcBac9qeIZkWy
	ZKO7mE2E1/tHDOiBtVnSwViX9jAZeVpzTH9f2LujKxQ0fnzTv7BvQr+uCg/JxPYEuwx4lJRcCMPo4
	hPj4jB3irMitbpjES4o3NcdrYiH96iNw059Q3OcuNAbvTUY27Z9P60baj96ZqKZDSfFFF3IAJK2qA
	/i1uXpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qohwt-005WuD-2A;
	Fri, 06 Oct 2023 10:20:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qohwn-005Woa-1f
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 10:20:43 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50437c618b4so2445111e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696587639; x=1697192439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMO0y6d1gIggTjy/nwhhxTiY2T6sUr92V5iWg7Ms3S4=;
        b=kmz8jm9FWwZt8B4OtO2IJ3gPr39zZJ2xpqPRF2IGZ0jl972K3Voq2bljoV3g0+5Lle
         0mHyj1zfL2GCQB/cPVvd3Ht2fqUCKLyjsUqkSYzTPPzxgxsNb89qGU47eSc/8Zs/aCVx
         y/vy1oDftyWA65PVUfbh24oSozQ203JrGJrWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696587639; x=1697192439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMO0y6d1gIggTjy/nwhhxTiY2T6sUr92V5iWg7Ms3S4=;
        b=mrI+Kc2luzB9utqEANUNEAX2Cv+DO7RSkT9hms1jEcRMrE3UVnwNlCmf8oKBF/ilYD
         46apv+SwKS8AF4F5zJm14jCGWjbgitBqVpMm2KTEpfF4i4ckTsMAuC+3O9h18sZCKD/0
         Hlf4THdI6YsgR5Dle6MN8WQAZW3iqiv2WCPub3mcLFeM0wiJDsKezbyP5AWCdtaknMMU
         81z4EbJeNusYcEdbN84WvIDjOCuL9fla6RM4VNgfuL7kNEF7qJsiSkEmQZmkENGDgtoA
         cTBzfZKZiRqKJBjXRcCw0yDfCOTsc0N7IwijbTxcSlDZ8NmRfhOf1iSKIeQZD1kQAthR
         mejQ==
X-Gm-Message-State: AOJu0YyUmSoAgJpQACe3fBB2Ii8Cfzhke9IjfMQXy4UU87bMG4uyWh8I
	CKKo0w6mkxzhm4W+HIc5LWgNJj5cCzM0qhr9znRmAQ==
X-Google-Smtp-Source: AGHT+IEiszbiTGbErCkaGwOmwLTqn/3ZFNKuaOGdePa5MncEL3HFq5l3iPfNyaX178j2q02TmjHlawqg9j94X4q/aJA=
X-Received: by 2002:ac2:4e87:0:b0:503:3816:c42c with SMTP id
 o7-20020ac24e87000000b005033816c42cmr6141584lfr.41.1696587639012; Fri, 06 Oct
 2023 03:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Oct 2023 18:20:26 +0800
Message-ID: <CAGXv+5Fm66CJidLsfJRYuSndeMJHLfdwAWDdUHyx8TeMvuoJ0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
To: Mark Rutland <mark.rutland@arm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Valentin Schneider <vschneid@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Misono Tomohiro <misono.tomohiro@fujitsu.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_032041_561174_2B75E1D9 
X-CRM114-Status: GOOD (  37.68  )
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

On Tue, Oct 3, 2023 at 1:24=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Mon, Oct 02, 2023 at 09:45:29AM -0700, Douglas Anderson wrote:
> > Some mediatek devices have the property
> > "mediatek,broken-save-restore-fw" in their GIC. This means that,
> > although the hardware supports pseudo-NMI, the firmware has a bug
> > that blocks enabling it. When we're in this state,
> > system_uses_irq_prio_masking() will return true but we'll fail to
> > actually enable the IRQ in the GIC.
> >
> > Let's make the code handle this. We'll detect that we failed to
> > request an IPI as NMI and fallback to requesting it normally. Though
> > we expect that either all of our requests will fail or all will
> > succeed, it's just as cheap to keep a per-IPI bitmap and that keeps us
> > robust.
> >
> > Fixes: 331a1b3a836c ("arm64: smp: Add arch support for backtrace using =
pseudo-NMI")
> > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > Closes: https://issuetracker.google.com/issues/197061987#comment68
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  arch/arm64/kernel/smp.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
>
> I'm not too keen on falling back here when we have no idea why the reques=
t failed.
>
> I'd prefer if we could check the `supports_pseudo_nmis` static key direct=
ly to
> account for the case of broken FW, e.g. as below.
>
> Mark.
>
> ---->8----
> From 72fdec05c64a74f21871b44c7c760bbe07cac044 Mon Sep 17 00:00:00 2001
> From: Mark Rutland <mark.rutland@arm.com>
> Date: Mon, 2 Oct 2023 18:00:36 +0100
> Subject: [PATCH] arm64: smp: avoid NMI IPIs with broken MediaTek FW
>
> Some MediaTek devices have broken firmware which corrupts some GICR
> registers behind the back of the OS, and pseudo-NMIs cannot be used on
> these devices. For more details see commit:
>
>   44bd78dd2b8897f5 ("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devi=
ces w/ firmware issues")
>
> We did not take this problem into account in commit:
>
>   331a1b3a836c0f38 ("arm64: smp: Add arch support for backtrace using pse=
udo-NMI")
>
> Since that commit arm64's SMP code will try to setup some IPIs as
> pseudo-NMIs, even on systems with broken FW. The GICv3 code will
> (rightly) reject attempts to request interrupts as pseudo-NMIs,
> resulting in boot-time failures.
>
> Avoid the problem by taking the broken FW into account when deciding to
> request IPIs as pseudo-NMIs. The GICv3 driver maintains a static_key
> named "supports_pseudo_nmis" which is false on systems with broken FW,
> and we can consult this within ipi_should_be_nmi().
>
> Fixes: 331a1b3a836c0f38 ("arm64: smp: Add arch support for backtrace usin=
g pseudo-NMI")
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> Closes: https://issuetracker.google.com/issues/197061987#comment68
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Marc Zyngier <maz@kernel.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/kernel/smp.c      | 5 ++++-
>  drivers/irqchip/irq-gic-v3.c | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 814d9aa93b21b..061c69160f90f 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -964,7 +964,10 @@ static void smp_cross_call(const struct cpumask *tar=
get, unsigned int ipinr)
>
>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  {
> -       if (!system_uses_irq_prio_masking())
> +       DECLARE_STATIC_KEY_FALSE(supports_pseudo_nmis);
> +
> +       if (!system_uses_irq_prio_masking() ||
> +           !static_branch_likely(&supports_pseudo_nmis))
>                 return false;
>
>         switch (ipi) {
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 787ccc880b22d..737da1b9aabf2 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -106,7 +106,7 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key=
);
>   * - Figure 4-7 Secure read of the priority field for a Non-secure Group=
 1
>   *   interrupt.
>   */
> -static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
> +DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
>
>  DEFINE_STATIC_KEY_FALSE(gic_nonsecure_priorities);
>  EXPORT_SYMBOL(gic_nonsecure_priorities);
> --
> 2.30.2
>
>

