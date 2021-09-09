Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A319BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 13:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 755EA611B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 13:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 755EA611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQxttK49xVUCPvtQcmZyZ0JjiiUHsPVHt6AbrbErdTA=; b=tS85+5t/lZ056C
	xjpH/PpDT+4yEtwCFhHMYD0UcNq/UEgQqNfem1WFhFrRBujChxZ9Go8YDvIq4ZCp2HO7jREFQCZsO
	rz6StCBzYtihhzzsXIe9Apje0sxCncTXK5CkKAgsCWeXOugupm3mWYYcvRiria/8uVYbLAl/H0Jgj
	ilkfRc4FiyxP/kzM8BETmZRguHIqbaGWoG5kASqcVUocfkRaJ5mOiyQUHAdzcgZkY8z/ymyRe+N+H
	iiee2wDJEi3JxTscvIE796wo2+fggVWG9t0dMttTcnf5nUI7RMtK1zNqGq/4/q/WANk/7PWBZ4nT8
	swFw4WeoA90nnRRGbLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOKEm-009w2z-1W; Thu, 09 Sep 2021 13:37:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOJV6-009aHh-WD
 for linux-mediatek@lists.infradead.org; Thu, 09 Sep 2021 12:49:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q11so2389773wrr.9
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Sep 2021 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wAM0T8G6RoTaL+Y8vrPSrkyhlkeAcZjgrvEsT1FGoxg=;
 b=i8ceddWDabmpRFFGiXT16HYRk48TxOP9V0HyQOxzyeHIdCZYMvHYushGqUUpB3sHuG
 LgyCcf8dT+mdWOOKJxPBickavu4WLE58wAwJB7uErs97Q6czvoH8V5AovtG53DV7oagQ
 DyDQYlktZ6dv0BqgfD/46J2JDTjdJmcc3EhEadDymmA1IEsQQt/GFNJpfRGOPKnLbdmO
 vd6IoWWqtoGv26TZrvB6jJcih0N1ge8t+MO5n5lWS3RWoQFwVwk0Jf3ETe7uiqWeHEAr
 lVb4Nht6i9A9r40Zx9HmeqoBKt2m1seuPmQ5VGbIYrhzPFaITFaLkveJZmY24nQp9TLt
 WF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wAM0T8G6RoTaL+Y8vrPSrkyhlkeAcZjgrvEsT1FGoxg=;
 b=2AXYoNNSaG9lhx7JU2aXTs3uFvadx1/B01ZMBu+UVnH3EEfGBFfvldXiA4vQVxcnnb
 QuGPB19I4B24f13u8pF+GDQrGiM9QUaTrFA3XNA0PnAWmlJX+OR2+rOJsIy0f8hVn4uP
 agcUytvaH5McS3fpZWi5E3nKLOl3sk0owjO2gt+G4p8++Eby1CD4nCidJAg0xxpQ0Q+I
 nrfpg+3ZyonI2AF0QAKiUAaeU3r/HUEHIR2Pbxn31J4sfiD1RRv8AUKbC6uJp0cKB7ku
 8UASzAJoVlTCdqcBgdKQqIyQ8OS2fStmAZY8WEso6LKS+EHlDS2Sa38hBE5QIsJZrWVG
 UYoQ==
X-Gm-Message-State: AOAM531KGoI0VVJUmYim34t+c/+dG0i54ilOJXWaG9KkoK5kyAIjTCBc
 8QEokIYyW3Phi+ksZ522pQtCug==
X-Google-Smtp-Source: ABdhPJxvYA+22G8slEPRSrP6PK4fbT2uKkOX51g0+SCQHqtSYI2Gzhg8yJJq9IrAz4PM7wAyOzxg/w==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr3460204wrq.131.1631191795089; 
 Thu, 09 Sep 2021 05:49:55 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id j20sm1688269wrb.5.2021.09.09.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:49:54 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:49:53 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <20210909124953.635bvnizczabk2ii@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-2-msp@baylibre.com>
 <YTZ2jf0xynvvZM2s@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTZ2jf0xynvvZM2s@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_054957_072042_24F89E47 
X-CRM114-Status: GOOD (  23.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sam,

On Mon, Sep 06, 2021 at 10:14:05PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:24PM +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is similar to the actual dpi. They differ in some points
> > regarding registers and what needs to be set but the function blocks
> > itself are similar in design.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> I fail to see why they share the same dt-schema as the main content in
> the schema is the clocks and they differ.
> 
> A new mediatek,dpintf schema seems more appropriate.

Good idea, I will do that. Thank you.

Best,
Markus

> 
> I recall I though so when reading the RFC variant but failed to comment on it.
> 
> 	Sam
> 
> > ---
> >  .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
> >  1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index dd2896a40ff0..1a158b719ce6 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
> >  
> >  maintainers:
> >    - CK Hu <ck.hu@mediatek.com>
> > @@ -13,7 +13,8 @@ maintainers:
> >  description: |
> >    The Mediatek DPI function block is a sink of the display subsystem and
> >    provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> > -  output bus.
> > +  output bus. The Mediatek DP_INTF is a similar function block that is
> > +  connected to the (embedded) display port function block.
> >  
> >  properties:
> >    compatible:
> > @@ -23,6 +24,7 @@ properties:
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpintf
> >  
> >    reg:
> >      maxItems: 1
> > @@ -37,10 +39,11 @@ properties:
> >        - description: DPI PLL
> >  
> >    clock-names:
> > -    items:
> > -      - const: pixel
> > -      - const: engine
> > -      - const: pll
> > +    description:
> > +      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
> > +      hf_fmm and hf_fdp are required.
> > +    minItems: 3
> > +    maxItems: 3
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -64,6 +67,34 @@ required:
> >    - clock-names
> >    - port
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-dpintf
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: hf_fmm
> > +            - const: hf_fdp
> > +    else:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: engine
> > +            - const: pll
> > +
> >  additionalProperties: false
> >  
> >  examples:
> > -- 
> > 2.33.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
