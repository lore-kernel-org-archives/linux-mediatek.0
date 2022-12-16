Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2856C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVBkOpfAYZxWE0+rYS13/gFKIJDXEDdtWxxYd6rvanE=; b=VAOwjwRO5P6SLfyDF/4f7gWQY6
	nJ+R4zfcGuix1mnERUgEN7ElKKx+M42X3T1pBFjHFjUvirAne3wYI3hKQSaZ+1IotjCsc5PeY7rq4
	3J7QDtC1mpZm/NUsaW0k1IOlSLd/sYUiZLVyvnEb8+Ub1mMMxl9yw7pAiLbegIBwpgha7N6dpUNic
	N0+1nCpFiPZeW2/rX7/gL5gq0O5TQh7ZQiBOY6cfpW8sEb3SVpHl7kYvXit5miJC0ZHUQxPUmTT7e
	8hpCQoDX7IqvTVFb+d8+OMeFH31m+ia89CdS49L0ZbsSMXaEzDI0tagnaBY1kPyy75b/KufI5IJAD
	dK2cLvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68mb-00ER53-Jr; Fri, 16 Dec 2022 11:21:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68mY-00ER2J-7k; Fri, 16 Dec 2022 11:21:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1499732wmp.3;
        Fri, 16 Dec 2022 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVBkOpfAYZxWE0+rYS13/gFKIJDXEDdtWxxYd6rvanE=;
        b=Iot8Bh9+xa3SjKPmbkeHmZKvmaOocwiF58oJi+ZrCINaerAm+qXAfowhA+gQfZAcLE
         EJUdTXEXViVikJzCrBCq4i98uocGEgBbfmrb9q9nBh5Nmblecou6t9oOpW6uRWLK1GBz
         MEetQ2jCbq3XoLDmWIbbd35EDhsQvOmEY/h9HW4YmzUL3F3PFahNQNc5KS4xn0UUux1Q
         5SzTp/lPaTaBRVUpxZNEqAYIuQc9CGKIpdGMwoRcr4tRRifWMNk19vKOKzzLHx5k75Vg
         ymhJgLrxT6Ei1LDPjXDrQNXKzQ2yPhxUrK/B02IWvXoqvYxyoiIOyLiozp/THiJ5nlXf
         3C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVBkOpfAYZxWE0+rYS13/gFKIJDXEDdtWxxYd6rvanE=;
        b=WBcvDJzt1nW1ujXmM2CX1cjATLBihloDH1SDYzL8WTwC+U/Esr2HTt2i+dSotpk4pm
         il19zi62/tx0wxWSRNROe0qhjgd861MLwmwEq/Hb8UGbbEkdh6k/nIaGuTrqVRxeEpMH
         hbO04H+bstnGTQGqKArIcgkz2mrmlHsBBENbd2QVJHFFNL55sYHmwvdi2JRlhTCb2HTF
         W/VyVGuQvqt4LJNoFEYr0AmI12HYeFAN7uaFM9VHrn5e7261MGNaBNaqdIz4gO58nZWO
         txSBW7rYhqNuhC6lVVLN+5zBDdj37xSXo4HXK9c3VZJ86g172gKU0zI9rQppHfkluJX7
         SUqQ==
X-Gm-Message-State: ANoB5pmPnV+WTEpWMb47v+LArgRv9m974uEnfBNQOhc5DT5XU3DsXyYO
	Pl/LaO2wCosghKPQNH/tq5Q=
X-Google-Smtp-Source: AA0mqf7GB4tSWpDtLhelhZuynKxnu977KSCTCyRT5cUWJqYeo9WRE8n6Wpjo2J18u5oWUE7FtBHcKQ==
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id o16-20020a05600c4fd000b003d1c0a14804mr25269065wmq.17.1671189696664;
        Fri, 16 Dec 2022 03:21:36 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b003b492753826sm2442120wms.43.2022.12.16.03.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:21:35 -0800 (PST)
Message-ID: <ee793350-f5da-7a63-fe2f-d4d081428021@gmail.com>
Date: Fri, 16 Dec 2022 12:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365
 SoC bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-7-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221213234346.2868828-7-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032138_315431_7A02A4B2 
X-CRM114-Status: GOOD (  12.39  )
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



On 14/12/2022 00:43, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index a3c37944c6305..c119caa9ad168 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -35,6 +35,7 @@ properties:
>             - mediatek,mt8188-xhci
>             - mediatek,mt8192-xhci
>             - mediatek,mt8195-xhci
> +          - mediatek,mt8365-xhci
>         - const: mediatek,mtk-xhci
>   
>     reg:

