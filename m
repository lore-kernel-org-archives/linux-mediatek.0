Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE05BC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2hQTPUfuJNacgMvbympUA555bAfKHNIBxMHLi2LZdc=; b=Ae5wmAPVD5rAz2EI0uEINk2vV5
	KTUbOfZb+u1r/OHjTg8bb6XtOEEjdxjowcxG/DC2A+weqW/N3WZzze6QomZCN2nTDe8JHB6HqKUlQ
	er0PcMqPxMV1NuVWL0t8MhUX+9K0kT8k7iWg6uAVuVqmpE4K4yrKA9/i9pJVNiayvTqo8zRtYLPL8
	rfDksO5EfZPxUHWBIjcIaL8y/DEcnWPh+JvXiNJMLJ3NLfiOVzgpBKb/BHkzItGFC2ZaXvg8nQrMH
	FY1OAz/hvZf6q0kdkNbCA53lKQrMezJczHnUdHtOvcBqDwHbq1GlKhCPuNno0eFae8YWFEhQ2ZezM
	+qTFRu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16S2-006oyi-2p;
	Mon, 22 May 2023 14:23:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16Ry-006owo-1M
	for linux-mediatek@lists.infradead.org;
	Mon, 22 May 2023 14:23:52 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-561b7729a12so52885767b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 May 2023 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684765426; x=1687357426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2hQTPUfuJNacgMvbympUA555bAfKHNIBxMHLi2LZdc=;
        b=rOTajVneBQhIGoLRDiTAKs06aV0ZOoGSH5biVYGbjl78Iz8FzehO/v0hZ/VJ7knTJR
         zAgSOWXa3du18HrxOP/0JFGEhvlkVJun16BMBLcSwY5r6JJRnno3YOrFrqjwutsqqvxw
         F8hPiSH0KeouQivgMEkMM2EfcooGzUqekyu0zsMoEVsjyzjtBz59lEWNrvOVZBAQw43Y
         9ZgQk1K64FCzfPlyx6YleOwJ9kI/Ze9iRZONxG8mlc/OO3BxV95UuTz4UyREfmCfg6rC
         RRnK6gTVuwL9/1CfYHD+7uw/6Z8+rlsPO+U1JXXGdGU8mPG5FW6lubwQtztoi9HBXECA
         hTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684765426; x=1687357426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2hQTPUfuJNacgMvbympUA555bAfKHNIBxMHLi2LZdc=;
        b=CbFhD0oQHFeUsM74Rx5KLvGaDJiSaCeMI6Zg5rnYtiG4/IZS+hVlGOy7kB9w0+fyoD
         dq2S51mkFcpah4DQgsbx+C1PEll0Z3W5rXqdzhMuKs5Rej3TMUO+gXrZhLl2vwHjt7ZN
         2wBEthgo5snqFnLrMd8My8jtgsFMf/8fvxb1NpVxkOztFOHN+DfYyFCD3Op80g5ezSU9
         AwgkxCiRXE/sv+oFY3ASbcveqt2LAmoXsNJpR9YZQhTHmV0M5MCnZcj9vHbXKZNOoDme
         IjXhoG13bOO6qoqGOS9+dBfPqeTReeCAEwE8BwjDD9Pi2hFjAWK7/MRv3rrWsG1XG8qH
         7J0g==
X-Gm-Message-State: AC+VfDyX3Ud8nWI248D5f8gXQ5imHNIOvxiRoLmSHv1NAoiOaHk//b1N
	lemCN0LpZiG1n6zrur/8fNS+KOaloQSSqGDJU+HZUQ5o2Z8Tmt3ahV4=
X-Google-Smtp-Source: ACHHUZ53/p5WrRGTADHz/P1eg0TzLqwPuexyukJwKo6PBD3Z5NBokuPlVMNwrk3h+57YFEC2ij05Mwx6SuXzhaAtnHs=
X-Received: by 2002:a81:9ac4:0:b0:55a:5323:2801 with SMTP id
 r187-20020a819ac4000000b0055a53232801mr11209388ywg.23.1684765426003; Mon, 22
 May 2023 07:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
 <20230203-evk-board-support-v7-8-98cbdfac656e@baylibre.com> <c6ea1360-9ca7-783e-0d0f-f5100fd8d024@collabora.com>
In-Reply-To: <c6ea1360-9ca7-783e-0d0f-f5100fd8d024@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 May 2023 16:23:34 +0200
Message-ID: <CAFGrd9qiYV2ct-z56Mu_4di1Rd0_u+u_WwyYYin6oJotq=2xpw@mail.gmail.com>
Subject: Re: [PATCH v7 08/11] arm64: dts: mediatek: add ethernet support for mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_072350_459223_201922E1 
X-CRM114-Status: GOOD (  26.43  )
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

Hi Angelo,

Le lun. 15 mai 2023 =C3=A0 13:47, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 11/05/23 18:29, Alexandre Mergnat ha scritto:
> > - Enable "vibr" and "vsim2" regulators to power the ethernet chip.
> >
> > Tested-by: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 57 ++++++++++++++++++++=
+++++++++
> >   1 file changed, 57 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/b=
oot/dts/mediatek/mt8365-evk.dts
> > index 3a472f620ac0..cf81dace466a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > @@ -88,6 +88,28 @@ optee_reserved: optee@43200000 {
> >       };
> >   };
> >
> > +&ethernet {
> > +     pinctrl-0 =3D <&ethernet_pins>;
> > +     pinctrl-names =3D "default";
> > +     phy-handle =3D <&eth_phy>;
> > +     phy-mode =3D "rmii";
> > +     /*
> > +      * Ethernet and HDMI (DSI0) are sharing pins.
> > +      * Only one can be enabled at a time and require the physical swi=
tch
> > +      * SW2101 to be set on LAN position
> > +      */
> > +     status =3D "disabled";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             eth_phy: ethernet-phy@0 {
> > +                     reg =3D <0>;
> > +             };
> > +     };
> > +};
> > +
> >   &i2c0 {
> >       clock-frequency =3D <100000>;
> >       pinctrl-0 =3D <&i2c0_pins>;
> > @@ -137,12 +159,47 @@ &mt6357_pmic {
> >       #interrupt-cells =3D <2>;
> >   };
> >
> > +/* Needed by analog switch (multiplexer), HDMI and ethernet */
>
> What part of the ethernet HW needs this regulator?
>
> > +&mt6357_vibr_reg {
> > +     regulator-always-on;
> > +};
> > +
> >   /* Needed by MSDC IP */
> >   &mt6357_vmc_reg {
> >       regulator-always-on;
> >   };
> >
> > +/* Needed by ethernet */
>
> Same question for this one. If a device needs us to turn on a regulator i=
n
> order for it to be powered (read: if the supply is not fixed-on), setting
> that supply as always-on is not beneficial for anyone, as eventually in a
> power-off sleep/idle/whatever-pm state, this device (whole chip or IP) *w=
ill*
> leak some amount of power.
>
> If hardware engineers decided to connect a device to a supply that *can b=
e*
> shut down entirely there must be a reason, right? :-)

In theory yes, but mistakes happen. For MT8195, ethernet is supplied by VSY=
S.
Curiously, all other SoC except one haven't the regulator drived by
the mdio driver.
Why is it powered by a regulator which can be turned off here, whereas
the ethernet
chip is able to Wake-on-Lan ? Maybe the vibrator regulator has been chosen
to supply enough current for all analog switches (to share pins between eth=
ernet
and HDMI), I don't know.

Should I create a new mdio binding/driver/node related to the ethernet chip=
 to
enable/disable power ? Currently I found only one who does that: "mdio-sun4=
i",
so I'm not really confident.
OR
Should I introduce the regulator management directly into mtk_star_emac
binding/drive, even if it's more related to mdio ?
OR
Should I put a comment in the DTS which warns that vibr & vmc must be on
to have ethernet working ?

Do you have a better suggestion?

Finally, we are speaking about power optimization where the feature isn't
already supported for this SoC. Can we do this step by step ? Because setti=
ng
the regulators always-on doesn't look bad when ethernet is enabled (for WoL=
).

Do you have a better suggestion?

Regards,
Alex

