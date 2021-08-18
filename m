Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBFBC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98489604AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98489604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygdJyDcrra8gs1Pgrhr5baqpKzNjJNd9yy9gnmeD4JU=; b=1B/MgGhGabRu3x
	+fZeqPHRpK89mcyDi/1aHcNhpPnMchz32MHy0LuU+ffOzYiZqEx8S/s4tqHc40JPCMCFkeXeojZDk
	/3aJ+qvy3QT4XTtpakCbrA7aIcxghzvG1NGEqL3qVqcBVXn3vI/NQguOKCehU7LkN92lRXv69wPkS
	/v+h3QSvFNqMgaSaRU9/p7S7/hh0Pd97sgztFoqEnRHM2DfBYfUVfsibPbdhFVpKDsx7dAjjXMXKd
	F23bp1xcuTPUeQMtFl3lIv2p0hZNdmNqyg78Y2PIlqWZu+4y96hopN8h1cuEYL7levoZWbsdYze7z
	saiaRU7PRldGHDkmmlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGG2b-004Vhn-Km; Wed, 18 Aug 2021 07:31:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGG25-004Ven-L7
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 07:30:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id w24so960619wmi.5
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K37RpQgduGf6cvmEt6AB4pJkqE0MT/cYTaC8+8kynqA=;
 b=dqsQq2hENrvqT9BzV9h+2JDiHZaXdqk9meXJ3RKVdZXt2BBomSy/5iaukTOyTlsDvh
 B4cMimHPA093CA6ruHFYQmeYpeX9/nWHEp7hejYQ6VqnNSAvSTqz0qVNS4G/M7bIhAWm
 DhYTRuaDxHvWSaaOd8j3bbZP9ZMJtnJ3fj274Ll0FfD0xIeYSHgcUwnwDydgWL7K9el4
 OrrQYDUrVjhphQCZ7y8MBB2W6OdCIaYbMmcrYL/60Tzbqhrc0VXPdeUF5fBGBxn2iYL4
 xR/2kgPuAF2yPsa/okCaXnjwUZRYloBYRvIhZOzxOZuFyZXKST1CWR6CDgvn8+c8h8kC
 K54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K37RpQgduGf6cvmEt6AB4pJkqE0MT/cYTaC8+8kynqA=;
 b=l2FbDzC81dqfJmnf0G+qfl54z/iRaTTpswkGLNybJiqB/LU92YMp4U5kPLLY3/0ty2
 sKwVGsa/1bTRwqw7s9EdLEvO7VwUsLQ3CJRj1E+ILhNpkCoHmx6/1dpHgtBZhVIpVN2v
 3yqQdP0uJQjBaJb7pI5+6TNvpadjwM1o73ZrO9N/v5+VpHCRDNXpt34oC8xT7eQ3nAc8
 HVp1Hvb9WJZ7vvmgleNDAkI5tGEVd3VzECj5psTTndLK3iMGQLq63101B/9Nlv35z/1w
 5vqfi2/0cuGxq1NS9c7f7M4bNS30np+Zh/4zlgJPbOpaWBxIBfqBF5ctNEwQsDdENKxF
 SAWw==
X-Gm-Message-State: AOAM532jbJT0DrkI7uzoRpqTUlZl5xBpCdv4AcmoCB6nlVBw4kCAf5pp
 eDXzJTH/Gn9e9TsdA4mHOURuYg==
X-Google-Smtp-Source: ABdhPJwG7UtHarbunzYv3llbcStKNeNfIbWFPioQ43OD0/LSFnX9kWS6tw3mWTmKtG7K1ZBNhcTsaQ==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr7021633wmi.77.1629271838448; 
 Wed, 18 Aug 2021 00:30:38 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l2sm4277221wme.28.2021.08.18.00.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:30:38 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:30:37 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <20210818073037.apmh2cf5hxhya6vo@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-2-msp@baylibre.com>
 <1629261946.11678.5.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629261946.11678.5.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_003041_741453_EBB58876 
X-CRM114-Status: GOOD (  23.92  )
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

Hi,

On Wed, Aug 18, 2021 at 12:45:46PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is similar to the actual dpi. They differ in some points
> > regarding registers and what needs to be set but the function blocks
> > itself are similar in design.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dpi.yaml        | 48 ++++++++++++++++---
> >  1 file changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index dd2896a40ff0..de4bdacd83ac 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -4,7 +4,7 @@
> >  $id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnDFMa1qYg$ 
> >  $schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnAjuBCxsg$ 
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
> 
> I've reviewed the modification in driver, it seems that dpintf is almost
> the same as dpi. Why use the name "dpintf"? I could accept this name
> only it's defined by hardware data sheet.

Yes the data sheet makes a distinction between DPI and DP_INTF. mt8195
has a DPI unit as well. DP_INTF has a slightly different feature set and
also uses slightly different register bits.

Best,
Markus

> 
> Regards,
> CK
> 
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
> > +      For dpi clocks pixel, engine and pll are required. For dpintf pixel, pll,
> > +      pll_d2, pll_d4, pll_d8, pll_d16, hf_fmm, hf_fdp are required.
> > +    minItems: 3
> > +    maxItems: 8
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -64,6 +67,39 @@ required:
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
> > +          minItems: 8
> > +          maxItems: 8
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: pll
> > +            - const: pll_d2
> > +            - const: pll_d4
> > +            - const: pll_d8
> > +            - const: pll_d16
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
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
