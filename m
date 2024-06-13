Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABBCC27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qMad1s8HI1EFGHqapCwasRBkvGmdeiF4NnLv9ZSDU4=; b=Pf2IWsyeXKN+7QWXm+use0OCdp
	d3j+/BomvFXSzPPXPcFROV9w2IECqs5S8fADiJgzsRtkYTVUoYpY3//3MtLZ/oy+39hh6yqkEGEcj
	gKwunX0aVlz5NPbAWMjVEr5r+in+Of2K6vKYprx5DwKoLoxmvti1BEoekhPvMRfdxw6r6qRzXxUtf
	mwYF/DSN5/VX2ayTCVLa4j9bd0b+46Qyqu070MGa66CU3dnQUpm1badD72/1MrXQn1SCtAhRtJtNO
	jQVdelkY33tbdAAufCKDCjfPA8tPDnY5UaAkwxLG4JTFitA4S8c/d+B/C2oFKy7+9H5TovEDtLc2k
	sNRPh81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgTz-0000000FtmP-37ac;
	Thu, 13 Jun 2024 09:10:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgTv-0000000Ftiz-3nu4
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 09:10:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e724bc466fso8212111fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718269852; x=1718874652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qMad1s8HI1EFGHqapCwasRBkvGmdeiF4NnLv9ZSDU4=;
        b=QdLhUDFTcgtjxBhC/MKa6yHM2noIKzUJ+aj27jEVBqXhxMs8GG8/l+0i3FHYkhKM5v
         KlC8jEi0iiRtRQ1Hwy0xG6JJZZVrR/DRPI+mQTycL1qeOxljXBTnWhljmvH/TkH9dcZY
         IaSwsygaKq/oX3jo1fg+dE0suI2EMCgWtujvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718269852; x=1718874652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qMad1s8HI1EFGHqapCwasRBkvGmdeiF4NnLv9ZSDU4=;
        b=oW94RRLvdojg6Y5tsVlx12xV/Mhw+91waTbYMOoJIb7wYWvKoczIqzKsqIuZtF0OjV
         e44RmuceNgWZOtpYx9nrL4uVbtf96Kkzsazi8/hx5Q0N1tmh1zCqxBn6hyyJaV4G40fp
         PY1PYB2Uf+u+nWxuwOav9ed0VCUzuoUAizGe1/P8QVq51FVnT4I/AhBICJHCID57g+MA
         8F5YcD3AuSfayElqCb79ymV9jaNNaB2Vw30Ah07h6aeXCfWzZoJJ0Ht8BQnF7VnHzlGW
         KwMJ1gaZ4e4loF8Yy+qoDCSSMgdQJHeNQgwsQLpsnNocPvH2XiJZBuCHfYBmNbomFKVw
         uHOg==
X-Forwarded-Encrypted: i=1; AJvYcCWFFdn3wQsIEWPtAsRBZ+uFfVVMQJN8p0lzh8kvCed2SPnOeQj7u4VCqwnWgnu8rW52D5GbJdptrxgURhg7TVXdRZeNQ0thQb50bgwuaGSDhNKQ
X-Gm-Message-State: AOJu0Yzu//EfKIkoPKWkMBfU2oXH9DVCc7JXt+Y6bgNtjtns71l5iHo6
	EfD8W6SqglEXWur5BSeyEs2swNpNpa6VGcbKtZjLiwlyIOaSFHCU61MHhugRAdijkHWCDY0diGe
	myc2FGvm2bBNfOYZRA7GC6La+WvYju1p8Xv/X
X-Google-Smtp-Source: AGHT+IFE16q+3aJZ+pDB8j2rm8rHPIGnaWtqcWZM+SpiuLNffT3VD8BSWouvI+m971OdxrGKrmk+TlmqOWpCQUtBEeQ=
X-Received: by 2002:a05:651c:19a6:b0:2eb:d77a:850c with SMTP id
 38308e7fff4ca-2ebfc8f0545mr43873481fa.4.1718269852401; Thu, 13 Jun 2024
 02:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com> <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
In-Reply-To: <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 17:10:41 +0800
Message-ID: <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Frank Binns <Frank.Binns@imgtec.com>, Adam Ford <aford173@gmail.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_021056_010881_F7A8644A 
X-CRM114-Status: GOOD (  33.36  )
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

On Tue, Jun 4, 2024 at 12:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.c=
om> wrote:
> >
> > Hi ChenYu,
> >
> > On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > > of the Series6XT GPUs, another sub-family of the Rogue family.
> >
> > I've added Adam Ford who sent out some DT related patches [1] for the R=
enesas
> > variant of GX6250 and the GX6650 (another Series6XT GPU).
> >
> > >
> > > This was part of the very first few versions of the PowerVR submissio=
n,
> > > but was later dropped. The compatible string has been updated to foll=
ow
> > > the new naming scheme adopted for the AXE series.
> > >
> > > In a previous iteration of the PowerVR binding submission [1], the
> > > number of clocks required for the 6XT family was mentioned to be
> > > always 3. This is also reflected here.
> > >
> > > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793=
a43c79c2a.camel@imgtec.com/
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++--=
--
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.=
yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > index 256e252f8087..48aa205b66b4 100644
> > > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > @@ -12,10 +12,17 @@ maintainers:
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - ti,am62-gpu
> > > -      - const: img,img-axe # IMG AXE GPU model/revision is fully dis=
coverable
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - mediatek,mt8173-gpu
> > > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > > +          - const: img,powervr-6xt
> > > +      - items:
> > > +          - enum:
> > > +              - ti,am62-gpu
> > > +          # IMG AXE GPU model/revision is fully discoverable
> > > +          - const: img,img-axe
> >
> > The Series6XT GPU models have differing numbers of power domains (eithe=
r 2, 4 or
> > 5). Whereas, the AXE GPUs have a single power domain, so I assume there=
 should
> > be a related change here.
> >
> > The GX6250 has two power domains (lets call them A and B). There's a co=
nstraint
> > that if domain B is powered then domain A must also be powered.
> >
> > In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_MFG=
, which I
> > believe corresponds to power domain B. I assume this works because the =
MTK power
> > controller driver is encoding the constraint above, meaning that when w=
e disable
> > or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173_P=
OWER_DOMA
> > IN_MFG_2D (domain A).
>
> It could also be that the power domains are split in the glue layer and t=
here
> is some sequencing handled there. I'll reach out to MediaTek to see if th=
ey
> can dig up some design specifics.

Unfortunately they said they no longer have that information.

> I assume you would like to see the separate power domains properly modele=
d
> in the device tree?

So how should we go about this? Adam, do you have this information for
your platform?

Thanks
ChenYu

>
> Thanks
> ChenYu
>
> > Thanks
> > Frank
> >
> > [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/4435=
48.html
> > [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.ht=
ml
> >
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -56,6 +63,15 @@ allOf:
> > >        properties:
> > >          clocks:
> > >            maxItems: 1
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: img,powervr-6xt
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 3
> > >
> > >  examples:
> > >    - |

