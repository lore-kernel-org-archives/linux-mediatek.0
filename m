Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E24C49EA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 04:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjQAjmGk1n7ajuQcs+KaJPCMDM2UdVWblEx6MXLoPhk=; b=RLlOGK+wg12SmSbEKSTCgR1gQM
	IsHxpA3RlCqEfzOcUCTpvk98nFdfYM1w/wT3admNBH3bP6avrm1w7nPils08lbmcATHm/Oq1dLEcp
	WGBlnI4Bdz7u6Cl4oJD4/Zzgl6VUIgcisPOoOluPYDv0sGQaz2qJo3Iu8ghiRWV5MAbx8uRPKxO8r
	g6oadI6mtd+o/XarWIhCnImGl4kVsChaMUSgAKHp3PshzpXXekpO+ssgn9N4yCc6WxbQRBHPQuynM
	7iAtI9gyqIOwl9r6/KlDjYdDq6ZghVZpJt1AuGqfUpRkoe9pflu46HA4ZeFba/m2oIaS2PWRqra5e
	ADMXHLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBwx-00000000U5G-1e4x;
	Tue, 06 Aug 2024 04:37:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbBwQ-00000000U0t-2G9n
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Aug 2024 04:37:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so494660e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Aug 2024 21:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722919016; x=1723523816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjQAjmGk1n7ajuQcs+KaJPCMDM2UdVWblEx6MXLoPhk=;
        b=V0ZG3p0+zfs9Dg/YB7fvuYc/6c433sfUjrN7WioJ4BmdyizaJJMADaAfd59lPc7j3Q
         rPNQmJTl/5Ab/aaYqA4Ar509BEMRseBtMOAK+x2A33Buw4IiuYYkcjVR3wnZ7yXXq5IJ
         iZeRQlaY7EwkPR2PszFSYP+hcR0AweTLRkwWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722919016; x=1723523816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjQAjmGk1n7ajuQcs+KaJPCMDM2UdVWblEx6MXLoPhk=;
        b=uYVIPW6oMmAJtlwTzsLOjktVvBcxXRFAEhgQtIOBq/5TH/NjYNK5V/bw+0IRhE5EjT
         vCBc/OxcHya4cjpPiuLOrmepmSyTnCFDfYIT6L+kvRMUPzmcXJPFep+BGdHQcX5HacG1
         58zv5E9S8iwsuC/Bmh4ZKIOP5/y/NBxsiqVYoJ+CKvzCPtvZZN6tqt3UUsoeQJqMiCqO
         hNgnf70fSa8dNEVHeO/3iFUnBvL4s4yebLErf2KaIhtbBv0nnzC/ng5Os/nhepjNLfV8
         dd92QJSVPOYt1J/HNxPIoUujovlR9gX53EHD/KnUyO4ooy6sHg+yqbqrQNWly/G75ABU
         ec/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWWMQkY93jpKmerE8gikmJRiRsSUD7wrtBv1XhqPCULDM39W5ioQDFCWoO5qjqa0GWLHFgUhqvqjAzpBRB90jRPWP6L/Bq/Zs0Zg5VQ/ab2ygI
X-Gm-Message-State: AOJu0YwD5Xw3yc+DvtqFR+2CDy8qySJO8eEa2wOsNRbcvea8sgic5sNA
	CZIgKZlRyP/F04qaItBIJ8B/9LV0DTf4mfFnUAgpwvbaTdLucr03pqimHRqexqV2RzVIXfxkj43
	Cm0ysJTKvluYzQtZvgiTtexB2SiuucB1XOWPv
X-Google-Smtp-Source: AGHT+IH6osN8AiHIsz3iGxVmsYDHTrZXNZkckgohptXBOcaV4KXsXzyqgFu5HOFrpie8oXsv/eCahc96/S2ayEDpeWY=
X-Received: by 2002:a05:6512:2308:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-530bb3bc202mr11441300e87.52.1722919015831; Mon, 05 Aug 2024
 21:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240805065051.3129354-1-treapking@chromium.org> <8e089dc0-9342-480f-ac8a-93b5bfe1241e@collabora.com>
In-Reply-To: <8e089dc0-9342-480f-ac8a-93b5bfe1241e@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Aug 2024 12:36:44 +0800
Message-ID: <CAGXv+5GnkhyT+nKq7j50G+Lpm720wLX3Jqfa5QWP6p29yUKq7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Remove clock from mfg_async
 power domain
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Kiwi Liu <kiwi.liu@mediatek.corp-partner.google.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_213658_615090_BCBB6C04 
X-CRM114-Status: GOOD (  16.00  )
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

On Mon, Aug 5, 2024 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/08/24 08:50, Pin-yen Lin ha scritto:
> > This clock dependency introduced a mutual dependency between mfg_async
> > power domain and mt8183-mfgcfg clock, and Mediatek has confirmed that
> > this dependency is not needed. Remove this to avoid potential deadlock.
> >
>
> Uhm, have you tested this upstream with Panfrost, or only downstream with=
 the
> proprietary Mali stack?

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

With glmark2-es2-drm on linux-next-20240805:

# glmark2-es2-drm
Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to
'mailbox' mode for SwapInterval(0).
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2023.01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:      Panfrost
    GL_RENDERER:    Mali-G72 (Panfrost)
    GL_VERSION:     OpenGL ES 3.1 Mesa 22.3.6
    Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 stencil=3D0=
 samples=3D0
    Surface Size:   1366x768 fullscreen
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse: FPS: 134 FrameTime: 7.485 ms
[build] use-vbo=3Dtrue: FPS: 391 FrameTime: 2.559 ms
[texture] texture-filter=3Dnearest: FPS: 378 FrameTime: 2.652 ms
[texture] texture-filter=3Dlinear: FPS: 329 FrameTime: 3.046 ms
[texture] texture-filter=3Dmipmap: FPS: 369 FrameTime: 2.717 ms
[shading] shading=3Dgouraud: FPS: 367 FrameTime: 2.731 ms
[shading] shading=3Dblinn-phong-inf: FPS: 372 FrameTime: 2.690 ms
[shading] shading=3Dphong: FPS: 342 FrameTime: 2.930 ms
[shading] shading=3Dcel: FPS: 338 FrameTime: 2.964 ms
[bump] bump-render=3Dhigh-poly: FPS: 336 FrameTime: 2.978 ms
[bump] bump-render=3Dnormals: FPS: 376 FrameTime: 2.663 ms
[bump] bump-render=3Dheight: FPS: 328 FrameTime: 3.052 ms
[effect2d] kernel=3D0,1,0;1,-4,1;0,1,0;: FPS: 316 FrameTime: 3.169 ms
[effect2d] kernel=3D1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 118 FrameTime: 8.5=
11 ms
[pulsar] light=3Dfalse:quads=3D5:texture=3Dfalse: FPS: 372 FrameTime: 2.692=
 ms
[desktop] blur-radius=3D5:effect=3Dblur:passes=3D1:separable=3Dtrue:windows=
=3D4:
FPS: 51 FrameTime: 19.764 ms
[desktop] effect=3Dshadow:windows=3D4: FPS: 191 FrameTime: 5.254 ms
[buffer] columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fr=
action=3D0.5:update-method=3Dmap:
FPS: 49 FrameTime: 20.746 ms
[buffer] columns=3D200:interleave=3Dfalse:update-dispersion=3D0.9:update-fr=
action=3D0.5:update-method=3Dsubdata:
FPS: 49 FrameTime: 20.437 ms
[buffer] columns=3D200:interleave=3Dtrue:update-dispersion=3D0.9:update-fra=
ction=3D0.5:update-method=3Dmap:
FPS: 53 FrameTime: 18.997 ms
[ideas] speed=3Dduration: FPS: 117 FrameTime: 8.554 ms
[jellyfish] <default>: FPS: 282 FrameTime: 3.559 ms
...


Thanks
ChenYu

> Regards,
> Angelo
>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Fixes: 37fb78b9aeb7 ("arm64: dts: mediatek: Add mt8183 power domains co=
ntroller")
> >
> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8183.dtsi
> > index fbf145639b8c..267378fa46c0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -872,8 +872,6 @@ power-domain@MT8183_POWER_DOMAIN_CONN {
> >
> >                               mfg_async: power-domain@MT8183_POWER_DOMA=
IN_MFG_ASYNC {
> >                                       reg =3D <MT8183_POWER_DOMAIN_MFG_=
ASYNC>;
> > -                                     clocks =3D <&topckgen CLK_TOP_MUX=
_MFG>;
> > -                                     clock-names =3D "mfg";
> >                                       #address-cells =3D <1>;
> >                                       #size-cells =3D <0>;
> >                                       #power-domain-cells =3D <1>;
>
>

