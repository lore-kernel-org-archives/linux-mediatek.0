Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D11C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzR+Z4kxn7o2P/WW6PzrWm03607DFyihBAzL1aumsm4=; b=2qVAxWdeeoiwQbMh8EIAfQsMEj
	+9bWvJJNAaQMMeICfoUTcj388HTyLzgPhXT3J1ywiBheRZ4eisTV8uw4qHb1V48iXxSK5TVvgHDpW
	1meW+PVGGoDb6O6/j4RdJTcXxyE4qdVZydbyW5HE2XayaO7lzy6i+Q5sBa9oJPWk+2P0WvY6lb8dZ
	keNbvZnHAoOrhDzuLUAEjpxZ8vRZZZhsCW8OkLYdD/X825m38KcGBCVenzIdIG/fXmGtanc1ptdvQ
	Q1cn6ziItDsgV3oIN0qlJ2ug5Ffb8ZUTjr542A2phIgWKeXGkrVbnbr8UolFx+9sNSMH1eqh2JuyJ
	AQ3UkSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3YN-006vCP-RM; Tue, 16 Aug 2022 20:52:47 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3YB-006v49-DL; Tue, 16 Aug 2022 20:52:36 +0000
Received: by mail-il1-f179.google.com with SMTP id k12so1982482ilq.10;
        Tue, 16 Aug 2022 13:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=EzR+Z4kxn7o2P/WW6PzrWm03607DFyihBAzL1aumsm4=;
        b=09g+a3tcmQOOtO779ACHi1k2NyhR67f9j1SBhlcGX7Ea5NsCfflM4OLOU+cpHWc76y
         06KiA3XVNJx7phgW0Fx8Oha+RI/8Mo29WBAvHZ5mDzi/mE+q5+LilgPt52+sCHLbl5jn
         hZNxP4cKziKGrwGkHc43F72p4UxTM/1L2tivJfS6V8cjmqCKFJOO5mmJw5BS4/x3BZFz
         GrJMz9JmwlWKChBSJoVnwYgW9MXHNtv2RPKiP87aq0oSqd7nKGSztN/GzJT65iLiBF+5
         hXl9xJP3XdDN8n+q7Itvk1C5I2aYSJ1HQ8PcaYI1Aw1Kk82tfjrmg6bULT44mLTmSkje
         TQkg==
X-Gm-Message-State: ACgBeo0Qh4kxrPFNjWYcjU5EgAWEoYXQDNj8FGwhgITAg3DQKL6Nfri2
	Zev3hSX/8JONt5MUAEelpg==
X-Google-Smtp-Source: AA6agR4sGyiJKaOIlOFFnF0gqYNlu2XfR46u2ykdYGuFEEDs2T7qsaoxAPvnZ50uBGOOW7Z0yR8c2A==
X-Received: by 2002:a05:6e02:18cd:b0:2de:73e8:3f0 with SMTP id s13-20020a056e0218cd00b002de73e803f0mr10622659ilu.69.1660683151102;
        Tue, 16 Aug 2022 13:52:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v30-20020a02b09e000000b00339dbd4c8d7sm4780229jah.45.2022.08.16.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:52:30 -0700 (PDT)
Received: (nullmailer pid 2713686 invoked by uid 1000);
	Tue, 16 Aug 2022 20:52:28 -0000
Date: Tue, 16 Aug 2022 14:52:28 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: net: dsa: mediatek,mt7530: fix reset
 lines
Message-ID: <20220816205228.GA2709277-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_135235_507031_301E48CB 
X-CRM114-Status: GOOD (  22.93  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 13, 2022 at 06:44:10PM +0300, Arınç ÜNAL wrote:
> - Fix description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.
> - Add description for reset-gpios.
> - Invalidate reset-gpios if mediatek,mcm is used.
> - Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
> - Require mediatek,mcm for the described MT7621 SoCs as the compatible
> string is only used for MT7530 which is a part of the multi-chip module.

The commit message should answer 'why is this change needed/wanted?' not 
'what changed'. I can read the diff to see what changed.

d> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index edf48e917173..4c99266ce82a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -110,11 +110,15 @@ properties:
>    mediatek,mcm:
>      type: boolean
>      description:
> -      if defined, indicates that either MT7530 is the part on multi-chip
> -      module belong to MT7623A has or the remotely standalone chip as the
> -      function MT7623N reference board provided for.
> +      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
> +      switch is a part of the multi-chip module.
>  
>    reset-gpios:
> +    description:
> +      GPIO to reset the switch. Use this if mediatek,mcm is not used.
> +      This property is optional because some boards share the reset line with
> +      other components which makes it impossible to probe the switch if the
> +      reset line is used.
>      maxItems: 1
>  
>    reset-names:
> @@ -165,6 +169,9 @@ allOf:
>        required:
>          - mediatek,mcm
>      then:
> +      properties:
> +        reset-gpios: false
> +
>        required:
>          - resets
>          - reset-names
> @@ -182,6 +189,24 @@ allOf:
>          - core-supply
>          - io-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: mediatek,mt7531
> +    then:
> +      properties:
> +        mediatek,mcm: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: mediatek,mt7621
> +    then:
> +      required:
> +        - mediatek,mcm
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
> 

