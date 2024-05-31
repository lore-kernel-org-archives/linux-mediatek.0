Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A4EC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvrZTCq64hB5lHJheyU2TPKqgbbvFWSIbyIIWaCcr6w=; b=IKL3PihbezCQA0vTV7A/7cjD4G
	RwW4hGtfRcwRNj0IOyqhQPHrUj5IpOTwwcyG9IR0JGo7E5gKm4eFNFLBz2wXGUdlwvyxRupMbiFDk
	fhfg15r3ujwwt4KGGwecvIsP3LdIfkhvT2w3LsngOI29sBsrloMtVpXhKuQT49gX0v+Lpi9D+FwqM
	sBtzydaMpBkLAOigZNSFK2jd03aWk9NY9DCPjGyOGeEURk8LphcnchHmDwLjalkxvpWzg4n1ktGbJ
	eJ3hb+pdcMSFeYImVU+nVkAC4VoNWKgNGMNUcISD8VKXq5cwKHolx9qsChGsQUdPds6gyfVjtZFwC
	WX81F4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3C1-0000000AVJa-4AnP;
	Fri, 31 May 2024 14:25:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3Bx-0000000AVH0-2FOP;
	Fri, 31 May 2024 14:25:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-6c53fe7adfcso361935a12.3;
        Fri, 31 May 2024 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717165511; x=1717770311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvrZTCq64hB5lHJheyU2TPKqgbbvFWSIbyIIWaCcr6w=;
        b=gcn3c5FzcMfndk5ZeBzu9c8y5cl9JI09EBMXeiZeqNDD0SbSyFqPklTfJJFVaMFjtD
         AgxD0BDGtoHL5555JU4E9ZiRQRrHPyf0DdgcjFSz+zadIa42OlVwlzvQkY4IDPj4VLt9
         UGUPCkocjP1f5NalXyfYgxuYipJrjraho+jQfNHF2dRxVDPmPNC1U9K7o+Y1KsK9HDR5
         0Riy+SevsYcOCO+d6yNUdcMN6XnBWBUaCWwYh/QGC3Rczk3cchdnzUvvekwJzqxieDgt
         /4dVFrwsfr1EwrUFW+vyIl61Rnttpbd9fv/iLqoAEmosnjG+Fv2TdIhuo1tcJh/z4rmS
         y7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165511; x=1717770311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvrZTCq64hB5lHJheyU2TPKqgbbvFWSIbyIIWaCcr6w=;
        b=GhDjXzLdAwbSs1F8Q/OYEX++VqfYMgTX+Ngh1ZU0lWMOsIYJQCgQLSctdnqygJ21af
         JMLl6z2S6fhCPgdjl+akgteU2Vduto06BWFsT8WSHVxkoZWE1WwNtr/iN3nJZ26GcYoB
         RPQ6SPvMEJraYVVkcIm+5ze14IYpVF1fb5uSEgeD3RCXIRt4e4Ti1zthFZlW1avVrV5l
         KgkUzjL1cXOHLZkMNi3IZZzDKUid7C0Ub+7BdnPtgMCRN+UXWL8vUPqfq7qq7oewG/dG
         lFH30rvxDVwlb3p/HK+XP+uGca1I+JhiB4pb3zDKMgr3F3nmIDQEzvKzzxb3hzfOxnFJ
         cOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJBoqnWElkO5+LP3fnisvBlybcxcCMuvPJVASoJ/uHjBTCNqqW982fnuYDA7AYw2R7Nl/Zbxlj94Foh4hW1PmY+C0He8zomedMpEv7ZMG1edMk8tSpfMFc/IYJIkmd6dJCzRZ8rXwrD3X5iLavVaoMwfZm/9b0lEo=
X-Gm-Message-State: AOJu0YzagQBnae8O7n8N74jSpvr2x/+jeauHr1vvtIy1Eow+N5Xy7EM2
	Csvjd4k6D68VHmuke55UkAd+3vDQKw5KKR9hb9WGrYAYqdSDzT9LeWkUJBfgsunmNd2HeuRFz7d
	zR3yjJTXXHMxyp9wJMgBPJzrk1QY=
X-Google-Smtp-Source: AGHT+IGLbXNCTP7kEEDSMq48BUCNTcGq4/Bj168zhaicbZLEfBju50BxyoEC44nEYY/K5zSXtSoOZMn4twkyQ+dOxks=
X-Received: by 2002:a17:90b:2282:b0:2bd:fa57:b361 with SMTP id
 98e67ed59e1d1-2c1dc56fce1mr1799546a91.11.1717165510580; Fri, 31 May 2024
 07:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
In-Reply-To: <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 31 May 2024 09:24:56 -0500
Message-ID: <CAHCN7xJ7X9_yNJa7-HyU=FzN2G1cV8i9R+PoTHm-DKyiOPenUQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"wenst@chromium.org" <wenst@chromium.org>, "mripard@kernel.org" <mripard@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240531_072513_710476_6F92415C 
X-CRM114-Status: GOOD (  29.87  )
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

On Fri, May 31, 2024 at 8:37=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com=
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

Thanks for including me.

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
>

In the cover letter of this series, it was noted that the GPU
enumerates, but it doesn' fully function yet.  This is also the case
for both of the Renesas variants I have been testing, and I was nicely
asked to postpone my series until the driver was closer to being
ready.

Even if the driver isn't ready yet, it would be nice to move the
bindings forward.

adam

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

