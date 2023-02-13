Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438DFC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h74cDQbgTdYncRWX3Uv32ARg+TAO4xNXRfIu6VensXg=; b=Uwo4FVP3UcN79Ipprv+MEOIVWD
	tJOvXdkkEgVv7ZntGZ97BwCA91JpFbFQZjAo4y1AUmXv+FOAmdao45SOxgaZOQE6/lxUM9RVgfr6B
	qI+mLH+FGTaMcpclmBiL10VLRcUdkAwFFWNH8v8emALB8kBid2mCb0UyPmIu9l3tYM72InCd89u/i
	9gFIthHlX71sUYpi7LLs9VKrvEJ4lhjjo5EXAIMrhctEnplynG/WqHzl7ywsQIF8iix/md759aUUT
	9D3ZbOGvNZKHZrAR+xA2dpnMLF5tZRE0ts/SmaXWkJf1gOHqAZK11Kyq5sTyhJ+HaW/Vh+bjVq79o
	3jf/nNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUxJ-00DmZm-Tg; Mon, 13 Feb 2023 09:17:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUxF-00DmX6-RN
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 09:17:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o15so8070218wrc.9
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 01:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h74cDQbgTdYncRWX3Uv32ARg+TAO4xNXRfIu6VensXg=;
        b=PB29dGCSLCehErz5UeBpdIOyvUGN56QP4ynMmbXeBxyEGhFJ7uSuTgA/Rlw71C66OZ
         f00/AxjW5MnvGhuwbFF7LycdMP0seIbtfJUYw1xhsLRwMcKrkhIPjiKTtTMjkuvc2q1s
         kF8Iq9c1/x8WltmS0xjbdYk9PaKhnq2cVegZs6nx7Dl2Zb1g+VXnWEYBwWO1WJD+/N99
         2BpFoHBkfPkwUZRuRyjtevZuMLz5YlzE0A6zv0KoZ2hL9MQ8tuwZtHh5Itn7ARaCUvXF
         QlX8FQZiFvP4NfpbawPmAAQRyYCZp+s25aUrHEY7P9EBzoh3+twL+vbkBFtMEmTndU81
         ndUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h74cDQbgTdYncRWX3Uv32ARg+TAO4xNXRfIu6VensXg=;
        b=wycFS8sxljVeC/0Vetp8fC/3WjLYKaKTy/KLayz3uYGX+u4AH26vwdvGPj5LR3UyzF
         E+fiBE6Gj5CccMtvig/Arv/+pMDi0YurjpEbtf6GE4A1N0m+z6uUh1e/9g9NCIy+caLg
         vLA4nt3N9aSQT0e1P0YOMiqN2qGpY+ZezrJva+UaYJwKsMCEjp9S6BVlZpsM0hivwqrs
         JmjqZELOwCt96UHBd/VR0BXK9QMIRJIfSp7/LxwmpGsWiAdiEHfAu39DLm69eqPyayAt
         mty6tJsK1fpYJkgriJt3iUXSROQNDL3UqQ7N8u+f4l3EdJpYSmPjnXgi74l4GIH/lGfc
         D5aw==
X-Gm-Message-State: AO0yUKUjrZHT4NEpsIsxBD9KMkDBwr8c+sGVgp2LaIsgD0AZjesfKAzC
	8m4ZGD9pD1le82zyps+6/YFM+Q==
X-Google-Smtp-Source: AK7set+IshfpqoWnvctuQzvDvkpgdvAbbagtzROSYTvPetRlM7bQOGDBLySLCCSZsdmI7Nz/eTh+Kg==
X-Received: by 2002:adf:cd84:0:b0:2c3:dafd:c729 with SMTP id q4-20020adfcd84000000b002c3dafdc729mr20385856wrj.47.1676279816339;
        Mon, 13 Feb 2023 01:16:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v14-20020adfe28e000000b0027cb20605e3sm9983692wri.105.2023.02.13.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:16:56 -0800 (PST)
Message-ID: <0000e9d1-7876-0830-4ec3-dadc69f8c54d@linaro.org>
Date: Mon, 13 Feb 2023 10:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 04/12] dt-bindings: arm: mediatek: sgmiisys: add MT7981
 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1676128246.git.daniel@makrotopia.org>
 <7273678366079b93ee19c4c6f6ea9bc13cd8dcfb.1676128246.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7273678366079b93ee19c4c6f6ea9bc13cd8dcfb.1676128246.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_011657_967259_FB6F4308 
X-CRM114-Status: GOOD (  15.08  )
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

On 11/02/2023 17:02, Daniel Golle wrote:
> Add mediatek,pnswap boolean property as well as an example for the
> MediaTek MT7981 SoC making use of that new property.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../arm/mediatek/mediatek,sgmiisys.yaml       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> index 99ceb08ad7c0..97d4ab70e541 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
> @@ -23,6 +23,8 @@ properties:
>            - enum:
>                - mediatek,mt7622-sgmiisys
>                - mediatek,mt7629-sgmiisys
> +              - mediatek,mt7981-sgmiisys_0
> +              - mediatek,mt7981-sgmiisys_1
>                - mediatek,mt7986-sgmiisys_0
>                - mediatek,mt7986-sgmiisys_1
>            - const: syscon
> @@ -33,6 +35,10 @@ properties:
>    '#clock-cells':
>      const: 1
>  
> +  mediatek,pnswap:
> +    description: Invert polarity of the SGMII data lanes
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
> @@ -51,3 +57,19 @@ examples:
>          #clock-cells = <1>;
>        };
>      };
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      sgmiisys0: syscon@10060000 {
> +        compatible = "mediatek,mt7981-sgmiisys_0", "syscon";
> +        reg = <0 0x10060000 0 0x1000>;
> +        mediatek,pnswap;

No really need for three almost the same nodes. Just choose one - with
or without pnswap.

Best regards,
Krzysztof


