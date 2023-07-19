Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF69C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiQ1ya2Vx/jvZEdWpDejEV/ueqVWa0CUVCzYMuLpt3A=; b=gX0C36cwMm7v9KduoZ0XeEZQ5B
	K83vXrWlVJtQ8s3QGWqDCTWWub/I1KuaaZHnqevpT/VVxE6D3Xa20gI7QX4Q/TTxh05OxnUsYpmCH
	GOZwnfTvlOZfIJC7fKnMu28OcnZkol1E55KdLCSlU2R+qXMMX23B9v4wyQNCtE5mUCvjlRpx/nOEi
	cE0puebkIEzSV6+uIz82Rp/nFXWVuA7axiG66tHgpev0H/XG8lGSEeYNwgXotq/hijj0Ykhj/bd1Y
	aqFKicLMsBaOnue75JNqhW+a3RvQDZnXIuJ3VFrXrCXjAJsfXVfbDOU0Gp5OQI7bvP7pZwU6xVWXK
	xbfb7LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM18f-0060X2-2T;
	Wed, 19 Jul 2023 06:58:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM18c-0060UW-2M
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 06:58:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9928abc11deso893195466b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689749897; x=1692341897;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiQ1ya2Vx/jvZEdWpDejEV/ueqVWa0CUVCzYMuLpt3A=;
        b=ih2pfbdbHahkCjOs6AGDGXaKH2QHQeoM4569JR82H8ay75NwvkFSKO9x0g/lW87nVN
         Zw3o2JHEeBXn5eKaFj7J3wKwfefJBXWIQ9WS1GD8CjF69diQkyx8UbMvSGzI4XHbAJT6
         oJuZxxyxlCivu7gJ66knmDOeZ5blHGfX4mZA+r0I506ypPh4XzqqKDaygLwuoADFaGzo
         mJKWNB3xNxVgISqvzYONh+l0JMSj7zlY2pSPdNIxPZebTcy/KWq7m1Inl1P+SeWvDzV9
         cZmTvSWbq+T+5I6TsybJd3rCrUhe6JQnGLfv/iW5FspFfpypr5HMxYhxv/c4aSJNckve
         v9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689749897; x=1692341897;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiQ1ya2Vx/jvZEdWpDejEV/ueqVWa0CUVCzYMuLpt3A=;
        b=kONO5P8K1+aPH/1QIAR3Gah+OqC+9jb8zERqbza7BEH+TWEh5t4GclE5ll1nqYpnw6
         bqKmL3mVgxU4DkFtQpTspTkwSvuzJtvBs05/V4hrCaqOPSjM0Mb9Djwrl2CqDKP2vkGQ
         7n51Guw8Mo6Ela109tMXi3bep9x3U2aWKbDisw5c+XV08T1Eum5ixsukt8Md3qq2Z2rl
         Q2jy8hkOR/ROyVRZuyUtupK/XSQq9gWB7NCR0c1PDpYMq2AqJ9UqR7l0bdDbLPT0EyyA
         1E3339QcQtiiDRWxKJ1jPgPq03vxxBBa/ms6TxV39Dalqyj1UdqCzMsq6FCWaObQPaIs
         K1cg==
X-Gm-Message-State: ABy/qLaLgvLPDiYX6BJZRdxV5yffvcd9MfAZh1gdGUchzNO1S7xd95kN
	/dcnch9MCjQhcjfU/zMXaSgWpg==
X-Google-Smtp-Source: APBJJlE5ZgBavnvlZCV3/u4bBdrjFGWaL2d7i/P3Md+EUmM54ETrgEpbPWbD7g1htS6tzyI3vE71KA==
X-Received: by 2002:a17:906:739b:b0:993:ffcb:ad55 with SMTP id f27-20020a170906739b00b00993ffcbad55mr1645449ejl.9.1689749896922;
        Tue, 18 Jul 2023 23:58:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id bn14-20020a170906c0ce00b009925cbafeaasm1909898ejb.100.2023.07.18.23.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 23:58:16 -0700 (PDT)
Message-ID: <2a4bca2f-15e5-1705-b6d2-8c250bf470ea@linaro.org>
Date: Wed, 19 Jul 2023 08:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Florian Fainelli
 <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1689714290.git.daniel@makrotopia.org>
 <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_235818_772685_3202E6B5 
X-CRM114-Status: GOOD (  21.12  )
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

On 18/07/2023 23:30, Daniel Golle wrote:
> Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> 10 Gigabit/sec supported by 2 packet processor engines for
> offloading tasks.
> The first MAC is hard-wired to a built-in switch which exposes
> four 1000Base-T PHYs as user ports.
> It also comes with built-in 2500Base-T PHY which can be used
> with the 2nd GMAC.
> The 2nd and 3rd GMAC can be connected to external PHYs or provide
> SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> 5GBase-KR or 10GBase-KR.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 74 +++++++++++++++++--
>  1 file changed, 69 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 38aa3d97ee234..ae2062f3c1833 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt7629-eth
>        - mediatek,mt7981-eth
>        - mediatek,mt7986-eth
> +      - mediatek,mt7988-eth
>        - ralink,rt5350-eth
>  
>    reg:
> @@ -61,6 +62,12 @@ properties:
>        Phandle to the mediatek hifsys controller used to provide various clocks
>        and reset to the system.
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node that handles the path from GMAC to
> +      PHY variants.
> +
>    mediatek,sgmiisys:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
> @@ -229,11 +236,7 @@ allOf:
>              - const: sgmii_ck
>              - const: eth2pll
>  
> -        mediatek,infracfg:
> -          $ref: /schemas/types.yaml#/definitions/phandle
> -          description:
> -            Phandle to the syscon node that handles the path from GMAC to
> -            PHY variants.
> +        mediatek,infracfg: true

Did it mean that it was defined only here? Then this "true" is not
really needed.

You should however disallow it ("false") in other variants).



Best regards,
Krzysztof


