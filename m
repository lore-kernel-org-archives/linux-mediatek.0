Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9170BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRPTsvi2xvnA/c1MYOB0hguXkvQfZTWWTzslMYWxYKU=; b=UK/Zj7mxuNnOZikaVWZv+234dq
	WlsQ24VPV8y+MwGAc1iY7KedVYFmCUQ1mWEN/Fip9cURie9kpx6NA1nLaBACzt1ZKLh8rfgjgDlX5
	oLUZC3eyvsMvpWKlJ1ob0F2wa+ILnt61QnBQsqKbEiERqSotUxk8FoBicOLeW6M0BdVnVx6QJgiCG
	KG6+RUYGq5q7UC+MdnTysPF3G5lVTrq6WKXU+/letrJ9cjXxlF9SIvT5o1jjK0seJLP6foFlSvCnL
	ALbWIBNkmiJACDVxBJmF45R84KL846ObZLvPeW2Za+mhPbfr9oWhrrc9BSz/+X3iW9Bgz1RZRj6UK
	RFojoF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9em-00F3TJ-2n;
	Sun, 13 Aug 2023 11:53:16 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9ei-00F3SZ-2y;
	Sun, 13 Aug 2023 11:53:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99cce6f7de2so477740166b.3;
        Sun, 13 Aug 2023 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691927590; x=1692532390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oRPTsvi2xvnA/c1MYOB0hguXkvQfZTWWTzslMYWxYKU=;
        b=ATFt2tpDvrfMsMtWfojgvpZXF1CVomdsotvhq/cgY2o4e9GBSlQghZMgJaDSvevKxs
         j3zR7YB9K03vAEE92dJodLz6waJFp+cGtRmcatrwlEwtC7OFGMFY3gZfk+8EiSx1tJaG
         xU9YrkBFxx6zAjrfZcVEMuN/2bxYTT+np0RANNFfrQ3BaaEnxnKkI/1Ua+mzHyQdTSuk
         eXAVyB2Vulvn6jU2+6TmtvXS+KX4OUzkHNxeg0hYctbNhTH3ohITpCE/JnX6hfoMzh4q
         Rv4x5UsTH49Tfr/TA4VKPGneLzFqOkcL7+VrnBsh1ttn9deIq3LzQWktru+6P85l/6Wq
         IE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927590; x=1692532390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRPTsvi2xvnA/c1MYOB0hguXkvQfZTWWTzslMYWxYKU=;
        b=czexH70+PeuDsm2V9XR+ZnaXwP0XL2ZXqwxFC6wzD373sDNI3OQYajrvDUc317/cwB
         BW3Vg7YVnu3t8fEo7hpIiBgR8JDc3o51MYW2IF+kwiQte0TS9HS5VJ1oZnAjLH6JvSV/
         Gd6F3I4ynt9dvCEhJmanOwKMDQdRD9doe1ql05i2b6G3y3G2tcyYVIKKz3sxIaRhUATV
         KCIlB72fJrO+M1lh/Y0VJIrD3BYYehDUjHSQupVwowZFNZjak7XUjySbaaRiF7+TCAwR
         gh1eBMuNe1RknC0FxmVUXy4ipNdGSOAb4iUXGg67DYzgcDU6A5w4qk+qo+nqYWEL69C0
         KQLQ==
X-Gm-Message-State: AOJu0Yw8VD2lwXtJbKykfm8i105pmZv+CN9vbA9UUWzaBTUj+Fr5vylW
	G7Z0Gf3R3bn1vD7F9hJ4uMk=
X-Google-Smtp-Source: AGHT+IFKg5qQEbxbCrnVhjCDPohFCLQymMifmy+mbyfCzfkWgjI3v6iEVwhPJM++NNBZ34XE9gdJgw==
X-Received: by 2002:a17:906:5181:b0:993:f2b4:13c9 with SMTP id y1-20020a170906518100b00993f2b413c9mr6169481ejk.21.1691927589752;
        Sun, 13 Aug 2023 04:53:09 -0700 (PDT)
Received: from skbuf ([188.27.184.148])
        by smtp.gmail.com with ESMTPSA id cd19-20020a170906b35300b0098e42bef732sm4467015ejb.183.2023.08.13.04.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:53:09 -0700 (PDT)
Date: Sun, 13 Aug 2023 14:53:06 +0300
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
Message-ID: <20230813112026.ohsx6srbt2staxma@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_045312_986291_8B62A20E 
X-CRM114-Status: GOOD (  19.18  )
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

On Sat, Aug 12, 2023 at 10:20:43PM +0300, Arınç ÜNAL wrote:
> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> index 4d5f5cc6d031e2..82dda8fae8b16e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> @@ -72,6 +72,10 @@ properties:
>            - compatible
>            - reg
> +  mdio:
> +    $ref: dsa.yaml#/properties/mdio
> +    unevaluatedProperties: false

sja1105 does not support an "mdio" child property. I haven't checked the
others. Don't add properties that aren't supported.

> +
>  patternProperties:
>    "^(ethernet-)?ports$":
>      patternProperties:
> 
> The nxp,sja1105.yaml schema also needed some changes.
> 
> dt-bindings: net: dsa: nxp,sja1105: improve internal MDIO bus bindings
> 
> SJA1110 Ethernet Switch uses the mdios property for its internal MDIO bus.
> Therefore, disallow the mdios property for SJA1105, and the mdio property
> for SJA1110.
> 
> Require the phy-handle property on the non-CPU ports if the mdios property
> is being used.
> 
> Refer to dsa.yaml#/properties/mdio to point the human readers to the
> description on the dsa.yaml schema.
> 
> ---
>  .../bindings/net/dsa/nxp,sja1105.yaml         | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> index 82dda8fae8b16e..7d92350f1065b2 100644
> --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> @@ -52,7 +52,7 @@ properties:
>      patternProperties:
>        "^mdio@[0-1]$":
> -        $ref: /schemas/net/mdio.yaml#
> +        $ref: dsa.yaml#/properties/mdio
>          unevaluatedProperties: false
>          properties:
> @@ -128,14 +128,32 @@ allOf:
>      then:
>        properties:
>          spi-cpol: false
> +        mdios: false
> +
>        required:
>          - spi-cpha
>      else:
>        properties:
>          spi-cpha: false
> +        mdio: false
> +
>        required:
>          - spi-cpol
> +  - if:
> +      required: [ mdios ]
> +    then:
> +      patternProperties:
> +        "^(ethernet-)?ports$":
> +          patternProperties:
> +            "^(ethernet-)?port@[0-9]+$":
> +              if:
> +                not:
> +                  required: [ ethernet ]
> +              then:
> +                required:
> +                  - phy-handle

For sja1105, phylink-compatible bindings (phy-handle, fixed-link or managed)
are required for all ports (user, dsa or cpu).

Also, sja1105 does not populate the slave_mii_bus, so it never uses the
fallback where ports implicitly connect to an internal PHY if no phylink
bindings are present.

> +
>  unevaluatedProperties: false
>  examples:
> 
> Arınç

