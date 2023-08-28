Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AEBC83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elLPoDp9bmkE4We94dz6eaKiXla0ksw3fzd5gyuWCCc=; b=MXiZgNowo8tcX/6BwK1wITiQLY
	rIuVt1+ieEIoea6ixB6nA0IjkxHl8Vg9mjqSvyg2vDc8g1wKyN2QtS4I9LJo/sTiyGuJs9P53dFTs
	LA2SezZ/Ml4++GF4qJdIfC+rV59umYAKgmEpLPQwVCGWeDEurSROZ3rIsHGYukNz9GhlGh+d64giw
	791QdvV6Eaoqf5nHhL/78N7sxL4twc8cy0SIWA+ZoXRWQ2DhGD27mdAkpINytIgBXskynUB4FpEV+
	+is2BlSlPrGzCFOHtMZj7zIaTq8XsYGFIR5wzFUgnQ/MR55EVbAeufcVecragYXhXK/6RdPZVQ8k2
	QCHEQhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZqo-009Sp8-0S;
	Mon, 28 Aug 2023 10:52:06 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZqj-009Snb-1a
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 10:52:03 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-48d167f6cffso963374e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693219917; x=1693824717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elLPoDp9bmkE4We94dz6eaKiXla0ksw3fzd5gyuWCCc=;
        b=SdSV6oYdsFNGt3VJkcjb3T8M+WRpkMC27SB4trWP6t6WCuNgIf0IBzzcIwAzdzhOzb
         lpbTZg3GcvnmJFA8dB0skK4Tul8jBDeYqK3mTZAT2jMOqI6Xs0zf/DLy6DyRkMn1OE05
         s4UAMmwGB3pKve3g+iJoaxr4D7kaCHjh5cpFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693219917; x=1693824717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elLPoDp9bmkE4We94dz6eaKiXla0ksw3fzd5gyuWCCc=;
        b=TItxoUFQEiZ/tBIQDv2i6a1Ii6OL7/0m8SCUcUkhZUGro1H8bapJEtcppHRjAUMaSj
         Aa+980y+OfCui6bOjWsTfyyg4m8FpNuFv0vyiiPZ1hReq+M/1x+tk3xXt9r3rodKrKbn
         zhsBMMncubSZF/Ryt2o1t+Z6IsXlbfnQg6WaoG6RYY0vfKnDFA/4MUp1h/hNW+negMDM
         YbSlHHOPwp1SI+JJ3YJv86WSLTDccbT6f5BHU1o7eQ0/7z5sfSqEVvhy5XcLn4dDpPC1
         GDL9BL+Pw8j/m+R5hM5nOWonDR7LSqBn52PFlyXvWe6+oVZZoLfW2HcsyJ/T3iLeK8uC
         Hklw==
X-Gm-Message-State: AOJu0YzeO991JGEwN+6sOkJ2YX17Y/b17qmQ0R4X6lX9yiaLu04VhfGe
	mCXNPdF0IHShuqAxgVUnSAYkHWMBis5Jjvbv6Mj97A==
X-Google-Smtp-Source: AGHT+IGR36/jVcdlzI9EHwegyXf6XR7oaier3VVqD/hv7csJfXZdl6/g5RXOQdrWkimON7lfWlQ1zKRYdtrfJiAE4jQ=
X-Received: by 2002:a1f:4c81:0:b0:487:e8f1:a2bf with SMTP id
 z123-20020a1f4c81000000b00487e8f1a2bfmr19015896vka.15.1693219917389; Mon, 28
 Aug 2023 03:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230825114623.16884-3-macpaul.lin@mediatek.com> <CAGXv+5FTuY=ZHB3-2Woit5amRZ=RxByGMq=LQp-es8tWEhAQUA@mail.gmail.com>
 <986d8056-3708-ed3d-1896-0fbc034ca53c@mediatek.com>
In-Reply-To: <986d8056-3708-ed3d-1896-0fbc034ca53c@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Aug 2023 18:51:46 +0800
Message-ID: <CAGXv+5E2kOOz59AMCvQv_as6SesDkt15b9uDOSZ_iJMytgf1gA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt6360: add PMIC MT6360 related nodes
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_035201_600268_F16E73B7 
X-CRM114-Status: GOOD (  38.87  )
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

On Mon, Aug 28, 2023 at 5:59=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.c=
om> wrote:
>
>
> On 8/28/23 12:36, Chen-Yu Tsai wrote:
> >
> >
> > External email : Please do not click links or open attachments until yo=
u
> > have verified the sender or the content.
> >
> > On Fri, Aug 25, 2023 at 7:46=E2=80=AFPM Macpaul Lin <macpaul.lin@mediat=
ek.com> wrote:
> >>
> >> MT6360 is the secondary PMIC for MT8195.
> >> It supports USB Type-C and PD functions.
> >> Add MT6360 related common nodes which is used for MT8195 platform, inc=
ludes
> >>  - charger
> >>  - ADC
> >>  - LED
> >>  - regulators
> >>
> >> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> >> ---
> >>  arch/arm64/boot/dts/mediatek/mt6360.dtsi | 112 ++++++++++++++++++++++=
+
>
> [snip..]
>
> >> +       regulator {
> >> +               compatible =3D "mediatek,mt6360-regulator";
> >> +               LDO_VIN3-supply =3D <&mt6360_buck2>;
> >> +
> >> +               mt6360_buck1: buck1 {
> >> +                       regulator-compatible =3D "BUCK1";
> >> +                       regulator-name =3D "mt6360,buck1";
> >
> > Normally there's no need to provide a default name. Any used regulator
> > should have been named to match the power rail name from the board's
> > schematics.
> >
>
> I have 2 schematics on hand. One is mt8195-demo board and the other is
> genio-1200-evk board. There are 2 PMIC used on these board
> with "the same" sub power rail name for "BUCK1~BUCK4". One is mt6315,
> and the other is mt6360.

This is more of an board level integration thing. Regulator names are
expected to be named after the actual power rail names. For example,
take a look at Rock Pi 4 schematics [1], the power rail from BUCK1 of
the RK808 PMIC is named "VDD_CENTER". And in the dts file [1] we can
see the regulator is named that as well (albeit with some style changes).

Now if a project really chooses meaningless names like BUCKx or LDOy
for their power rails, then so be it. However those are board level
decisions. The names are there to help with integration debugging, so
it makes sense to have names that match the power rail names in the
schematics. Default names rarely make sense.

[1] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/rockpi4_v13_sch_20181112.p=
df
[2] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/rock=
chip/rk3399-rock-pi-4.dtsi#L267

> I've also inspected other dtsi of the regulators, such as mt6357 and
> mt6359. They have regulator nodes with named for their purpose. For the
> schematics of mt8195-demo and genio-1200-evk boards, there are no
> explicit usage for "BUCK1~BUCK4" for both mt6135 and mt6360. In order to
> specify the sub power rail for mt6360, MediaTek chooses name like
> "mt6360,buck1" instead of simple name "buck1" for distinguish with
> "buck1" of mt6351.
>
> >> +                       regulator-min-microvolt =3D <300000>;
> >> +                       regulator-max-microvolt =3D <1300000>;
> >
> > These values correspond to the regulator's range. They make no sense as
> > regulator constraints. The min/max values are supposed to be the most
> > restrictive set of voltages of the regulator consumers. If what is fed
> > by this regulator can only take 0.7V ~ 1.1V, then it should save 0.7V
> > and 1.1V here. If the regulator is unused, then there are no constraint=
s,
> > and these can be left out.
> >
> > Just leave them out of the file.
> >
> > Both comments apply to all the regulators.
> >
> > ChenYu
>
> There are some common circuit design for these regulators like mt6359,
> mt6360 and mt6315 used on many products. MediaTek put the most common
> and expected default values in their dtsi. However, some changes still
> need to be applied to derivative boards according to product's
> requirements. The actual value be used will be applied in board's dts
> file to override the default settings in dtsi.

The values here are definitely not some product's expected values.
They are the full range of output voltages supported, as seen in the
driver.

The regulator binding says:

    regulator-min-microvolt:
      description: smallest voltage consumers may set

    regulator-max-microvolt:
      description: largest voltage consumers may set

The constraints given in the regulator node are those of the consumers,
not the PMIC regulator itself. As you mentioned, a board may need to
adjust the range based on its design, i.e. what the board has connected
to the regulator.

So either something is connected, and the consumer's constraints are set
by overriding the default in the board .dts file; or, nothing is connected
and the constraints don't matter, as nothing is going to set the voltage
or enable the regulator. So there's no reason to give a default. For
unused regulator outputs, their device nodes don't even have to exist.

I'm trying to get people to _not_ write default values, as they don't
make any sense. The full voltage range is already implied by the
compatible string.

ChenYu

> The regulator node "mt6360,ldo6" is not used by mt8195-demo and
> genio-1200-evk. I'll remove it in the next version.
> Thanks for the review.
>
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP
> >> +                                                  MT6360_OPMODE_ULP>;
> >> +               };
> >> +
> >> +               mt6360_buck2: buck2 {
> >> +                       regulator-compatible =3D "BUCK2";
> >> +                       regulator-name =3D "mt6360,buck2";
> >> +                       regulator-min-microvolt =3D <300000>;
> >> +                       regulator-max-microvolt =3D <1300000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP
> >> +                                                  MT6360_OPMODE_ULP>;
> >> +               };
> >> +
> >> +               mt6360_ldo1: ldo1 {
> >> +                       regulator-compatible =3D "LDO1";
> >> +                       regulator-name =3D "mt6360,ldo1";
> >> +                       regulator-min-microvolt =3D <1200000>;
> >> +                       regulator-max-microvolt =3D <3600000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +
> >> +               mt6360_ldo2: ldo2 {
> >> +                       regulator-compatible =3D "LDO2";
> >> +                       regulator-name =3D "mt6360,ldo2";
> >> +                       regulator-min-microvolt =3D <1200000>;
> >> +                       regulator-max-microvolt =3D <3600000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +
> >> +               mt6360_ldo3: ldo3 {
> >> +                       regulator-compatible =3D "LDO3";
> >> +                       regulator-name =3D "mt6360,ldo3";
> >> +                       regulator-min-microvolt =3D <1200000>;
> >> +                       regulator-max-microvolt =3D <3600000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +
> >> +               mt6360_ldo5: ldo5 {
> >> +                       regulator-compatible =3D "LDO5";
> >> +                       regulator-name =3D "mt6360,ldo5";
> >> +                       regulator-min-microvolt =3D <2700000>;
> >> +                       regulator-max-microvolt =3D <3600000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +
> >> +               mt6360_ldo6: ldo6 {
> >> +                       regulator-compatible =3D "LDO6";
> >> +                       regulator-name =3D "mt6360,ldo6";
> >> +                       regulator-min-microvolt =3D <500000>;
> >> +                       regulator-max-microvolt =3D <2100000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +
> >> +               mt6360_ldo7: ldo7 {
> >> +                       regulator-compatible =3D "LDO7";
> >> +                       regulator-name =3D "mt6360,ldo7";
> >> +                       regulator-min-microvolt =3D <500000>;
> >> +                       regulator-max-microvolt =3D <2100000>;
> >> +                       regulator-allowed-modes =3D <MT6360_OPMODE_NOR=
MAL
> >> +                                                  MT6360_OPMODE_LP>;
> >> +               };
> >> +       };
> >> +};
> >> --
> >> 2.18.0
> >>
>
> Best regards,
> Macpaul Lin.

