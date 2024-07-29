Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFBEC3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCdO+5lszghKNXPYNfgULQjNkCO6Bgbrx/J4VNViASA=; b=iGIEcxYPswY2KblXQBtnleaIuV
	Sw7dVXZs8wQSVc6G6Rb3OZvQh0kq6q7ehMTunOaYNjwSIR8cS/cj3BOQilONB7GxYu49ZQMr4yH1L
	EUJP08UAnqOGVMa7wnOMYoaW6tQONxNFLsTwSOD6dQCiB1BQkLYfVn7rMZVeUgMf6ADMkl6Nbypk0
	xvmyeiFkmmPbgqQiIsl17j+uVNyN3Ub8ynXRQGnSeyUTHfnXb5DtyfxDURkumYTYQEBMXc6TH4z8O
	bLaUoQl72vEKjvGi+O7tjjR6iIi2QB1fg0egS8kbtFpPBPCiQPmJ8yIbryE8BX0ALgkcKsXSgRaBS
	6WWsiopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLPq-0000000ATiO-1Lyz;
	Mon, 29 Jul 2024 08:07:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLPn-0000000AThU-1NLl
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 08:07:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52f01613acbso3688196e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722240448; x=1722845248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCdO+5lszghKNXPYNfgULQjNkCO6Bgbrx/J4VNViASA=;
        b=dyVDZDYSbq9gpN3j00gP0potmxd6uvKdn+m3MgHiIzTJSBkF3NIADQAAiD8pNkGzmF
         bdinBSDgq8Hcm43G3FcGMKEUF7yVIEVyPqlNyJEl9hgwRfbJ/rSSTg1Ji87BmXJS/OJ4
         IUI5k7KOtwEHfYjJJXiH1Ulf2xTbu7JbQuCyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240448; x=1722845248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCdO+5lszghKNXPYNfgULQjNkCO6Bgbrx/J4VNViASA=;
        b=J6c/EnjgV32j2W3Tf/PQrRhaBFu2j2m2pfwqlgm6ffuNafGsirjDqHwZG60Dj+8CmZ
         d+H05WT+IRsO9xuQljbMCq7mwi9VhhY5cZS0omqca3RN03O3KtaxRd7Y3ihEPpTqdELo
         E5Lkr2r2AjwExR5T6dKR1dDyb2fqX2zzGHXqLw5dqtUBtZ5fihVc4+dNEY7kxKwjJ5bz
         IR7z1u9zPExIV2nb0ODzqOf7uc299VXtSL3KIWkmD30pGbjb9zPJN1ciJOEnRiyY5ZuH
         ziy3Y/9IloHknmmTIzE8+wKYlgDwYcxCFMndtku0kduqhCb+t7F0Q22JlYV5xe3DzeR5
         pmPg==
X-Forwarded-Encrypted: i=1; AJvYcCU8HHeARGR0QN9G6adI7ZONPGPV0oGd5czzFZ5vFsKlORYFXM4pHNwz/Q/IMTAOyWpWCg+ca++tDxBS23CLxere/4ixlA3hUnIyFQ9TDroww1Ie
X-Gm-Message-State: AOJu0YztJ0wcBVXMDvfjBzNLm3Vs2IuwEwvX/spUl7lv/ZS0y/iBVPYX
	3SnQ+Rb05U5RngN7kxibEuTpjdN+Gi+xHqTQ0HDseZPeVyr9rI6QdtevHq0na77piykEgPii6Pq
	lQiheg+a6EJW7X5X0HDksfp16tHsRi2bG/Fip
X-Google-Smtp-Source: AGHT+IGom9OVJS7Jqx6fzlsfDpTXf0AFtaX0XP4s0jUU4E/uPPTvIW9YD1G5Ss7bz5ELxdrY8h88xy0q5UME34INd/E=
X-Received: by 2002:a05:6512:33c6:b0:52f:441:bdd6 with SMTP id
 2adb3069b0e04-5309b674163mr1778099e87.0.1722240448197; Mon, 29 Jul 2024
 01:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
 <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com> <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
 <51f0f4f3-11a5-4d74-981e-3f24f8475c7f@collabora.com>
In-Reply-To: <51f0f4f3-11a5-4d74-981e-3f24f8475c7f@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jul 2024 16:07:16 +0800
Message-ID: <CAGXv+5F-U6O3dQdU2L8bR5V+D=PLreACZYCh5sxBY3PFrex1zg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240729_010731_419327_46AB8ED1 
X-CRM114-Status: GOOD (  41.12  )
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

On Mon, Jul 29, 2024 at 3:59=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/24 17:11, Chen-Yu Tsai ha scritto:
> > On Fri, Jul 26, 2024 at 8:11=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
> >>> Hi,
> >>>
> >>> On Mon, Jul 22, 2024 at 11:27=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
> >>> <nfraprado@collabora.com> wrote:
> >>>>
> >>>> Currently if the xhci1 controller happens to probe before the pcie1
> >>>> controller then it fails with the following errors:
> >>>>
> >>>> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
> >>>> xhci-mtk 11290000.usb: can't setup: -110
> >>>> xhci-mtk: probe of 11290000.usb failed with error -110
> >>>>
> >>>> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
> >>>> clock, although exactly why this pcie clock is needed for the usb
> >>>> controller is still unknown. Add the clock to the xhci1 controller s=
o it
> >>>> always probes successfully and use a placeholder clock name for it.
> >>>>
> >>>> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> #=
KernelCI
> >>>> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0=
ec51@notapiano/
> >>>> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>>
> >>> So I asked MediaTek about this, and it seems the correct thing to do =
is
> >>> disable USB 3 on this host controller using the following snippet. Th=
e
> >>> snippet is copy-pasted from our issue tracker and won't apply directl=
y.
> >>>
> >>> This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhci1
> >>> is used only for USB 2.0 on an M.2 slot.
> >>>
> >>
> >> Uhm, okay, but why should USB3 be disabled on a controller that suppor=
ts USB3?
> >>
> >> I agree about disabling it on specific boards that use only the USB 2.=
0 lines of
> >> this controller, but doing that globally looks wrong... and looks like=
 being a
> >> workaround for an error that gets solved with adding a clock as well.
> >>
> >> In short, the question is: why would that be the correct thing to do?
> >
> > We can disable it in mt8195-cherry.dtsi then?
>
> That device does not use this controller, so yes we can disable it, but t=
hat still
> doesn't resolve the issue pointed out by Nicolas...!

No. I mean disable USB3 on this port. Also see the next paragraph.

> Please note that the issue that he sees doesn't happen only on Tomato, bu=
t also on
> other MediaTek MT8195/MT8395 boards - and applying this commit makes disa=
bling the
> controller, or disabling the USB 3 lines on the controller, kinda redunda=
nt, as
> this will effectively fix probing it... but again, fixing the actual issu=
e with
> this controller is something that must be done.

If those other boards use the XHCI1 USB3 lines for ... USB3, then the USB3
PHY should also be tied to XHCI1, right now due to the Cherry Chromebook
design, only the USB2 PHY is tied to it.

> Disabling the controller on Tomato is a different topic - here we are dis=
cussing
> about fixing the issue, and that will happen, again, on any board that ha=
s this
> controller enabled with USB3 lines. :-)
>
> So, unless there is any specific reason for which applying this commit is=
 a bad
> idea, or any alternative fix to this that is better than the proposed one=
, and
> not a workaround... I'm applying this one.

Didn't I just relay what MediaTek says is the correct fix? Disable USB3
for this port on devices where the serial pairs are used for PCIe instead
of USB3.


Regards
ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>> index 8b7307cdefc6..2dac9f706a58
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>> @@ -1447,6 +1447,7 @@
> >>>                                         "xhci_ck";
> >>>                           mediatek,syscon-wakeup =3D <&pericfg 0x400 =
104>;
> >>>                           wakeup-source;
> >>> +                       mediatek,u3p-dis-msk =3D <0x1>;
> >>>                           status =3D "disabled";
> >>>                   };
> >>>
> >>>> ---
> >>>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
> >>>>    1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/b=
oot/dts/mediatek/mt8195.dtsi
> >>>> index 2ee45752583c..cc5169871f1c 100644
> >>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> >>>> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
> >>>>                                    <&topckgen CLK_TOP_SSUSB_P1_REF>,
> >>>>                                    <&apmixedsys CLK_APMIXED_USB1PLL>=
,
> >>>>                                    <&clk26m>,
> >>>> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_X=
HCI>;
> >>>> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_X=
HCI>,
> >>>> +                                /*
> >>>> +                                 * This clock is required due to a =
hardware
> >>>> +                                 * bug. The 'frmcnt_ck' clock name =
is used as a
> >>>> +                                 * placeholder.
> >>>> +                                 */
> >>>> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P1_=
TL_96M>;
> >>>>                           clock-names =3D "sys_ck", "ref_ck", "mcu_c=
k", "dma_ck",
> >>>> -                                     "xhci_ck";
> >>>> +                                     "xhci_ck", "frmcnt_ck";
> >>>>                           mediatek,syscon-wakeup =3D <&pericfg 0x400=
 104>;
> >>>>                           wakeup-source;
> >>>>                           status =3D "disabled";
> >>>>
> >>>> ---
> >>>> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
> >>>> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>>>
> >>>>
> >>
> >>
> >>
>

