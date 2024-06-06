Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4076BC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 03:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqp5qceNq5zHDEhmHDdIMgCbwP2xDR/VfW9ZZv9RNJk=; b=Mvbis06g2LILcz4uEGFCkA3dPW
	a/0uNCYvu8VFfsC7xXCQJTmd4VifcvcAEFPetf7cWuNApolTrWSJ/4oJp2blCzRxlzxqP9k0srkWs
	jcyfXaISeVOQS8+SZskW8JilNchFsmZukEnL7hXqkVTSoH7JY9SU2fVyNDavne50YT7283yqpR3LM
	ME9NPePwp6YqKny2dUy87favgXfd+1r4fhqd2l84H3xD2g2MwSrp8r23S+IPZ/WLdPAeaiOHoUzdQ
	/VxWvSMygrmNdF7YiKpCqRMEAB97+dCg7FytaEQnmFnd1Jxd4JKXHbG5r/T4FMs/YWRf3OLIy42nM
	a6KiWAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF3nw-00000008Fup-39QK;
	Thu, 06 Jun 2024 03:28:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF3ns-00000008Fsz-4AAO
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 03:28:42 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ead2c6b553so3711901fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 20:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717644517; x=1718249317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uqp5qceNq5zHDEhmHDdIMgCbwP2xDR/VfW9ZZv9RNJk=;
        b=X70pDZMe4DPLj8bkpc6btVwSvSu6JJK8xRjGBAfAJatasMekMvoybGVKsix2iIa1zn
         qBdQBBezWXR/EGTdR6ivgAoJbPOkIUXjhGs55UVRpJ3P0LdOmwRvKR/S8f9/TAg8Auz4
         kZUcdKJZaqnO/VRg8y8QnJ39PUlrBL0/05FcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717644517; x=1718249317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uqp5qceNq5zHDEhmHDdIMgCbwP2xDR/VfW9ZZv9RNJk=;
        b=PgdzelGIaNo5MzmlPtxXxQO+MFopSQZtDaTSfz0uwwVIcG1hZTVbOTseOlJ8Epvoyo
         gQNhmU+EpxVSjp5+YVRv+JjGh2Ky2GLHlJFTtY/q3aBAPyHjsqCFXEUrfWke8VdkNRZv
         Bglo3Cyt19Ia0QxK0wVD40AnmxnT0fc9DCdzRyxyZIbhfxccvNV3Pmq2VqUHfwo8KGow
         tXZfbQOpQ8558og+/ju4HRpDlmUZmqKpb8KoOkC5M7z4VWrJ3SkYdURC8csLB2szDHtY
         HQyq+UQEoRoZxji8A8zS4iRsqYLR4tJhpjenmKdLHD9MryrdmL1ryzKGXKh/h9AnVDn0
         qBAw==
X-Forwarded-Encrypted: i=1; AJvYcCVFkYKsbkL/7o6TfRpxw+5e0OUjiLPUwQY5WoMxNRhinY3ov4tVoOWhe66L4RmGlbn6ZnFB8uJ658Ptomo6YTK9j8r7/7rvqwrgUsd1342OhEbB
X-Gm-Message-State: AOJu0Ywg8kQfAXsQTqT8taBk0aZzvOIyYaClcFXYp0lL7f9Qxd1MJMfw
	+MA2WkmgQ54gWgpN8266rHXLePr43Yfd3NHFX9aE+i7cBpthYuGmEzkn2Y76FtPJpt55aTMbPq4
	g1OF7wkgjjVlf0wMiTzBROZNZ7LFc+PHpw3ZI
X-Google-Smtp-Source: AGHT+IGsCEI0/+y91vNyNNYX+q2ZIumGw6d9Pxpjw+1niuix5bZfPr7FyV232O4Sowxvaw+VS8I/365F2zfGr+Nw9m4=
X-Received: by 2002:ac2:48ad:0:b0:51d:34bb:3c6c with SMTP id
 2adb3069b0e04-52bab4ea6dbmr2490766e87.31.1717644517343; Wed, 05 Jun 2024
 20:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-6-wenst@chromium.org>
 <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com> <CAGXv+5GuGz-KahcbKtuyUA1-59sMWSL0QucOdp8FPoQWrc9YUQ@mail.gmail.com>
 <08256a88-7165-41ca-b484-4acf1c8e316b@collabora.com>
In-Reply-To: <08256a88-7165-41ca-b484-4acf1c8e316b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Jun 2024 11:28:26 +0800
Message-ID: <CAGXv+5EtKwdFRCX6BqmVVA5yXCDpJ8eb80m7yU8Aj7vz9E=36w@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power
 domain clock
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_202841_113234_61F11FDF 
X-CRM114-Status: GOOD (  30.89  )
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

On Wed, Jun 5, 2024 at 7:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/06/24 10:25, Chen-Yu Tsai ha scritto:
> > On Thu, May 30, 2024 at 6:03=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> >>> The MFG_ASYNC domain, which is likely associated to the whole MFG blo=
ck,
> >>> currently specifies clk26m as its domain clock. This is bogus, since =
the
> >>> clock is an external crystal with no controls. Also, the MFG block ha=
s
> >>> a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the bl=
ock
> >>> diagram, gates access to the hardware registers. Having this one as t=
he
> >>> domain clock makes much more sense. This also fixes access to the MFG=
TOP
> >>> registers.
> >>>
> >>> Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.
> >>>
> >>> Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain c=
ontroller")
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> Just one question... what happens if there's no GPU support at all and=
 this
> >> power domain gets powered off?
> >>
> >> I expect the answer to be "nothing", so I'm preventively giving you my
> >
> > Well it's powered off by default. Just double checked, and without the =
final
> > patch:
> >
> > # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> > domain                          status          children
> >              performance
> >      /device                                             runtime status
> > -----------------------------------------------------------------------=
-----------------------
> > mfg                             off-0
> >              0
> > mfg_2d                          off-0
> >              0
> >                                                  mfg
> > mfg_async                       off-0
> >              0
> >                                                  mfg_2d
> >
> > And with the last patch but with the powervr removed:
> >
> > # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> > domain                          status          children
> >              performance
> >      /device                                             runtime status
> > -----------------------------------------------------------------------=
-----------------------
> > mfg_apm                         off-0
> >              0
> > mfg                             off-0
> >              0
> >                                                  mfg_apm
> >      /devices/platform/soc/13fff000.clock-controller     suspended
> >              0
> > mfg_2d                          off-0
> >              0
> >                                                  mfg
> > mfg_async                       off-0
> >              0
> >                                                  mfg_2d
> >
> > Things seem to work OK. I can SSH in, and the framebuffer console on th=
e screen
> > works fine.
> >
> >
> > Note that accessing the regmap through debugfs doesn't do much good. re=
gmap
> > doesn't handle runtime PM. And the syscon regmap isn't even tied to a
> > struct device. Dumping the regmap through debugfs while the power domai=
n
> > is off gives all zeroes, likely due to bus isolation.
> >
>
> The last part where you say "gives all zeroes" is actually the best outco=
me that
> I could have ever expected.
>
> So, well, many thanks for this very nice analysis and test.
>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
>
> I confirm my green light. It's beautiful when this kind of patches come u=
pstream
> especially with your replies actually removing any kind of possible doubt=
.
>
> >
> > Thanks!
>
> Thank *you* for caring about this old platform!

Can you pick up this patch first?

Frank mentioned that the GPU core takes two power domains. I asked
MediaTek for more information but I don't know how long that will take.


ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> ....but if I'm wrong and the answer isn't exactly "nothing", then I st=
ill agree
> >> with this commit, but only after removing the Fixes tag.
> >>
> >> Cheers,
> >> Angelo
> >>
> >>> ---
> >>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173.dtsi
> >>> index 3458be7f7f61..136b28f80cc2 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> >>> @@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
> >>>                                };
> >>>                                mfg_async: power-domain@MT8173_POWER_D=
OMAIN_MFG_ASYNC {
> >>>                                        reg =3D <MT8173_POWER_DOMAIN_M=
FG_ASYNC>;
> >>> -                                     clocks =3D <&clk26m>;
> >>> +                                     clocks =3D <&topckgen CLK_TOP_A=
XI_MFG_IN_SEL>;
> >>>                                        clock-names =3D "mfg";
> >>>                                        #address-cells =3D <1>;
> >>>                                        #size-cells =3D <0>;
> >>
> >>
>

