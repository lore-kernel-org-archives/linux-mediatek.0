Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974DBC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KEjIGIP7k4933B+btGoksmvrPyH6BRppEBQn/EZ6nA=; b=aI03j80HlRBRV65UcHAmWaVYFF
	I9im09tpqCbGJ0Gn/qoU+EHDwPOkumwPceMXUT8xePePvtsDdRlBOvKMVuIgJ2++5T+5pVTe47Ui6
	izgPUT+fOKmZvGUsJ8QeU2b6wl3JTVAPtGZBOOPtDJNiqAfIHLRedPXQbu6yXQ9z5tO0KOd8Vv79N
	czRXvempWTM4KijX75bJaTrAh261vs7uQX76bDSpDBkX8kRZ+jqwjHm6FYSuXw1eSEOxTqVSksORC
	Cn+Fq+RAuTQggJ/Sey3ON+ihXKoNZ2j3nqV4gYVdC5a9R+B2HB8OHh9V5W4Cf4G8+CMOLIa2NQium
	dY5Lx13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTZ9-00GsLN-0a; Tue, 07 Mar 2023 09:25:03 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTYp-00GsAN-Gj
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:24:45 +0000
Received: by mail-ua1-x929.google.com with SMTP id n4so8362854ual.13
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678181079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KEjIGIP7k4933B+btGoksmvrPyH6BRppEBQn/EZ6nA=;
        b=hVe6Sb3vULw3t8joPXyJizdO/5PxqGwox55+I7vxTiXYKJ0qwlXt6/LqiGX9tqqE/b
         nk4UimZQaU0d9iKv62y+OHGrxmGZ30Rg+l1tmtH486aWXB/oPzRZJOCh98gaG8qn2iOQ
         asNP6HvdtcY8Jj1N2XPu2lCt+dWqp9/a2Dai0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678181079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KEjIGIP7k4933B+btGoksmvrPyH6BRppEBQn/EZ6nA=;
        b=a7sc10iVxix61X0f//J6I160r+VvxOtfIl4HZMPX2NuN+1YkKmBbbYH0I/107jjaUG
         HEk6JvyyqnsuDkK2/OO9skCxoKBJFm2m8evXr2DZYM6ZTRE/ht0eEtDURBXluwbexzQj
         8oSiifqMy8dxpXcZs/UX1Llr4vRDyFjWqTlIOZNq64vtX6SvSgWoNXf4SjdnrygLc3JB
         /Jgt4t53fnNQOkeGqNFrFZOhf8L1GPxidzV3O9mM9FIiiTzhuQY3bWuuqkfg7U/wJ//Y
         mWxXPhQkKz8GSsJnQKkagUst4tSp6je57ZGC6bB4L+bqODJUooPTX5axpJlm2h/r2WY5
         psig==
X-Gm-Message-State: AO0yUKW1oZFKL7cTDPj7hMSHOJGke35WiJYx7UmNjRP9r5Z2COPtmlR6
	+LZ+1TYdJBC/aomju9DNGMX9ppRXfwAJBsaUHQ5IVw==
X-Google-Smtp-Source: AK7set+da9sAeR326t9LNfp7UZouQJyP9uKjC8RgBcg9Kg3WklPbE8tDN9/nwn0EBb9q00Bh4xZa0t6X7HiSBNUylAo=
X-Received: by 2002:a9f:3104:0:b0:68a:5bba:ba40 with SMTP id
 m4-20020a9f3104000000b0068a5bbaba40mr8809625uab.1.1678181079476; Tue, 07 Mar
 2023 01:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
 <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com> <CAGXv+5FwNfZ7TwKVMM5_uAjYQ6ZmhZVFsWREb_da-jxC6EUVJw@mail.gmail.com>
In-Reply-To: <CAGXv+5FwNfZ7TwKVMM5_uAjYQ6ZmhZVFsWREb_da-jxC6EUVJw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:24:27 +0800
Message-ID: <CAGXv+5F8A4kLq3y8dE4mrcVb338-afDorWsS5MRBvWVPgiAhEA@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_012443_583893_96430645 
X-CRM114-Status: GOOD (  30.03  )
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

On Fri, Mar 3, 2023 at 12:09=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Mar 2, 2023 at 6:17=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
> > > On Wed, Mar 1, 2023 at 5:55=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Add coupling for these regulators, as VSRAM_OTHER is used to power t=
he
> > >> GPU SRAM, and they have a strict voltage output relation to satisfy =
in
> > >> order to ensure GPU stable operation.
> > >> While at it, also add voltage constraint overrides for the GPU SRAM
> > >> regulator "mt6359_vsram_others" so that we stay in a safe range of
> > >> 0.75-0.80V.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> > >> ---
> > >>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
> > >>   1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > >> index 8570b78c04a4..f858eca219d7 100644
> > >> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > >> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > >> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
> > >>          regulator-always-on;
> > >>   };
> > >>
> > >> +&mt6359_vsram_others_ldo_reg {
> > >> +       regulator-min-microvolt =3D <750000>;
> > >> +       regulator-max-microvolt =3D <800000>;
> > >> +       regulator-coupled-with =3D <&mt6315_7_vbuck1>;
> > >> +       regulator-coupled-max-spread =3D <10000>;
> > >
> > > Looking again at the downstream OPP table, it seems there's no voltag=
e
> > > difference requirement. It only needs V_SRAM >=3D V_GPU. Same applies=
 to
> > > MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >=3D 10=
000.
> >
> > On MT8195 we don't need any regulator coupling. There, the GPU-SRAM vol=
tage
> > is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need t=
o
> > scale the vsram.
>
> Looks like it's fixed at 0.75V. I guess we're Ok on MT8195.
>
> > >
> > > Would setting max-spread to 0 work? I ask because with both regulator=
's
> > > maximum voltage set to 0.8V, there's no way we can reach the highest
> > > OPP.
> > >
> >
> > No that doesn't work. I can raise the Vgpu max voltage to 0.88V to solv=
e the
> > issue right here and right now, or we can leave it like that and revisi=
t it
> > later.
> >
> > I would at this point go for setting mt6315_7_vbuck1's max-microvolt to
> > 880000, as this is the maximum recommended voltage for the GPU as per t=
he
> > MT8192 datasheet, it would also make sense as we would be still describ=
ing
> > the hardware in a correct manner.
> >
> > What do you think?
>
> If it's just to accommodate the coupler stuff, I say just set the maximum
> at the lowest possible setting that satisfies the coupler constraint and
> granularity of the regulator. The regulator does 6250 uV steps, so I gues=
s
> we could set the maximum at 812500 uV, with a comment stating the nominal
> voltage of 800000 uV and that the extra 12500 uV is to workaround coupler
> limitations.
>
> Does that sound OK?

Even without changing anything, the coupler seems to work OK:

 vsram_others                     1    1      0  normal   800mV
0mA   750mV   800mV
    10006000.syscon:power-controller-domain   1
         0mA     0mV     0mV
 Vgpu                             2    2      0  normal   800mV
0mA   606mV   800mV
    13000000.gpu-mali             1
0mA   800mV   800mV
    10006000.syscon:power-controller-domain   1
         0mA     0mV     0mV

Am I missing something?

ChenYu

