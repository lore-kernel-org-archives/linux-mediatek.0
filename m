Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CBC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHh7THGmNUX1NDYtIMVbnhFwwspK0WwD8hBv2/VAAYc=; b=49na41iH45ZtMEMSqayY5amE9L
	ONf3ilRQwzGP6g+8+WEQFkQo4kUEXUK4M9s2nHJc3VTnI63GugyuiX8BhDr8JYP3RV57ZFzpaqDI6
	q0+wVuvNA9jjBQVroiJ165YY9eEoVSOF8Ea0cDSoQHkvlAUGI5qvLGNFESCRClBerOiky5xrg2vyM
	FuXdq7kVbhdu5hJP+x5czAk/PsjwTeozmn9E8zeirWYh41sfLi/l/suI1nB5kxt5d5kqunJp23yc+
	A8MpSaY5V6w11EL9KI396oYV92OtsTWsXu3p4IJPNOvzSpjNrEHY+KQKjQwLarXj736EyEYdMjuBd
	FJQeKDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0o-00C36p-0R;
	Fri, 12 May 2023 13:40:46 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxT0k-00C34m-27
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 13:40:44 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f3a287ecceso21310571cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 May 2023 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683898841; x=1686490841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHh7THGmNUX1NDYtIMVbnhFwwspK0WwD8hBv2/VAAYc=;
        b=LBIavBx65RK+r4uqlBsGVDjBwqBi2VAoWO5u4KU6+bgusanbag9pJmFX2VrEWGruvw
         d/5c38pyCTlEpfHmF95A7kBY/LvlqMiVhHs1j8tsowLWZICI+FdEGzBbKDVlPpjFYtCC
         HTUtVbhdXbyOnLJUs6R+KoKjM9BT/9gyzW3fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683898841; x=1686490841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHh7THGmNUX1NDYtIMVbnhFwwspK0WwD8hBv2/VAAYc=;
        b=e7pEDaA2+pyldEMFHE2NJae9ESydAmE5o8WW/d9hI6QGNpfIqcOGc3i43cxfIwwObj
         SApiiZiR1AGdfFmDy9KlcFDI19ZJjt2FhrGjs+UENcjcs4LAa+EnZXuIdEqJ4tz3b5K7
         XZ65KwQLlyilNPRvMi1/Vr7voM4R5G8wzPdDquAOdhAcjJ8wCYrW9cQijdCKGRqmqJyO
         CB02NBoBprBf4fUMWEOQjLhxpZtaNwyVFFT2PiJKWsYv+qxHvi3AAe35Q3twqjFznFH/
         Uz4faR8q/brZb5+WDfUVFbHvPt0b5Din6yJXJ3/dBtffw9oesGtGe+7Li61t18acVgoR
         1ESg==
X-Gm-Message-State: AC+VfDyLrcqUVKpIyDuVjAqdIyhr53/V66VJkGDZj5zzFe+s55MsjBrJ
	yVsN6cegiqEQwL0ID0ZW47yKFytlC/cjmu5LTA0=
X-Google-Smtp-Source: ACHHUZ6SyuMh7+lV6z0En8obU6RcuR08jxPh1cDZIcmznpPIlrY92f388956yUY+2SfvmHqU12IXeQ==
X-Received: by 2002:a05:622a:44:b0:3f3:91e9:47bf with SMTP id y4-20020a05622a004400b003f391e947bfmr24336719qtw.38.1683898840734;
        Fri, 12 May 2023 06:40:40 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id l30-20020ac8459e000000b003e97fe68511sm3113089qtn.3.2023.05.12.06.40.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 06:40:39 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3f38a9918d1so1015531cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 May 2023 06:40:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:3ef:1c85:5b5e with SMTP id
 t18-20020a05622a181200b003ef1c855b5emr253424qtc.19.1683898839232; Fri, 12 May
 2023 06:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid> <86v8gym0ys.wl-maz@kernel.org>
In-Reply-To: <86v8gym0ys.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 May 2023 06:40:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnNaRc7D3nZ658KD18fDSQCBODS-16gpERkKcb7v793w@mail.gmail.com>
Message-ID: <CAD=FV=VnNaRc7D3nZ658KD18fDSQCBODS-16gpERkKcb7v793w@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: interrupt-controller: arm,gic-v3: Add
 quirk for Mediatek SoCs w/ broken FW
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Ben Ho <Ben.Ho@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org, 
	Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_064042_695671_B51A5DB4 
X-CRM114-Status: GOOD (  45.67  )
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

On Fri, May 12, 2023 at 1:02=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Thu, 11 May 2023 23:05:35 +0100,
> Douglas Anderson <dianders@chromium.org> wrote:
> >
> > When trying to turn on the "pseudo NMI" kernel feature in Linux, it
> > was discovered that all Mediatek-based Chromebooks that ever shipped
> > (at least ones with GICv3) had a firmware bug where they wouldn't save
> > certain GIC "GICR" registers properly. If a processor ever entered a
> > suspend/idle mode where the GICR registers lost state then they'd be
> > reset to their default state.
> >
> > As a result of the bug, if you try to enable "pseudo NMIs" on the
> > affected devices then certain interrupts will unexpectedly get
> > promoted to be "pseudo NMIs" and cause crashes / freezes / general
> > mayhem.
> >
> > ChromeOS is looking to start turning on "pseudo NMIs" in production to
> > make crash reports more actionable. To do so, we will release firmware
> > updates for at least some of the affected Mediatek Chromebooks.
> > However, even when we update the firmware of a Chromebook it's always
> > possible that a user will end up booting with old firmware. We need to
> > be able to detect when we're running with firmware that will crash and
> > burn if pseudo NMIs are enabled.
> >
> > The current plan is:
> > * Update the device trees of all affected Chromebooks to include the
> >   'mediatek,gicr-save-quirk' property. The kernel can use this to know
> >   not to enable certain features like "pseudo NMI". NOTE: device trees
> >   for Chromebooks are never baked into the firmware but are bundled
> >   with the kernel. A kernel will never be configured to use "pseudo
> >   NMIs" and be bundled with an old device tree.
> > * When we get a fixed firmware for one of these Chromebooks, it will
> >   patch the device tree to remove this property.
>
> Since you're in control of distributing the FW together with the
> kernel, I assume you're also in control of the command line. Why can't
> that firmware pass the option enabling the pseudo-NMI support,
> dispensing ourselves from all of this?

I considered the option, but it gets really awkward. Specifically:

1. We can't have old firmwares "take away" the kernel command line
option enabling pseudoNMI, obviously.

2. Having new firmware inject `irqchip.gicv3_pseudo_nmi=3D1` into the
kernel command line feels really awkward from an abstraction point of
view. This bakes into the firmware an implementation detail about how
something is implemented / enabled in the kernel, which feels wrong.
In general I'm not a fan of needing the kernel command line argument
to begin with and I'd hope that eventually it could go away.

3. Having the firmware inject `irqchip.gicv3_pseudo_nmi=3D1` into the
kernel command line also makes it awkward when you consider
non-affected boards. On Qualcomm boards, Rockchip boards, and x86
boards we want to enable pseudo NMI without needing to spin the
firmware to have it add this option. ...so we have to add this option
to the "default" command line for every board _except_ affected
Mediatek boards? Is this weird convention something that our build
system carries as we move to newer Mediatek SoCs that aren't affected?
What if we want a single build for Mediatek and Qulcomm boards (which
is something that has been bandied about, even if we haven't done it
yet).

Considering all the above, I think trying to use the
`irqchip.gicv3_pseudo_nmi=3D1` like this wouldn't fly.


> > For some details, you can also see the public bug
> > <https://issuetracker.google.com/281831288>
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../bindings/interrupt-controller/arm,gic-v3.yaml           | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm=
,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,g=
ic-v3.yaml
> > index 92117261e1e1..8c251caae537 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3=
.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3=
.yaml
> > @@ -166,6 +166,12 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  mediatek,gicr-save-quirk:
>
> I think this deserves something *much* stronger that outlines what is
> wrong, because this is not just a quirk. This is a failure to even
> remotely grasp the requirements of the architecture (and to use
> standard, public code that would have done it correctly). Something
> like "mediatek,broken-save-restore-fw" would be more adequate.

Sure, I'll rename it in the next spin. Unless we get into a big
discussion somewhere else in this patch, I'll plan that for early next
week.


> > +    type: boolean
> > +    description:
> > +      Asserts that the firmware on this device has issues saving and r=
estoring
> > +      GICR registers when CPUs are powered off.
>
> Nit: not the the CPUs, but the GIC redistributors.

Ah, good point. I'll update.

