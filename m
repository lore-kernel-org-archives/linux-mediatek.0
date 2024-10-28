Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8147FD1359C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=; b=Ck/IvABsiLiMEFNq0uUOrfzrhb
	mafSfmiHkWJcCkEmo01IX4WgkugaHgKpUNXfstPTIacndNdzpMmG1RjRz6ebxmPUv+Y2TMyv61uDO
	2fTnYZtPhHYoT0OuUOkqPze0IAi5wZPuZ03u1t8Y8+dSBf+kVZ8642ndEFErPmZBsrjIxoOgn5nCg
	cPwnf3407+PAOvromm2OFdyuGxcVRidw8BIZ/oY7aVI46WLiOaB23ucZNoaAt4TrgObharD2zk8QE
	EfvQAVe2AEATrQI0IbuOMxw+uMR3C1JbW/kEqWjLNbZ7tpVg3aJr1sVmB9FV3okPNIw00Lbo3riIq
	yegl9krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ot4-0000000Aks3-0mau;
	Mon, 28 Oct 2024 12:30:22 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NkQ-0000000AYIl-1vXM
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 11:17:50 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-84fe454176bso1241463241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114241; x=1730719041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=;
        b=nrJD7Iz7UAB41EigP8AZjbMH2/uuXtFp9i4lqv6WNTAnfUPJoy/rshrBhGUaTqzCnC
         m29ayIW67UBFVr3tsgGM9ENdoI9Kehmgx3cB+4EMybA67KRJZFwJKED6awBh799AK5hR
         NONnSPBJDGqsrX6X1H3vmoev5fy4X6wJWn7tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114241; x=1730719041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=;
        b=GmokLAemnAiyZUnPlcijB2Kll7n/6DKUOpskCLv0/cl/1X3ymiU/GxXHBq5lk2BaAE
         ZwOUzC/wCR+kAdSh6aQDqx8LO0fuMXbm9kbbHBXibhyTK78D5KyFZuOx+9nIqvdCGfHO
         On2DECpykSxtYSeRMy2y9LKCBWw10w8Gj75qlogMoIn9ppy5X7kJTX9U6m868s0MMpKd
         ikzwR1YHDVS4TwiYsjze9B/nwM0k771gJt39KA9UiVrIpc6TNmLRs7NX7oMWmhMlHJlZ
         UmrgFUZWSSekRyl0eRZKiW8X9OysIPtY6MXZ/tZnC2JtbW60avGWBHklFkfLM8o6mpFn
         xxGw==
X-Forwarded-Encrypted: i=1; AJvYcCXyH00avFn8KS3725klu58tlRlhVu26w0RswS+0z5XNusph9aAYDWpcG6Lo7yHA2IZ/k1XpiGEQ4ijbUiu9aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv7PSryYibTnI0Y3O4Fb3jaC5PGVU0m7BGjmmBdyAVl/ZMQv0d
	Fhmto9B1CUYk9BL0IOFoVpDfO1TDuTcwglalCm75qpIxaIOz01hv3Kmhjp9++65xNs5w07jT1OY
	=
X-Google-Smtp-Source: AGHT+IEa22BA19ZoL2EzP/TnZ5+TuzH/ZU59cyEMLVMmFETEf0CKTiXd9BuDm8/Rz3ph7+LDEQInHA==
X-Received: by 2002:a05:6122:3c4c:b0:50d:3ec1:1546 with SMTP id 71dfb90a1353d-5101502fe03mr4357680e0c.4.1730114240824;
        Mon, 28 Oct 2024 04:17:20 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-510045e3ee8sm826463e0c.33.2024.10.28.04.17.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:17:19 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4a46b6affeaso1458202137.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwOev6IGZCoKLUG9EMCNJLAgJDIAdlsjlf0DU0Us+uM2aqEopwqLt/fS9PK4/C/N/PwJA+h6gt3pU1UvTftA==@lists.infradead.org
X-Received: by 2002:a05:6102:3049:b0:4a3:d2e5:f097 with SMTP id
 ada2fe7eead31-4a8cfd6d0d4mr4759861137.24.1730114238879; Mon, 28 Oct 2024
 04:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025110111.1321704-1-fshao@chromium.org> <20241025110111.1321704-3-fshao@chromium.org>
 <iupuwxxslb3t76mzy3ufsruwwpd47fuop7y6tfcbwkosdagkxf@fnklbp6t6au2>
In-Reply-To: <iupuwxxslb3t76mzy3ufsruwwpd47fuop7y6tfcbwkosdagkxf@fnklbp6t6au2>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:16:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1nic3HgEGeS6up_MsYh3UoM_piHC6=uuRep5bne4zOWbxQ@mail.gmail.com>
Message-ID: <CAC=S1nic3HgEGeS6up_MsYh3UoM_piHC6=uuRep5bne4zOWbxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041722_506991_34838CAD 
X-CRM114-Status: GOOD (  25.23  )
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

On Mon, Oct 28, 2024 at 5:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:59:36PM +0800, Fei Shao wrote:
> > Introduce MT8188-based Chromebook Ciri, also known commercially as
> > Lenovo Chromebook Duet (11", 9).
> >
> > Ciri is a detachable device based on the Geralt design, where Geralt is
> > the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> > different combinations of second-source components, including:
> > - audio codecs (RT5682S and ES8326)
> > - speaker amps (TAS2563 and MAX98390)
> > - MIPI-DSI panels (BOE NV110WUM-L60 and IVO t109nw41)
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/Makefile         |    8 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   63 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   54 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   20 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   76 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   67 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   52 +
> >  .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  413 +++++
> >  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1497 +++++++++++++++++
> >  11 files changed, 2304 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
0.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
1.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
2.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
3.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
4.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
5.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
6.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
7.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts=
i
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index 8fd7b2bb7a15..c6c34d99316b 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -69,6 +69,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-volt=
orb-sku589824.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-voltorb-sku589825.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku0.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku1.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku2.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku3.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku4.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku5.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku6.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku7.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r5-sku2.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-spherion-r0.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts b=
/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> > new file mode 100644
> > index 000000000000..7a2edbaa74f1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8188-geralt-ciri.dtsi"
> > +
> > +/ {
> > +     model =3D "Google Ciri sku0 board";
> > +     compatible =3D "google,ciri-sku0", "google,ciri", "mediatek,mt818=
8";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts b=
/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> > new file mode 100644
> > index 000000000000..53fdd5acaa3f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8188-geralt-ciri.dtsi"
> > +
> > +/ {
> > +     model =3D "Google Ciri sku1 board";
> > +     compatible =3D "google,ciri-sku1", "google,ciri", "mediatek,mt818=
8";
> > +};
> > +
> > +&dsi_panel {
> > +     compatible =3D "ivo,t109nw41", "himax,hx83102";
> > +};
> > +
> > +&touchscreen {
> > +     himax,pid =3D <0x1003>;
>
> Why do you add more of undocumented properties?

I think I'll drop the Himax related thing until Himax finishes
upstreaming their drivers, so there's a standardized binding to
follow.

>
> > +     firmware-name =3D "himax_i2chid_1003.bin";
> > +};
> > +
> > +&i2c0 {
> > +     /delete-node/ audio-codec@1a;
> > +
> > +     es8326: audio-codec@19 {
> > +             compatible =3D "everest,es8326";
> > +             reg =3D <0x19>;
> > +             interrupts-extended =3D <&pio 108 IRQ_TYPE_LEVEL_LOW>;
> > +             #sound-dai-cells =3D <0>;
> > +             everest,jack-pol =3D [0e];
> > +             everest,interrupt-clk =3D [00];
> > +     };
> > +};
> > +
> > +&sound {
> > +     compatible =3D "mediatek,mt8188-es8326";
> > +     model =3D "mt8188_m98390_8326";
> > +
> > +     audio-routing =3D
> > +             "ETDM1_OUT", "ETDM_SPK_PIN",
> > +             "ETDM2_OUT", "ETDM_HP_PIN",
> > +             "ETDM1_IN", "ETDM_SPK_PIN",
> > +             "ETDM2_IN", "ETDM_HP_PIN",
> > +             "ADDA Capture", "MTKAIF_PIN",
> > +             "Headphone Jack", "HPOL",
> > +             "Headphone Jack", "HPOR",
> > +             "MIC1", "Headset Mic",
> > +             "Left Spk", "Front Left BE_OUT",
> > +             "Right Spk", "Front Right BE_OUT";
> > +     status =3D "okay";
> > +
> > +     hs-capture-dai-link {
>
> Nope, that's not how DAI links are called.

Acknowledged, but I'm still figuring out what you want to suggest here
- does the `^dai-link@[0-9]+$` pattern sound okay?

>
> > +             codec {
> > +                     sound-dai =3D <&es8326>;
> > +             };
> > +     };
>
> ...
>
> > +&i2c2 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&i2c_tunnel {
> > +     /delete-node/ sbs-battery@b;
> > +
> > +     battery: sbs-battery@f {
> > +             compatible =3D "sbs,sbs-battery";
> > +             reg =3D <0xf>;
> > +             sbs,i2c-retry-count =3D <2>;
> > +             sbs,poll-retry-count =3D <1>;
> > +     };
> > +};
> > +
> > +&max98390_38 {
> > +     sound-name-prefix =3D "Front Right";
> > +     maxim,dsm_param_name =3D "dsm_param.bin";
>
> NAK. Not a DT property. You cannot send us ACPI stuff.
>
> Go through internal review first, which should tell you that ACPI is not
> accepted into DT. There are just few exceptions and codecs do not
> qualify.

I'll drop all these invalid lines. It was likely a misunderstanding
when the lines were added. Thanks for clarifying.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

