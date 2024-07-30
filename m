Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11636C3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 04:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgGP1ucTPfcv4IyFkymcgQIfN0PbeyLZRnIeoFwlKQM=; b=1YZndn0Ywx7YGusuBknVtbKrMB
	I5xedZNR8OcG0WIuEbolpuXbu/ZuD4hji6/sHjhpNj58u3Tx9G1zj2f+U0zJDvfygOMrQ/eIxdRkv
	adp9sVIINKtJDKzmBie7uc52yEUvrjiuVQmtDRwepsLHZXUEE3oftMfZDEIzrMrUprc6ZfZbjd0/T
	LlGx1vSjFns0ILOVmrO/rv3oLbqyQJ+DH5I4nhHbdgy32N6tuPFhnHhg4xdXezoD6zOCFHgEaEP0L
	AOORb3zE8ryvvSKf/4qNMr72kDD5QuOALkqiColaeQEGTmhuHZ9qUiosPt5gXRvTmEBCb9jz7TXtk
	WWp0PAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYeIl-0000000DZde-2Z4k;
	Tue, 30 Jul 2024 04:17:32 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYeIX-0000000DZbg-3fdy
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jul 2024 04:17:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso47935101fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 21:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722313036; x=1722917836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgGP1ucTPfcv4IyFkymcgQIfN0PbeyLZRnIeoFwlKQM=;
        b=XibULACuxjf1P4vMij9Ry+tiFzT1ZtFQVMzlwj1stcOhUEImU9QOT7py49I5SR3g6z
         douDqDF1roOXdDiO3hnsBoGF6agsh9HZMgpaySRvhRhf9fUdgXk86IGsuqZyJ0xVM+q8
         ILkTRbESw9jS9R1pL8l6TpKUtf8iSD8kRQo7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722313036; x=1722917836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgGP1ucTPfcv4IyFkymcgQIfN0PbeyLZRnIeoFwlKQM=;
        b=jQHB8BKOsFimAdkiMAwzOXovPciPqCb/70Nx7s3gDJTDDmpkSK9Zhe9IqXxEVzc/47
         bEGEsRuNgdg1nLkp0wl1IKofu1YV34gjwMCWx87927eKod50SnjPOwCE+Q/LFow3zI7f
         XmY6EpVFMMKjmqiUaVRZClseE3nI+70UZ4jmkSVRP+vtDUU9ErgAsJBicke8ltEQSeeQ
         lH0Do2V1Vz+bY8aKO3Gje+pUXluHWnH1x1Jwfx02lKt9k4q3iyh60KJiW3U9KYlHSeNO
         8jRcn16S5diwVCLM95I65cMUSxJpe1k7EkEORJn74G+hCUIxhn+CVm9cVUkZfiUJwec4
         Unbg==
X-Forwarded-Encrypted: i=1; AJvYcCVgX758lhR0UihTZHwPhuq47AqgRRbfeTc6N/vdfBBULtkAfCikMIZwPdJ3QdGPu6ktoUX8sVePSMl0kJ7go+VSD8FVIrEWncRd3FjnhveSt8sr
X-Gm-Message-State: AOJu0YyK+uq5u23qB9ojaT5ulJwWBLuobIVHkI53+jdImMqULIXxSMZS
	/y8H3btH+eLZWl0XHvuK1MlTWSa5BOWMMWa0qeLekTfcy1rrxAgcyaDr0qcegARez16HhCQQuB1
	WTZNfFMk10DG9oo6tEa2Qc5h7rPqvf1kr7uNn
X-Google-Smtp-Source: AGHT+IGfiA0+QZ9Kb6Y4YqqZvxoYTPMWzVGbPjJzPBkYhPspR8Xa0o5mt/jjmatQ4v/8mnzKWm+4pAxAxR9srNb4oU8=
X-Received: by 2002:a05:651c:545:b0:2f0:1fd5:2f29 with SMTP id
 38308e7fff4ca-2f12edfef11mr69164661fa.19.1722313035624; Mon, 29 Jul 2024
 21:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
 <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com> <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
 <51f0f4f3-11a5-4d74-981e-3f24f8475c7f@collabora.com> <CAGXv+5F-U6O3dQdU2L8bR5V+D=PLreACZYCh5sxBY3PFrex1zg@mail.gmail.com>
 <de0b0daa-2a35-4286-b4db-4f646073a04c@collabora.com> <CAGXv+5EvzRr8h5vnuV2h=zkVwkVp3fShDP_45BpaO0HkivuDtQ@mail.gmail.com>
 <c3e38dae-646f-471a-ae40-150b8f86cac0@collabora.com> <be8a0047-3a37-4e25-b4aa-ab34adff4418@notapiano>
In-Reply-To: <be8a0047-3a37-4e25-b4aa-ab34adff4418@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jul 2024 12:17:04 +0800
Message-ID: <CAGXv+5EybBNiapMDcnvW5kMKm_ig8kta6-XsGYAFss8EOyKCCg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1 controller
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_211717_935439_0E1EC08A 
X-CRM114-Status: GOOD (  82.45  )
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

On Tue, Jul 30, 2024 at 2:14=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Mon, Jul 29, 2024 at 02:34:27PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 29/07/24 12:48, Chen-Yu Tsai ha scritto:
> > > On Mon, Jul 29, 2024 at 4:54=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > > >
> > > > Il 29/07/24 10:07, Chen-Yu Tsai ha scritto:
> > > > > On Mon, Jul 29, 2024 at 3:59=E2=80=AFPM AngeloGioacchino Del Regn=
o
> > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > >
> > > > > > Il 26/07/24 17:11, Chen-Yu Tsai ha scritto:
> > > > > > > On Fri, Jul 26, 2024 at 8:11=E2=80=AFPM AngeloGioacchino Del =
Regno
> > > > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > > > >
> > > > > > > > Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On Mon, Jul 22, 2024 at 11:27=E2=80=AFPM N=C3=ADcolas F. =
R. A. Prado
> > > > > > > > > <nfraprado@collabora.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Currently if the xhci1 controller happens to probe befo=
re the pcie1
> > > > > > > > > > controller then it fails with the following errors:
> > > > > > > > > >
> > > > > > > > > > xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f=
)
> > > > > > > > > > xhci-mtk 11290000.usb: can't setup: -110
> > > > > > > > > > xhci-mtk: probe of 11290000.usb failed with error -110
> > > > > > > > > >
> > > > > > > > > > The issue has been tracked down to the CLK_INFRA_AO_PCI=
E_P1_TL_96M
> > > > > > > > > > clock, although exactly why this pcie clock is needed f=
or the usb
> > > > > > > > > > controller is still unknown. Add the clock to the xhci1=
 controller so it
> > > > > > > > > > always probes successfully and use a placeholder clock =
name for it.
> > > > > > > > > >
> > > > > > > > > > Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@col=
labora.com> #KernelCI
> > > > > > > > > > Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-=
b3df-63e1ddb0ec51@notapiano/
> > > > > > > > > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@c=
ollabora.com>
> > > > > > > > >
> > > > > > > > > So I asked MediaTek about this, and it seems the correct =
thing to do is
> > > > > > > > > disable USB 3 on this host controller using the following=
 snippet. The
> > > > > > > > > snippet is copy-pasted from our issue tracker and won't a=
pply directly.
> > > > > > > > >
> > > > > > > > > This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on=
 which xhci1
> > > > > > > > > is used only for USB 2.0 on an M.2 slot.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Uhm, okay, but why should USB3 be disabled on a controller =
that supports USB3?
> > > > > > > >
> > > > > > > > I agree about disabling it on specific boards that use only=
 the USB 2.0 lines of
> > > > > > > > this controller, but doing that globally looks wrong... and=
 looks like being a
> > > > > > > > workaround for an error that gets solved with adding a cloc=
k as well.
> > > > > > > >
> > > > > > > > In short, the question is: why would that be the correct th=
ing to do?
> > > > > > >
> > > > > > > We can disable it in mt8195-cherry.dtsi then?
> > > > > >
> > > > > > That device does not use this controller, so yes we can disable=
 it, but that still
> > > > > > doesn't resolve the issue pointed out by Nicolas...!
> > > > >
> > > > > No. I mean disable USB3 on this port. Also see the next paragraph=
.
> > > > >
> > > >
> > > > Yes, sorry I was meaning the same - but I effectively wrote "disabl=
e controller"
> > > > instead, my bad.
> > > >
> > > > > > Please note that the issue that he sees doesn't happen only on =
Tomato, but also on
> > > > > > other MediaTek MT8195/MT8395 boards - and applying this commit =
makes disabling the
> > > > > > controller, or disabling the USB 3 lines on the controller, kin=
da redundant, as
> > > > > > this will effectively fix probing it... but again, fixing the a=
ctual issue with
> > > > > > this controller is something that must be done.
> > > > >
> > > > > If those other boards use the XHCI1 USB3 lines for ... USB3, then=
 the USB3
> > > > > PHY should also be tied to XHCI1, right now due to the Cherry Chr=
omebook
> > > > > design, only the USB2 PHY is tied to it.
> > > > >
> > > >
> > > > Yes, I am aware of that.
> > > >
> > > > > > Disabling the controller on Tomato is a different topic - here =
we are discussing
> > > > > > about fixing the issue, and that will happen, again, on any boa=
rd that has this
> > > > > > controller enabled with USB3 lines. :-)
> > > > > >
> > > > > > So, unless there is any specific reason for which applying this=
 commit is a bad
> > > > > > idea, or any alternative fix to this that is better than the pr=
oposed one, and
> > > > > > not a workaround... I'm applying this one.
> > > > >
> > > > > Didn't I just relay what MediaTek says is the correct fix? Disabl=
e USB3
> > > > > for this port on devices where the serial pairs are used for PCIe=
 instead
> > > > > of USB3.
> > > > >
> > > >
> > > > I think there must've been some misunderstanding here.
> > > >
> > > > Yes you did relay what MediaTek is the correct fix, and I agree tha=
t the USB3 must
> > > > be disabled on devices where those serial pairs are used for PCIe i=
nstead of USB,
> > > > or on devices where those are completely unused.
> > >
> > > OK. I will send a patch for Tomato as you asked.
> > >
> > > > This, though, will fix the issue only on those devices (because we =
are disabling
> > > > those lines entirely, so depending on how we see it, this might not=
 be a fix but
> > > > rather a workaround).
> > >
> > > I would say that is a more accurate description of the hardware, so a=
 fix.
> > >
> >
> > I can accept a patch for Tomato with a Fixes tag. Yes.
> >
> > > > If we don't apply this fix, any board that uses those pairs for USB=
 3 instead will
> > > > still show the same "clocks are not stable" error, leaving them wit=
h a broken port.
> > > >
> > > > And I believe that because the clocks are not routed externally but=
 rather are
> > > > internal to the SoC, so, if INFRA_AO_PCIE_P1_TL_96M is necessary fo=
r that USB 3
> > > > port to work, a board that intends to use those pairs for USB3 woul=
d still need
> > > > this exact clock to actually get that port to work.
> > >
> > > I couldn't reproduce the issue by disabling pcie1 as Nicolas mentione=
d.
> > > I don't have any more to add to this though. Sorry for the noise.
>
> Huh, that's surprising. FWIW I just reproduced with kernel next-20240729,
> upstream defconfig (besides a CONFIG_USB_ONBOARD_DEV=3Dn to be able to bo=
ot from
> my USB drive), and the pcie1 node in mt8195-cherry.dtsi disabled. Hardwar=
e is
> mt8195-cherry-tomato-r2.
>
> Also, I just tested adding
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index fe5400e17b0f..a60c4d1419df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1401,6 +1401,7 @@ &xhci0 {
>  &xhci1 {
>         status =3D "okay";
>
> +       mediatek,u3p-dis-msk =3D <0x1>;
>         rx-fifo-depth =3D <3072>;
>         vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
>         vbus-supply =3D <&usb_vbus>;
>
> And that fixed the issue as well. So as far as fixing the error on Tomato=
, this
> patch works too, and makes more sense.

Could you also try adding the USB3 PHY instead of disabling U3 on the
controller? As:

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2ee45752583c..61b3c202a8cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1444,7 +1444,7 @@ xhci1: usb@11290000 {
                              <0 0x11293e00 0 0x0100>;
                        reg-names =3D "mac", "ippc";
                        interrupts =3D <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
-                       phys =3D <&u2port1 PHY_TYPE_USB2>;
+                       phys =3D <&u2port1 PHY_TYPE_USB2>, <&u3port1
PHY_TYPE_USB3>;
                        assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_1P>,
                                          <&topckgen CLK_TOP_SSUSB_XHCI_1P>=
;
                        assigned-clock-parents =3D <&topckgen
CLK_TOP_UNIVPLL_D5_D4>,

I wanted to test this, but I couldn't actually reproduce the error.

> However I agree with Angelo that a board that does use USB3 on this contr=
oller
> would still need the original patch adding the PCIE clock to work. But su=
ch a
> board doesn't currently exist, does it? And we don't actually know if USB=
3
> really works in that case. Or why this clock is needed. So there are a fe=
w
> unknowns...

MacPaul seems to have one. He mentioned to me that he doesn't need the patc=
h
adding the PCIE clock, but needs "mediatek,force-mode" instead.

Looking at the comments around "mediatek,force-mode" in the driver, it
seems that the PHY defaults to PCIe mode. A combination of not initializing
the PHY to USB3 and turning on the PCIe related clock might be what is
allowing the PHY to respond to the controller? This is just a guess though.

> Anyway, I really don't know what option would be better. Just let me know=
 if I
> should resend a patch or CC me in any alternative patch.

I'll send the patches to fix up pure USB2 usage. Given we have conflicting
reports on whether the PCIe clock is needed, I ask that you try the PHY
assignment change first.


Thanks
ChenYu

> Thanks,
> N=C3=ADcolas
>
> > >
> >
> > Sometimes the noise actually opens some eyes around (be it mine or whoe=
ver else's),
> > so as long as it is constructive, I don't see it as noise.
> >
> > In short: no worries! :-)
> >
> > > > As for Tomato itself - I agree that we must add the u3p-dis-msk=3D0=
x1 flag, yes,
> > > > and we will, but I'm purely talking about - again - an eventual boa=
rd that would
> > > > not have that property because USB3 is exposed/used for real.
> > >
> > > I think it would make more sense to fix the `phys =3D ` statement in =
mt8195.dtsi
> > > to list both the USB2 and USB3 PHYs. At the board level, for boards o=
nly
> > > using USB2, we would have the overriding `phys =3D ` statement alongs=
ide the
> > > `mediatek,u3p-dis-mask` property. Does that make sense to you?
> > >
> >
> > Yeah, that'd make sense, though I'm not sure if the driver can cope wit=
h that: in
> > that case, we'd obviously need "two" patches and not one :-)
> >
> > Cheers!
> >
> > >
> > > Thanks
> > > ChenYu
> > >
> > > > Cheers,
> > > > Angelo
> > > >
> > > > >
> > > > > Regards
> > > > > ChenYu
> > > > >
> > > > > > Cheers,
> > > > > > Angelo
> > > > > >
> > > > > > >
> > > > > > > ChenYu
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > > Angelo
> > > > > > > >
> > > > > > > > >
> > > > > > > > > ChenYu
> > > > > > > > >
> > > > > > > > > index 8b7307cdefc6..2dac9f706a58
> > > > > > > > > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > > > > > > @@ -1447,6 +1447,7 @@
> > > > > > > > >                                           "xhci_ck";
> > > > > > > > >                             mediatek,syscon-wakeup =3D <&=
pericfg 0x400 104>;
> > > > > > > > >                             wakeup-source;
> > > > > > > > > +                       mediatek,u3p-dis-msk =3D <0x1>;
> > > > > > > > >                             status =3D "disabled";
> > > > > > > > >                     };
> > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >      arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++=
++++--
> > > > > > > > > >      1 file changed, 8 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b=
/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > > > > > > > index 2ee45752583c..cc5169871f1c 100644
> > > > > > > > > > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > > > > > > > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > > > > > > > > > @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
> > > > > > > > > >                                      <&topckgen CLK_TOP=
_SSUSB_P1_REF>,
> > > > > > > > > >                                      <&apmixedsys CLK_A=
PMIXED_USB1PLL>,
> > > > > > > > > >                                      <&clk26m>,
> > > > > > > > > > -                                <&pericfg_ao CLK_PERI_=
AO_SSUSB_1P_XHCI>;
> > > > > > > > > > +                                <&pericfg_ao CLK_PERI_=
AO_SSUSB_1P_XHCI>,
> > > > > > > > > > +                                /*
> > > > > > > > > > +                                 * This clock is requi=
red due to a hardware
> > > > > > > > > > +                                 * bug. The 'frmcnt_ck=
' clock name is used as a
> > > > > > > > > > +                                 * placeholder.
> > > > > > > > > > +                                 */
> > > > > > > > > > +                                <&infracfg_ao CLK_INFR=
A_AO_PCIE_P1_TL_96M>;
> > > > > > > > > >                             clock-names =3D "sys_ck", "=
ref_ck", "mcu_ck", "dma_ck",
> > > > > > > > > > -                                     "xhci_ck";
> > > > > > > > > > +                                     "xhci_ck", "frmcn=
t_ck";
> > > > > > > > > >                             mediatek,syscon-wakeup =3D =
<&pericfg 0x400 104>;
> > > > > > > > > >                             wakeup-source;
> > > > > > > > > >                             status =3D "disabled";
> > > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > > base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> > > > > > > > > > change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f4=
6aac
> > > > > > > > > >
> > > > > > > > > > Best regards,
> > > > > > > > > > --
> > > > > > > > > > N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > >
> > > >
> >
> >
> >

