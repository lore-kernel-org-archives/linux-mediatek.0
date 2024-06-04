Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD34CC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 04:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZTkPdaoUs8jQNyMlsxEd3PQVY77PvdNJflZvZlG4XM=; b=VMBcNLyDgtBKn24NmFTnzP4duq
	tD72Qk1i9kKs5ZvNuenPThUqo38FyJyi20fTlDrUWGpowb6j08YkyGxvIPwXYqC7nE4AQXps/0PkG
	8G8nYK85QcCf396vjPtIymju+mDb4jk9cOjdDTClFkfaOteqPB0MRnKLut/ybfRJIXJEppDPGWxeZ
	HvrUGFfOFioZWxRebcucLnK5hyvyi+KeIxBhyG8FScIifa7Lhzs2E4YGkL3AllIZf/soFVK1LGwGc
	jHLEHSxXvW4RyKkp61hHQMH404171kY/xFfWpSoiejdJb0GTj343WnuLDl6dseonGhTmt6DLfYZio
	6SauW1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELgV-000000019s9-25ty;
	Tue, 04 Jun 2024 04:22:07 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELgR-000000019nF-40IR
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 04:22:05 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so35455341fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717474918; x=1718079718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZTkPdaoUs8jQNyMlsxEd3PQVY77PvdNJflZvZlG4XM=;
        b=PGwiUIgRp8oqGMNiJHRKOln7VhdPfRtxhAaWiBrnoemhXwS/KfMtsadqq+Ev0qgo1w
         LLfza2NqqauRyqZrc9BTcni1kyDPWtFPgFS/ge2eoj+duyaqejUQrPi+EGhQhl4K9Nzg
         /uWVeFxyqKUiOPTdWs1dxkGU3936XDssvCAHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717474918; x=1718079718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZTkPdaoUs8jQNyMlsxEd3PQVY77PvdNJflZvZlG4XM=;
        b=GNi/Yho0VFCphmoSLdYWhPFcJ1roMDhzIL7oLf1HpAAMOADyaxNzt9EijZ0zUtPH3l
         Vs69sc6o7t8GhiCQxRRD74IEjgm+nb5WOAHBC2bzaMR6LeuXszdao+5atm+yb4lCfl/t
         OI9+15dpdUanxuX98/6LS+FnrPLhEycNVgkTVauxHwF2ezIeQ6yx+Bulxb9vDGVwhA4q
         H9i9o9nfmr5plNHU4CVD3ELaGinfn+epcpUhJBiyBy1oxZ8uiaKl07krsCAEj58em9cE
         8mcxfZ0mVASI/yIpUHbxCKX+SUgS9427h0wJOkDBy2QK0hQBtMe6wj8rXhr0us8UZB6A
         EqPw==
X-Forwarded-Encrypted: i=1; AJvYcCXEBpzzO1MOp5fE7gL1WmvBIEWfXd0DEDjLzz9xPGrvOBxYugiSGzbwD2N2mOJEW077A2tNoIBTraIeyaUFWWOKTa3JjGS+7PTglMs1s3VqbOXm
X-Gm-Message-State: AOJu0Yx6rvdPkfalxbVud5zPMJCMHfm5RTaAkvB7HoZq3Q61zmCU/yXa
	sHcYEqCIlC4hSkhE5kTQQVPscjat6jarrgVHa4A9UrjYtHB9TrtPxJ2W65EQtl4yE4H+TFkUf06
	Is0WyxJSIUzUu62aoFzo7HGtUmkOXkiyY1hhu
X-Google-Smtp-Source: AGHT+IGDgg2+V5eJ8x467mxNrV7nhwIMgXm1gR49RnrnhPkROZN8HdeL71iXvR/Wj+N6cLD7tGCc7y6sYjgN44bSwNQ=
X-Received: by 2002:a19:5f53:0:b0:51d:5f0b:816f with SMTP id
 2adb3069b0e04-52b89590e7cmr5639078e87.15.1717474917527; Mon, 03 Jun 2024
 21:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com> <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
In-Reply-To: <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jun 2024 12:21:46 +0800
Message-ID: <CAGXv+5GeWpBaFw89KsKyQi4t+Wjh=+58UQ7hyPaLM6pwGELiVA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Adam Ford <aford173@gmail.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
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
X-CRM114-CacheID: sfid-20240603_212204_092543_C438DBAC 
X-CRM114-Status: GOOD (  34.39  )
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

On Fri, May 31, 2024 at 10:25=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Fri, May 31, 2024 at 8:37=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.c=
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
>
> Thanks for including me.
>
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
> >
>
> In the cover letter of this series, it was noted that the GPU
> enumerates, but it doesn' fully function yet.  This is also the case
> for both of the Renesas variants I have been testing, and I was nicely
> asked to postpone my series until the driver was closer to being
> ready.

Yeah. Frank laid out the current state of GX6250 support and future plans
in his reply to the clk driver patch.

> Even if the driver isn't ready yet, it would be nice to move the
> bindings forward.

Agreed. It would be nice to have an agreed upon set of bindings. We
can then move our downstream stuff comply with it.


Thanks
ChenYu

> adam
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

