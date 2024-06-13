Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D493C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY7+qVTCBnkic8L6HrX2KqWBFLJlyWpgMqTcC8mYb1g=; b=jnqrx9zdC4jSn8Ms8WjeV0yLXW
	CRe6lnwbTJt5Uc3A8TUp4r4uM5bfNwQGVLNnSBydxl8px3YGXm9AQMVC1322pMlsri2nphXuGyujn
	0I0Y4z40PBCv3Qsgd2HBM0CeINhR5egESkfL9QgO57JW94tE4F342BmES4hXd2G+iNsbftuSdNauv
	sSCuu9GQX1gfC3JeUvMXftm7KsnwiBD9bT31NcakuoARn7taVLC2/Ym4sv0xK9zpwVnNhk0Qvn29O
	7rDdecyDlTi4F9NJUOnNOLmNBG7cW30ma2sIdKTYnnR1DlH4WRZDcwitwphKPeLb4l3kXSyQ7rpdT
	IUeKQTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkQP-0000000GhU3-1TFr;
	Thu, 13 Jun 2024 13:23:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkQK-0000000GhRf-1wIw;
	Thu, 13 Jun 2024 13:23:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2c2fe7f07c4so856340a91.2;
        Thu, 13 Jun 2024 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718285005; x=1718889805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY7+qVTCBnkic8L6HrX2KqWBFLJlyWpgMqTcC8mYb1g=;
        b=dSApOP8uieoKNaGFR300tp0aD3IkbEW5OIzqH6fW9yk3IaI4rlRQZ60Mq98uWF2t5G
         B/A8RbeyXFBBe4SKbRuiI8O7VRybwTqRiGuXI2U0l/XnOEc4U1WFD9ssUyZMZR+jKQvn
         JnkP2Kk4PvlGsVLHXUnRnC/y1vinGeI1w2hXjM9IBY4EetaNT08WAasg/vTCuz6YSARu
         6J07RCexsY3mBMsnfcYE8xb/DHBCGg2Kk5KjjW6YaA6oe1/9bKB8fSI2IYVo/m9fOlLU
         iYbv3BrtFAihm26h2lA84Lbbid0S+mYjbue/doe/ZcSYy0KgxtjmHhKqMVVHDGOaZ1ff
         1N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718285005; x=1718889805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY7+qVTCBnkic8L6HrX2KqWBFLJlyWpgMqTcC8mYb1g=;
        b=jaG91RqBjeydaflh78/SbRjRXg1eVz1PKe72BmdaXkeSdRU7q6z2LbACqlicEcDYHj
         maUKUdWvqC+D9U9FGGMt7vS7aqeNvlsEhQU68dLAcWa27YauWLZ0Kf47J7FLH8GYdeCu
         mHacXcT0zhEan8Au+Jhs/MAaXBkrY7dICt+9cqMuITpvqG80ffKtDTOdikQxL8gAFFDr
         ALD0J9uwZv2EaEqHGPFxHTlNuI5FsOAi4Bj/9VthKGlG9Kq5Oa9xRHyfaLoTiaEuDVnw
         NYwISk27WQ0grh0+2Xnr+M8/bDMjNnDxudJnPRdMN1ytNmfs2T69PYL9iLqyq/OcWRlW
         /pEA==
X-Forwarded-Encrypted: i=1; AJvYcCWeyRHxS3dCNxR2zUoRu+94yyK089C/l58mRwML+z6RJHQ46QfNliHXptyzEVLuKr1YgDpiB7Z789PLI1FHxAt9Ov4wCNbHAfjNu3Xto0Un/kworg/t2FNYobLfHTIuszd5mCrDMLI/AP//+kXLug7qewbw2BJa3nA=
X-Gm-Message-State: AOJu0YxiXboT8/5Qj8g8SiDxj1aQwrqP7ZttaWELiaU5HUAoy0YI4v/G
	aYRkN7mZo9qeWYWodskrFYEMOooBCmMkLMu6zBB5utOeZec0vIBkvQFPVOzIB2RTApG/egac2Kl
	HDfub9GGqXuXdHovfW7EUPGz3jUE=
X-Google-Smtp-Source: AGHT+IFjS6qqHBjZXHKWN1u+dasS0C5YOlgGO92F1+LaOmoGNT/BOCRy3ovZaMBx8lFhb6yb/cyp8I+kce1iGOhlNQM=
X-Received: by 2002:a17:90b:1909:b0:2bf:de54:f5b with SMTP id
 98e67ed59e1d1-2c4a762fdebmr4954256a91.18.1718285005354; Thu, 13 Jun 2024
 06:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
 <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com> <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
In-Reply-To: <CAGXv+5HC_spBAc-t4cS+aCOQKdfWRzMkXK94HmD1Qg02ML4Uug@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 13 Jun 2024 08:23:13 -0500
Message-ID: <CAHCN7xLHWCmeHJJY9tHFOng4EeJOqXCm9H-EA7cbABd-jogmfQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20240613_062328_529205_377F02DA 
X-CRM114-Status: GOOD (  41.92  )
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

On Thu, Jun 13, 2024 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Jun 4, 2024 at 12:18=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec=
.com> wrote:
> > >
> > > Hi ChenYu,
> > >
> > > On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > > > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > > > of the Series6XT GPUs, another sub-family of the Rogue family.
> > >
> > > I've added Adam Ford who sent out some DT related patches [1] for the=
 Renesas
> > > variant of GX6250 and the GX6650 (another Series6XT GPU).
> > >
> > > >
> > > > This was part of the very first few versions of the PowerVR submiss=
ion,
> > > > but was later dropped. The compatible string has been updated to fo=
llow
> > > > the new naming scheme adopted for the AXE series.
> > > >
> > > > In a previous iteration of the PowerVR binding submission [1], the
> > > > number of clocks required for the 6XT family was mentioned to be
> > > > always 3. This is also reflected here.
> > > >
> > > > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c7=
93a43c79c2a.camel@imgtec.com/
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++=
----
> > > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogu=
e.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > index 256e252f8087..48aa205b66b4 100644
> > > > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > > @@ -12,10 +12,17 @@ maintainers:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - ti,am62-gpu
> > > > -      - const: img,img-axe # IMG AXE GPU model/revision is fully d=
iscoverable
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - mediatek,mt8173-gpu
> > > > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > > > +          - const: img,powervr-6xt
> > > > +      - items:
> > > > +          - enum:
> > > > +              - ti,am62-gpu
> > > > +          # IMG AXE GPU model/revision is fully discoverable
> > > > +          - const: img,img-axe
> > >
> > > The Series6XT GPU models have differing numbers of power domains (eit=
her 2, 4 or
> > > 5). Whereas, the AXE GPUs have a single power domain, so I assume the=
re should
> > > be a related change here.
> > >
> > > The GX6250 has two power domains (lets call them A and B). There's a =
constraint
> > > that if domain B is powered then domain A must also be powered.
> > >
> > > In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_M=
FG, which I
> > > believe corresponds to power domain B. I assume this works because th=
e MTK power
> > > controller driver is encoding the constraint above, meaning that when=
 we disable
> > > or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173=
_POWER_DOMA
> > > IN_MFG_2D (domain A).
> >
> > It could also be that the power domains are split in the glue layer and=
 there
> > is some sequencing handled there. I'll reach out to MediaTek to see if =
they
> > can dig up some design specifics.
>
> Unfortunately they said they no longer have that information.
>
> > I assume you would like to see the separate power domains properly mode=
led
> > in the device tree?
>
> So how should we go about this? Adam, do you have this information for
> your platform?

In the Renesas platform, I only had to add one clock [1] and one
power-domain [2] to get the GPU to come up.  In Renesas' downstream
driver, they only use one clock, but Geert, the Renesas tree
maintainer, sent me the three clocks to assign to the 6xt graphics if
it's determined that 3 clocks are required.  In terms of the power
domain, there appear to be 2, but one is dependent on another, so
turning on the 'B' power domain turns on the 'A' power domain
automatically.  I should note that I can't get the graphics to
function, since the 6xt isn't supported yet, so there could be some
elements missing that I am unaware of.

adam

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/drivers/clk/renesas?h=3Dnext-20240613&id=3Df7b0dfffd3e0897ca73916a0c3=
d3fb61c61df51e
[2] - https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240227=
034539.193573-3-aford173@gmail.com/



>
> Thanks
> ChenYu
>
> >
> > Thanks
> > ChenYu
> >
> > > Thanks
> > > Frank
> > >
> > > [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/44=
3548.html
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.=
html
> > >
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -56,6 +63,15 @@ allOf:
> > > >        properties:
> > > >          clocks:
> > > >            maxItems: 1
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: img,powervr-6xt
> > > > +    then:
> > > > +      properties:
> > > > +        clocks:
> > > > +          minItems: 3
> > > >
> > > >  examples:
> > > >    - |

