Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E79FC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 04:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=; b=Zv1jM5doex3caMSDoWfTwsidB+
	QkZYdLyc5bK4o3+iF40b9129T5bhjh3oRqASy0VXaas61GW/JLg7hLXZB8IEWDU69CPTzFFB8Fipo
	TNqkHPuqaguq+uSImLuOMCpbxxjxnpXqdRQDPqPjbtreT8tfOleG5qcbu6CohfZttTtFVUuIvVqXx
	WIf5uhFVTGgEuowppkk+GmYsw923hAuXLUvkjzAQA+RGvO3T+ldMqXjFiHlp6r7ctiGHzIIq4CjLG
	vocYic3VEILSj9lddQDO+CzlmT2HXS3y0v+9lDaIzxUILvNOxteHZ93pOOk+z74NA3+Qqdwy8Ey46
	YN5qkiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJrO-0000000GJiD-2anS;
	Wed, 08 Jul 2026 04:26:10 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJrL-0000000GJhK-3Pn1
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 04:26:09 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-664d4478a64so277159d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 21:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783484766; cv=none;
        d=google.com; s=arc-20260327;
        b=RV66uqkcmXJW9t/L0F0MkO0/9dqwKfvik7fw/o03TdFaJ+5Lx7EBiM5/jWisp5yV/D
         sx2uxmvC/PnlNmJjc4atiJKTHxxX7rIURye9EzR0bATRUgf3Y+BIbTIH88AtmOyMcKPc
         upQtVFLeqrjjhUO1CsS2v8SL+n3w2zOUdW/sjotaKkY/ndDDICo8Sk5FDabxiWLJN46w
         6+3xf04pULsq4I0CmxhuUedGD9TdhJ3Jd4bUaZaxhuCedWiFakSHsUkZmJCUhKhClml6
         I6D0o90B8pevdhdUOi7DzY2oMV2tUWrr89c2X9KsG4M4plncoO3a9rjvmEZQ9zVcsIyi
         /BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        fh=LnJ/gLZD55v5lPbC6p+ehLV0mWT53f08cuh38oH2Cc0=;
        b=f4embFZXIVX6AkSvKewtgA7yHh3puEOt4hXxTp+oxoNcocfvN5AAM3KrE3aulHtu7q
         +FjVnvDTVmmKe2cDTlUmmbX9Tped1PlvDexfsK38jPt4fT7uaN9icMsbrg9DZ96F/tbA
         ryHvnk/jEUjK2YufMgvu5RcrATnUx+8BPs19gfsvh8oeaYFbsnyLG1Yk9K27zb6VMedm
         sFJw/WtHK4EAjClZSPSnV7vtw30zf8o2iiwnRiTI3v0MARLqEHlsFJilb5vLjbj2kSHY
         mxsDNPv7TDRABHF0GCOfiAozibJFk71sSt3fnCYHN7HG65ws+iN6QKEJSHnK8zm53B6t
         VSjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783484766; x=1784089566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        b=URGZnyuJt9w/VzhRXTedvaHvxJhDiVd3dV8FeAUcOVpYkuQpIheruvA2gvkT5T05nE
         3zgq6VNcaIC8DwB4KD5IPkdHGLsJrQBAtNmz7VCzjSykFdH32kxk3YMe2h0OtKB9xPhU
         ZUohvXcvFpeaLQu3tukP60mDKgQXPOrgs5hrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783484766; x=1784089566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TWqEVDO1Px1PCZICb5KMgjoiJimA/1tHVt9yLna+xE=;
        b=mim5AHnQyq+HLzLzzKDWXaTSQTW89YgCQmgR4ORpD3Hs5WilqLY7lOW79wrw1y4XSb
         7mThviqXw6WUbcS4F1ZlpLcyoD2m5dm8jDjZdn/GYhUTgnn10Z6Hux0IDGdnwWj9fXVm
         BHX5pYvvI3s5VYavSGdbpNFRORN6K8+Y9YVnLPxrH2GwPZhrBiMlaL+3YT3c3bZ8zlIf
         OR56F8SPkPoImwUZL/puX8v3+BH8uLBG/a4dvT7VMN8mLS8hoyFHSCzYfMcQm6J6hZQu
         81wp7lsj+TOIUXXc8RDk3ubwguhE/ERtRe6brxkqG3c9uM5A+JCYIxHjAZQXLUOj1VSE
         633Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqd48hditHtaR6mXxWm4vVzDLetu+rP4b9i1yICYMeRem+hD4kMK9Bp9SCtBXng+CO/ApOvNePz2zhjk+mMbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtnOGn7U+8lxRd9YprwKtSx5c7Z3LrIcc5rGNO5XzXAyKu+h7P
	Wn9o39D8KMTj8aQlZJ/rG+tsO7OSogkv7Hn5RRyVpLvmb3KOfFWsslHsOR1uQeuktkZi5iAeHaA
	XsKfqxaQceN/wCyaZxiBwEJ4MW72MgqWsP7o7m65S
X-Gm-Gg: AfdE7cmgWl6CgaQJeQhfMa/DHJeuKdsJ5x27FugkPGOZQ99RpkL/EsaUjMhcIfbPge+
	uLSqYKFiHQayULR/ke7qX/ZVQYD6kjcejx1IOq2/JHa7qnjnIJcA3wFwYa58DVQo/al888Mflgr
	fyBTKksdIPMrpzd4inYYI+tje498vH8+oWarGZI0n8LlKBCEvbTStfu4AuAPxKBh+zK5A15j6O1
	AOBGTMCVCGW4asHHHaJWiQIkauo11da53sr3gaVVroB3INnLKlfhpdlwb/2PqJl6H23JwkqNccR
	EkRuVMrYic+RbP3nye+tDBjcpnU=
X-Received: by 2002:a05:690e:1916:b0:662:dcc4:c6bb with SMTP id
 956f58d0204a3-6679f0909a2mr589124d50.37.1783484766428; Tue, 07 Jul 2026
 21:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com> <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
In-Reply-To: <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 12:25:55 +0800
X-Gm-Features: AVVi8CdMjcjDEO3nU05c3hnTSzfBa4pXETiFq-WswvUgQmZHYpqwsoBeVo-3znY
Message-ID: <CAGXv+5EsWVbLtUP6b75fvkDVSqUDoAOA1t3hPO4cA9sAA02=WA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_212607_908996_2B6ABC22 
X-CRM114-Status: GOOD (  35.87  )
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

On Tue, Jul 7, 2026 at 7:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/7/26 13:08, Chen-Yu Tsai wrote:
> > On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> >>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR=
4X
> >>> DRAM.
> >>>
> >>> Add a device node for it and hook up all the supplies.
> >>>
> >>> This change requires a firmware fix for the SPMI bus to read back
> >>> correctly. The required firmware version is 15842.175.0. This is
> >>> included in ChromeOS releases R150-16700.22.0 (available in Beta
> >>> channel as of writing or stable channel in mid-July) or
> >>> R151-16721.0.0 and later.
> >>>
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> This is a big problem then.
> >>
> >> I take it as if the firmware fix is not in place, probing the CPU powe=
r supplies
> >> will fail, with all the consequences.
> >
> > That's right.
> >
> >> This means that with this, we're breaking all Geralt machines with old=
er firmware,
> >> which is not acceptable...
> >>
> >> ...so this needs a different solution, or strong reasons to make me un=
derstand that
> >> I'm wrong, if I'm wrong.
> >
> > We can drop the CPU supplies (they don't matter since cpufreq is hardwa=
re
> > driven) and just add the regulators. How does that sound? If the firmwa=
re
> > isn't updated, the PMIC will fail to probe, but since nothing is using =
it,
> > the system will continue to work (with some annoying error messages).
> >
>
> That'd be wrong, but less wrong than not having anything described...

Yeah. As I said, it doesn't affect usability.

> ...I wonder if, at this point, you could set the SPMI node to status =3D =
"fail" and
> have the *new* firmware override that to "ok".
>
> That's the only reasonable way to go forward, IMO.

I'm afraid it is unlikely to get a firmware release to fix a non-critical
issue. We were fortunate that there was an actual critical issue being
fixed that allowed me to merge the small fix for the SPMI controller.

I think it would be great if everyone could update their OS and firmware,
but I understand that some devices never get updates, such as those in
board farms that never boot into ChromeOS.


ChenYu

> Of course, avoid having the firmware adding the CPU supplies, because tha=
t would
> be rather sketchy then. Just "if spmi status fail found, change to ok".
>
> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>> ---
> >>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++=
++++
> >>>    1 file changed, 66 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> index f382f90c48f5..fea52c377d88 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> @@ -4,6 +4,8 @@
> >>>     */
> >>>    /dts-v1/;
> >>>    #include <dt-bindings/gpio/gpio.h>
> >>> +#include <dt-bindings/spmi/spmi.h>
> >>> +
> >>>    #include "mt8188.dtsi"
> >>>    #include "mt6359.dtsi"
> >>>
> >>> @@ -241,6 +243,14 @@ &cpu5 {
> >>>        cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >>>    };
> >>>
> >>> +&cpu6 {
> >>> +     cpu-supply =3D <&mt6319_buck1>;
> >>> +};
> >>> +
> >>> +&cpu7 {
> >>> +     cpu-supply =3D <&mt6319_buck1>;
> >>> +};
> >>> +
> >>>    /*
> >>>     * Geralt is the reference design and doesn't have target TDP.
> >>>     * Ciri is (currently) the only device following Geralt, and its
> >>> @@ -1156,6 +1166,14 @@ pins-bus {
> >>>                };
> >>>        };
> >>>
> >>> +     spmi_pins: spmi-pins {
> >>> +             pins-bus {
> >>> +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>=
,
> >>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> >>> +                     bias-disable;
> >>> +             };
> >>> +     };
> >>> +
> >>>        uart0_pins: uart0-pins {
> >>>                pins-bus {
> >>>                        pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> >>> @@ -1267,6 +1285,54 @@ &spi2 {
> >>>        status =3D "okay";
> >>>    };
> >>>
> >>> +&spmi {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&spmi_pins>;
> >>> +     #address-cells =3D <2>;
> >>> +     #size-cells =3D <0>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     pmic@6 {
> >>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek,m=
t6315-regulator";
> >>> +             reg =3D <0x6 SPMI_USID>;
> >>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>> +
> >>> +             regulators {
> >>> +                     mt6319_buck1: vbuck1 {
> >>> +                                     regulator-name =3D "ppvar_dvdd_=
proc_bc";
> >>> +                                     regulator-min-microvolt =3D <52=
0000>;
> >>> +                                     regulator-max-microvolt =3D <11=
55000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +
> >>> +                     /* vbuck2 is ganged with vbuck1 */
> >>> +
> >>> +                     mt6319_buck3: vbuck3 {
> >>> +                                     regulator-name =3D "pp1125_emi_=
vdd2";
> >>> +                                     regulator-min-microvolt =3D <10=
60000>;
> >>> +                                     regulator-max-microvolt =3D <11=
70000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +
> >>> +                     mt6319_buck4: vbuck4 {
> >>> +                                     regulator-name =3D "pp0600_emi_=
vddq";
> >>> +                                     regulator-min-microvolt =3D <57=
0000>;
> >>> +                                     regulator-max-microvolt =3D <65=
0000>;
> >>> +                                     regulator-enable-ramp-delay =3D=
 <256>;
> >>> +                                     regulator-allowed-modes =3D <0 =
1 2>;
> >>> +                                     regulator-always-on;
> >>> +                     };
> >>> +             };
> >>> +     };
> >>> +};
> >>> +
> >>>    &uart0 {
> >>>        pinctrl-names =3D "default";
> >>>        pinctrl-0 =3D <&uart0_pins>;
> >>

