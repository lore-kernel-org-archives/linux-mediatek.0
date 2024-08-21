Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FA7C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2vX0cAcL6u6kB8S2gDC6BZ0GpOYUqLhhMzp6ZJx/1c=; b=lkry4tXZ1S7rWEk2ITPL/iG39T
	yvGkg7CjNLMhtPZ+KniGoQdIbD+2NIUfyG0/TCWMq6RYgWzUCZY7rRo85hL3VoIvBm3zwoVQfIv5V
	/dvh2JBWWLDueCbxtmo5TW7wcd1itImzcuWVP0Bn1ZBXRMGjSaMSPmgo4qr1YnZIvVqebbcMlHxFc
	e90EUKLBha9iijwtXms043bbb8GujR4uAuuFEY9rOL0wFYiiX4r/C8zi8nvVfsL5VCRxi6ZXI9/eR
	ZlIXqtAT2l0wW8p8mL/HH8VxLiJzfGmPxQBoVFbtLS1nSN901lDH/wdPhd/p/vU0H5kB+TCfmf89j
	KWT4j3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgiKB-00000008NCI-1lU9;
	Wed, 21 Aug 2024 10:12:19 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgi8U-00000008KhW-3lzb
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 10:00:16 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-709485aca4bso3305520a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724234413; x=1724839213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2vX0cAcL6u6kB8S2gDC6BZ0GpOYUqLhhMzp6ZJx/1c=;
        b=fj7VaI/pZKgQmiBckSsAU0oghonmCSA70D0LYX3pUUsdw/4w8Saib2VMyNz5NA4a71
         AajIG5BXsZWsnrYnON8rV4VhBRVqMhMnHuimWWVkS6ajNJx0MYrr3yhvkeGlOaH+e9nc
         ViIxCLKpALlEgo5dUyciXT8tsn6Jo9ZSruKQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724234413; x=1724839213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2vX0cAcL6u6kB8S2gDC6BZ0GpOYUqLhhMzp6ZJx/1c=;
        b=i/+dOy2RsdPmKaw7/YEXHPlLLHgx5AwWih1sGG5TRY8ofcHZPW1Qs0VObBykoEFTZS
         HjqvcA7EuDPWgTZ3helVIQQTzlv/BQSO2WKLF7syI0wZR5L6bzQumoHrPoKdCZnCo0Hx
         RWI/Z+bzUzX2jD3xAf339ydaTpnzxV4SODx92k6PoY4XD6cfoM9xHaOqAlcWFJLng+bw
         b9qkwGYZRAJlWUgvlYs5G80ZYP+bMmA1hX+eYecrNt7qnCIqLxbrHJTPWVG82uOvwIuy
         SCGRBcYnUUbkS1/rzQI6djoxCJYHf48puATA6Pt4jlMjK5GyszfITt4e5eTptXCPRGKF
         vAGw==
X-Forwarded-Encrypted: i=1; AJvYcCU+d3NF5SziGKLnDGQTlR9E35RPhG9wP19QAH1waJE+/7fSU5elGYnSpotukjKn+aMnOtpdsdnRFn626MsHbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmlWclZ0NpsXTmIMxzqTINRgadvqmUeMsrOWXH0NZJfmLfiwOX
	uyPRql4XLT5KmZYW6QIe7Eth09M6FONwsM4zq5cEEEUgh8yJRziVlsx5qlzv8w==
X-Google-Smtp-Source: AGHT+IEX3F+CPJJNzHCWZtEffTW2KurhONpiKwuAK9S/tJd6nVZvVtWPiQDzzrQnSsCU/tnc7BEIEQ==
X-Received: by 2002:a05:6870:910e:b0:270:14cc:656c with SMTP id 586e51a60fabf-2737eed86aemr2031331fac.6.1724234413128;
        Wed, 21 Aug 2024 03:00:13 -0700 (PDT)
Received: from [192.168.0.106] ([103.163.98.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae07e41sm9617199b3a.65.2024.08.21.03.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 03:00:12 -0700 (PDT)
Message-ID: <abc3330a-58a2-4527-a101-81e2e6168abd@chromium.org>
Date: Wed, 21 Aug 2024 15:30:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240821092659.1226250-1-rohiagar@chromium.org>
 <20240821092659.1226250-2-rohiagar@chromium.org>
 <415a27c7-dfdf-4cc5-9aaa-1681dd32ddcb@kernel.org>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <415a27c7-dfdf-4cc5-9aaa-1681dd32ddcb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_030015_063510_1AF8A8A2 
X-CRM114-Status: GOOD (  13.25  )
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


On 21/08/24 2:59 PM, Krzysztof Kozlowski wrote:
> On 21/08/2024 11:26, Rohit Agarwal wrote:
>> Add power domain binding to the mediatek DPI controller
>> for MT8186.
>> Also, add power domain binding for other SoCs like
>> MT6795 and MT8173 that already had power domain property.
>>
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index 5ca7679d5427..864b781fdcea 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -62,6 +62,8 @@ properties:
>>         - const: default
>>         - const: sleep
>>   
>> +  power-domains: true
> Missing maxItems. I don't get why did you change this...
>
>> +
>>     port:
>>       $ref: /schemas/graph.yaml#/properties/port
>>       description:
>> @@ -76,6 +78,23 @@ required:
>>     - clock-names
>>     - port
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt6795-dpi
>> +              - mediatek,mt8173-dpi
>> +              - mediatek,mt8186-dpi
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
> This part can be dropped. Just disallow it for other devices.
I was a bit confused here.

Can we add something like this?
if:
   not:
        (mt6795, mt8173, mt8186)
then:
     properties:
         power-domains: false

Thanks,
Rohit.
>
> Best regards,
> Krzysztof
>

