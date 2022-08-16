Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C4C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IOZgKwOUJ0yyXI/vD5VmeYlLJhpEL4ag2WpyQni1K8=; b=kYwLCcbaTdzDphX9KRsy6OEr4F
	JiqSiRDeYoDAOrHnZ/c9NGmQ+apNQ0w7POMbwoaYP1ior84yy4uKLgEmIMVYVFXOEx10I8rKAwmoZ
	SNcm3cKKpiUywtemQQ0DapbNp2A8OiHOB0Fq+u/LBYqb77SsMxiqPO2uJQSp98YZQLmRZU1QzfLiB
	HNzsH9z0vHrFxgtxmedBWC4lrxJdoTAceiWnlzFBSs/DOnMCtOEgHKIWxMz/HhJ5GtuONC51V4hyR
	2FWVn/C3m3fgMmEhPE8f69KOXWaQfWapybbdSAw9KGqURQFVWTSNKcDxxvX3PjZwGVGmSUU0cHqgn
	PxDdUZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3u6-0073Lq-DR; Tue, 16 Aug 2022 21:15:14 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3tv-0073Ck-EI; Tue, 16 Aug 2022 21:15:04 +0000
Received: by mail-io1-f41.google.com with SMTP id z72so506009iof.12;
        Tue, 16 Aug 2022 14:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=+IOZgKwOUJ0yyXI/vD5VmeYlLJhpEL4ag2WpyQni1K8=;
        b=66c8dihPl8SdybwOEyChlcgJfny7Wj6oQlhi6z4NmU0xCvQ/F3CLbIED2tGY1AyweQ
         h2db59wvQeGS+MPy6JW5l44vGdpQusuGqy5qVP+AhhsWIb1zYH/wIQbmU4tKaM+UYN+r
         020Ib+qOACSiCQg6eT9gD6Q6lJrsLyqdeLNpTjRX4lyHsN2Wy3qKjnE8ZiZ+fD3VZh5v
         g/TdCZ/Q2QScPJ6Lu6VH7mcY/uIy1VHtJP6ky/JqyBVbFYcwSbLNAt/E0ejI197iDxaC
         kl6Lt6NDN/wabdMVZe+xlrsC3JqcqtozE1FDAFA4yTui50xWucSIPZictEkbyYw4Sy2C
         6yBA==
X-Gm-Message-State: ACgBeo23BwM7eVADEydZIIDhoE41O23EBR+382MNt07m+S7Dr6/AKyyv
	siZPqfVcNpTCP51NYj1l4fpgtbYxBw==
X-Google-Smtp-Source: AA6agR6EQ8bauAwsr4ENQXhnGEColpXLl7hTdDigEdxvjsKeYgVLQhBqtACdoLlYH97bXvEZuHHIgQ==
X-Received: by 2002:a05:6602:2b14:b0:67b:8976:2945 with SMTP id p20-20020a0566022b1400b0067b89762945mr9685592iov.82.1660684499157;
        Tue, 16 Aug 2022 14:14:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o130-20020a022288000000b00343429c9cb6sm4841082jao.139.2022.08.16.14.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 14:14:58 -0700 (PDT)
Received: (nullmailer pid 2744716 invoked by uid 1000);
	Tue, 16 Aug 2022 21:14:54 -0000
Date: Tue, 16 Aug 2022 15:14:54 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: net: dsa: mediatek,mt7530: remove
 unnecesary lines
Message-ID: <20220816211454.GA2734299-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_141503_546182_875B18CC 
X-CRM114-Status: GOOD (  14.58  )
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

On Sat, Aug 13, 2022 at 06:44:13PM +0300, Arınç ÜNAL wrote:
> Remove unnecessary lines as they are already included from the referred
> dsa.yaml.

You are duplicating the schema and then removing parts twice. I would 
combine patches 4 and 5 or reverse the order.

> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 27 -------------------
>  1 file changed, 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index ff51a2f6875f..a27cb4fa490f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -162,15 +162,8 @@ allOf:
>  
>        patternProperties:
>          "^(ethernet-)?ports$":
> -          type: object
> -
>            patternProperties:
>              "^(ethernet-)?port@[0-9]+$":
> -              type: object
> -              description: Ethernet switch ports
> -
> -              unevaluatedProperties: false
> -
>                properties:
>                  reg:
>                    description:
> @@ -178,7 +171,6 @@ allOf:
>                      0 to 5 for user ports.
>  
>                allOf:
> -                - $ref: dsa-port.yaml#
>                  - if:

This 'if' schema is the only part you need actually (though you have to 
create the node structure).

>                      properties:
>                        label:
> @@ -186,7 +178,6 @@ allOf:
>                            - const: cpu
>                    then:
>                      required:
> -                      - reg
>                        - phy-mode
>  
>    - if:
> @@ -200,15 +191,8 @@ allOf:
>  
>        patternProperties:
>          "^(ethernet-)?ports$":
> -          type: object
> -
>            patternProperties:
>              "^(ethernet-)?port@[0-9]+$":
> -              type: object
> -              description: Ethernet switch ports
> -
> -              unevaluatedProperties: false
> -
>                properties:
>                  reg:
>                    description:
> @@ -216,7 +200,6 @@ allOf:
>                      0 to 5 for user ports.
>  
>                allOf:
> -                - $ref: dsa-port.yaml#
>                  - if:
>                      properties:
>                        label:
> @@ -224,7 +207,6 @@ allOf:
>                            - const: cpu
>                    then:
>                      required:
> -                      - reg
>                        - phy-mode
>  
>    - if:
> @@ -238,15 +220,8 @@ allOf:
>  
>        patternProperties:
>          "^(ethernet-)?ports$":
> -          type: object
> -
>            patternProperties:
>              "^(ethernet-)?port@[0-9]+$":
> -              type: object
> -              description: Ethernet switch ports
> -
> -              unevaluatedProperties: false
> -
>                properties:
>                  reg:
>                    description:
> @@ -254,7 +229,6 @@ allOf:
>                      0 to 5 for user ports.
>  
>                allOf:
> -                - $ref: dsa-port.yaml#
>                  - if:
>                      properties:
>                        label:
> @@ -262,7 +236,6 @@ allOf:
>                            - const: cpu
>                    then:
>                      required:
> -                      - reg
>                        - phy-mode
>  
>  unevaluatedProperties: false
> -- 
> 2.34.1
> 
> 

