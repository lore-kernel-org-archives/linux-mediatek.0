Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ECAC25B74
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 04:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N61SX3AAhMaQCzElmg/wZ9mbz5RbGf4AjlXkFfrh07w=; b=Ki5kosgrCzoOvx6FrbbSwUWuKH
	UaOicKPMeNkODEG6HlT1O9tJF3NzAp07YBebry6jKgDwvX5OHvMJWWzNxG3KHU7A95y+jUhYkVt/I
	n4zWB61qG5h4gn50X457iMIf5Rp0EislqS53ed4lijl43DjKT6kVPhSS7KrECtGVsjB26bgohfKct
	Z8onHDRI1iMiap1FIuYBjbAGp1blgOEtkyaH9krL7WymoSjLKacNg+1tIsoaiAX7MYnHmN6itRJ7y
	w1u5Ki/dCCsZvjTrBss2orx/Bbfkki0EeYNo1xarxN3ugHSTdYefoBt6gXlB0BC2mZbCUg74Bt/DX
	rTvHt+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELdh-000000019Nc-2gwP;
	Tue, 04 Jun 2024 04:19:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sELde-000000019MR-0TqI
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 04:19:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5295e488248so5299812e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 21:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717474744; x=1718079544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N61SX3AAhMaQCzElmg/wZ9mbz5RbGf4AjlXkFfrh07w=;
        b=Q45YusHRSovfyvBYBSo5DcqoY01vD0QJjdBNQYwQO1IfGniivH/B3P0M+/plaDrAd/
         Fx5paS8AW3O7gUdwRNFeO/rO14/agXEI6Puk8ya/NNPAWGJSabrTj9szWaxCxRWNDE15
         W35gQM1enuOsTrAbb8623jZIEsy0IuAPUxmZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717474744; x=1718079544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N61SX3AAhMaQCzElmg/wZ9mbz5RbGf4AjlXkFfrh07w=;
        b=wRBb42lSEt+MMXuVP/4N88IyvIznRTnGFWCaVZtsG58GAp/MYTt7+9E6zMOupyhXQP
         JPYBEnrt9+j/k3va4qMbX+GwrXVLT528Zc1t9SLNYaaUz7SzVByDPX5sq7h+o5rictnO
         H7rTdoCqiTgR494XuzeViVl5BuWb/5gBB86hMOpqSBR6ZLOgnp29IS0UB+GFinnsf/v/
         CDWGXu+W1LsjomFB4iL4lFC1Eieb0LcUVOF506l1L+IOThJ6SrIWmoJIM3mxMScPcGLu
         sccJUteDibraHJbG9m55fNy8HSsrld9bRxqS6Wn5oZ+Cnjg4MM8OsIdznHzI6brn39W4
         AAUw==
X-Forwarded-Encrypted: i=1; AJvYcCWi1DthlPssr+2vqq0Z25cEw0dcX1xTRscw5uYaR8pCL9y/f2vE0ibA9FD98IV980kfAbN00OhG43F8aFIvMQ2Yi7Od7tBAxhA0a4Sfdx5kCOLC
X-Gm-Message-State: AOJu0YwhpYgijjHMyRucXhutRaLnBCyfWwiJO7k+0L7kw8Vy3g4pVnK+
	u8EwcRLT5TXW1puQ9OuzTAQPNLshRH7/YRMRUNr9Qkdb1V6HQ89efZy0leXBYRB9FJch0t2lmmD
	SGR8k4nXl2gUU4+lsc3OGBpPZFTN9UGu5/bLX
X-Google-Smtp-Source: AGHT+IHX+8hzvDI7P5tkl2A/qlQQgMeILMWvYV42TUTaHfCptFD9ZuhOs/nuU1Lg8mOfQm/ry468a30QNnvnUyOmxiU=
X-Received: by 2002:a19:9107:0:b0:51e:2282:63cf with SMTP id
 2adb3069b0e04-52b896c494dmr5934420e87.45.1717474743646; Mon, 03 Jun 2024
 21:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
In-Reply-To: <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jun 2024 12:18:52 +0800
Message-ID: <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"aford173@gmail.com" <aford173@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240603_211910_214001_68D5177A 
X-CRM114-Status: GOOD (  28.93  )
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

On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> Hi ChenYu,
>
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > of the Series6XT GPUs, another sub-family of the Rogue family.
>
> I've added Adam Ford who sent out some DT related patches [1] for the Ren=
esas
> variant of GX6250 and the GX6650 (another Series6XT GPU).
>
> >
> > This was part of the very first few versions of the PowerVR submission,
> > but was later dropped. The compatible string has been updated to follow
> > the new naming scheme adopted for the AXE series.
> >
> > In a previous iteration of the PowerVR binding submission [1], the
> > number of clocks required for the 6XT family was mentioned to be
> > always 3. This is also reflected here.
> >
> > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a4=
3c79c2a.camel@imgtec.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 256e252f8087..48aa205b66b4 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -12,10 +12,17 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - ti,am62-gpu
> > -      - const: img,img-axe # IMG AXE GPU model/revision is fully disco=
verable
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8173-gpu
> > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > +          - const: img,powervr-6xt
> > +      - items:
> > +          - enum:
> > +              - ti,am62-gpu
> > +          # IMG AXE GPU model/revision is fully discoverable
> > +          - const: img,img-axe
>
> The Series6XT GPU models have differing numbers of power domains (either =
2, 4 or
> 5). Whereas, the AXE GPUs have a single power domain, so I assume there s=
hould
> be a related change here.
>
> The GX6250 has two power domains (lets call them A and B). There's a cons=
traint
> that if domain B is powered then domain A must also be powered.
>
> In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_MFG, =
which I
> believe corresponds to power domain B. I assume this works because the MT=
K power
> controller driver is encoding the constraint above, meaning that when we =
disable
> or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173_POW=
ER_DOMA
> IN_MFG_2D (domain A).

It could also be that the power domains are split in the glue layer and the=
re
is some sequencing handled there. I'll reach out to MediaTek to see if they
can dig up some design specifics.

I assume you would like to see the separate power domains properly modeled
in the device tree?


Thanks
ChenYu

> Thanks
> Frank
>
> [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/443548=
.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.html
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -56,6 +63,15 @@ allOf:
> >        properties:
> >          clocks:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: img,powervr-6xt
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> >
> >  examples:
> >    - |

