Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6477DCED265
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=; b=uM8Hjz/0iR7SZcr0lB+uNSNvSa
	nsZB6gMK/Ir6/fvgZ5y3MtBlSoXU3uUtGPmR1IHok7heFGeoXpgkT2rfgYnA+jHGgxz4JNQ2Jx4sB
	qiZchzcKmbRc+/J5hpCB0tv1Fz5iaDtrXdFOaMkxOwQZxyZGPZhA1NJz9wxNuMamZW8F398bpuJXa
	/jYOKr/U1uBrA7btxmG3dxyFPL/uYpwrOEf9uzHAAVW37fjaiTCmDkQeuCWug530mX+l6W8W1+uDH
	g8b0w4AqV3S+2tNVySkNU2z7qXtKrBh+rkjlcva3Zr2PDSnEsFxne1SxkXsZJ3RGkYh8/95djrOyn
	RmP0CC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLImM-00000000EJU-3YrC;
	Tue, 18 Nov 2025 10:17:42 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLImJ-00000000EIV-1MvI
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 10:17:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so228336e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763461057; x=1764065857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=;
        b=OJeEHNT5B6/+3joWd/8gbUDTP/VxfQgw2utqwhoHC5qzAnLSxzOjfsDaTP8rjoRAvE
         hVypbhW4FI1IWSP8qXSqxDgKEuFCrAgGNSLMzC3KHWk0tUvGf1fTcQf4OFIOQVCrO1/F
         On+Zy54eIAYpqLWl4NF7NFjFwU2wqCINjedE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461057; x=1764065857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=;
        b=wxJ5f6kaExi0sClfiXPrVnSJAOw5y02pel9Cdi96J+ujUrzrKqB6AOzBoKAmYs/yF/
         T9sEr4KPDH0XyIZV+OJdEuWYNe8UtqgYGMHAeTcFLot20XL7EluyKR2KZ0jLosKQt5kX
         JngCZhIW5A3BV5tKywUvQ46exR2GZZYsKA+tBv6GcfATGw7yPL6ULLY2jSWQoXcLChE/
         G9yfbUKX4DQrDD2WWjlZFBp6MU4wglMKoa6bR5gqWm9bUlDCtEYBKBP+wQ5sK1mnsTOo
         olP/zGdLECpgLKBwTimmIx4XUxpXGYuyt5BL9rfAfH/7fis5YXoyo2+r3/k2Wv3LA0zo
         8Hvw==
X-Forwarded-Encrypted: i=1; AJvYcCU5yfwQRXHqlT3743FIgILbgbjs9HV1dUS6KRrGmKwJfdLenCh3aUUL5JJMPc/59hJYGsJ5i2zeV2eWNwlIyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP27hPaKoV4llQjRMYj/p1dXK0vlp47ub+NkilC+BX4Ap3+9ue
	p4dxExO0kygPJDLKFJl9DVO7HzPfbNfEPgItv8OXQ2VCJ4uTnOIclaNqbl6mgrbvr6LJzkGdn8P
	jhZmzkfSH7LegzAZ9IyG0W5PUAkTjkY84nRb+EyY7
X-Gm-Gg: ASbGncsC0yxsu/rw6t9rymwBkte+qwv+A8/ozzJCEBD6NMVxhq87d9K/pJA0B+PaySR
	NYaKhAh0mjTdnFifQiBmMGIG3CoLSJIbMFR/pXTn92sYYj1mj3Eiqb5M9G+0itNHt+5Vn6JTvwA
	ivRt+KzsamOkJmfjYP1yQh5yE6xexdq4ohazBxltwixYoErWb8E2fGXsnY/U9ZINLl/x+l+QWW4
	Hch8N5kNXf/Ra8DctGDgV6bX+jp0n8WOHjZkTDMV/n/YvEbS/11dRI7gYh1bF/vTtuIIjua5tRx
	C0N2tJRwCtz8O/Y=
X-Google-Smtp-Source: AGHT+IEDIyDccAsQNaQoiJeQUTT4vBLg4RzkD7VakIIbkSB2sGZK1r6Tx5nUDzSggQyhw/8/mBQdIa7MJoa+YejWBHs=
X-Received: by 2002:a05:6512:3b0d:b0:594:2f72:2f7b with SMTP id
 2adb3069b0e04-595841a2ce6mr4735606e87.6.1763461056862; Tue, 18 Nov 2025
 02:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20251117211306.725678-1-robh@kernel.org> <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
In-Reply-To: <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Nov 2025 18:17:25 +0800
X-Gm-Features: AWmQ_bm304gtjUmEwlNuwAwUF0aqnogWCU3ugaXK9WBY_7txsNFFaEsy0o7zYa0
Message-ID: <CAGXv+5H23oc_Zj3tR4uCwKpXi074ujmF7WB9g_NV-OmXnAWmmQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at build time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_021740_598019_6EEAF435 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Nov 18, 2025 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
> > It's a requirement that DT overlays be applied at build time in order t=
o
> > validate them as overlays are not validated on their own.
> >
> > Add targets for all the Mediatek overlays.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This will soon be a warning[1].
> >
> > Note that if it is desired that the combined .dtb is not installed, the=
n
> > the combined .dtb should be added to 'dtb-' variable instead.
> >
>
> Uhm, sorry, can't we do something such that we don't generate a DTB with =
a
> preapplied overlay?
>
> Even something like generating those and deleting before build finalizati=
on
> could work, I guess, though that'd be hacky maybe.
>
> I don't know if this is the case, but I'm worried that various people hav=
e
> scripts to copy DTBs somewhere (in some partition) or embed those in imag=
es,
> and if they get the preapplied overlay dtbs in the same place, havoc coul=
d
> happen as the bootloaders might be selecting wrong dtbs (as a plus, there=
 is
> no dtbo that varies machine compatible strings, rightfully).

The in-tree scripts/make_fit.py can take a list of DTBs to pack, so
it's conceivable that someone would just use a wildcard path.

We do something similar downstream in ChromeOS, but we probably won't
get this change anytime soon.

OOTH the "make fit" target uses arch/arm64/boot/dts/dtbs-list , which
it seems is also used for DTB install?


ChenYu

> Cheers,
> Angelo
>
> > [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.or=
g/
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index a4df4c21399e..4e92bd9f0e53 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -15,16 +15,30 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-acelink-ew=
-7886cax.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-mini.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtbo
> > +mt7986a-bananapi-bpi-r3-emmc-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-emmc.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> > +mt7986a-bananapi-bpi-r3-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> > +mt7986a-bananapi-bpi-r3-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt79=
86a-bananapi-bpi-r3-nor.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtbo
> > +mt7986a-bananapi-bpi-r3-sata-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-sata.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> > +mt7986a-bananapi-bpi-r3-sd-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt798=
6a-bananapi-bpi-r3-sd.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-2g5.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-emmc.dtbo
> > +mt7988a-bananapi-bpi-r4-emmc-dtbs :=3D mt7988a-bananapi-bpi-r4.dtb mt7=
988a-bananapi-bpi-r4-emmc.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-emmc.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-sd.dtbo
> > +mt7988a-bananapi-bpi-r4-sd-dtbs :=3D mt7988a-bananapi-bpi-r4.dtb mt798=
8a-bananapi-bpi-r4-sd.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-sd.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm-hana.dtb
> > @@ -104,6 +118,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-genio-700-e=
vk.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-kontron-3-5-sbc-i1200.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtbo
> > +mt8395-radxa-nio-12l-8-hd-panel-dtbs :=3D mt8395-radxa-nio-12l.dtb mt8=
395-radxa-nio-12l-8-hd-panel.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8516-pumpkin.dtb
> >
> >   # Device tree overlays support
>
>
>

