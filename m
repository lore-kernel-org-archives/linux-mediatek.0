Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F60C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 15:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTcHH2j+s1hb1mCfRdNcGdP6fILWYb3lLn9HYz/KlSw=; b=GLczWGiw/1hAouO58GfzGGyxP6
	8PlimsfJ3lpaLj/MG51VUCE98Jc0W2QgTyOW+w2ZIP+NiY3KpwCJVkOtj98cx9406STErxsAgxybB
	P9Eg7slBcbkDiH+Rsa5AQfEH1147/IzVUt8IC6Lz2RAjWhbzBHTy/nZl3j8nvD14LBiOhwVGBjWr8
	YFuTMQlGgazXzTp/3lbOeP8Nndd5TgmcrPjD6mKKo5ZVeCVQEnzDdOAbgXaew23nt7mK8RhwqkBU8
	zjhKm+faRj8asiRugfOyw7rXHke3rzakAR/srvOPJyss/MshRllsUTBf22LaQ5pTqh+uX7jxd+y3V
	42GyMC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXMcF-00000004GB5-1Pdm;
	Fri, 26 Jul 2024 15:12:19 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXMbp-00000004G6e-0wgw
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jul 2024 15:11:54 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so20099811fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jul 2024 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722006711; x=1722611511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTcHH2j+s1hb1mCfRdNcGdP6fILWYb3lLn9HYz/KlSw=;
        b=UPycWlw+JKQRsJsPQ+h1K6NySHlT4h14lxXjyKghhy7nUmTxLe8KKyUyEec378L8of
         OE/FwIshk+M74t/qQ9tFfKcDkgVFqWTJ/u75mEW0d/Q0Hb3K2VO9N8Jzr1/288rcObX1
         6YNeAkzD5w960zLOPG5fde8gYKwi3B13fXUKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722006711; x=1722611511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTcHH2j+s1hb1mCfRdNcGdP6fILWYb3lLn9HYz/KlSw=;
        b=KoZyPbhb4G2dL5CwlZuz96lRkByyMYbJiqFb77LGd+U0xntzUWlVDgIEL1An781C+5
         Mpw/kWL5yyTBVyRUbF21bXvnQV6mYPScGgwlY4Wvhxua4wuOaDZGGEhS1jigsLLvmxfM
         09EhA23RYJDb4MkGmmj4pAGE3GAHQr+MAUEKuPKydXem1fhlkiC+Q5A9AlCZ5SKqdb/E
         /Tn/z66hDxiys1U9FZ7YQM0dUpU4tReQUlmVD+n1xA11NMcKg/gjiEPkOmWlvtdoYW+v
         O5+Xv4Cwvtv82phX7Hkjalw0gx+AQ4rvh3rYZ4oBZbOg/yt8p3R2Leew+/DCFDWmHAjo
         7aig==
X-Forwarded-Encrypted: i=1; AJvYcCU0HRv3h1OEaW19FQEm5sf32DDXnTCfR2q+dnLz8rP6S4ot+/zo5WhhrOvHcO4i/dv16Dt0nq8FBIzJFfYordzzX/Q00sUj1pAuK4EkJoalzGN6
X-Gm-Message-State: AOJu0Yy0KcBXonAgq4swm4S8YNaTbT6fBxlBe8GsqU5O+wPVqq8nL7pT
	EEwRUmhdNhrRX964lERwbFmV6plYABGtrjClJgiCy2HSL8ulIai58d1Ts9hLkdicBc74bf0+SMw
	n4uUchtwfWGUT5Xx0qG+TGb2lb5dnVcv8M++NdmRbHITBpoo=
X-Google-Smtp-Source: AGHT+IHDVcZ7KXLOAKMLyDwEWrD5j4fRyegkq6cGnhaUP9u+zy4o58+lxAm64v2kyV8TtF07McmVZ2yCfIFULN1rXkc=
X-Received: by 2002:a2e:9786:0:b0:2ef:324f:c907 with SMTP id
 38308e7fff4ca-2f03db562c7mr51360951fa.5.1722006710402; Fri, 26 Jul 2024
 08:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com> <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com>
In-Reply-To: <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 26 Jul 2024 23:11:37 +0800
Message-ID: <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240726_081153_315896_36B3B445 
X-CRM114-Status: GOOD (  34.25  )
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

On Fri, Jul 26, 2024 at 8:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
> > Hi,
> >
> > On Mon, Jul 22, 2024 at 11:27=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> >>
> >> Currently if the xhci1 controller happens to probe before the pcie1
> >> controller then it fails with the following errors:
> >>
> >> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> >> xhci-mtk 11290000.usb: can't setup: -110
> >> xhci-mtk: probe of 11290000.usb failed with error -110
> >>
> >> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
> >> clock, although exactly why this pcie clock is needed for the usb
> >> controller is still unknown. Add the clock to the xhci1 controller so =
it
> >> always probes successfully and use a placeholder clock name for it.
> >>
> >> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> #Ke=
rnelCI
> >> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec=
51@notapiano/
> >> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
> > So I asked MediaTek about this, and it seems the correct thing to do is
> > disable USB 3 on this host controller using the following snippet. The
> > snippet is copy-pasted from our issue tracker and won't apply directly.
> >
> > This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhci1
> > is used only for USB 2.0 on an M.2 slot.
> >
>
> Uhm, okay, but why should USB3 be disabled on a controller that supports =
USB3?
>
> I agree about disabling it on specific boards that use only the USB 2.0 l=
ines of
> this controller, but doing that globally looks wrong... and looks like be=
ing a
> workaround for an error that gets solved with adding a clock as well.
>
> In short, the question is: why would that be the correct thing to do?

We can disable it in mt8195-cherry.dtsi then?

ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> > index 8b7307cdefc6..2dac9f706a58
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1447,6 +1447,7 @@
> >                                        "xhci_ck";
> >                          mediatek,syscon-wakeup =3D <&pericfg 0x400 104=
>;
> >                          wakeup-source;
> > +                       mediatek,u3p-dis-msk =3D <0x1>;
> >                          status =3D "disabled";
> >                  };
> >
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
> >>   1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boo=
t/dts/mediatek/mt8195.dtsi
> >> index 2ee45752583c..cc5169871f1c 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
> >>                                   <&topckgen CLK_TOP_SSUSB_P1_REF>,
> >>                                   <&apmixedsys CLK_APMIXED_USB1PLL>,
> >>                                   <&clk26m>,
> >> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHC=
I>;
> >> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHC=
I>,
> >> +                                /*
> >> +                                 * This clock is required due to a ha=
rdware
> >> +                                 * bug. The 'frmcnt_ck' clock name is=
 used as a
> >> +                                 * placeholder.
> >> +                                 */
> >> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL=
_96M>;
> >>                          clock-names =3D "sys_ck", "ref_ck", "mcu_ck",=
 "dma_ck",
> >> -                                     "xhci_ck";
> >> +                                     "xhci_ck", "frmcnt_ck";
> >>                          mediatek,syscon-wakeup =3D <&pericfg 0x400 10=
4>;
> >>                          wakeup-source;
> >>                          status =3D "disabled";
> >>
> >> ---
> >> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> >> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
> >>
> >> Best regards,
> >> --
> >> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>
> >>
>
>
>

