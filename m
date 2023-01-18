Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B77DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmrZHvM1DlPNSOW3Xlkk3jNqiZi+8RsKuRw9Ed+dB6M=; b=ZeICJQkQs4X/WlTEAckt5PiGGt
	yL5of3XF2cu7TEjbGL5npliaCc7ZohtseQG7yua77fKZL2UXyJi93GdvG7XvP45Lhcs6/2j8kbnuj
	EllbNg8OJ66l7lUYmXg8/24S7yDtkVO/GdRk65vNWR9PYMqRfiiWAvwYUEdBkbSqvtO/8pHyziFsk
	1l+0Z1BgCDmXa9zDpFJWfMFLF3ptTIqcyrp2rY0Dq60k1o6hexSsO6aWAEanEmhtkk977J9ercODY
	0TMDJurika8w2tHCY4aGRawhpRMCoQ668j91b6HM37lhh9Tf+B6jE5gb4P1pKImVLv1Ny4JtirAe3
	glktsJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6ik-000YiW-Ph; Wed, 18 Jan 2023 11:35:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6iY-000Ycs-4F
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 11:35:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q8so12642825wmo.5
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmrZHvM1DlPNSOW3Xlkk3jNqiZi+8RsKuRw9Ed+dB6M=;
        b=soyoUjyM6lCyBm738nBiG3QZMffXSdK/FAbzUKQqOOnOa1KE2ODZHiW4vHSpHOAkWH
         nlnuprkLbTVnqi1A7qa3Awa/oQyrcNjg/L7DKmSm6W64tZR+JTG/QAZgZmeW3OfvIoG/
         o/6xscBJP90jIQPwbDIwnEd8lGR0NVafYEvz7yK2nRTP3HL2A3GlW60c+l35lzqdAmdB
         P/M8gGXfNWf1T1dyCYupm/TM/DtBF5vVW/DSNnsib+1GXYKfeZBov8cFJ4gnypsY8Wfi
         Q/CUdcrNIu57jnqT3/Txa1tbUBUTK6XFZeF6BJSUkJ8qeODvXHWWs0KVxa/l9xra8kLx
         hxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmrZHvM1DlPNSOW3Xlkk3jNqiZi+8RsKuRw9Ed+dB6M=;
        b=dxW2rlD+RmGqm6veYi6zP+i3eaPubHsftCaSo9kYlZOCCW+GleOosmJ0xZYoSWc13x
         Rbh0ZsdkTPGjonPR9VJ53Her18E7ED7WwXSwOj8unPE6aDs16HoUp9pMYyVDrj0usF0n
         ioDrfTMAsWZ0CJkiA1xb8/WGJwroEBEIck4xOoCd7IL7odLj4koQFNPpDNZwoNQzNRC2
         CxBc3TcV7oSalZZGM/3lKGLWcoNcRcaJR9pFbv66WR/arWvt1wmAZqcdpfAAb40vpZBm
         HMDyAAzeO6NjLbaf92B0hYlgOX2hDfT2XN9NCkCn0s8vbqO248Lbzd6Zc5AEheUxZE0t
         AFUg==
X-Gm-Message-State: AFqh2kouRHX2d396707ESEzDThBhKRmPEosor/w0f1+1YUEs78jH8SmF
	MKJyJMK50g4TDglAWWDkl1HEvA==
X-Google-Smtp-Source: AMrXdXsLfr9LdA2Qpx9wkQv4kWlO1tu+d9Q9P47dtmh/jHU40qAohVcnlAkJVbaTTAmxwXJnbjnN4A==
X-Received: by 2002:a05:600c:c8d:b0:3da:fcee:2ef1 with SMTP id fj13-20020a05600c0c8d00b003dafcee2ef1mr6266128wmb.32.1674041694337;
        Wed, 18 Jan 2023 03:34:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003d35acb0fd7sm1716356wmo.34.2023.01.18.03.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:34:53 -0800 (PST)
Message-ID: <d2b84b4c-1529-8709-b9eb-3cf21ad8cc7e@linaro.org>
Date: Wed, 18 Jan 2023 12:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx
 I2C PCIe clock generators
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230117231626.134588-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117231626.134588-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_033458_233909_F99E1E30 
X-CRM114-Status: GOOD (  11.03  )
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

On 18/01/2023 00:16, Marek Vasut wrote:
> Add binding for Skyworks Si521xx PCIe clock generators. This binding
> is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
> generators, tested model is Si52144. It should be possible to add
> Si5213x series as well.
> 

Thank you for your patch. There is something to discuss/improve.

> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: XTal input clock
> +
> +  skyworks,out-amplitude-microvolt:
> +    enum: [ 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000 ]
> +    description: Output clock signal amplitude
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c@0 {

Just i2c {

> +        reg = <0x0 0x100>;

And drop this one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


