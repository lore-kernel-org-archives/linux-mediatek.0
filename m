Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF73C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqCUADzpoo8AFdoi8q+vW/4XMqO6zRBOxuOuOr9QdQE=; b=thezmowBlCGT2La20vmbgDA9Y7
	ZQ0VE4QsSIfw4ECZoUKXy6YqrSAHt8pVvxGLIbnw87zwyyC58g/gLZHa2L8hA1xxESGyu45DCQ7F0
	Ijc8NRb57qg3xOnWmT8qq/HYf3cN/n6vQyHXe8vLJbvafBuq6T1Q9PBF1OOx5f2YWAm3YyvXgdEEw
	JSREPrVCw9GdKvIcSeFcq/GidqOQI5B8PmTxJIE6B0HVdVSjtWtDP4oNlX+g2jcQqW58fX+UbBHDc
	GIvbHlo6P+iapG8CDAiiRt+XcprOk81DiuTQsCb9MnQuyQ61rCwTZ9ktMfccCWXQb/Pzyn5DsZBYM
	scJDst7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYU65-003UCE-EN; Wed, 14 Sep 2022 15:14:41 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYU5j-003TXm-27; Wed, 14 Sep 2022 15:14:20 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1278624b7c4so41845787fac.5;
        Wed, 14 Sep 2022 08:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mqCUADzpoo8AFdoi8q+vW/4XMqO6zRBOxuOuOr9QdQE=;
        b=hGtRQfBWIMp7PoJ9RFlWH8hy9DaHFwqac0h6OZN97wuJ1XOBoJXLaD1wrhpryPCtOe
         gxIGcbop0ROBTQXWP085CLzOpH+kZSPBSkpcwqlFHaONA4o4kkqWwiNB40Hb2An6qRHQ
         76FNdho1ycO/ecJ3ErK20M06usHMopXKvcQXXx9YE4geXXRa/dCyADlhmrFNI+MPG3rA
         PGQNi41PvVWRaRoAPEXIuB4QCBWk8J74hpfhBe1vGpU5n7ckdEB/opQgH58p/iuffX+O
         rZiVbMMoTjB7Lv1OqmFxhGoXgK7K0Y8UVvcvDnj1Eak6CZDbsRz+tEh3vfNhgqF0EIOM
         qhoA==
X-Gm-Message-State: ACgBeo0ABj4BguVdnrc2exfr70t8DT8MmlXhrglDFheYKgJIeIwHTJw2
	yi0p1Q5ECct2ZSMjZk6iKQ==
X-Google-Smtp-Source: AA6agR7bsAhsApH+C7wdfjNUjslyXpkMLePmDH1OXJw3zdJmRZjSzOly8XTZk4JY5P//x3SzNBNRew==
X-Received: by 2002:a05:6870:e616:b0:12b:82e8:dc53 with SMTP id q22-20020a056870e61600b0012b82e8dc53mr2767817oag.276.1663168455901;
        Wed, 14 Sep 2022 08:14:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u22-20020a056871009600b0012b342d1125sm7798176oaa.13.2022.09.14.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:14:15 -0700 (PDT)
Received: (nullmailer pid 2263826 invoked by uid 1000);
	Wed, 14 Sep 2022 15:14:14 -0000
Date: Wed, 14 Sep 2022 10:14:14 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: memory: mt7621: add syscon as
 compatible string
Message-ID: <20220914151414.GA2233841-robh@kernel.org>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
 <20220914085451.11723-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914085451.11723-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_081419_142626_F7FDE2B0 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, Sep 14, 2022 at 11:54:45AM +0300, Arınç ÜNAL wrote:
> Add syscon as a constant string on the compatible property as it's required
> for the SoC to work. Update the example accordingly.

It's not required. It's required to automagically create a regmap. That 
can be done yourself as well. The downside to adding 'syscon' is it 
requires a DT update. Maybe that's fine for this platform? I don't know.

> 
> Fixes: 5278e4a181ff ("dt-bindings: memory: add binding for Mediatek's MT7621 SDRAM memory controller")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/memory-controllers/mediatek,mt7621-memc.yaml   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> index 85e02854f083..6ccdaf99c778 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt7621-memc
> +    items:
> +      - const: mediatek,mt7621-memc
> +      - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -25,6 +27,6 @@ additionalProperties: false
>  examples:
>    - |
>      memory-controller@5000 {
> -        compatible = "mediatek,mt7621-memc";
> +        compatible = "mediatek,mt7621-memc", "syscon";
>          reg = <0x5000 0x1000>;
>      };
> -- 
> 2.34.1
> 
> 

