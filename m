Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E90C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfe/hV+Rb5o9a+XFpxwa7AcGfaflt1m8Wn542eQ+zSo=; b=OAue4hpRRuWJGdI9bPa0OC+lNq
	kisdzKdkFNISy/ZbyxouN+b791L77bkquzpHVPKA61tt86aaq/pCoJMXNxHlSI7gclEQa0ZDthKhe
	iETbD9wJbPNum7L0oJAcuI77xMFpr5V2gd3bv0/3HGm+t17hC8O90FnsIdpY+SGNI6459bDayYBM4
	9unuUBXBjxJOKxZ5QVkusZzVNaxH/dWNvHDFvsjXCLYqeQgR8d+FlivYZWl3x5GYx2/n21gVax2QG
	pAg/DVnYYv1xavEg0f01/m43aPQePovxVPuRLbsjWNUoupcLO0LrmOQ2csfcaBV0p9u8u0S9SCfJ3
	D43SALRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUpE-00000008AwP-0uEp;
	Fri, 08 Mar 2024 07:39:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUpC-00000008Aue-14vy
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:39:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a4467d570cdso59812266b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Mar 2024 23:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709883564; x=1710488364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfe/hV+Rb5o9a+XFpxwa7AcGfaflt1m8Wn542eQ+zSo=;
        b=lBrUgmOvK9kynYkpJrP7wtbo4Hcp/fRSSzkgTzs1GfPO2HTOzCVt6s1ameJlIvhNiN
         78QslGhVL8mjnG7SOH0xFReWCIrMme1BvXpGQQnwbJLUAMYsHBic/3QeDycsqmF8GwUV
         hyjLxcyQUfmIEBtOxfo5v1SbgR8/AwDKFEcMIwt+zD9J/E1RfO95mkVUgCUxr7fjNOcO
         XTqfu+w0CO6T7S2t6uQcxaBYBJDXyhfmgItr0YSsS66/nDAOb1NdC5XPlwDwMUuzflUM
         TqWD47xjeB4vyNPt35Mb2Fk/G+i9fPo1f33LxHW+KmfK24WQcM/tz0ptB/eJ1sBGqVRz
         3j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883564; x=1710488364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfe/hV+Rb5o9a+XFpxwa7AcGfaflt1m8Wn542eQ+zSo=;
        b=qANFVI/Y3NxPGVw3UVcyfhMx0UNOlmswy4NnKKNLCo6kr4eSJdLOyF5omgWjbhj+O7
         oxu2vddaOPnROqjhl1TvSTQMyuO06Dd6Xr7HLjLj1Y55coUMpDYk6FsyInZm96jaCB0B
         29Wstq6QfqDNKnKSMVUqd/n2HH1nnCKBhZdOS2XTAZP6PZwYH8mKaMF354n5uaxJG+IJ
         z3O9tGN3NP6WW/vKKaXaUh/liB99co7582o9vI9mjI24YPY5TZAYXzxzvP5qkMIiVLLM
         jRZxwCNv6NJBucX+wPYs5bi1KKJbSDWTu2XRzuU4dXuUaEB6rmuOula3WPx7rhXANTQx
         sM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw7btc1jnwMgJhZE+Pcuzs9NDcA/zhGtr0XzQVdgn511pg4+YH9PcSQLV/H2+IE+pHwMoqYM+EcwlT2cuVfTuHV1oiHeWw47rnZPOXaZ+mbmCz
X-Gm-Message-State: AOJu0Yx2vYksZ7WlyRKKLXDPfQ3QlDSjPPNbYEdA2LlMOGYcNTzj97dE
	0rbqmzACnKWoOIAupoP7ubNI6MgCQGTOMRLBFntYCXmBDBm2tP9Szca+eN2YIzQ=
X-Google-Smtp-Source: AGHT+IHBxhqqXXnLefHVKg5W5tjUWeZ/hVczSWvDPynV6/Q9HcavmOXC3PTE3KpC4xhTwoxQxqIonA==
X-Received: by 2002:a17:907:a093:b0:a45:f215:ce89 with SMTP id hu19-20020a170907a09300b00a45f215ce89mr390704ejc.6.1709883564004;
        Thu, 07 Mar 2024 23:39:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906288700b00a42ed7421b8sm9133569ejd.93.2024.03.07.23.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 23:39:23 -0800 (PST)
Message-ID: <28f260a7-d4a1-48b6-8387-af134b9a600d@linaro.org>
Date: Fri, 8 Mar 2024 08:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: dts: ralink: mt7621: add cell count properties to
 usb0
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240306202131.2009-1-justin.swartz@risingedge.co.za>
 <73e7a642-d993-485f-9ccc-abe3daf79390@linaro.org>
 <48fd88f29482fc1b94439727b2d2484f@risingedge.co.za>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <48fd88f29482fc1b94439727b2d2484f@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_233926_411001_682C36CF 
X-CRM114-Status: GOOD (  12.94  )
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

On 07/03/2024 15:58, Justin Swartz wrote:
> Hi Krzysztof
> 
> On 2024-03-07 10:01, Krzysztof Kozlowski wrote:
>> On 06/03/2024 21:21, Justin Swartz wrote:
>>> Add default #address-cells and #size-cells properties to usb0,
>>> suitable for hubs and devices without explicitly declared
>>> interface nodes, as:
>>>
>>>   "#address-cells":
>>>     description: should be 1 for hub nodes with device nodes,
>>>       should be 2 for device nodes with interface nodes.
>>>     enum: [1, 2]
>>>
>>>   "#size-cells":
>>>     const: 0
>>>
>>> -- from Documentation/devicetree/bindings/usb/usb-device.yaml
>>>
>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>> ---
>>>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi 
>>> b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> index 2069249c8..f02965db1 100644
>>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> @@ -309,6 +309,9 @@ usb: usb@1e1c0000 {
>>>
>>>  		interrupt-parent = <&gic>;
>>>  		interrupts = <GIC_SHARED 22 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>
>> Doesn't this bring new W=1 warnings?
> 
> For a fresh build (make O=build clean; make O=build W=1): I do not 

make dtbs W=1 is enough

> receive any warnings regarding mt7621.dtsi or my board's .dts file. I 

I meant for other boards due to unnecessary address/size cells, but if
you checked it is fine.

Best regards,
Krzysztof


