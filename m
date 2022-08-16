Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E9C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuSisoMkl6+60tdPaffN493peiy7o2wWR1+PZsK1WiE=; b=WfTXrXHAGcWsNd7vXYUdQ+gZCA
	BKpvOu78u0N9ixky/4bTMNrYzaRqzXIWJK1G3pV5Tkm4EuEHUFhpZ7J2BPBruJFx6Mrhck+fmJBkj
	tmD6huB+VMOx6F5KmB2ZgQLNh55JXMG4jzofPeLdJz6zG2LgslRUaroj+IRFjQNAvzy7DROmv8CYo
	21BvOYBBe/46E2adj9MY6KF79LFVoBnjnMh7I8yWu1feS8MNt5jX/6cW6vZ4KW8EqfW8NPVyqBkrX
	VZNR1ft610N9JgSckwDVFENd55AqvbutYxvmIWp9BO0opopp7k/Ppb4AKS/fPFEbOknBH3+yrW1l6
	zRT39mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO40U-0076tm-GI; Tue, 16 Aug 2022 21:21:50 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO40J-0076pD-H7; Tue, 16 Aug 2022 21:21:40 +0000
Received: by mail-io1-f41.google.com with SMTP id r141so5728864iod.4;
        Tue, 16 Aug 2022 14:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=tuSisoMkl6+60tdPaffN493peiy7o2wWR1+PZsK1WiE=;
        b=00VU/bcAey9EWEMYmlTZfwBgtPfioXqhJqHOqPN6oWY3jiQ1OIUOc/70iPik2O30Pm
         sEJFAngGXjbO1QsJj1XfBIy25tkTkhRfeDktWF2x9dwTacBlaCL4KMAeTtIlGrqgcNKj
         JUmF2Q2UuuHh04O+3aHZ83B9dUoVAOZ03TZpsfYuvrTL6c4QUrPw97boc4adtcG4IUxd
         V3qqt83HX+BQWceASE78Fjqipx1Y3xspHTRdZQHu08RAzhaOWFyLPtXutJQt7hXMoe4H
         dDF5Ix0aors4RTeBqmPruE4PKWwT10ly0AQrZX1XZigjtwzxBFbZFUcIKwQX8/DHXvo0
         FqQw==
X-Gm-Message-State: ACgBeo07gJOVSvkhAt6lQ7WC7ueWfVl2AJSs3F89jnpQe9mE7E29Yzl/
	eyZ6gC+TILkH+cdTLWQOZQ==
X-Google-Smtp-Source: AA6agR44tAdtZC5+EJ1JbGySmbewN0vjdw3exH0tsi8qEIiGjppZgzRv1p3JPHSpnXbJNvAZX/sl8A==
X-Received: by 2002:a02:a144:0:b0:343:5da5:f424 with SMTP id m4-20020a02a144000000b003435da5f424mr10161530jah.150.1660684898739;
        Tue, 16 Aug 2022 14:21:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h12-20020a056e021d8c00b002e127d59f63sm5198039ila.74.2022.08.16.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:21:38 -0700 (PDT)
Received: (nullmailer pid 2754798 invoked by uid 1000);
	Tue, 16 Aug 2022 21:21:35 -0000
Date: Tue, 16 Aug 2022 15:21:35 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: dsa: mediatek,mt7530: define
 phy-mode for each compatible
Message-ID: <20220816212135.GA2747439-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_142139_614247_BB712C3E 
X-CRM114-Status: GOOD (  18.37  )
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

On Sat, Aug 13, 2022 at 06:44:14PM +0300, Arınç ÜNAL wrote:
> Define acceptable phy-mode values for CPU port of each compatible device.
> Remove relevant information from the description of the binding.

I'm not really sure this is worth the complexity just to check 
'phy-mode'...

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 103 ++++++++++++++++--
>  1 file changed, 92 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index a27cb4fa490f..530ef5a75a2f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -49,17 +49,6 @@ description: |
>    * mt7621: phy-mode = "rgmii-txid";
>    * mt7623: phy-mode = "rgmii";
>  
> -  CPU-Ports need a phy-mode property:
> -    Allowed values on mt7530 and mt7621:
> -      - "rgmii"
> -      - "trgmii"
> -    On mt7531:
> -      - "1000base-x"
> -      - "2500base-x"
> -      - "rgmii"
> -      - "sgmii"
> -
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -177,6 +166,36 @@ allOf:
>                          items:
>                            - const: cpu
>                    then:
> +                    allOf:
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 5
> +                        then:
> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - gmii
> +                                - mii
> +                                - rgmii
> +
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 6
> +                        then:

You've restricted this to ports 5 or 6 already, so you just need an 
'else' here. And you can then drop the 'allOf'.

> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - rgmii
> +                                - trgmii
> +
> +                    properties:
> +                      reg:
> +                        enum:
> +                          - 5
> +                          - 6
> +
>                      required:
>                        - phy-mode
>  
> @@ -206,6 +225,38 @@ allOf:
>                          items:
>                            - const: cpu
>                    then:
> +                    allOf:
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 5
> +                        then:
> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - 1000base-x
> +                                - 2500base-x
> +                                - rgmii
> +                                - sgmii
> +
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 6
> +                        then:
> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - 1000base-x
> +                                - 2500base-x
> +                                - sgmii
> +
> +                    properties:
> +                      reg:
> +                        enum:
> +                          - 5
> +                          - 6
> +
>                      required:
>                        - phy-mode
>  
> @@ -235,6 +286,36 @@ allOf:
>                          items:
>                            - const: cpu
>                    then:
> +                    allOf:
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 5
> +                        then:
> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - gmii
> +                                - mii
> +                                - rgmii
> +
> +                      - if:
> +                          properties:
> +                            reg:
> +                              const: 6
> +                        then:
> +                          properties:
> +                            phy-mode:
> +                              enum:
> +                                - rgmii
> +                                - trgmii
> +
> +                    properties:
> +                      reg:
> +                        enum:
> +                          - 5
> +                          - 6
> +

Looks like the same schema duplicated. You can put it under a '$defs' 
and reference it twice.

>                      required:
>                        - phy-mode
>  
> -- 
> 2.34.1
> 
> 

