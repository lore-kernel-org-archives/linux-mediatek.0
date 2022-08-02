Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FB2C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzB0a7bJOMuRv01PGiHsY1rvic1GuiUFISUsomCCCOo=; b=2KGSXhhAM1NVXgiB33h6MEXbh4
	Rfz0rI6kkkZtURf/iTzAo8fQ549gbx3o++dmys00tupKOCg1HFmc21o4gEJsGDGONQvyOeLP+4z94
	44RSmmZupWuuyvlj6r57TbLOB/fbUrPj4g2GYsisfDACvIfvEV8niKiEMFmE1xfbitljcpQhv1FvL
	JgeUhugZROkhrKUnW+ZyU3nT7a5/nzWaY+R4K2B4VD5l+M2/UFxAQnBlrDdb8PAeNJMjmrCcA/XCy
	D8IaT3Bl0UXKFS49V6hB0MpLygvRPtkK7W2W5i9VC3Ji2838+dDWLqiKyDqNr6ClTNPA9Hmtup4OV
	Win1xy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInTM-00BwTp-4U; Tue, 02 Aug 2022 08:41:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInTH-00BwOk-7p
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:41:49 +0000
Received: by mail-lf1-x12b.google.com with SMTP id y11so20921487lfs.6
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zzB0a7bJOMuRv01PGiHsY1rvic1GuiUFISUsomCCCOo=;
        b=FGiOqoB701ZWcSGMUaQswKviPECFcCRkpb1CO5b7T7slyTtpMvgZLLV6NZv4POrW3A
         8KxoyNm4hvlQ39tHXnv1WTlPGfm4VwNAbmheiMYG5htaEo9wiHviHhhbehHK9+BM69dZ
         NyZ3qlzJbke68yc7fuGUCf8nJYbMAcXy/exARn+DYXlbv/5Ldrl5wN1FhsetYXS/rNlo
         MsVvjSNyIdpmYIMdW+LURg68QqTKLFfEEha5nzX/+71DcMi352uN2HPEY2i/zJj5Vrob
         Sc7aki4z/6Cvxbx2OQ4zEY8V4gYluEfFcHvtaYS+MRvfu6PGwN79mL3GtQHxzWt/Rqec
         xT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zzB0a7bJOMuRv01PGiHsY1rvic1GuiUFISUsomCCCOo=;
        b=bQQLAMJnQaSg4atHwrJ5REwWa1+2N2KbuQWoe2fxjBJwozHIrSrAopCXESsDGgmUBm
         ClaliKIQL+TCPipZFzjM1eRB1uRdKSJ7jxkXXkDcOYpvhw7kxqGLcHIR1u6PjPk+4Dn/
         bV3kR7uihKexg4IZpBtkVNvryAFQ6RFWG15oYtp3BbhIkErGqoDfTKKKe8YbubBf8YYq
         NdOF2EM1ERpzyABKgZv7MhqtQ0kr3jK+q+K/eaJzNZq2YlL5DAv0n9d7e1OlI3AM2w4A
         inBhiECymTpktpeZp6zoNBXIdBwPJPdVrR7yq1lyB6iu/+8lLf7C6PHZj82NusMbKSOk
         0+yw==
X-Gm-Message-State: AJIora+CZBypIyl5caddCNIPpqYKpe7MdfaPPBnzjnsfHoa1ZfZ8vuXG
	aT3PWM2zPiWZpc26adQSPyJW5g==
X-Google-Smtp-Source: AGRyM1vJSAY2q/uqhkA1XSIumtj2KvUDJDe8nq4mEflYQj1coZO+qe9bEl83kK9K5j3RD9tqV2NHeg==
X-Received: by 2002:a19:6d0d:0:b0:48a:8b3c:e28 with SMTP id i13-20020a196d0d000000b0048a8b3c0e28mr6420470lfc.265.1659429705435;
        Tue, 02 Aug 2022 01:41:45 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id e12-20020a19674c000000b00489e2156285sm2021463lfj.104.2022.08.02.01.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:41:44 -0700 (PDT)
Message-ID: <cc60401b-ecb8-4907-af3e-bb437ae1421b@linaro.org>
Date: Tue, 2 Aug 2022 10:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: mediatek,mt7530: make trivial
 changes
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-2-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730142627.29028-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_014147_721653_7899855B 
X-CRM114-Status: GOOD (  24.68  )
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

On 30/07/2022 16:26, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Fix MCM description. mediatek,mcm is not used on MT7623NI.
> - Add description for reset-gpios.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 27 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 17ab6c69ecc7..541984a7d2d4 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -4,12 +4,13 @@
>  $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Mediatek MT7530 Ethernet switch
> +title: Mediatek MT7530 and MT7531 Ethernet Switches
>  
>  maintainers:
> -  - Sean Wang <sean.wang@mediatek.com>
> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
>    - Landen Chao <Landen.Chao@mediatek.com>
>    - DENG Qingfang <dqfext@gmail.com>
> +  - Sean Wang <sean.wang@mediatek.com>
>  
>  description: |
>    Port 5 of mt7530 and mt7621 switch is muxed between:
> @@ -66,6 +67,14 @@ properties:
>        - mediatek,mt7531
>        - mediatek,mt7621
>  
> +    description: |
> +      mediatek,mt7530:
> +        For standalone MT7530 and multi-chip module MT7530 in MT7623AI SoC.
> +      mediatek,mt7531:
> +        For standalone MT7531.
> +      mediatek,mt7621:
> +        For multi-chip module MT7530 in MT7621AT, MT7621DAT and MT7621ST SoCs.

If compatible: is changed to oneOf, you can use description for each
item. Look at board compatibles (arm/fsl.yaml)

> +
>    reg:
>      maxItems: 1
>  
> @@ -79,7 +88,7 @@ properties:
>    gpio-controller:
>      type: boolean
>      description:
> -      if defined, MT7530's LED controller will run on GPIO mode.
> +      If defined, MT7530's LED controller will run on GPIO mode.
>  
>    "#interrupt-cells":
>      const: 1
> @@ -98,11 +107,15 @@ properties:
>    mediatek,mcm:
>      type: boolean
>      description:
> -      if defined, indicates that either MT7530 is the part on multi-chip
> -      module belong to MT7623A has or the remotely standalone chip as the
> -      function MT7623N reference board provided for.
> +      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
> +      switch is a part of the multi-chip module.

Does this mean it is valid only on these variants? If yes, this should
have a "mediatek,mcm:false" in allOf:if:then as separate patch (with
this change in description).

>  
>    reset-gpios:
> +    description:
> +      GPIO to reset the switch. Use this if mediatek,mcm is not used.

The same. Example:
https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155

> +      This property is optional because some boards share the reset line with
> +      other components which makes it impossible to probe the switch if the
> +      reset line is used.
>      maxItems: 1
>  
>    reset-names:
> @@ -148,7 +161,7 @@ required:
>    - reg
>  
>  allOf:
> -  - $ref: "dsa.yaml#"
> +  - $ref: dsa.yaml#
>    - if:
>        required:
>          - mediatek,mcm


Best regards,
Krzysztof

