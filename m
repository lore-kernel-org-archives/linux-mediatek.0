Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A520C43602
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=; b=rdFRSGHQ85uPyW+8Z1p8/BOEZl
	otyqS+Jbwl4Oe6ljL6eeBkCSUumvCBxAWcLIlFerl4XCbbwlo/8MIpQf+nYNRj6et1lUeHslHjav4
	Vj6pO4FFlwc5vngI3/FAvkhCDr/7sqGsc3Lmfl5PcratflWZM+zeuM8Hd2Df0SMYJx9iMosF80yR5
	SSKLODqPcVG4hN94NMpuOwg1F4NtgsLLmwX9D6EPJlL+84xlaJ86wP+P6PYw/oUbdrXaDCF0L73sB
	MivtwoX76aBRwgijnJTIMsZQH+Mfh7M0P1bx47Vs+YstL4IoyZXKZ+KzSkMTLbwBZu0Yi6kWoSCvT
	02M/vUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3ff-0000000EpEo-0p3c;
	Tue, 07 Jul 2026 11:08:59 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3fc-0000000EpDp-3KSm
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 11:08:57 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66766d649fdso3236133d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 04:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783422535; cv=none;
        d=google.com; s=arc-20260327;
        b=IQ6R5PssoZRYT16O47C+XiWCXq2XsVyZeDq4eLtojhdwOyw6kOteiCO33KYLocIotW
         F/LPCgsg5b3Lf9FhRNVr+luFOriJYytCMuZst+4BFzBNFYaQmOXFlQyHVzPX+0gGk+CR
         NbYII3JNHfefdNch9rK9HGqwJSPp0bum1uMm3D0RjhMW79G3a/F3yi9GvKq4sGpdTckn
         Cl57T8pDeyk4H3r6gU9OlHLV/gbvBllzjWOGlvsgi9FJgWYqXpsiCfED8ltNXUDXVzjp
         bZTWQzrnjbkXXiv8/YBRBZVz3MLTfP0sWcn9PDuw0GylkdkvrYdHlDeo9SFLQs3lN5eb
         PMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        fh=25F+pMEyPmxIgyT8NsTx5mgGPIFfskzmWM1YNwRpY5E=;
        b=PXSVdZruMtkz9oqmpu1AYwFCb7awOPiFch9/uw7UZYqNZrxFwyVL6GhxsVeOj/kG5E
         JiDEKymp4DK/WO23WKyC91O+l5Pl3sZvCJqLG7fVRr4lF4FqeCDK05ovoHuclCywO3zQ
         pNw4d2sUty0FM96QGydc3gkMtUE4F6CbYTicw/DiO3PZqLw75o7nqfX4bf+DHuMwu84q
         OMooO5fQblnaTCqK9wH31eAQE/0Gmp2vJUYgOqMA4LXEz/ZK8fn9dyrat+j/w/zqe2fL
         GeN+C2+aPBVOr+FwN42VQyOcd+MVYJOaTEcM2uxW07yEkadptC5WsAttOmnldmHQ5yA0
         XF2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783422535; x=1784027335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=IxwqA9cdhTRSfnGd3o1Z8m84fqj9VI4mvoU2Omhn/PzpRIe8g/K8ehVrMIg3KB42kb
         jYFBEx0lmUQodQ2DnwT+viSRRg7B5fH5q8UZP/dDe6lRK4o+1q955kFSOch4Jjil40ro
         dPlWbuVjgM9aUw0pLMxBeZ/3Ys6Qbjuy718cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783422535; x=1784027335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=VZq7kC76LJvIf93vqyuEIZ7+7/CekOcGoUZDgQplv1+sCQuFC7oVdihYnqH7+2TT6T
         7TcvoU4JlxNGM/bVDBndZ93j1EpvIzUSw22kAhOY16juxDQV1nDIGBOwePGXThQKiv6+
         /kI2MXiR3OTMkVXFNlXfbsqy/bT4gGOUPalSwCec2uKJnE+K0Nqr3wlRN+Dc4+xA6NrQ
         GDZdP+zyi2ZqSlg2Q9UGQenTuyklQVEBtnX2QbbunAk8CiC2vkJnKiQa6mpsA9zXR46J
         cIdM0MYw5WrBHj3DgwGHFOG0sQjzeOmuRga8IUp2IWpLU13fAm0XM2DVOpnmV4UkM6fu
         Pqiw==
X-Forwarded-Encrypted: i=1; AHgh+RqSuiWlvj4OmaaR/xGQlGOs2k8/ssJ/Iqnk+wzDKyyv7EDfAvDpAaKyNp5qxKEcSew6kk0WbRlI/oJPxtDL+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkAtni6TIbPwZ8SIU7nEUhLF6ECg5cIMgJyyPHSGjX1+zkemup
	eUuyQN6xTm3sl225XaAnrSwovBfOuAeOfT57EuIcpVHJ3bBiTJuoI55u1UzoqpINcXg95O1F6ju
	piFsHuASwnA7VOxnm4fHBHFh/UjTj0qqB4CDaNrA6
X-Gm-Gg: AfdE7cm8asSYOaSu5q8jGVYboDv2wsj68TEhet4MBdagzXLLQbvMWIcx4xxqO9Dc/2m
	+j6KMzGBC1t95YNWdotBhwSnPSsetEqhbKlbceLKnxPYY5lwYkPkG7ohbDckX5Ph0+rjxgXnSIs
	Ug9U9b4AR2bu19B63R3sTDxIlFvt780okn5H3gM9oJQfUNvgT7cUD3PoEpXYXqWMlbbD36AZ9IR
	9Qyj5A/DL5gXbGd7DYlE9RLNhee+tf8LV6a2HoW7427FRylCHCifDhnG43OegvCu/1bV4GqBGce
	XHsHbhNk2f69ZfV0noQtJeqQV9I=
X-Received: by 2002:a05:690e:c4d:b0:664:d7aa:3eb3 with SMTP id
 956f58d0204a3-6677faec2c3mr3752539d50.12.1783422535581; Tue, 07 Jul 2026
 04:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
In-Reply-To: <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jul 2026 19:08:44 +0800
X-Gm-Features: AVVi8CfL_5JVdKBWQj1eUZZBa-EhN5C_J2kjO8U6LC_EYJUTpwV01pG1PV1A2Kg
Message-ID: <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_040856_875830_2D82B166 
X-CRM114-Status: GOOD (  28.24  )
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

On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> > The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> > DRAM.
> >
> > Add a device node for it and hook up all the supplies.
> >
> > This change requires a firmware fix for the SPMI bus to read back
> > correctly. The required firmware version is 15842.175.0. This is
> > included in ChromeOS releases R150-16700.22.0 (available in Beta
> > channel as of writing or stable channel in mid-July) or
> > R151-16721.0.0 and later.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> This is a big problem then.
>
> I take it as if the firmware fix is not in place, probing the CPU power s=
upplies
> will fail, with all the consequences.

That's right.

> This means that with this, we're breaking all Geralt machines with older =
firmware,
> which is not acceptable...
>
> ...so this needs a different solution, or strong reasons to make me under=
stand that
> I'm wrong, if I'm wrong.

We can drop the CPU supplies (they don't matter since cpufreq is hardware
driven) and just add the regulators. How does that sound? If the firmware
isn't updated, the PMIC will fail to probe, but since nothing is using it,
the system will continue to work (with some annoying error messages).


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 ++++++++++++++++++=
+
> >   1 file changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index f382f90c48f5..fea52c377d88 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -4,6 +4,8 @@
> >    */
> >   /dts-v1/;
> >   #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> >   #include "mt8188.dtsi"
> >   #include "mt6359.dtsi"
> >
> > @@ -241,6 +243,14 @@ &cpu5 {
> >       cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >   };
> >
> > +&cpu6 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> > +&cpu7 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> >   /*
> >    * Geralt is the reference design and doesn't have target TDP.
> >    * Ciri is (currently) the only device following Geralt, and its
> > @@ -1156,6 +1166,14 @@ pins-bus {
> >               };
> >       };
> >
> > +     spmi_pins: spmi-pins {
> > +             pins-bus {
> > +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
> > +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       uart0_pins: uart0-pins {
> >               pins-bus {
> >                       pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> > @@ -1267,6 +1285,54 @@ &spi2 {
> >       status =3D "okay";
> >   };
> >
> > +&spmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spmi_pins>;
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     pmic@6 {
> > +             compatible =3D "mediatek,mt6319-regulator", "mediatek,mt6=
315-regulator";
> > +             reg =3D <0x6 SPMI_USID>;
> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     mt6319_buck1: vbuck1 {
> > +                                     regulator-name =3D "ppvar_dvdd_pr=
oc_bc";
> > +                                     regulator-min-microvolt =3D <5200=
00>;
> > +                                     regulator-max-microvolt =3D <1155=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     /* vbuck2 is ganged with vbuck1 */
> > +
> > +                     mt6319_buck3: vbuck3 {
> > +                                     regulator-name =3D "pp1125_emi_vd=
d2";
> > +                                     regulator-min-microvolt =3D <1060=
000>;
> > +                                     regulator-max-microvolt =3D <1170=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     mt6319_buck4: vbuck4 {
> > +                                     regulator-name =3D "pp0600_emi_vd=
dq";
> > +                                     regulator-min-microvolt =3D <5700=
00>;
> > +                                     regulator-max-microvolt =3D <6500=
00>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >   &uart0 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&uart0_pins>;
>

