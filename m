Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0982ACA553A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWMdnJsx2d8fiBGvmqe7qu7qVNHb4jJy8Zu53A7Ws4A=; b=ps/hCXMYtBXJ+yAe9Vg5CK/jmS
	DEcMiguCz+aSS+XXNi9NkUgJlXuhIjvjWJYSbG812btpQm11wZZzXimJQeUcRd+JjL1EO+1/s7VIT
	TDXBIpXbcccNCoIWtIBliULN56CkikFWSkbi9FLrDvPz5yhkfJMKje8Fb06s3RsOjDzFRHZLJNpC7
	M6fVHjL8+VRMJzS7iQV6FpAC2zYIQe48q1/Mli4TN8gWeaZmohATz1K2bItfG/r4Eg8UF7pjoowoC
	tJTSDpy2u1Kd2RGdfu6uXzXN0SdZHCd5elWcwEOfQizxDhxgWU25N8lgYpwaG55MgHIf0Jf1ozdEQ
	JvD/1YIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNfK-005h7k-0A;
	Wed, 13 Sep 2023 11:04:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNfH-005h6f-0h;
	Wed, 13 Sep 2023 11:04:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdcade7fbso833972866b.1;
        Wed, 13 Sep 2023 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694603047; x=1695207847; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XWMdnJsx2d8fiBGvmqe7qu7qVNHb4jJy8Zu53A7Ws4A=;
        b=fPGGYUz73fsiVrtjCZ92ROIPd6MOVd/+3Q2Dicj0uXpoPvq4c/bojQ1Zv889KQK0nX
         c9Yo6YuKVDotlgGoNzYqYEaOuRwWVaybb5uvR4bq30P856WDSqhkvk7W57Az/bphO0iK
         elUZ5ZlU7rsxixAJp81Q2QdbvXUyDtvQJyUBDEQIy5CE34UfGIQw4s1P9CLxXZU9l5xx
         NHXXZcAShFzE60G1JA4wv3qiFjsCvKWFIPDBdZ1jRQL/K1Sr1gj/8Otk+mgJGNx3Vx33
         c3OQ1q16xBAJ0J6CBCwT8n6uJLqtqIWWsH+wt3UHtlYyv+uFvv18B8vwYfBANIWUg2op
         vytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694603047; x=1695207847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWMdnJsx2d8fiBGvmqe7qu7qVNHb4jJy8Zu53A7Ws4A=;
        b=enYyGiLXrm5Ytsa1REdqkRU6wyLDz98sP0LR+20hNOXMrFaRbNlc7OyjtBuTtsEkXj
         zxYhjzu1Jbwj7Z8mwL7hxZQGaoLe5PBzPb0iPGygmzPBjzDJKGzGAeiFTBKTMAJzb0X6
         F9sOERco0juUV54Wq+F2Mi/zNG8875q/d3w3GaVSkY07Xbn0XmdY+3p2MrLtr6A0tUxr
         zzitkPwxh9YDmDmXHY0/iBcwK2u0gLdSarkSleISpiWCY/QpjyFu/YiKdgkt1q6BlAZ1
         3mWDzd2LLZ1Xg0+vZMSwfHf1bVihhv+nYlLYYQ8rLBqgPS2QozwaCxO57jqO6b/Jq6xI
         ldLA==
X-Gm-Message-State: AOJu0Yw06AGsOX6/EIvB5Hh33tjsu3h6HLHMkgY1Rl64U6yoKrNsimrj
	cbgOnBrIUhGrIPH5QJWw2OU=
X-Google-Smtp-Source: AGHT+IENQYSCb1bqP3F1jbQeEwYGGwYsGuq575to5BfuhYNjZDfJ9D1qKsoXbdaMDic7mOraJMeKMA==
X-Received: by 2002:a17:906:18a2:b0:99d:f0e8:5623 with SMTP id c2-20020a17090618a200b0099df0e85623mr1572105ejf.54.1694603047218;
        Wed, 13 Sep 2023 04:04:07 -0700 (PDT)
Received: from skbuf ([188.26.184.93])
        by smtp.gmail.com with ESMTPSA id qb1-20020a1709077e8100b009ad89697c86sm2352992ejc.144.2023.09.13.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:04:06 -0700 (PDT)
Date: Wed, 13 Sep 2023 14:04:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230913110404.co7earmnbzf6hhoe@skbuf>
References: <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_040411_258975_A705025F 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Sep 13, 2023 at 01:59:17PM +0300, Arınç ÜNAL wrote:
> If I understand correctly, these phylink rules are for switch ports. The
> fixed-link, phy-handle, and managed properties are described on
> ethernet-controller.yaml so I thought it would make sense to define the
> rules there and refer to them where they're needed.
> 
> Example:
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 480120469953..7279ab31aea7 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -65,16 +65,8 @@ if:
>      - required: [ ethernet ]
>      - required: [ link ]
>  then:
> -  allOf:
> -    - required:
> -        - phy-mode
> -    - oneOf:
> -        - required:
> -            - fixed-link
> -        - required:
> -            - phy-handle
> -        - required:
> -            - managed
> +  $ref: /schemas/net/ethernet-controller.yaml#/$defs/phylink-switch
> +  required: [ phy-mode ]
>  additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e532c6b795f4..742aaf1a5ef2 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -179,6 +179,15 @@ required:
>    - compatible
>    - reg
> +if:
> +  required: [ mdio ]
> +then:
> +  patternProperties:
> +    "^(ethernet-)?ports$":
> +      patternProperties:
> +        "^(ethernet-)?port@[0-9]+$":
> +          $ref: /schemas/net/ethernet-controller.yaml#/$defs/phylink-switch
> +
>  $defs:
>    mt7530-dsa-port:
>      patternProperties:
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 9f6a5ccbcefe..d7256f33d946 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -284,6 +284,21 @@ allOf:
>              controllers that have configurable TX internal delays. If this
>              property is present then the MAC applies the TX delay.
> +$defs:
> +  phylink-switch:
> +    description: phylink bindings for switch ports
> +    allOf:
> +      - anyOf:
> +          - required: [ fixed-link ]
> +          - required: [ phy-handle ]
> +          - required: [ managed ]
> +
> +      - if:
> +          required: [ fixed-link ]
> +        then:
> +          not:
> +            required: [ managed ]
> +
>  additionalProperties: true
>  ...
> 
> Arınç

I don't think they're for switch ports only. Any driver which uses
phylink_fwnode_phy_connect() or its derivatives gets subject to the same
bindings. But putting the sub-schema in ethernet-controller.yaml makes
sense, just maybe not naming it "phylink-switch".

