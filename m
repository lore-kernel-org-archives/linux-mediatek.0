Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EADC54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLICRt9GCJHCS3DI2MlqTXOZAkPRxSOAwmw8BMYEFig=; b=BtZwG6kJDLqgXXpHWIL0j9E8JQ
	AyRcZj/71wBUVrBRCe4hfyb/s1FIi5KNyxznNuDtgIoOdDwt3tdfcMQOo+5hERsv3WvH0XOjRn2vj
	8Zrsm1o7ocJ7CyeoV9XksGSGzIVjpI5TYylQnsTTkYbl5uV6KDMFfx0OFFu0mGFI2DoomkJq+ExQm
	gBPT4U+TIsXlhvSQwpqESS8eBqXi/ortfcdOLHP0ab9FPi9ehM0qqR9FeZNQ/nRJW6lTjr3i7/qiP
	5K4NRTXPQqVrS1fFuZ25MZeuKuShz0pm4VNsGTV+9yOxZesThEX+6p4iK/wwh8we5sRfiTn2HWo4H
	HTJiAX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8h2-00000003X9E-0nRb;
	Thu, 07 Mar 2024 08:01:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8gz-00000003X6a-0SUX
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 08:01:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-567fe9d7741so687071a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Mar 2024 00:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709798487; x=1710403287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLICRt9GCJHCS3DI2MlqTXOZAkPRxSOAwmw8BMYEFig=;
        b=p8O/S/OFr9PxThMLrDES0LoG6J7KOeBIZcKweB1aeMVM/0ipfCmAmE4A2AHDnfytsL
         737rbE5vxMYTH/hXR4gVARxpAg8WY7sLQFKbh+WWB0ePMecq7DfEEAO1MFnvpIGoexTK
         sAvC/PDeApkRo6uqkrrf7a6YoxTgeqRyhgpbsSNlmwCekzWn3e97vVnEofvT2VJn2BU1
         WvVrK21VTlin7g2sekSHllpZ6hQfOE/J8d9XDY7Q21H6UlWiywNsjcee/PsHBfNyfQwG
         ZEKFuWkwA3NY2ZCjXnXQEvztAPeqAo8XBLNJyntDBRYbjccsGCaIvALym4NOEz8Pvb1h
         GtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709798487; x=1710403287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLICRt9GCJHCS3DI2MlqTXOZAkPRxSOAwmw8BMYEFig=;
        b=CT9AqxpCwzN1m0P8IpA+/dNi1CJu/e0sJfxPi46fIcxIi7NKeDW5O1BVJrTrnD95Zq
         AP+jvWtWupSVj0FoEe7TDl025aJxqzTG62VaGOAx3mSvjNZMqzHxPvXc3+lZR/e/xCw+
         aA3MN5NVC4OZpDgMGNY1B+vInb7c+cFEZRaTlKU0EPCaiRvmPSsLHa7+2HmLAPt24av8
         7zJjkVEZmgPU4+1Avzu/lwsG+UA0EIlVcts6pHaFO3ZKjOzSf032QlvocTVtLeI0/d/i
         wKGZjbOJwdNTXTRmShMZRvmECAA1SIHyiXmIsuh6+OMnKOtz7hwNrokK/ULjDSJ1HRS/
         6GbA==
X-Forwarded-Encrypted: i=1; AJvYcCUTHoovW7S6aUztwm+D0J5ZlQudmEAMIHsIpNWxvuSVCDDe8CZyqNOPKbNv9x01LUSPGMdDjqkT8v7Ug9ZF6Qa7hTJOjATWUjh/aAa/jxDlWKEX
X-Gm-Message-State: AOJu0YwITJuiYACqc+ois3evTdWOC+xYEGRRb+cOD972Ku8qDJlrRjyE
	PaePvYurgJ2Rsb8ZXGGxTUKWFHK36ibwYhIUC2Cjz2epNNKIHM5O7DYhce1Jtk8=
X-Google-Smtp-Source: AGHT+IGT2JV4TDS649+Vxblbkn5aso4fvOG/svjgAVgBOSUaPOqfhCNWY3t4WpRju5WLafM5hj2p2Q==
X-Received: by 2002:a05:6402:1b0f:b0:567:e78a:4444 with SMTP id by15-20020a0564021b0f00b00567e78a4444mr2761514edb.39.1709798487058;
        Thu, 07 Mar 2024 00:01:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id c28-20020a50d65c000000b00565a9c11987sm8121750edj.76.2024.03.07.00.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 00:01:26 -0800 (PST)
Message-ID: <73e7a642-d993-485f-9ccc-abe3daf79390@linaro.org>
Date: Thu, 7 Mar 2024 09:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: dts: ralink: mt7621: add cell count properties to
 usb0
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240306202131.2009-1-justin.swartz@risingedge.co.za>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240306202131.2009-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_000129_466183_331A4FAC 
X-CRM114-Status: GOOD (  14.08  )
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

On 06/03/2024 21:21, Justin Swartz wrote:
> Add default #address-cells and #size-cells properties to usb0,
> suitable for hubs and devices without explicitly declared
> interface nodes, as:
> 
>   "#address-cells":
>     description: should be 1 for hub nodes with device nodes,
>       should be 2 for device nodes with interface nodes.
>     enum: [1, 2]
> 
>   "#size-cells":
>     const: 0
> 
> -- from Documentation/devicetree/bindings/usb/usb-device.yaml
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 2069249c8..f02965db1 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -309,6 +309,9 @@ usb: usb@1e1c0000 {
>  
>  		interrupt-parent = <&gic>;
>  		interrupts = <GIC_SHARED 22 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Doesn't this bring new W=1 warnings?

Best regards,
Krzysztof


