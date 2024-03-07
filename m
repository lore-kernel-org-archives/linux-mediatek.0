Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28118C54798
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRR3aMrPNTHPyKTnpZBfnYrcMUQU7aCizh88lK2tEOw=; b=tnlEEW0QpIDrvfIhtRGhEbKFo4
	Hu5fQ/t8aB2TK3+jHRP25CW1Y2i8ugADmdc8OIgmLt4gKChHksZYDet/jkTILAyJ3ggNpppXQIJ/r
	Vn4Sv6QWH5gGzdVNXPhbOYkBTux/RQSsEAwCEMWYcpsqcR+A+N4mVl4qFtcdHs5TLPDxW4zL739+Q
	6eqAcYnmxXdnuFJ8Bwu8JFBjXAZHIMZwgil8gRiqUU4dMphq2UjOFAp1uRQ31StU63eOp+jvyyh4x
	4RaOGYwol8cY+7pGeUl759ZWwjsu9ULNcgrr5WypKITgZaKBhnxOkreFGbXDtsakRhAyvYflbaOGG
	1qd73ETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGk2-00000005WBX-2DIh;
	Thu, 07 Mar 2024 16:37:10 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riGjx-00000005W9s-2b8O;
	Thu, 07 Mar 2024 16:37:07 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-21eea6aab5eso585084fac.0;
        Thu, 07 Mar 2024 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709829424; x=1710434224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRR3aMrPNTHPyKTnpZBfnYrcMUQU7aCizh88lK2tEOw=;
        b=X2O0n4s6gYQ8dUIX+23e7vxWczTZpWBTYhdl7im22ZVZUOn79IdPWrWdv+7Mp3mwIN
         /9a84TE2S5sgsTg25+5BwdoZx63v2sNJLCnFT5SpScR2No92v7GO1IxkjWCEMg/9kMWU
         MD8mDj5RfMhRxaw9uvenxBIPOpVNBzyWdnA44IaYpKgPAO5MhhShbMMAISAEJVzPkLda
         bLdTd1hs3Y1AX7m5RWd1g4GZd/1AQMy62TMuY55hliu2QFSX/ihdEHsBvlJB8r4KxxLJ
         KSo5D4x5BbLy2Z5C8Dk2DOcAr3zVQSIWoZlB9PJBiRbIUyRRGmNc/P2ms4RhADha2WR3
         mjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709829424; x=1710434224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRR3aMrPNTHPyKTnpZBfnYrcMUQU7aCizh88lK2tEOw=;
        b=JrNn2EmJTkf+t+PcwcfSXjPF0/9CUEDJSRgdH20s2vS8b1hjB/FMpMPehTiTxEPnxm
         kocMurv8DrgxLs1Zi9Up0eM0qOY6h/9rxyuVjLH/IKopuxQRjXfyUjmNDzr4pXTuFZ/U
         i/mppbEcvI7BR3f4QBsrxBi+AmhTXdMc+dBuMbYPXaaDX4e74F7ce7aUkR4N8dgLJx8l
         /NtTMkDWIVezbbfx6ItBCk2tuQGiGTfPTQJYMRHYkolC2E2T3kLP45Wo1quiR4ajD+Vi
         /SC9UXp7nM0+ndWonfBLHk3fOOKK7NbEWCwvAI4mV0iPXuUVPc5ons24rIdrx+03I5h8
         2k0A==
X-Forwarded-Encrypted: i=1; AJvYcCW7vCuCDEnjWY6WktihPipReVTqs6q66wQeTITK0fWU74dPySjd+W3bzhHggipYsEURsqxVbTWoE9ws/FswPCon7owXYpLIY7XL5jZZTKY+tqnYjOqcyhw0vh31lpCE6n3SykmK/pwvbtaEcmMS2r47zkOLLB2VmGg=
X-Gm-Message-State: AOJu0YyEF/um4e+WYBcKs7SOWl6rG4bhODFWYCaoLfIWhuOpOAtvJmKa
	kS1IIYlXMbbgFhWBK5FkZ5PA3B0X5TO+khL07peW/2oTB34Xgl5GDWjX0yfR1+HhNiQoCN0+PuE
	wLAPVQT3lqIBtw3jEoSKuuY5VveEhI5Ic
X-Google-Smtp-Source: AGHT+IFJQktXHafepx7m2ZI9QAsBmwKMITqcJJIw//kIMZ1qNUrVo2cXeWwX3DelxvQp+xNWB9FVPEmJ0rR4dSgR1Bg=
X-Received: by 2002:a05:6871:782:b0:21e:e5db:7964 with SMTP id
 o2-20020a056871078200b0021ee5db7964mr370234oap.23.1709829423970; Thu, 07 Mar
 2024 08:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
 <20240306201045.1475-2-justin.swartz@risingedge.co.za> <CAMhs-H9WyQZsvEvCfUcZ0_eU8--EzxEmaxR50wdRFDGP3E64ZQ@mail.gmail.com>
 <13e3063facfea3407dba23b74b0a56db@risingedge.co.za>
In-Reply-To: <13e3063facfea3407dba23b74b0a56db@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 7 Mar 2024 17:36:51 +0100
Message-ID: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mips: dts: ralink: mt7621: add serial1 and serial2 nodes
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_083705_819669_642E3DFA 
X-CRM114-Status: GOOD (  24.07  )
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

Hi Justin,

On Thu, Mar 7, 2024 at 4:15=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Hi Sergio
>
> On 2024-03-07 12:04, Sergio Paracuellos wrote:
> > Hi Justin,
> >
> > On Wed, Mar 6, 2024 at 9:11=E2=80=AFPM Justin Swartz
> > <justin.swartz@risingedge.co.za> wrote:
> >>
> >> Add serial1 and serial2 nodes to define the existence of
> >> UART1 and UART2.
> >>
> >> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> >> ---
> >>  arch/mips/boot/dts/ralink/mt7621.dtsi | 38
> >> +++++++++++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>
> >> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi
> >> b/arch/mips/boot/dts/ralink/mt7621.dtsi
> >> index dca415fdd..2069249c8 100644
> >> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> >> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> >> @@ -128,6 +128,44 @@ serial0: serial@c00 {
> >>                         pinctrl-0 =3D <&uart1_pins>;
> >>                 };
> >>
> >> +               serial1: serial@d00 {
> >> +                       status =3D "disabled";
> >> +
> >> +                       compatible =3D "ns16550a";
> >> +                       reg =3D <0xd00 0x100>;
> >> +
> >> +                       clocks =3D <&sysc MT7621_CLK_UART2>;
> >> +
> >> +                       interrupt-parent =3D <&gic>;
> >> +                       interrupts =3D <GIC_SHARED 27
> >> IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +                       reg-shift =3D <2>;
> >> +                       reg-io-width =3D <4>;
> >> +                       no-loopback-test;
> >> +
> >> +                       pinctrl-names =3D "default";
> >> +                       pinctrl-0 =3D <&uart2_pins>;
> >> +               };
> >> +
> >> +               serial2: serial@e00 {
> >> +                       status =3D "disabled";
> >> +
> >> +                       compatible =3D "ns16550a";
> >> +                       reg =3D <0xe00 0x100>;
> >> +
> >> +                       clocks =3D <&sysc MT7621_CLK_UART3>;
> >> +
> >> +                       interrupt-parent =3D <&gic>;
> >> +                       interrupts =3D <GIC_SHARED 28
> >> IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +                       reg-shift =3D <2>;
> >> +                       reg-io-width =3D <4>;
> >> +                       no-loopback-test;
> >> +
> >> +                       pinctrl-names =3D "default";
> >> +                       pinctrl-0 =3D <&uart3_pins>;
> >> +               };
> >> +
> >
> > Please follow the preferred order for properties described in dts
> > coding style [0]. I know that there is some mess around the properties
> > order in some nodes with the current dtsi file but we did not have
> > coding style before and now we have it, so I think we should follow it
> > at least for new additions.
>
> No problem. I see you've already "Acked-by" patch 1 (adding pinctrl
> properties to serial0) of this set, so would it be a better move to
> submit a new patch set that would look something like:
>
>   1. add pinctrl-name and pinctrl-0 to serial0 [no changes from what I
> sent]
>   2. reorder serial0 properties according to the DTS style guidelines
>   3. add serial1 and serial2 with the correct property order

This would be ok, thank you.

Best regards,
    Sergio Paracuellos

