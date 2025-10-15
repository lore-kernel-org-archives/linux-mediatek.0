Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5FACCD185
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 07:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=; b=1CqXKL3xsoYXxi
	rmeDl6JjG78uVinnC1cTMlJZLJm9fTh+HDFbx3rxqhUKobLKhs6eoX7BJd9jIDu/RElpNussEGtfX
	h6ILuZKFcXyHCGfkESyvFZZvEO+uXyTFZN9AKNg1ICb5NYNd9qcyposT8XmgeY5IBIIjThYvCFZl3
	L6TYsFmtR2/wiX8LEahESbi6m/sd/P3iY3CEvBmR1zJQJCuIF0z/nBA37zHf5SO8aOBy6QN9NXsxw
	JaxwKkK9OYDCr75P2YHk3rQGd2onA3P3orjJlT404y998wKyjkeGHN0JYfRxZaguerKIjWNyUuGpx
	hPpZiMnWKaOkkYngvvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vz2-00000000kn4-33Lx;
	Wed, 15 Oct 2025 07:31:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vyy-00000000kks-1psr
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 07:31:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-375eff817a3so61341691fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760513494; x=1761118294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=;
        b=KFlEr25yzFmPEPH3hrk1XXJSKKxOSl2JIeysNaO+ubrf7706Pv7W8Qw0KBEeVCrmBf
         D5fnDbqYSL0SMHgW34gmbLn9ZVfgwsz6to+E8vGa8ht8OyIZ/x0f98U+kneN66J/X8m5
         s4IEaYxmz0AFeuXTnwB9oS4wOj3Ht2/FQHw3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760513494; x=1761118294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA/rGkqw3N7PVH4gFdLuRaD7H9TojqRrEXcECrcqYbg=;
        b=bp5UKpv5Sa84uR9ZLbMzD/zWzl+QUdbd0Fs7tHty0RH+bzW8MeIQSepTm/akJ+02l3
         p0FQy+5kS/DXbrsDzUonX6STj3KYRc75ljXnH4HqKBwKqAUZPPgDQCZsTJjAbTscmJLS
         AVfBizuMtkSRSHUUdoDtYNL2Odas/xYO5aL47RItKwRbe6uAc7w1Usne6tRyaxwBp8MB
         5dvlmXNeChRBQiB5A/22BjqqGvHeVPa6Sij063UIsmXUqaAi7XUqMfjx0wqB2zYo3m9k
         U33Z/rruvizCHSnvF8GmwGIkIzdU3bIC2RKUfqOvC2XofdsQPhcPnzXq9U0YCZmJCEKO
         ZNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZWw4K7yUqmBBLnJjY8YKQwJ4bEsDbj4G7b168pz/YD2JKbzfRFg+sUBu5kflXRHOyq3NbC/Hpe78Nm0ObVw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx5b+Rp+oTQks9oPqsMQB/ksjwjuWLJzoyKiuZBdS7/0f5DyiX
	od2HTjaHT2yWU3/Zdcs0SC+lyPZQUAEgyQEd46vLWf1heozk/mCE0Ocz2IBGbmtVC650Ssvi5w+
	dcUxbW8SiLpQjLvblRTXL1wQERPT786MPNp01CjTt
X-Gm-Gg: ASbGnctZ0jodoDdQA8nQucyLN66M56hbRS092Js8lfkcyZwvKXAtA40qltW9UXik0ok
	TXU8V0SCeqTfN5J6w5t/UM3OwCg0y8o5lDwGM8QuTGyNnMpq9ikp/of9DioXCNoYWCQTOWA5ytR
	w3nuse1Js2S1htF7PlCe05Y1pHa7bcik/JKpDnjNlBjKQCoTbBWYfSF1DSZuk2QwPAcwhI+xnK5
	4TH2Lh0xT91n7ZDSqgY8qSDsejXlPlrBTD2f7ITultZtPeWvx31UAVXoGauWeX1Cqcbl6G7WLUZ
	bA==
X-Google-Smtp-Source: AGHT+IGix7SiLyiT/iVo280/TBO4WaVIjuGiYnKRmsDHJTLJH8R+MNxCQXl3EtGV1sD7rAb12vm7OwOdCHylb5Oip9A=
X-Received: by 2002:a05:651c:3608:b0:364:f7e2:3908 with SMTP id
 38308e7fff4ca-37609e0fbbcmr72211741fa.26.1760513493816; Wed, 15 Oct 2025
 00:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250814092510.211672-1-wenst@chromium.org> <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
In-Reply-To: <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 15 Oct 2025 15:31:22 +0800
X-Gm-Features: AS18NWDz5vKCVYo2LSqzyJIsi9qNL-WB0jpDYaeMQh-Pcz5jywfjijzblwQFm7E
Message-ID: <CAGXv+5EPd5hLSNTFYkBWPCL1Bq4CJN4R7v5ZWtoRMYSi9+TeCA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_003136_535064_1CB3D9FB 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 9:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/08/25 11:25, Chen-Yu Tsai ha scritto:
> > The first SCP core is used to drive the video decoder and encoders.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Added SCP vreq pin
> > ---
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 ++++++++++++++++++=
+
> >   1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index c5254ae0bb99..7fedbacdac44 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
> >               #size-cells =3D <2>;
> >               ranges;
> >
> > +             scp_mem_reserved: memory@50000000 {
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0 0x50000000 0 0x800000>;
> > +                     no-map;
> > +             };
> > +
> >               apu_mem: memory@55000000 {
> >                       compatible =3D "shared-dma-pool";
> >                       reg =3D <0 0x55000000 0 0x1400000>;
> > @@ -1077,6 +1083,13 @@ pins-bus {
> >               };
> >       };
> >
> > +     scp_pins: scp-pins {
> > +             pins-scp-vreq {
> > +                     pinmux =3D <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       spi0_pins: spi0-pins {
> >               pins-bus {
> >                       pinmux =3D <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
> > @@ -1146,6 +1159,18 @@ &postmask0_out {
> >       remote-endpoint =3D <&dither0_in>;
> >   };
> >
> > +&scp_cluster {
> > +     status =3D "okay";
> > +};
> > +
> > +&scp_c0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&scp_pins>;
> > +     firmware-name =3D "mediatek/mt8188/scp.img";
>
> After a (very brief) discussion with Arnd last time, turns out we decided=
 to avoid
> using the firmware-name property, including for mtk-scp.
>
> Please resend without firmware-name.
>
> P.S.: there's a patch to construct the firmware name from compatible...
> https://lore.kernel.org/r/20250911140043.190801-1-angelogioacchino.delreg=
no@collabora.com

I'm aware of the patch, but did that get merged? If not then this would
cause it to default to just /lib/firmware/scp.img?

ChenYu

> Cheers,
> Angelo
>
> > +     memory-region =3D <&scp_mem_reserved>;
> > +     status =3D "okay";
> > +};
> > +
> >   &sound {
> >       pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
> >                       "aud_etdm_spk_on", "aud_etdm_spk_off",
>
>

