Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA1C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//cYdkbYFLjikSLrQMK52LAnpkQRDpOmX2g1yW5gAEM=; b=UAQms5glSBlOoTPs1hlCvl2JhQ
	LLy/LrKjN7Fo2YMjIoGRY9fkSbESxd/4uoemGCk6j/CpGUd0EoHMYj421ez8OgLfl69xkeVyOkFcW
	zgjPhnFJVHn8rvnMCyadE2wg6KP/jCjRadNAcBVsnssSfApXuXSeTgoFZMv/dM9co8lmTuXvSWAjD
	CgPYkB5NRIJBOR6R8H4PdyRIcm24rO+GFs/2fTcSrYa3Sipj1ZvZ0gDmSBRpLHNOU8Iw2CvXxljgz
	+queXNgcP7+qkix96ZZk4QYYpm82JuRvc4rcH6WGF09x/um0yDKeZooTNJzBgCLhCcRR0QJOHbk1h
	lxlXHZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTsF-00GziY-Gv; Tue, 07 Mar 2023 09:44:47 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTsC-00Gzg3-Bw
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:44:46 +0000
Received: by mail-vs1-xe30.google.com with SMTP id m10so11782295vso.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//cYdkbYFLjikSLrQMK52LAnpkQRDpOmX2g1yW5gAEM=;
        b=ECn30YO1MEaRGU7MgUmW3hhEOL9fYlUfG4f1CoC7fkpcA+EPGildLtMtol6XhV6xsa
         D2V3QeQXyUC8ViK3lLMGs4iWryPCTzni+gFahSbT3qyXkLth7OZm1BgNY4kO6vRUbMus
         fXJsvX8Z5pgSrZnls4oTHvoruKIoPJpQFxYQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//cYdkbYFLjikSLrQMK52LAnpkQRDpOmX2g1yW5gAEM=;
        b=nPqIXnA9shjBYrIEhinFPBgblFXTEuISac0aS24CBkh26dGxTESzi14c0iZJ46Ngi1
         sW6VnOcCNOyhc5MWrSD8Awbhu3cK/rKWOsouUJ7pHh8EkyNvvhfMv1snoSIxZCbx7Ok5
         OY9hB6J43/kwTV5j3wglEk/OI8+z11jN5Sk/wfB5WKdefXbsUmLcTqqCgsFGogcS0Uu7
         p5XoMLVJB8RA4XXtRMF/DvoDn7iz5Ewd4y64IYD+nQmoa/ciTNrUO/lS5DIjaNCEbbdr
         J+d5AOO3S/ncSw355Qvp5ckoxV6waN2lpro6ULgSBEGBSYtcYVDgVJMU3eaXT178aJLb
         knWA==
X-Gm-Message-State: AO0yUKVl4v51Cd+rbf4b3QvwHEjVrz5depejDdiUKRDRQv/gCI1X6p1E
	wIKXtJoBUsFKUXTTnbf9emZKrjPjYizuGcFwVkwg9g==
X-Google-Smtp-Source: AK7set/1eEgQqC8T0I7qSYCA34Qq3DGlXqTOrAUPGOGCAvlEKAqRKkYJEV/Zy1k3IPgIz9XnkV8pcIYHwdVRMHK8Pi4=
X-Received: by 2002:a67:e3cb:0:b0:421:e25b:3d0c with SMTP id
 k11-20020a67e3cb000000b00421e25b3d0cmr3355189vsm.3.1678182283170; Tue, 07 Mar
 2023 01:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com>
 <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com> <CAGXv+5FwNfZ7TwKVMM5_uAjYQ6ZmhZVFsWREb_da-jxC6EUVJw@mail.gmail.com>
 <CAGXv+5F8A4kLq3y8dE4mrcVb338-afDorWsS5MRBvWVPgiAhEA@mail.gmail.com> <e1b9d901-421c-3509-c92a-c59d49ff2b0d@collabora.com>
In-Reply-To: <e1b9d901-421c-3509-c92a-c59d49ff2b0d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:44:32 +0800
Message-ID: <CAGXv+5EcAMmGro9UFLmQvkgcBykS9rsUdF_YsdbRUbtipfEFJA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230307_014444_457870_292186B2 
X-CRM114-Status: GOOD (  30.84  )
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

On Tue, Mar 7, 2023 at 5:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 10:24, Chen-Yu Tsai ha scritto:
> > On Fri, Mar 3, 2023 at 12:09=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> On Thu, Mar 2, 2023 at 6:17=E2=80=AFPM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>>
> >>> Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
> >>>> On Wed, Mar 1, 2023 at 5:55=E2=80=AFPM AngeloGioacchino Del Regno
> >>>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>>
> >>>>> Add coupling for these regulators, as VSRAM_OTHER is used to power =
the
> >>>>> GPU SRAM, and they have a strict voltage output relation to satisfy=
 in
> >>>>> order to ensure GPU stable operation.
> >>>>> While at it, also add voltage constraint overrides for the GPU SRAM
> >>>>> regulator "mt6359_vsram_others" so that we stay in a safe range of
> >>>>> 0.75-0.80V.
> >>>>>
> >>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregn=
o@collabora.com>
> >>>>> ---
> >>>>>    arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
> >>>>>    1 file changed, 9 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >>>>> index 8570b78c04a4..f858eca219d7 100644
> >>>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >>>>> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
> >>>>>           regulator-always-on;
> >>>>>    };
> >>>>>
> >>>>> +&mt6359_vsram_others_ldo_reg {
> >>>>> +       regulator-min-microvolt =3D <750000>;
> >>>>> +       regulator-max-microvolt =3D <800000>;
> >>>>> +       regulator-coupled-with =3D <&mt6315_7_vbuck1>;
> >>>>> +       regulator-coupled-max-spread =3D <10000>;
> >>>>
> >>>> Looking again at the downstream OPP table, it seems there's no volta=
ge
> >>>> difference requirement. It only needs V_SRAM >=3D V_GPU. Same applie=
s to
> >>>> MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >=3D 1=
0000.
> >>>
> >>> On MT8195 we don't need any regulator coupling. There, the GPU-SRAM v=
oltage
> >>> is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need=
 to
> >>> scale the vsram.
> >>
> >> Looks like it's fixed at 0.75V. I guess we're Ok on MT8195.
> >>
> >>>>
> >>>> Would setting max-spread to 0 work? I ask because with both regulato=
r's
> >>>> maximum voltage set to 0.8V, there's no way we can reach the highest
> >>>> OPP.
> >>>>
> >>>
> >>> No that doesn't work. I can raise the Vgpu max voltage to 0.88V to so=
lve the
> >>> issue right here and right now, or we can leave it like that and revi=
sit it
> >>> later.
> >>>
> >>> I would at this point go for setting mt6315_7_vbuck1's max-microvolt =
to
> >>> 880000, as this is the maximum recommended voltage for the GPU as per=
 the
> >>> MT8192 datasheet, it would also make sense as we would be still descr=
ibing
> >>> the hardware in a correct manner.
> >>>
> >>> What do you think?
> >>
> >> If it's just to accommodate the coupler stuff, I say just set the maxi=
mum
> >> at the lowest possible setting that satisfies the coupler constraint a=
nd
> >> granularity of the regulator. The regulator does 6250 uV steps, so I g=
uess
> >> we could set the maximum at 812500 uV, with a comment stating the nomi=
nal
> >> voltage of 800000 uV and that the extra 12500 uV is to workaround coup=
ler
> >> limitations.
> >>
> >> Does that sound OK?
> >
> > Even without changing anything, the coupler seems to work OK:
> >
> >   vsram_others                     1    1      0  normal   800mV
> > 0mA   750mV   800mV
> >      10006000.syscon:power-controller-domain   1
> >           0mA     0mV     0mV
> >   Vgpu                             2    2      0  normal   800mV
> > 0mA   606mV   800mV
> >      13000000.gpu-mali             1
> > 0mA   800mV   800mV
> >      10006000.syscon:power-controller-domain   1
> >           0mA     0mV     0mV
> >
> > Am I missing something?
> >
>
> I don't think you are... I may be getting confused by all of the changese=
ts
> that I'm pushing at once.
>
> Hence, is this commit fine as it is?

It works for some reason. Maybe it's a bug in the coupler. Either way I
think it works, even though the numbers might be a bit off. We can revisit
it later.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

