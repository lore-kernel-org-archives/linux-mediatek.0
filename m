Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03979C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gcrr3kC74rReKv7GNSo411IeX5s50dNiJe54KXuM0I=; b=QKk+oiPUmu2hwQYM6p8QJn3NZL
	ubN9/hVCg7Y9TKRiL1zY57fFZjep99ILz41rYY7Wd68RgewqeM7SOmI9RlEm3caRFSL+zWhulIbRm
	mIubgKrv7j6WFfea9UomTx9vbwlmUAdabHkXPAnBjofbRZO75UR9h0N4V3yK/4QYNjcCtIA630TMD
	vJ9E9FxJn1Qgt5ZXLO07JuusosIMfBh0TAORwQuObOa7tVyJwB+fjRXKWQ2+yw71VXPJNpxKd3daE
	noIqC060rA2knI3X8w8CtzgtBE3+jjw5c5xx21ctXxTGURBwu0iC5VDF6RXuSmin51HFa+2JJEDzU
	DvLbmKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbYT-004BdX-1g;
	Mon, 30 Oct 2023 23:20:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbYQ-004BcI-1F
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Oct 2023 23:20:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9be3b66f254so751558666b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Oct 2023 16:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698708009; x=1699312809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gcrr3kC74rReKv7GNSo411IeX5s50dNiJe54KXuM0I=;
        b=EqpCNgrwANOHyRsqR8o17NcxYMmRa70tss5ONynF+nP+PHOtwIwucIEmPdurvn/Kg8
         HLH9n37nth3ibWTW/danr8jSIDWjepMNPjdCqJw5fsPHBWiPX0/20l6aXlrL+pXACfNL
         cjn8PM5GUqCesvj8IKKK8NluMcp8a4FZhb9BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698708009; x=1699312809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gcrr3kC74rReKv7GNSo411IeX5s50dNiJe54KXuM0I=;
        b=YHfJEem53i9LKze4boAZjN4bUJYEjBtDnnRrRkA+uJucvou7j60itDw/0vhlPoCYfN
         EOXxvIjS2a/Igd+243IjQW/fSrpqjmOYiQncZ+5M/OR29nvA3JCGEa0Zl2YcbObjrXiz
         0ezM43tFPT2l0GNvTU2swgIFlP+yWpxQpKWQjha46AgWCXwTBqfzUK1NJy7Sb05MHm4h
         oUgQKAfScuidVLL+KZ9NSS7TwT97pThv+IVwmPdmwZ8GU5w8aMeGjyqu5LBJi0T5ZGrp
         ifgU1bc13Uz66EV9Gp9q4xeNBNEy0+mwgwex4t6NUfj9XHpG91PYUNv2M2sKWBFRPwpO
         QG3g==
X-Gm-Message-State: AOJu0YxXbPoYeu8TOCCXX+LkQU5nHlWwFiT2LpqVqLXV1y811rnn3ynW
	8uBUu93tp/d2ArgbCmKhuPukF51aQc4FqljxBFXFWp+W
X-Google-Smtp-Source: AGHT+IHVuXPTA0zlJefiYZBCP1Tt3mtIQ9e0vAGaaTw2p5QNWIwZpP/Ri/oZuDedkCPjt5ahVBP+ZA==
X-Received: by 2002:a17:907:3e13:b0:9bd:f902:9a61 with SMTP id hp19-20020a1709073e1300b009bdf9029a61mr9307146ejc.18.1698708008893;
        Mon, 30 Oct 2023 16:20:08 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id pj27-20020a170906d79b00b0098e34446464sm31414ejb.25.2023.10.30.16.20.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 16:20:08 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so6398a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Oct 2023 16:20:08 -0700 (PDT)
X-Received: by 2002:a50:c04f:0:b0:542:d6e7:1e09 with SMTP id
 u15-20020a50c04f000000b00542d6e71e09mr46600edd.0.1698708007918; Mon, 30 Oct
 2023 16:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <ZS-7DC9OH2DUejLY@FVFF77S0Q05N>
In-Reply-To: <ZS-7DC9OH2DUejLY@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Oct 2023 16:19:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=Jqcq+oS1xQr71eqOHSbW4VHT=_AEDU6upjwsPKGKdg@mail.gmail.com>
Message-ID: <CAD=FV=V=Jqcq+oS1xQr71eqOHSbW4VHT=_AEDU6upjwsPKGKdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: Disable GiC priorities on Mediatek devices w/
 firmware issues
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Amit Daniel Kachhap <amit.kachhap@arm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, James Morse <james.morse@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_162018_425016_A25DE8D9 
X-CRM114-Status: GOOD (  42.02  )
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

On Wed, Oct 18, 2023 at 4:01=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Fri, Oct 06, 2023 at 03:15:51PM -0700, Douglas Anderson wrote:
> > In commit 44bd78dd2b88 ("irqchip/gic-v3: Disable pseudo NMIs on
> > Mediatek devices w/ firmware issues") we added a method for detecting
> > Mediatek devices with broken firmware and disabled pseudo-NMI. While
> > that worked, it didn't address the problem at a deep enough level.
> >
> > The fundamental issue with this broken firmware is that it's not
> > saving and restoring several important GICR registers. The current
> > list is believed to be:
> > * GICR_NUM_IPRIORITYR
> > * GICR_CTLR
> > * GICR_ISPENDR0
> > * GICR_ISACTIVER0
> > * GICR_NSACR
> >
> > Pseudo-NMI didn't work because it was the only thing (currently) in
> > the kernel that relied on the broken registers, so forcing pseudo-NMI
> > off was an effective fix. However, it could be observed that calling
> > system_uses_irq_prio_masking() on these systems still returned
> > "true". That caused confusion and led to the need for
> > commit a07a59415217 ("arm64: smp: avoid NMI IPIs with broken MediaTek
> > FW"). It's worried that the incorrect value returned by
> > system_uses_irq_prio_masking() on these systems will continue to
> > confuse future developers.
> >
> > Let's fix the issue a little more completely by disabling IRQ
> > priorities at a deeper level in the kernel. Once we do this we can
> > revert some of the other bits of code dealing with this quirk.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeat=
ure.c
> > index 2806a2850e78..e35efab8efa9 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2094,9 +2094,30 @@ static int __init early_enable_pseudo_nmi(char *=
p)
> >  }
> >  early_param("irqchip.gicv3_pseudo_nmi", early_enable_pseudo_nmi);
> >
> > +static bool are_gic_priorities_broken(void)
> > +{
> > +     bool is_broken =3D false;
> > +     struct device_node *np;
> > +
> > +     /*
> > +      * Detect broken Mediatek firmware that doesn't properly save and
> > +      * restore GIC priorities.
> > +      */
> > +     np =3D of_find_compatible_node(NULL, NULL, "arm,gic-v3");
> > +     if (np) {
> > +             is_broken =3D of_property_read_bool(np, "mediatek,broken-=
save-restore-fw");
> > +             of_node_put(np);
> > +     }
> > +
> > +     return is_broken;
> > +}
>
> I'm definitely in favour of detecting this in the cpucap, but I think it'=
d be
> better to parse the DT once on the boot CPU rather than on each CPU every=
 time
> it's brought up.
>
> I think if we add something like:
>
> #ifdef CONFIG_ARM64_PSEUDO_NMI
> static void detect_system_supports_pseudo_nmi(void)
> {
>         struct device_node *np;
>
>         if (!enable_pseudo_nmi)
>                 return;
>
>         /*
>          * Detect broken Mediatek firmware that doesn't properly save and
>          * restore GIC priorities.
>          */
>         np =3D of_find_compatible_node(NULL, NULL, "arm,gic-v3");
>         if (np && of_property_read_bool(np, "mediatek,broken-save-restore=
-fw")) {
>                 pr_info("Pseudo-NMI disabled due to Mediatek Chromebook G=
ICR save problem");
>                 enable_pseudo_nmi =3D false;
>         }
>         of_node_put(np);
> }
> #endif /* CONFIG_ARM64_PSEUDO_NMI */
> static inline void detect_system_supports_pseudo_nmi(void) { }
> #endif
>
> ... then we can call that from init_cpu_features() before we call
> setup_boot_cpu_capabilities(), and then the existing logic in
> can_use_gic_priorities() should just work as that returns the value of
> enable_pseudo_nmi.
>
> Note: of_node_put(NULL) does nothing, like kfree(NULL), so it's fine for =
that
> to be called in the !np case.
>
> Would you be happy to fold that in? I'm happy with a Suggested-by tag if =
so. :)

Yup, that looks good to me and I can fold it in (fixing a few nits
like missing "\n" and adding __init to the function). I'll wait to get
maintainers opinions on whether to fold patch #3 in here and then send
a v2.

-Doug

