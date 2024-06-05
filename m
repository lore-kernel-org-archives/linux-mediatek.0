Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D8EC25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTYgiHqEKqI6DY4xUoSYEerbolGYT7sqcHeeQXdfKvE=; b=yeMIh+YnGx2Z78bF0RXiN2uBla
	CrsGfx1zSdIP3m8Aghzi5oHi/0Xi5c1N35Mkk7Rdd+QS6VTtG1medMJq+XQDVmqveE8Q5Dv5Vv4JR
	qKOccdzA/C71wHP5AX5tYMlvKd/b33XptoDvZIqzhFJPzLsuXVnp6lKGND6nmzg6m0MI1gLesAOPr
	6Sof5q/K9Dto/G/xHP/amxVZ7cfSzCkpJBKjm8bPGHHAeRqNu9gXvdDqeZhCHCviNLcvVIKFRirvC
	CtZW86hV55aU8j5eg5/Csvb53cCUNj93XnIQ3eiz8TPhvZfQP6vlHwR0Pt5M9NZGLyv7L4zOlmglZ
	WrkDb4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEly6-00000005CIr-3kpV;
	Wed, 05 Jun 2024 08:26:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEly2-00000005CFc-3Nkh
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 08:26:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52b8f5d811aso4631122e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717575956; x=1718180756; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTYgiHqEKqI6DY4xUoSYEerbolGYT7sqcHeeQXdfKvE=;
        b=WTlXcqvvNR/hx3iYvx8QlXLo5ktAbCuxG7mUBpJvJraVzi4r1c5hXz6o1HgbPSVElz
         /HsgUXAi3hPOBoEyxFsmhx8u1bVgHELipHjajb3NHHWLtk5o2wWRI1euWh0mElTzQafh
         /ypmz50/9a81mUvjQavnFuHVnnM3omdP2hJpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575956; x=1718180756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTYgiHqEKqI6DY4xUoSYEerbolGYT7sqcHeeQXdfKvE=;
        b=KQyNSWnPlBqrjHjsjsxqY3UfNjktHOMTq489ai42VCnVIfbJeRXV40yfhlNQQenUPL
         r2UaEZKoc7iFudVVMVLgCXOZuDA/i3tLBDE6SMfZ46/l5hY3+ol1mgNg9BcJ0/4mMPU+
         91+ZDdkqQcq3GiD1LRzsqHRtO7UJDWi2j8m08FhrJUowmwrQtQr47krtbu5r+tPwgHuj
         +BEdEnzW8uO0FT9YxdUhIrYliDtaPN+hE36OVPuYjCIZP6InyMPAFAnzy0LN5bgI95SU
         pQoZ+lxT3WFug9VcOgthlONfFENfiIFxAxLJCJGY7HraU54cELMqTElug++nUvZdQ/9V
         0Ldw==
X-Forwarded-Encrypted: i=1; AJvYcCW/NYV+vTTB6xVGoveipTyi0c1bFXdEVWKLpVXUWf5Fi84qmoJOWzkde+tnsIsSD1nIkWIrwfdRtjbvaVYUdYd10gJ9B3dSNp6Wv0PQnEBwHCi2
X-Gm-Message-State: AOJu0YxjQkhPT3K5ynT91ZEZOwYCE2nE+/+Z0Toxvw3Ed6fXbxE9636/
	ZCUciv43vevJ1qdPLIw7WItrhUAx8nfRkMose+b9tR/jB+onuZRtAnZYdOP0h7YQ5Rg7wq3PzUa
	18vVKQ6uuJa7ykupSzmU7honi2Fwsqz0068bP
X-Google-Smtp-Source: AGHT+IEz6cLO0SYpIuAYgl0GIp5y8JoS82uXIYv/gjnD7flwuduPkyTGJYNwDh582C9DE0cOUwen7uBXY5qAmo/W3wY=
X-Received: by 2002:a05:6512:3082:b0:52b:423b:ade2 with SMTP id
 2adb3069b0e04-52bab4b85b8mr1349765e87.3.1717575955882; Wed, 05 Jun 2024
 01:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-6-wenst@chromium.org>
 <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
In-Reply-To: <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 16:25:44 +0800
Message-ID: <CAGXv+5GuGz-KahcbKtuyUA1-59sMWSL0QucOdp8FPoQWrc9YUQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240605_012558_924956_F92E479B 
X-CRM114-Status: GOOD (  23.34  )
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

On Thu, May 30, 2024 at 6:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> > The MFG_ASYNC domain, which is likely associated to the whole MFG block=
,
> > currently specifies clk26m as its domain clock. This is bogus, since th=
e
> > clock is an external crystal with no controls. Also, the MFG block has
> > a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the bloc=
k
> > diagram, gates access to the hardware registers. Having this one as the
> > domain clock makes much more sense. This also fixes access to the MFGTO=
P
> > registers.
> >
> > Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.
> >
> > Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain con=
troller")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Just one question... what happens if there's no GPU support at all and th=
is
> power domain gets powered off?
>
> I expect the answer to be "nothing", so I'm preventively giving you my

Well it's powered off by default. Just double checked, and without the fina=
l
patch:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
---------------------------------------------------------------------------=
-------------------
mfg                             off-0
            0
mfg_2d                          off-0
            0
                                                mfg
mfg_async                       off-0
            0
                                                mfg_2d

And with the last patch but with the powervr removed:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children
            performance
    /device                                             runtime status
---------------------------------------------------------------------------=
-------------------
mfg_apm                         off-0
            0
mfg                             off-0
            0
                                                mfg_apm
    /devices/platform/soc/13fff000.clock-controller     suspended
            0
mfg_2d                          off-0
            0
                                                mfg
mfg_async                       off-0
            0
                                                mfg_2d

Things seem to work OK. I can SSH in, and the framebuffer console on the sc=
reen
works fine.


Note that accessing the regmap through debugfs doesn't do much good. regmap
doesn't handle runtime PM. And the syscon regmap isn't even tied to a
struct device. Dumping the regmap through debugfs while the power domain
is off gives all zeroes, likely due to bus isolation.

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

ChenYu

> ....but if I'm wrong and the answer isn't exactly "nothing", then I still=
 agree
> with this commit, but only after removing the Fixes tag.
>
> Cheers,
> Angelo
>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8173.dtsi
> > index 3458be7f7f61..136b28f80cc2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
> >                               };
> >                               mfg_async: power-domain@MT8173_POWER_DOMA=
IN_MFG_ASYNC {
> >                                       reg =3D <MT8173_POWER_DOMAIN_MFG_=
ASYNC>;
> > -                                     clocks =3D <&clk26m>;
> > +                                     clocks =3D <&topckgen CLK_TOP_AXI=
_MFG_IN_SEL>;
> >                                       clock-names =3D "mfg";
> >                                       #address-cells =3D <1>;
> >                                       #size-cells =3D <0>;
>
>

