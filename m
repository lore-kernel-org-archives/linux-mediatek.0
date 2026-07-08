Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493B6C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=; b=OcaO4w98V5FUF3RcbucN4TP3Kt
	DzvD1doilpB4qR0qABBl3AkYbYdhgD/4bPrSxHHopAjTwQJA4zoojVwBQjKq0PZVFs6XwFYQCgzTk
	6N/DSJgWPsFFHu7AK/j8LbUZ/ynq6zP0+jRgb6Fg8vNsdq65n1pA7Fa5yVW+YR0VEZRiMUf3M48V9
	tNk/ljIhnhbhm+jIJyxW+K5hrAgBYUii7e2RlwwTs1/rz1YbkEAx5YwO3fnF3Navxnx2iv+7VtmxY
	TwG2Me4GMnfYqFts7Yfj/R80psBdTAkMdxKEDrzSOx098+uu6p2Euo+lXRxrJBX8KjvwUM3g80fO1
	MTfTqzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNRR-0000000GasC-0LOB;
	Wed, 08 Jul 2026 08:15:37 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNRO-0000000GarK-0vjX
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 08:15:35 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-664d78637f8so538462d50.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 01:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783498533; cv=none;
        d=google.com; s=arc-20260327;
        b=DHNuxWTlKMHqiapamdNNCepNl00xBDQfD9yMfs/ut2H84C8qMVE+JJylCQw7O6fPEF
         D60QIXot+gJ765WGOfY+lcQznTjblmIOvX0VGUTyVCvjr+woMQG9IpjcP1xH/+5QkJAi
         sX1AczJ/LRF26e5UFKZRDLBWwvBAzSX7uxB5p3sUb4vegwPct1tDllHTKwjGSiqz9Wma
         ZkPDWWjedx3L2u9UCECVF/5ZMz/UZ+BEnS/q5FvVNIBrC7Sh7HJKDy7P12Q8XeF83/Z2
         e1brvzLF6bNNYyV+9DCv6PERaX/8TmBtSzsj1d1oysRjcrq6xl2xBNzvq4g2R2z4h5Nj
         HQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        fh=y/7+WSfzGn1stvcnYGfm54JwcgeVqmHwEonOAVvfBU4=;
        b=m8cCgXNuDeZFMRcs383okJzQN5ywPIeuQAyFi0YknJp9mtmbU3NPgml6+xfc4ha+uV
         GA2Xn6eSjx4YLdP/tveDnrKfVOhntqFS9yVK4punKqP6rs91FD7CSwxQ97yn11gR1Nq1
         nbCG8pFscxzqDOBdgQ8tdW0mR93aeppyemxbfen+9k0NCv+TxsVBXz/w6oALSR0OiGsz
         KF1KWyFVZG1b3oXIgGwhTj/j3rddQrHv3zjLDyjTEqndWobKVeo7R8IDEuhfNVR5lMOJ
         LXfu6HxT6PCiLumTiCsFNSqIj8Z0HaNCJq8/KrmIEyszDYQwrPJKe5IOYqPHWoAYRNK9
         7Q6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783498533; x=1784103333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        b=nfrfL84fiPVHaxHfFoPmkwtnzSCkSPJst4YppOMvG1Ecm4MZ5F7n8iW3ccr9koxYjP
         P53IGS8cEpFI+1U8K+UIo6e9S+fM81kXjzGGQhyafvdqfSQmGwrOTZtelA43u007hv/u
         qZGoyqnkhILciV4xtq3HTYyI5p9/kx/To5Kjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498533; x=1784103333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXXv+6sXHuG3kLi8r5M/4A6sQ9dakJtPq27Tv/WBH0s=;
        b=RqtbYy7BfUj1F8SOogDTo4G3EA2Y7zUwOPb9DQwg0XU3Eog6d7snNajh6Mss4aAWQN
         eE56VW5uzNme81EaDaqeABX1xLrgGXeYh/mer+D0x20AjsgsMfg0yQKKpIHhAHDWZKxZ
         7nFzuecR503xE90TGXR925DBigKxK4gAx84C6yWsG4fDxpvoW7dFdJoNwH+2va/5TdyN
         2/xenQhDIW6aol0bT1taaHWX9wCXoNZ2M8WyUGyMExaWogAsu1ztwUr6qRzkLXnt8phg
         EHR9Ro4xVvMO/KvAU2g91OcdIdIm470KxSmjebHdmkgUky5F5xbi8uQpGA4NRdmsDcRJ
         wytg==
X-Forwarded-Encrypted: i=1; AHgh+RozhEilw/iuslXPriS25spWoIgGH6XowyK6yLRzlkpTU6B9c/blTquJzPi3rvpicitKj73K7jyYKcOXzEkPYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7j0VLu9YZFW2d0lye1sduWySufB4z1m6HC7BnPGl7rR/rGDQ5
	NYpaVWMH+fyOTl3KN43+N5k21Ql6GFExrsyIaD2fwniV+3SwiCVgB4uig4UUNasWWFEEXRXpg4O
	OwYH4/BPUSwFWXx5s/z34qHXCCAgK7pERiLW0jSV/
X-Gm-Gg: AfdE7cnOo8q4dGjA8qa+te9ZCtB4Wa7v0KdAImhc9qW5D54KdprTtEhS1JBiPlNHe9O
	/gpioETOow8deuSDFcg4BTHVYpz1Zm4i2BuagksRBECwFNOEZUMxz1NPDKJ7c3A7NwoFMgiXSfa
	wHtLNZG8Fvv6AZbGNTA9Q1VbnE3VX23rI4StmxOZAJw67GjqAK06Sx7dAq3fHN7vqjmykSdqE6K
	kz+gkKFa9qqldwsR86l75IqDTIphiyDSP1X6eDcPiX2wPaTGFZxstdPuyU/OpvEK2CxC+3QtigH
	Y93anHA2BoVJrmEti5P/9fbYcww=
X-Received: by 2002:a05:690e:438d:b0:664:ae6b:b48e with SMTP id
 956f58d0204a3-6679f1bd123mr838906d50.67.1783498533057; Wed, 08 Jul 2026
 01:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
 <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com> <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
 <2834aca4-916f-4d3e-afb4-cd2425b035ef@collabora.com>
In-Reply-To: <2834aca4-916f-4d3e-afb4-cd2425b035ef@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 16:15:22 +0800
X-Gm-Features: AVVi8CeOUHa5MdrVz6aDKyiGOSJ6AaGRjTGNLqqbDw6HCk8vEuopNlJIo0CvBmo
Message-ID: <CAGXv+5F1JJ0q_7yuGbTLbbi11E5q0SJvLAX7n=P7UjFLyJjBoA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_011534_339720_1B73A47C 
X-CRM114-Status: GOOD (  48.17  )
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

On Wed, Jul 8, 2026 at 4:02=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/8/26 06:25, Chen-Yu Tsai wrote:
> > On Tue, Jul 7, 2026 at 7:24=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/7/26 13:08, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> >>>>> The Geralt design uses a MT6319 PMIC to power the big cores and LPD=
DR4X
> >>>>> DRAM.
> >>>>>
> >>>>> Add a device node for it and hook up all the supplies.
> >>>>>
> >>>>> This change requires a firmware fix for the SPMI bus to read back
> >>>>> correctly. The required firmware version is 15842.175.0. This is
> >>>>> included in ChromeOS releases R150-16700.22.0 (available in Beta
> >>>>> channel as of writing or stable channel in mid-July) or
> >>>>> R151-16721.0.0 and later.
> >>>>>
> >>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>
> >>>> This is a big problem then.
> >>>>
> >>>> I take it as if the firmware fix is not in place, probing the CPU po=
wer supplies
> >>>> will fail, with all the consequences.
> >>>
> >>> That's right.
> >>>
> >>>> This means that with this, we're breaking all Geralt machines with o=
lder firmware,
> >>>> which is not acceptable...
> >>>>
> >>>> ...so this needs a different solution, or strong reasons to make me =
understand that
> >>>> I'm wrong, if I'm wrong.
> >>>
> >>> We can drop the CPU supplies (they don't matter since cpufreq is hard=
ware
> >>> driven) and just add the regulators. How does that sound? If the firm=
ware
> >>> isn't updated, the PMIC will fail to probe, but since nothing is usin=
g it,
> >>> the system will continue to work (with some annoying error messages).
> >>>
> >>
> >> That'd be wrong, but less wrong than not having anything described...
> >
> > Yeah. As I said, it doesn't affect usability.
> >
> >> ...I wonder if, at this point, you could set the SPMI node to status =
=3D "fail" and
> >> have the *new* firmware override that to "ok".
> >>
> >> That's the only reasonable way to go forward, IMO.
> >
> > I'm afraid it is unlikely to get a firmware release to fix a non-critic=
al
> > issue. We were fortunate that there was an actual critical issue being
> > fixed that allowed me to merge the small fix for the SPMI controller.
> >
>
> Yeah, I know how it is regarding firmware updates... but you know, I *mus=
t* try to
> get OEMs/ODMs to do the right thing when hacky things get in front of me,=
 and I am
> fully aware that many of them largely underestimate such issues, and even=
 close the
> possibility to fix those, which is even worst.

Well, it is at least possible to land a fix into our tree, but it's not
going to go through the qualification process for a firmware release
because of resource (cost) reasons.

I think (?) the firmware builds are public, but that doesn't really help
the average user.

> On the other hand, I know you, and I know that you always try to do the s=
ame
> whenever you can, so please, be aware that I'm not complaining about you.

I understand what you are asking and why, and I would ask the same if
possible.

> > I think it would be great if everyone could update their OS and firmwar=
e,
> > but I understand that some devices never get updates, such as those in
> > board farms that never boot into ChromeOS.
>
> Unfortunately, this is not just a ChromeOS problem but way larger...
>
> Anyway, I'll stop here to prevent myself from going OT too much and being=
 grumpier
> than I already am :-P
>
> I guess then just add the SPMI PMIC and add a big comment that clearly st=
ates
> something like
>
> /*
>   * The mt6319_buck1 is the cpu-supply for CPU6 and CPU7.
>   *
>   * However, this device ships with a broken firmware which needs to be u=
pdated to
>   * at version XXXXXXX or newer in order to workaround a bug that (descri=
be bug).
>   *
>   * [blahblah text so that's why the cpu supply was not assigned to cpu6/=
7].
>   */
>
> ...so that everyone reading the DT is fully aware of what's going on and =
can act
> accordingly if they wish.
>
> How does that sound?

Works for me. I'll send a revised patch.


Thanks
ChenYu

> Cheers,
> Angelo
>
> >
> >
> > ChenYu
> >
> >> Of course, avoid having the firmware adding the CPU supplies, because =
that would
> >> be rather sketchy then. Just "if spmi status fail found, change to ok"=
.
> >>
> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>>> Cheers,
> >>>> Angelo
> >>>>
> >>>>> ---
> >>>>>     .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 ++++++++++++=
+++++++
> >>>>>     1 file changed, 66 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> index f382f90c48f5..fea52c377d88 100644
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>>>> @@ -4,6 +4,8 @@
> >>>>>      */
> >>>>>     /dts-v1/;
> >>>>>     #include <dt-bindings/gpio/gpio.h>
> >>>>> +#include <dt-bindings/spmi/spmi.h>
> >>>>> +
> >>>>>     #include "mt8188.dtsi"
> >>>>>     #include "mt6359.dtsi"
> >>>>>
> >>>>> @@ -241,6 +243,14 @@ &cpu5 {
> >>>>>         cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >>>>>     };
> >>>>>
> >>>>> +&cpu6 {
> >>>>> +     cpu-supply =3D <&mt6319_buck1>;
> >>>>> +};
> >>>>> +
> >>>>> +&cpu7 {
> >>>>> +     cpu-supply =3D <&mt6319_buck1>;
> >>>>> +};
> >>>>> +
> >>>>>     /*
> >>>>>      * Geralt is the reference design and doesn't have target TDP.
> >>>>>      * Ciri is (currently) the only device following Geralt, and it=
s
> >>>>> @@ -1156,6 +1166,14 @@ pins-bus {
> >>>>>                 };
> >>>>>         };
> >>>>>
> >>>>> +     spmi_pins: spmi-pins {
> >>>>> +             pins-bus {
> >>>>> +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SC=
L>,
> >>>>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>=
;
> >>>>> +                     bias-disable;
> >>>>> +             };
> >>>>> +     };
> >>>>> +
> >>>>>         uart0_pins: uart0-pins {
> >>>>>                 pins-bus {
> >>>>>                         pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> >>>>> @@ -1267,6 +1285,54 @@ &spi2 {
> >>>>>         status =3D "okay";
> >>>>>     };
> >>>>>
> >>>>> +&spmi {
> >>>>> +     pinctrl-names =3D "default";
> >>>>> +     pinctrl-0 =3D <&spmi_pins>;
> >>>>> +     #address-cells =3D <2>;
> >>>>> +     #size-cells =3D <0>;
> >>>>> +     status =3D "okay";
> >>>>> +
> >>>>> +     pmic@6 {
> >>>>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek=
,mt6315-regulator";
> >>>>> +             reg =3D <0x6 SPMI_USID>;
> >>>>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>>>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>>>> +
> >>>>> +             regulators {
> >>>>> +                     mt6319_buck1: vbuck1 {
> >>>>> +                                     regulator-name =3D "ppvar_dvd=
d_proc_bc";
> >>>>> +                                     regulator-min-microvolt =3D <=
520000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
1155000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +
> >>>>> +                     /* vbuck2 is ganged with vbuck1 */
> >>>>> +
> >>>>> +                     mt6319_buck3: vbuck3 {
> >>>>> +                                     regulator-name =3D "pp1125_em=
i_vdd2";
> >>>>> +                                     regulator-min-microvolt =3D <=
1060000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
1170000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +
> >>>>> +                     mt6319_buck4: vbuck4 {
> >>>>> +                                     regulator-name =3D "pp0600_em=
i_vddq";
> >>>>> +                                     regulator-min-microvolt =3D <=
570000>;
> >>>>> +                                     regulator-max-microvolt =3D <=
650000>;
> >>>>> +                                     regulator-enable-ramp-delay =
=3D <256>;
> >>>>> +                                     regulator-allowed-modes =3D <=
0 1 2>;
> >>>>> +                                     regulator-always-on;
> >>>>> +                     };
> >>>>> +             };
> >>>>> +     };
> >>>>> +};
> >>>>> +
> >>>>>     &uart0 {
> >>>>>         pinctrl-names =3D "default";
> >>>>>         pinctrl-0 =3D <&uart0_pins>;
> >>>>
>

