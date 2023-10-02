Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF623E7490C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w025f/6AdfhrbLNyBq/UB//v5OtoztTxmfkB6A0lQtk=; b=ZFMgHVseqMcxpACXf8f4p0XVzv
	U660w1ucvFT5RRtqMPh9ri02Re7xuXsCo9ndmC4zmQAZluwGsvoGEOHRxpT47MMvUCfyTWu5Z4/te
	wS3d/5v460DygrlXYWNn6zkf0tH8SggsBD0FdUKGChWC8++17m6Jf9tTI8RZbecsMUJajMNaxYLjy
	eZR6UErzLC0EQfz+cs+q6d92eyJvai4AIxPPofaXIlRla6otR4/v3mbyBi0WWnaXZGp3a3dJzIt1h
	hTQwJDalHdiATkAZGOvcZQyzNIDfyrb1OsWWbNKbNzP+ofpcmRH5hX1zsKlEvR3m5JXTcoDfBNsgA
	tCcLpuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOPJ-00DHDu-1l;
	Mon, 02 Oct 2023 19:16:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOPH-00DHD5-0X
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 19:16:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so9155866b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696274195; x=1696878995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w025f/6AdfhrbLNyBq/UB//v5OtoztTxmfkB6A0lQtk=;
        b=izVdQo6mRtQzOvPPSv/lOTa/qfbR9UC213rZ7rW0AtowfYJU3YsrxM8n2Ktk5vKFa0
         ny78FRSwyS5nsyJ4cuN872+c7q9mnTXQ9ilMOtI35AYX0T+w+Qv71BiwjjYW2gSFCzun
         n7zn/x8OvYV7YDBFJ/jwzEkcaziLlKGOIIncQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696274195; x=1696878995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w025f/6AdfhrbLNyBq/UB//v5OtoztTxmfkB6A0lQtk=;
        b=BbMqfW1Ns5b6btTDHoGRUru19vsnzm1hmcLtggOAQG4GfDhde04Elev5cJmPef0dbz
         mAJtYtwAz7AlbxtHxxkRNgd+AGc7WxHcr/MK/gbG4Hg8pkpZdgLgQPEc8d0Nkn7XCvow
         3FwcYnNEhycVYkAG+q2o57u+CJ3gBGfGIi4T0NHi056gTOj8nIX2DP+OmDZkHh+sjIfA
         prjCVInD4y9U0MkAIlFNTAoNSBDijRjkJPEYLg3D9sQrQib0Q0k22l9s8TN54wqxWJg+
         6wFIjn419nTNpXS0J9bIu4w2zD1p9btOAoALEW5wE1THwWnXorD98XvtSpXPzUs/6HT/
         dESA==
X-Gm-Message-State: AOJu0YwkJQtB8LBP03JUatzOS94C1xlU0B3HyByF6T6Z7GlC5ArrmHtu
	8Re9z40qJwzCqVs1rN2NDlzo998BER4YWq9MR/mT/K6D
X-Google-Smtp-Source: AGHT+IFlqLf3L3d+RrqO7ZfVXZzwYqFLPbvQbZ0SW1gOsX/2EegVbMMpB3aXbWnM70h5T0/vWSbyoA==
X-Received: by 2002:a17:906:2249:b0:9a3:faf:7aaa with SMTP id 9-20020a170906224900b009a30faf7aaamr10621724ejr.15.1696274195033;
        Mon, 02 Oct 2023 12:16:35 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b0098ce63e36e9sm17656626ejj.16.2023.10.02.12.16.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 12:16:34 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-405459d9a96so18405e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 12:16:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3b07:b0:400:46db:1bf2 with SMTP id
 m7-20020a05600c3b0700b0040046db1bf2mr28521wms.2.1696274194181; Mon, 02 Oct
 2023 12:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Oct 2023 12:16:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
Message-ID: <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231002_121639_203016_640FDF32 
X-CRM114-Status: GOOD (  37.92  )
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

On Mon, Oct 2, 2023 at 10:24=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
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
> ---
>  arch/arm64/kernel/smp.c      | 5 ++++-
>  drivers/irqchip/irq-gic-v3.c | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Sure, this is OK w/ me as long as folks don't mind accessing the
global here, it's OK w/ me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

It seems to work for me, thus:

Tested-by: Douglas Anderson <dianders@chromium.org>


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

One thought, actually, is whether we should actually change
system_uses_irq_prio_masking() to return the correct value. What do
you think?

-Doug

