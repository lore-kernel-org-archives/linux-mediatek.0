Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA868C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9EiLEczNvqA8WX10E7FQeJULY67Q0641hz5KGCuXsg=; b=0A87vdhDU/NNTI
	vRQrYxQTgjHFkXsAdUq/3f9RDXveYGo2LEyJGFLUdEmT9MVhffJP9ALih8qjgqMqIdmI7lhSFQ/1Z
	vziXknWVzSMPp91UG5c949orsefv5UPBVKEljeT3qJk5vi8ATe0aas7Iias43THYPj1ITMdsvQOqO
	IWBCK/hjd9zJg5uI7/JOag/GviSX9C9XKi7TEctqy82p/soKOBNwy+sk4R6h4iORYLrT27tIAaphU
	u9kP8aJVHMwsiuL0QvtqK8TY++v8jFnz6l0PbevUli6F1NeR09QKg5QngP63RZOwqTzf51/VPTm5x
	HONex6cmm7VwEVa9cYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUXP-000EGK-FD; Wed, 01 Jun 2022 20:01:51 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUXN-000EF7-Ey; Wed, 01 Jun 2022 20:01:50 +0000
Received: by mail-oi1-f182.google.com with SMTP id v9so4045356oie.5;
        Wed, 01 Jun 2022 13:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hM5KF5wCwVdKsYo5M+AgMiM3NVZvgB0creSQpi4bIVM=;
        b=J9plnXR5wU+/LzIzNO72Ldw/GQLwtMvVpAAf+Jad/d/e7e0HsGRbwju7Hy5N3GKTwZ
         4RpHaItvWgzq1JWAIBrJB1skvJwdLjlV8T2zRJlHyfMazPfy6ebU8cIZlIN/kSDwGzzR
         ICg1xS1+9jvogBok9XrBHzoMLAZvsqHFeTLZcOWe97HP6yti6BuBzZ5snSelcixpfaBZ
         romUfi2Z3tg2Dux+3sBxZyxdVsLTHaPwCDttHmf9ewU412KmYmiE4xOMUnOcLsducJPf
         AdQ5BlO5HjYjN25pfKy/zA3DhZLCc6KSh9wXAdL6qBCsxQ+eHZ21XOe5WyeUzWQFH7f9
         W6gQ==
X-Gm-Message-State: AOAM530nW7AaxARdmMMyGjcrSwR1omSPXHySEvyYjHOpFBxF5FtFeNy5
	WlMZseqMPJqatOXqh2/Ksg==
X-Google-Smtp-Source: ABdhPJz/ahrvEIyLaTJn2tdg3qpfcBBKaT+gGiEjPOUSa+SOVMJSI109IsfvmyTNBHZT51qJxtq0fQ==
X-Received: by 2002:a05:6808:15a3:b0:32b:9c85:3434 with SMTP id t35-20020a05680815a300b0032b9c853434mr16880204oiw.118.1654113704350;
        Wed, 01 Jun 2022 13:01:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r21-20020a056830081500b0060603221245sm1270062ots.21.2022.06.01.13.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:01:44 -0700 (PDT)
Received: (nullmailer pid 338460 invoked by uid 1000);
	Wed, 01 Jun 2022 20:01:43 -0000
Date: Wed, 1 Jun 2022 15:01:43 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org, krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: mediatek: Add phandles for
 mediatek infra/pericfg
Message-ID: <20220601200143.GA334351-robh@kernel.org>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
 <20220518100503.37279-2-angelogioacchino.delregno@collabora.com>
 <4cfbc8dd-83d3-80df-630d-6f8fb2efb9fd@gmail.com>
 <2550039f-1cfc-eb5d-bbc9-bf82666e9abd@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2550039f-1cfc-eb5d-bbc9-bf82666e9abd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_130149_542406_1CD748DC 
X-CRM114-Status: GOOD (  25.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 18, 2022 at 01:42:20PM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/05/22 13:29, Matthias Brugger ha scritto:
> > =

> > =

> > On 18/05/2022 12:04, AngeloGioacchino Del Regno wrote:
> > > Add properties "mediatek,infracfg" and "mediatek,pericfg" to let the
> > > mtk_iommu driver retrieve phandles to the infracfg and pericfg syscon=
(s)
> > > instead of performing a per-soc compatible lookup.
> > > =

> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > > =A0 .../devicetree/bindings/iommu/mediatek,iommu.yaml=A0=A0=A0=A0=A0=
=A0=A0=A0 | 8 ++++++++
> > > =A0 1 file changed, 8 insertions(+)
> > > =

> > > diff --git
> > > a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > index 2ae3bbad7f1a..c4af41947593 100644
> > > --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > > @@ -101,6 +101,10 @@ properties:
> > > =A0=A0=A0=A0=A0 items:
> > > =A0=A0=A0=A0=A0=A0=A0 - const: bclk
> > > +=A0 mediatek,infracfg:
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > > +=A0=A0=A0 description: The phandle to the mediatek infracfg syscon
> > > +
> > > =A0=A0=A0 mediatek,larbs:
> > > =A0=A0=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/phandle-array
> > > =A0=A0=A0=A0=A0 minItems: 1
> > > @@ -112,6 +116,10 @@ properties:
> > > =A0=A0=A0=A0=A0=A0=A0 Refer to bindings/memory-controllers/mediatek,s=
mi-larb.yaml. It must sort
> > > =A0=A0=A0=A0=A0=A0=A0 according to the local arbiter index, like larb=
0, larb1, larb2...
> > > +=A0 mediatek,pericfg:
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/phandle
> > > +=A0=A0=A0 description: The phandle to the mediatek pericfg syscon
> > > +
> > =

> > I didn't explain myself. What I was suguesting was to squash the patch
> > that add requiered mediatek,infracfg with the patch that adds
> > mediatk,infracfg to the binding description. And then squash the both
> > patches adding pericfg as well.
> =

> Sorry Matthias, I'm not sure ... I think I'm misunderstanding you again...
> ...but if I'm not, I don't think that squashing actual code and bindings =
together
> is something acceptable?
> =

> I've made that kind of mistake in the past and I was told multiple times =
that
> dt-bindings changes shall be sent separately from the actual driver chang=
es.

Combine patches 1 and 6 is the suggestion, not driver changes.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
