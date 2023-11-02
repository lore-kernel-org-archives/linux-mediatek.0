Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63876C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 00:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSPogdtJc+rblDu5y8IlUDorG6qls49gzkiSw7EfD9g=; b=gyOXn5iezzm9xEQFMTm9NW71we
	0Q1kd9is63foudJzRH/jPcnLqcLlR5DQNJhVDulDzxEikFvbcDrDjGOS5zJ36TWYMTuNkCae6gCwT
	3lRlU85AqzqXnj+HMbH2p3aZ0KsvCoFABnLDC3VaQ2JnmGlkHHz1SI4uW6ZwKEgnL38OEC0VWxcBy
	5gAVZxMV/vkYKqObMzTutYWbb6Ph2fLn9BY0+2VjWZBvSeFMuCOBjP7TgPd8okGMkQwoSCd/PzQjp
	fHPtajud25vMQFjNNqAroEmSQvcjqGiqGypwWRR9+bpkHH60lo+g/KlaTbOb6Z85rPM+D7tQNYgwl
	MenH30GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyLrx-008QdN-02;
	Thu, 02 Nov 2023 00:47:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyLrr-008Qao-2N
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 00:47:31 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 859651BAE;
	Thu,  2 Nov 2023 01:47:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698886024;
	bh=Z568URw5U1PLqZeH/B8bGigCX/Z/5PnBYbw2ZKBRIxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqahXrAHAOELVV6hUjjtFl3S1tD+P1AF1BL47IG79nk4t45F+1pKOxbsqqbJmyl80
	 gY2Iy37YnInLKWCOJ7Jt8dUQ9qscNZSliFsAKzJ7q4+74Vr9D1NRWRbVdjQj1SIVt9
	 BdueRX7sgTeFP2HS2XbcGYgeKs7LedGWrG/o3Sc4=
Date: Thu, 2 Nov 2023 02:47:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231102004727.GD14322@pendragon.ideasonboard.com>
References: <20231030133247.11243-1-laurent.pinchart@ideasonboard.com>
 <20231030133247.11243-2-laurent.pinchart@ideasonboard.com>
 <20231031170525.GA1728781-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231031170525.GA1728781-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_174727_915299_3D253A8F 
X-CRM114-Status: GOOD (  25.99  )
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

Hi Rob,

On Tue, Oct 31, 2023 at 12:05:25PM -0500, Rob Herring wrote:
> On Mon, Oct 30, 2023 at 03:32:45PM +0200, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The THP7312 is an external ISP from THine. Add DT bindings for it.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes since v4:
> > 
> > - Add bus-type property
> > 
> > Changes since v2:
> > 
> > - Drop description of reg property
> > - Improve thine,boot-mode property documentation
> > - Making thine,boot-mode property optional
> > - Don't use underscores in supplies names
> > ---
> >  .../bindings/media/i2c/thine,thp7312.yaml     | 231 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 +
> >  2 files changed, 238 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > new file mode 100644
> > index 000000000000..a576a8669644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> > @@ -0,0 +1,231 @@

[snip]

> > +  sensors:
> > +    type: object
> > +    description: List of connected sensors
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^sensor@[01]":
> 
> Missing a '$' on the end.
> 
> > +        type: object
> > +        description:
> > +          Sensors connected to the first and second input, with one node per
> > +          sensor.
> > +
> > +        properties:
> > +          thine,model:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description:
> > +              Model of the connected sensors. Must be a valid compatible string.
> > +
> > +          reg:
> > +            maxItems: 1
> > +            description: THP7312 input port number
> 
> items:
>   - maximum: 1
> 
> > +
> > +          data-lanes:
> > +            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> > +            items:
> > +              maxItems: 4
> > +            description:
> > +              This property is for lane reordering between the THP7312 and the imaging
> > +              sensor that it is connected to.
> > +
> > +        patternProperties:
> > +          ".*-supply":
> 
> "-supply$"
> 
> > +            description: Power supplies for the sensor
> 
> Perhaps some reasoning why any supply name is allowed here?

I've asked for more information about power supply sequencing, I have
hopes I will be able to simplify all this. If I can't I'll expand the
description. The idea is that the power supply names are specific to
each sensor. I can try to specify them with conditional rules if that's
preferred.

> > +
> > +        required:
> > +          - reg
> > +          - data-lanes
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +    additionalProperties: false

[snip]

-- 
Regards,

Laurent Pinchart

