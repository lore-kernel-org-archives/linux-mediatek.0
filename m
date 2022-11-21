Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92610C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVqUBkccUO74jpGwRk+0I2DcnpQP7VCCZIkeNtWiOpE=; b=Jham3npw7conmlhV4fGxWFO2cY
	/gSwW2sxfahuk3zrWliFVu0GQtknu9ZN/w43WwF8akza20kJgVU/7U6I/l2p0CdG2ZjanR+hTibXT
	F0eGyyy+S5gozRRbMgmiB3fbFp8HHhQ1gUeaSSrbiwiPo4bbwDarfjBr3lPIFRk5fFooYBgOxti7c
	2cQb8L69hhQ7XY28MTyjrIE+tygeDe2J4Tcpq1+Y7+ydpef9eXkMK+4JWf8yt98PEwZ7DtP3XZWmK
	Ug/6+oaWKXcRGmwchVp54DbtBpMa7sgArf9nz8c9Ci5SOMB81F7BXP/NWX2M13JLLPir9JWiLThjI
	kgg1ypAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox62x-00DbR8-DI; Mon, 21 Nov 2022 12:37:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox62b-00Db7W-11
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 12:36:50 +0000
Received: by mail-lj1-x231.google.com with SMTP id d3so14378644ljl.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVqUBkccUO74jpGwRk+0I2DcnpQP7VCCZIkeNtWiOpE=;
        b=Y3eucGiwI5BVrLdmmJzatUGPxjEd3oJ1t1nz+gZ4K/4gRhFqPcdaJgSvBSMGcT1oHV
         5ZBhd0iUdOussRJrrxVZ77aNXBzP8F5MbvhmCrTnucPu1+0MbfSIIZjzN93koqHiv/xE
         0E9JZQWkVjVThQpQHxltHws0FT4cNnEJssF6ojqXVdQqv71JwdcFkdi+r+s9q4/Ta2Vs
         lX3R1PtMd1uKRsbhMo8Z7gwJIy8NBrdVzAL4eKc1Y4Nukgrp0cwB0elHeXSCPGJQu7Nw
         X/oK/I94pMpEVIx0GsZmLa9scghtzDFxf72aLPAcP2NwroB+/4Q6S2c4tcCBsB/cdFDs
         9RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVqUBkccUO74jpGwRk+0I2DcnpQP7VCCZIkeNtWiOpE=;
        b=36AhjwotBAV6yECjmMduweoHKf59XbAJxLClesrd8zSlHA2GMLQ6VcOPh16uYDmz+z
         YDptJQKTCzeywcQ0iXMx02USwmycTS5FOOEIz6fuWlfjiwbQcHaGw3KxMqWkc5axyCYy
         fMgYP6TcTpNHXrVPKqn6XytbKItbnch5AzTTj3jCFrAxBA1mA2AeVDQIzzOrxdKeNk6y
         cf6YVQu0qNc4eh7rk0EtJSDpEKwi9MKODtFo1U4QtXKh3WWQGc03ex444TZCjQHwyugE
         Leau+onzOpuBUAPTzwEDj9v9+vXaSX2uqO0AH3oVJJRXUHu/2qm4RrQ9ZB215ItOpIIK
         mibA==
X-Gm-Message-State: ANoB5pknw1G/RzkReGFILSp/vDYgtVi/LsriRdrPsLUKfF+SWl0gW1BD
	1mLzSzR8eQLw3adGiG4LeeXZpQ==
X-Google-Smtp-Source: AA0mqf73fnJYF1Gt8sIJLcnzF17Iqsr/0vCWKscbqba1N6/1xq+5yLwMROsV8eqspQPv1DmynkHwZA==
X-Received: by 2002:a2e:97d7:0:b0:278:f437:9c43 with SMTP id m23-20020a2e97d7000000b00278f4379c43mr5201339ljj.342.1669034207437;
        Mon, 21 Nov 2022 04:36:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id dt27-20020a0565122a9b00b00492e3c8a986sm2004197lfb.264.2022.11.21.04.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:36:47 -0800 (PST)
Message-ID: <48a64598-5140-1949-8e93-7257ccadaf63@linaro.org>
Date: Mon, 21 Nov 2022 13:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/9] dt-bindings: pinctrl: mediatek,mt65xx: Drop the
 pins-are-numbered property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-9-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121015451.2471196-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043649_108286_29A77FF4 
X-CRM114-Status: GOOD (  10.88  )
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

On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Drop the pins-are-numbered property from the Mediatek MT65xx DeviceTree
> schema
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml           | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index cca9cc58a6934..cb450da49e6e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -28,11 +28,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  pins-are-numbered:
> -    $ref: /schemas/types.yaml#/definitions/flag
> -    description: |
> -      Specify the subnodes are using numbered pinmux to specify pins.

Oh, I missed that patch. There is no need to split it. Squash it with
your first and rather mark it as "deprecated: true"

Best regards,
Krzysztof


