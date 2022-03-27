Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B8FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOx9l0Z1ZaU33MtoYDdHlCC+m4tu0aJTIwng8c/3qnA=; b=moWdmd014QtzE6
	bnVdi7+LbXSDHKi3H1zIEHZaZiXovUbTIQeaJNnUS34jlCDkEhk9qOCdelk7Mqjd1pkRBI+9MzrNR
	WuAktz+idO2hAh5X7l34ofmW5VZV28HuDZHq+3hhmNRH01PCCbLRyp1CUxMwIAkqcod36dhzLYazU
	yJhOsWs5pQln74kE9B0VLmd9zuspmoc2SNZFFWg/jMAHd4O8yZxPUJkuiITMP8AKXyYnY5FAhkDsG
	J5Ba6ZFleA/4TSMqFR0o2ll27q7eBw7h8R24BfqJfusAtL5tbD3XZ3G8vXbOWhqm5/kTe+xCAAODo
	4MYIE9O3gMrX0ZUDUC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYXsi-005u0Y-2u; Sun, 27 Mar 2022 18:44:52 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYXsW-005tyG-RU; Sun, 27 Mar 2022 18:44:42 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so4744480wms.1; 
 Sun, 27 Mar 2022 11:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AxR3p4JpHPgr/VlvsFgwAIBMlsSazNinrnYeQnbHHDI=;
 b=wLqGueuC0qV92ccQfXGb3Z+r+Tm9ukgXX9Jt0EEKrjRx/xPveT/DJFXHGrsIiI8fHa
 T+f5Q08ldtmmH5rYGy4UDAQtkF/hdp3vyV4t2AneZY5SkL0/c6D86DEJtO9AOhY3yzQh
 hvJhliNm+D69RAtht4YiXEMzUn36xjNoDrrYnSvYz2l39Kp89ofY491r5pvztdN5l6U1
 TdAcYQln8NYsPnCmSR2OW+pqXjzset819ctgXg470EQSDu/SdFEfKHmPHDQQTNmZ47ML
 dL423QChR/wuevZuj/2Jvy+7PP26zb6s3f0cE2xL6I7rpUdqLIYuONM5+FcgXy1VVOdA
 oz2w==
X-Gm-Message-State: AOAM533+kbfbGiTAxB7U9NhQYz57lgJwj5Hbk4UKY67SqGUqRWJ1un2j
 Rsx9/vsu+M2tbUwRUtL2OfY=
X-Google-Smtp-Source: ABdhPJwewBgMpiPjnGygzz6MM1w7bJIXiSaYTxbNpycR3YhFVvV5QsOeyiwdS3vDi/xpJT5Gf7VxPg==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr20385514wmq.17.1648406676176; 
 Sun, 27 Mar 2022 11:44:36 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm12023109wrc.6.2022.03.27.11.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 11:44:35 -0700 (PDT)
Message-ID: <03277cc9-fa7a-71a1-331c-02734755d07f@kernel.org>
Date: Sun, 27 Mar 2022 20:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: arm64: dts: mediatek: Add mt8195-demo
 board
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220327165837.3048639-1-fparent@baylibre.com>
 <20220327165837.3048639-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220327165837.3048639-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_114440_928591_662A87D2 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/03/2022 18:58, Fabien Parent wrote:
> Add bindings for the MediaTek mt8195-demo board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ab0593c77321..1f68afb19d81 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -131,6 +131,10 @@ properties:
>            - enum:
>                - mediatek,mt8183-evb
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-demo
> +          - const: mediatek,mt8195

No need for this entry, should be combined with existing 8195.

>        - items:
>            - enum:
>                - mediatek,mt8195-evb


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
