Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9AFC41513
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JzoWKJWfDj4FguRZ7Oco2p7HgbsRYijC1lYv2wlZ+U=; b=4JKwqGCODJsMTJNsp4UY8vshVh
	bUUoCkSvkQcLUD9kXqoAALB2dSTbsZmQ6AiMIEf2p3sWXc5mUoA94fc4R5Vrx5s/Kzs/94DUb8L5R
	AGdE8t6to/YNqHzkQ3nPhtopHqDTYfb1KZP4DvEuMzR/cgNLUVlX6XYkHj9BLFJV2v1u/pYfHXP40
	mA7vdx7Omj43g3rui2A9A363zPRRpcL7FDMhkHCNIZ8b0QvlG+wscaZlkFtsHMWp/RE1nAL5ktas9
	s3VilQQiVfg+QVJhim5wJOjcv+obq6yRWXdJFKP62rCmqUfADkr//9MGkDOkPvwuStjbUUcb0DTuK
	bn1Yp8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV8wu-00F0Rf-0x;
	Sun, 13 Aug 2023 11:07:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV8wq-00F0Qd-1l;
	Sun, 13 Aug 2023 11:07:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-977e0fbd742so447712666b.2;
        Sun, 13 Aug 2023 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691924870; x=1692529670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JzoWKJWfDj4FguRZ7Oco2p7HgbsRYijC1lYv2wlZ+U=;
        b=kn7+miFpzqcrheYyIkdteTYanxmSe9imJRlF5Ticz8m+hZ8E8lV+DONipGiZfiaryb
         EJZw5xLfQZHLH9o45z+C4C804uHrYB8pMP8GhvbyNxrum4cq7chQEfgHayGivKdBbvV4
         cmXI1XxdGd6Dz5w5jWDGs9BEABnNOe+tBHn+EGvY/soTguXoYbkxdp275oVsLkuvRvvz
         qnRpQLHzrN5Oc8KR7x5BXSY1YrkKl64oteQPukRRcOwECrKUfccjS1OTE8cz/kq/Jbex
         gqBcQVz+QZisvO2Z61hnXlkd+b5txb2LSmU7eE3E7q/sKmc2iE5LIdzJnONqO7somYrw
         o0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691924870; x=1692529670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JzoWKJWfDj4FguRZ7Oco2p7HgbsRYijC1lYv2wlZ+U=;
        b=Mx3+rZ9fJ0IKse2Ib5MJnFYVlISlaq7DNbX+OhUdzHuYTgvvtBSTbCLiAPifL3Yt9j
         Iu01LLgQ4cc8g8s8LF919O5PaDR/+AG8vzFqSxKyFsmB46TmH5gNHtsWIpMLGDyEzYkb
         8KahJ43KD6NsSV7DEKl+sdZ9CDmAKg4rIJ2/2+jfMw82ZGeRXjAeKnt1wTqtynsVZGAb
         m/NmlMwVC0OrZH6Ya2kn7IjoAI82me9KyhN5PbJBjfxWQx/ZKWxIJt2pVVbfBlVb9nVO
         GKfL+PVx6AYFgZkh5QGUlCdqQ+z7hxWhlSOyT2dKUmciy1bV8dk5GEU4BG1iJhpDaeeW
         1neg==
X-Gm-Message-State: AOJu0Yy46KS1jJ2NX0Wb8eQiqa3cyn/v0yPQCeawMWQ8SlxV7K5mHCog
	i97NLNG/XnjUTRh9x1agMxg=
X-Google-Smtp-Source: AGHT+IGiBbzIr6xiUxTXEqiYjsMf2mnAhUrlkotMHGlTp3fQ8LNKaqiiDrm0mAkbHAIKUi8nhneRlQ==
X-Received: by 2002:a17:906:14e:b0:99b:f3d1:7735 with SMTP id 14-20020a170906014e00b0099bf3d17735mr5293600ejh.29.1691924870146;
        Sun, 13 Aug 2023 04:07:50 -0700 (PDT)
Received: from skbuf ([188.27.184.148])
        by smtp.gmail.com with ESMTPSA id a17-20020a170906671100b0099bd8c1f67esm4453038ejp.109.2023.08.13.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:07:49 -0700 (PDT)
Date: Sun, 13 Aug 2023 14:07:47 +0300
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
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add
 missing ethernet on example
Message-ID: <20230813110747.rvvsvte2t6pbe5j4@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230812091708.34665-2-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_040752_589662_4270111F 
X-CRM114-Status: GOOD (  16.86  )
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

On Sat, Aug 12, 2023 at 12:17:05PM +0300, Arınç ÜNAL wrote:
> The port@5 node on the example is missing the ethernet property. Add it.
> Remove the MAC bindings on the example as they cannot be validated.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/microchip,lan937x.yaml           | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> index 8d7e878b84dc..49af4b0d5916 100644
> --- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> @@ -68,16 +68,6 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>  
> -    macb0 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -
> -            fixed-link {
> -                    speed = <1000>;
> -                    full-duplex;
> -            };
> -    };
> -
>      spi {
>              #address-cells = <1>;
>              #size-cells = <0>;
> @@ -138,6 +128,7 @@ examples:
>                                      phy-mode = "rgmii";
>                                      tx-internal-delay-ps = <2000>;
>                                      rx-internal-delay-ps = <2000>;
> +                                    ethernet = <&macb1>;

macb1 instead of macb0: was it intentional?

>  
>                                      fixed-link {
>                                              speed = <1000>;
> -- 
> 2.39.2
> 


