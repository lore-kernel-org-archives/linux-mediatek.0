Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axeinl0AVOkMZkdy2C/CMY4wAszDNJkSPI4AMTzOaxM=; b=U2NFgGdnRyKRq2k+vWTqUcA3kE
	55KLYzPrDrlkKjecuezUEtZZnD9BGhTWLPZSnZdyjIsgLfIJnjQV2ljTiIJV7r0pisrhQS40IuTMO
	8jPELe9pouZq+V4llkZJuO3o03AkFTSBqjvml+E1QZSKXAq/wYepunEuJDbKe3rx590vua+YzkLeU
	xihSAABS6uFaWbJ+BKab9nsRGwUHJ9U8vWR9LluNxmFkrLyRDqAc5TRc/8fK7YLiI0eyhz4oRnjXW
	l+Zm5KmJvEvhgaTWgWzmXOKESy212Wy+yU7+zWuTJF0/CruuSAWz1wrUZGi2ntV3b0Ub+wsHU6+9j
	NQwp59fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1R5-004m2W-Cp; Fri, 04 Nov 2022 18:28:59 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1R3-004m22-1N; Fri, 04 Nov 2022 18:28:58 +0000
Received: by mail-ot1-f51.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso3113917otq.11;
        Fri, 04 Nov 2022 11:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axeinl0AVOkMZkdy2C/CMY4wAszDNJkSPI4AMTzOaxM=;
        b=iEXFtI2USFDgkpX0sQglAR51tx68DkATSAPMvQRYFCNXhepJ+dZgqHLknrFo5UsSgh
         sheg9E1Ok1AZFJibx2R7N1MuNoeT1OJ/7LErze/6uDi3X289iY01w+Tka462RnH78Yv8
         GJQchKeLFnKI/32d41SskaveY+VjJLwyS/86RjLmSDtqoK2FUi2yLjWnbfFQ5i036j5M
         j37b7tZhTA3SP7u6fa7eLQtD6wSnv1SMcMIKniPXV5LFi+WBdziLg3vZfhDCEONFnzu/
         1c8x6xosHAUD7dq6nHBsAPoX3UWsYvozM8FyoJur194NU1Rc/dbsUWhXXir8kRB4ktsf
         IC1A==
X-Gm-Message-State: ACrzQf2MRLUHNY5jssmilBebZXZ/0bZdSsyV51lCyb2KJUw0Czxh1Ocg
	hOe5LaOmYyNOgwxFGOedlA==
X-Google-Smtp-Source: AMsMyM5MfegN84c2dxVsm4eumZQlLU3ixmJQ8iQ0yvjncow3XVIGXYi5BQgNgYk95FH3nugWlpZ/eg==
X-Received: by 2002:a9d:7dd1:0:b0:66c:54b2:7df3 with SMTP id k17-20020a9d7dd1000000b0066c54b27df3mr13767334otn.247.1667586534956;
        Fri, 04 Nov 2022 11:28:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 36-20020a9d0627000000b00660fe564e12sm1794otn.58.2022.11.04.11.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:28:54 -0700 (PDT)
Received: (nullmailer pid 2226083 invoked by uid 1000);
	Fri, 04 Nov 2022 18:28:55 -0000
Date: Fri, 4 Nov 2022 13:28:55 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 net-next 6/6] dt-bindings: net: mscc,vsc7514-switch:
 utilize generic ethernet-switch.yaml
Message-ID: <20221104182855.GA2133300-robh@kernel.org>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-7-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104045204.746124-7-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_112857_101668_000BDCD7 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, Nov 03, 2022 at 09:52:04PM -0700, Colin Foster wrote:
> Several bindings for ethernet switches are available for non-dsa switches
> by way of ethernet-switch.yaml. Remove these duplicate entries and utilize
> the common bindings for the VSC7514.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> 
> v1 -> v2:
>   * Fix "$ref: ethernet-switch.yaml" placement. Oops.
>   * Add "unevaluatedProperties: true" to ethernet-ports layer so it
>     can correctly read into ethernet-switch.yaml
>   * Add "unevaluatedProperties: true" to ethernet-port layer so it can
>     correctly read into ethernet-controller.yaml
> 
> ---
>  .../bindings/net/mscc,vsc7514-switch.yaml     | 40 ++-----------------
>  1 file changed, 4 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> index ee0a504bdb24..3f3f9fd548cf 100644
> --- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
> @@ -18,10 +18,9 @@ description: |
>    packets using CPU. Additionally, PTP is supported as well as FDMA for faster
>    packet extraction/injection.
>  
> -properties:
> -  $nodename:
> -    pattern: "^switch@[0-9a-f]+$"
> +$ref: ethernet-switch.yaml#
>  
> +properties:
>    compatible:
>      const: mscc,vsc7514-switch
>  
> @@ -88,46 +87,15 @@ properties:
>        - const: fdma
>  
>    ethernet-ports:
> -    type: object
> -
> -    properties:
> -      '#address-cells':
> -        const: 1
> -      '#size-cells':
> -        const: 0
>  
> -    additionalProperties: false
> +    unevaluatedProperties: true

Both this and ethernet-switch.yaml allow unevaluated properties. 
Therefore any extra properties will be allowed. Add some to your example 
and see.

>  
>      patternProperties:
>        "^port@[0-9a-f]+$":
> -        type: object
> -        description: Ethernet ports handled by the switch
>  
>          $ref: ethernet-controller.yaml#
>  
> -        unevaluatedProperties: false
> -
> -        properties:
> -          reg:
> -            description: Switch port number
> -
> -          phy-handle: true
> -
> -          phy-mode: true
> -
> -          fixed-link: true
> -
> -          mac-address: true
> -
> -        required:
> -          - reg
> -          - phy-mode
> -
> -        oneOf:
> -          - required:
> -              - phy-handle
> -          - required:
> -              - fixed-link
> +        unevaluatedProperties: true

Same problem here. I'll comment more about this on 
ethernet-switch-port.yaml.

Rob

