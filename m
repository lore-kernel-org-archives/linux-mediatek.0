Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602E2C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSfrhxT9VAnyJPjGSsK9FNWQxpzeB1/ysg0wyIKwNbo=; b=y5x0B++8hRWiIXunvInfwUFaAx
	8dL1MJmX91isC/HC11Pw9a2GowzOlq57QxtfKAw1nHXm7sgJ1ulhrEo76oci9sbrVvvPNZPq8VOB9
	HQDtqETI2ocqW0ETJVQ8xeosq+3pMLTEor77ccfv4mlTrPoJ0dGrss0q21VocKa6EOuU29kNax90E
	oo8+U0L6TVc0hwuboj1nH1X45mtZxGB9N/QNgXlXRievlmxRqD3KC8sWxjOClkJCXKZo8pDhOzxQx
	JIC2nBi9nslvjvKY7gMJQopRPnar3th9YncaHkGGz1FeGeF8iFmFy98RIxYE+h6SLeTWt5XKJlnEM
	asI1SPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRL6-0051qQ-Fq; Tue, 23 Aug 2022 10:40:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRKv-0051jH-EO
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:40:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id m5so8425652lfj.4
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=CSfrhxT9VAnyJPjGSsK9FNWQxpzeB1/ysg0wyIKwNbo=;
        b=o+1s4+z44hI/KKr1Dk4qJ+cnrbPWDs8HpV/rQFs3+CacWfFtNXfe9dRvuqwkZRw1kc
         TbHlDRTcqTMkXvetmyrOJRl2dnEHtlVHiI/uo/qjVW9u8NexN9+2pO3bWk35B/ENgxbW
         PuyaXqnI/SSRC6U+OAa0UKqeKmsWjGhgBlaDxpIAzd/pNZtq0pWCHTY3lRym0DhiuZcU
         MEzvyxnEMTVFLDatcNczSPVgp6fbw7xKUfEq4R66aCk71Wu3cONBdxp6IuyaqMrlJ5T6
         67b0sOLDYkPeo95GXojgq758B2zAOnGyFmq/dkizAnzzjanAQ7dUQPg0y9qY9CULa868
         WH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CSfrhxT9VAnyJPjGSsK9FNWQxpzeB1/ysg0wyIKwNbo=;
        b=Ij2C4HiZF1haBhR234UaCtAp2p9FQcpQQnHcbY+6huAS1U1fTH1xXERviqVQH45WeE
         KArX8//2lR8i8pqW74IQyIZCMg/2lM232f7T8+wFO/Vrq4CzLaAiRWvxadvwTItl6/3T
         8WSOxt+YA0IQTEdwTLt9w/FwEbLjVATNKAa7Ftf4ylQNiu6dFOp5pCNny3TX8qNVhr6d
         +rJBy+DNVYUtZ+N96Mp6owK0iMWEmaMUcL3nNABB/XasqDKJ2yLfZO1rgYUbcDGYwMeB
         bD6dzHYTQfrhj3u6ltmOxUssiLkrjgQ4jsN8JmcjbIj7zGLsiAt+CLJXYMIfnBPiCy1M
         O6Zg==
X-Gm-Message-State: ACgBeo2r0yIqy1UEO/is4JnRhA1ogMheOBwuw4pqEpp2um3TUfezfouJ
	dRKBX8r6sx3qxTWzJ7G+d66Mlg==
X-Google-Smtp-Source: AA6agR4oA347epn9X35znOZfjzfSU5oXZ19wKjNx051aYhSs5BsqebDkkBZnPa3Fk9VNmwyv6D3b3w==
X-Received: by 2002:a05:6512:1322:b0:492:de5b:dc3c with SMTP id x34-20020a056512132200b00492de5bdc3cmr3880326lfu.503.1661251242988;
        Tue, 23 Aug 2022 03:40:42 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e8e74000000b0025e1ec74e25sm2300758ljk.43.2022.08.23.03.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:40:42 -0700 (PDT)
Message-ID: <70ae25b9-0500-7539-d71f-52c685783554@linaro.org>
Date: Tue, 23 Aug 2022 13:40:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/6] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
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
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-2-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220820080758.9829-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034045_516437_15CC99ED 
X-CRM114-Status: GOOD (  16.63  )
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

On 20/08/2022 11:07, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 36 ++++++++++++-------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 17ab6c69ecc7..edf48e917173 100644
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
> @@ -61,10 +62,21 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt7530
> -      - mediatek,mt7531
> -      - mediatek,mt7621
> +    oneOf:
> +      - description:
> +          Standalone MT7530 and multi-chip module MT7530 in MT7623AI SoC
> +        items:

You have one item, so don't make it a list. Just const:xxxxx

Same in other places.


Best regards,
Krzysztof

