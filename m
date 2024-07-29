Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3690DC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/0x59CX402n1FHBQk1SZQEtizSNWtGdnpBxqm2a6U8=; b=oSOA9VqS128YvSS+OIQQQa4syX
	R53cLxiDJh4Uy0ZmWBlXqzk9qlZoYUDdzRPARtRpuaPRXnReI/JtiZp50ee6upru9fw7dVej5hosf
	V9DKcSPPp/aIr8h6w9Bl0fKhWls3Kec6PWmLFHvZjGfCYGL1bsVe+qrEB9/yVlMLgKddLErQs5q2r
	AeaQb9EiA+gy1fOwgnoaa02QqUSPiIaAYiIpZFNL6JydMbkAzaWTZ1RAnPgLb2sy2f9O13AtaOfg4
	vsk9ZRAMW5yOezF4fDQRvO/7TURH9McZ2Ya6UP1D9kt4YlG/AZCwK3Wsgc1u6I8PuwdLNX5PpCap5
	RUv4Ugmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNvr-0000000Ax19-0ifP;
	Mon, 29 Jul 2024 10:48:47 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNvQ-0000000Awv2-0p8G
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 10:48:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52efef496ccso3228216e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722250098; x=1722854898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/0x59CX402n1FHBQk1SZQEtizSNWtGdnpBxqm2a6U8=;
        b=Jdv05auSJ35o0dhP/rTMZ81Y3OsmrJToWnmFMe998E08P558a+a4N0GbKvKLfFnSJz
         8Yxh9oWHyKfv6rnOHgFTY8zUkkrUfICj6jRMlWYQBsWdfLaGNLq+GFpbk5+zxmeH2Mo7
         hTq6DsrMxcpMYgO3ZDOdRJYoHupVRUydR5qvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250098; x=1722854898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/0x59CX402n1FHBQk1SZQEtizSNWtGdnpBxqm2a6U8=;
        b=sRhUYnKzWQj4LO9j7sV/cUX4hpIVXhsqGKgcV8kyJmTdOeFKL6rQA2fY4VJM0OoAew
         gUu9mk6NxIkswkzDVMEh0ZDaeREg4pRDf6GzVWoLCmy+ZuJ94MJtA+2xrwvvVLb7GtN3
         HuxBjD3boeCiHQfzZFeLrFcS08IMhTv2IX2N5eENO+mVpLT/kslyHQFOJAaAKDA+xoGI
         yGMq/iPchzfREAqSl8fkOOWyU51HmDE+7uPLBzavSeFbik6pK7O+8YIQ2VTVxlGyAdPV
         CgVm700pFW8HEF/uJy4rtER0OiZyJ7yCiVCO22+A2EvvIfVwC9YBC5GUrm5Hi3QKipan
         sO0w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6B/6ZNZaJdYgvUdAoycPaxLKibQ0NPf9ab6xnGIKBKMQ9CaJ2weZN0J3hRBWXa1DvHAXBOrb45rLbJlPne7VB9fJI1zrJIIuHzOcA2z3d/fY
X-Gm-Message-State: AOJu0YwlkHGo7uh0GDb94wYPU58CKw7vcAjxvJkNmXfAxQArQmBQIf5q
	bB2Ac/x0qjcbKKc4hNJuk7KJ7FJd5dsLyfbHmJmHfWfRngszfTiys3vNz3Mw5IN6Gq+ve+JPf/h
	48Vn2rMPRSP6MNQ1oHcNI8BqVeQrPwL2Ag/iB
X-Google-Smtp-Source: AGHT+IHB5y8Efven0rM7568H5Q/7IIX0B75sAgumyMxO9pLVe7LTrTw+hIQBfTXynQiq2pmvum8YwhTKmZ6h1vTdBSA=
X-Received: by 2002:a05:6512:4002:b0:52f:36a:f929 with SMTP id
 2adb3069b0e04-5309b6d2e9amr1967665e87.4.1722250097727; Mon, 29 Jul 2024
 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
 <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com> <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
 <51f0f4f3-11a5-4d74-981e-3f24f8475c7f@collabora.com> <CAGXv+5F-U6O3dQdU2L8bR5V+D=PLreACZYCh5sxBY3PFrex1zg@mail.gmail.com>
 <de0b0daa-2a35-4286-b4db-4f646073a04c@collabora.com>
In-Reply-To: <de0b0daa-2a35-4286-b4db-4f646073a04c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jul 2024 18:48:05 +0800
Message-ID: <CAGXv+5EvzRr8h5vnuV2h=zkVwkVp3fShDP_45BpaO0HkivuDtQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1 controller
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_034820_284331_433F4C0E 
X-CRM114-Status: GOOD (  60.17  )
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

On Mon, Jul 29, 2024 at 4:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/07/24 10:07, Chen-Yu Tsai ha scritto:
> > On Mon, Jul 29, 2024 at 3:59=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 26/07/24 17:11, Chen-Yu Tsai ha scritto:
> >>> On Fri, Jul 26, 2024 at 8:11=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
> >>>>> Hi,
> >>>>>
> >>>>> On Mon, Jul 22, 2024 at 11:27=E2=80=AFPM N=C3=ADcolas F. R. A. Prad=
o
> >>>>> <nfraprado@collabora.com> wrote:
> >>>>>>
> >>>>>> Currently if the xhci1 controller happens to probe before the pcie=
1
> >>>>>> controller then it fails with the following errors:
> >>>>>>
> >>>>>> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> >>>>>> xhci-mtk 11290000.usb: can't setup: -110
> >>>>>> xhci-mtk: probe of 11290000.usb failed with error -110
> >>>>>>
> >>>>>> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
> >>>>>> clock, although exactly why this pcie clock is needed for the usb
> >>>>>> controller is still unknown. Add the clock to the xhci1 controller=
 so it
> >>>>>> always probes successfully and use a placeholder clock name for it=
.
> >>>>>>
> >>>>>> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>=
 #KernelCI
> >>>>>> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1dd=
b0ec51@notapiano/
> >>>>>> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.co=
m>
> >>>>>
> >>>>> So I asked MediaTek about this, and it seems the correct thing to d=
o is
> >>>>> disable USB 3 on this host controller using the following snippet. =
The
> >>>>> snippet is copy-pasted from our issue tracker and won't apply direc=
tly.
> >>>>>
> >>>>> This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhc=
i1
> >>>>> is used only for USB 2.0 on an M.2 slot.
> >>>>>
> >>>>
> >>>> Uhm, okay, but why should USB3 be disabled on a controller that supp=
orts USB3?
> >>>>
> >>>> I agree about disabling it on specific boards that use only the USB =
2.0 lines of
> >>>> this controller, but doing that globally looks wrong... and looks li=
ke being a
> >>>> workaround for an error that gets solved with adding a clock as well=
.
> >>>>
> >>>> In short, the question is: why would that be the correct thing to do=
?
> >>>
> >>> We can disable it in mt8195-cherry.dtsi then?
> >>
> >> That device does not use this controller, so yes we can disable it, bu=
t that still
> >> doesn't resolve the issue pointed out by Nicolas...!
> >
> > No. I mean disable USB3 on this port. Also see the next paragraph.
> >
>
> Yes, sorry I was meaning the same - but I effectively wrote "disable cont=
roller"
> instead, my bad.
>
> >> Please note that the issue that he sees doesn't happen only on Tomato,=
 but also on
> >> other MediaTek MT8195/MT8395 boards - and applying this commit makes d=
isabling the
> >> controller, or disabling the USB 3 lines on the controller, kinda redu=
ndant, as
> >> this will effectively fix probing it... but again, fixing the actual i=
ssue with
> >> this controller is something that must be done.
> >
> > If those other boards use the XHCI1 USB3 lines for ... USB3, then the U=
SB3
> > PHY should also be tied to XHCI1, right now due to the Cherry Chromeboo=
k
> > design, only the USB2 PHY is tied to it.
> >
>
> Yes, I am aware of that.
>
> >> Disabling the controller on Tomato is a different topic - here we are =
discussing
> >> about fixing the issue, and that will happen, again, on any board that=
 has this
> >> controller enabled with USB3 lines. :-)
> >>
> >> So, unless there is any specific reason for which applying this commit=
 is a bad
> >> idea, or any alternative fix to this that is better than the proposed =
one, and
> >> not a workaround... I'm applying this one.
> >
> > Didn't I just relay what MediaTek says is the correct fix? Disable USB3
> > for this port on devices where the serial pairs are used for PCIe inste=
ad
> > of USB3.
> >
>
> I think there must've been some misunderstanding here.
>
> Yes you did relay what MediaTek is the correct fix, and I agree that the =
USB3 must
> be disabled on devices where those serial pairs are used for PCIe instead=
 of USB,
> or on devices where those are completely unused.

OK. I will send a patch for Tomato as you asked.

> This, though, will fix the issue only on those devices (because we are di=
sabling
> those lines entirely, so depending on how we see it, this might not be a =
fix but
> rather a workaround).

I would say that is a more accurate description of the hardware, so a fix.

> If we don't apply this fix, any board that uses those pairs for USB 3 ins=
tead will
> still show the same "clocks are not stable" error, leaving them with a br=
oken port.
>
> And I believe that because the clocks are not routed externally but rathe=
r are
> internal to the SoC, so, if INFRA_AO_PCIE_P1_TL_96M is necessary for that=
 USB 3
> port to work, a board that intends to use those pairs for USB3 would stil=
l need
> this exact clock to actually get that port to work.

I couldn't reproduce the issue by disabling pcie1 as Nicolas mentioned.
I don't have any more to add to this though. Sorry for the noise.

> As for Tomato itself - I agree that we must add the u3p-dis-msk=3D0x1 fla=
g, yes,
> and we will, but I'm purely talking about - again - an eventual board tha=
t would
> not have that property because USB3 is exposed/used for real.

I think it would make more sense to fix the `phys =3D ` statement in mt8195=
.dtsi
to list both the USB2 and USB3 PHYs. At the board level, for boards only
using USB2, we would have the overriding `phys =3D ` statement alongside th=
e
`mediatek,u3p-dis-mask` property. Does that make sense to you?


Thanks
ChenYu

> Cheers,
> Angelo
>
> >
> > Regards
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>>> Cheers,
> >>>> Angelo
> >>>>
> >>>>>
> >>>>> ChenYu
> >>>>>
> >>>>> index 8b7307cdefc6..2dac9f706a58
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>>> @@ -1447,6 +1447,7 @@
> >>>>>                                          "xhci_ck";
> >>>>>                            mediatek,syscon-wakeup =3D <&pericfg 0x4=
00 104>;
> >>>>>                            wakeup-source;
> >>>>> +                       mediatek,u3p-dis-msk =3D <0x1>;
> >>>>>                            status =3D "disabled";
> >>>>>                    };
> >>>>>
> >>>>>> ---
> >>>>>>     arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
> >>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195.dtsi
> >>>>>> index 2ee45752583c..cc5169871f1c 100644
> >>>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>>>> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
> >>>>>>                                     <&topckgen CLK_TOP_SSUSB_P1_RE=
F>,
> >>>>>>                                     <&apmixedsys CLK_APMIXED_USB1P=
LL>,
> >>>>>>                                     <&clk26m>,
> >>>>>> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P=
_XHCI>;
> >>>>>> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P=
_XHCI>,
> >>>>>> +                                /*
> >>>>>> +                                 * This clock is required due to =
a hardware
> >>>>>> +                                 * bug. The 'frmcnt_ck' clock nam=
e is used as a
> >>>>>> +                                 * placeholder.
> >>>>>> +                                 */
> >>>>>> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P=
1_TL_96M>;
> >>>>>>                            clock-names =3D "sys_ck", "ref_ck", "mc=
u_ck", "dma_ck",
> >>>>>> -                                     "xhci_ck";
> >>>>>> +                                     "xhci_ck", "frmcnt_ck";
> >>>>>>                            mediatek,syscon-wakeup =3D <&pericfg 0x=
400 104>;
> >>>>>>                            wakeup-source;
> >>>>>>                            status =3D "disabled";
> >>>>>>
> >>>>>> ---
> >>>>>> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> >>>>>> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
> >>>>>>
> >>>>>> Best regards,
> >>>>>> --
> >>>>>> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
>

