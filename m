Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A52BC4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 07:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho7SlJoHvT+wKcAbJ0KHph2ARaFaURvHzXGzLEWuXYo=; b=alTzTNNYu3DrKLkZUiFiGKzog4
	dybM53ZnpFATJ9ffQRrN+J7y1VGXKiDLYQMze4jIQo+8YQGIoGNdl+dbLf0mWbsRUpYMLPd2aAVMK
	9esklzyN/6NXlEM81DfFMBfUJY8PRKBknkqX2BR00wLNpxwGt7oYXrO8Rp1Ef63prkJ8wA4rCk1Gj
	bikhrj8raTM0wOoIigtHkjW4ZMkmC+WzywV3enQmv2aoSEdPK27AXn9n0aCFACNvx30egSrG9Z9ow
	ksIMj2ZwgEGXc/CxFrDHXLlu7kCiIC6p1yu9s8NuX20UPPgRkp5X142K1FoGMrBD1JLOYMiLcvCh4
	pxE4gpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCIT-00283b-0O;
	Fri, 12 Jan 2024 07:49:45 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCIP-00282N-2D
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 07:49:43 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cd51c0e8ebso3371240a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705045778; x=1705650578; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ho7SlJoHvT+wKcAbJ0KHph2ARaFaURvHzXGzLEWuXYo=;
        b=sjxmMajQRfNfrAC4+yxtaENHKAbBD+UdciMGqFTvXFZpotAfN42MEGiUdmRGcjzgfn
         8VUzNv0FelowHvWVszbdHZQkpdQs9I3a+dffEL/6NyakVFD1L2sNQYxxnTTOZSFdCao1
         fV6onYeAcyAKQyUVqNhRxV2sBqHbDT3IWIgV9eR4PsSBNCJI9rmRB0X4bRgAAWTC8Hce
         a+/xNWXY7vyQrI8EY9TmXtXM1HDZE8Mf45gcBIzFU/tQDyKduOcqZN+Nuk++03QN7MBY
         sn64OFUSLIp4p9xFn7P3ptMmj20LBcGv1ujpcg8J+lcPGwkyKUoBsdGrMaYZNzGHOyPa
         K1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705045778; x=1705650578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho7SlJoHvT+wKcAbJ0KHph2ARaFaURvHzXGzLEWuXYo=;
        b=nG/MsmoNpaZnT9yEPPe32Qogi060d6F0hZdFUUJBlL8YvJ46Isyc7qow4cAoijQdZV
         ho8qIFJKvCppcMDnvxV/z3nmSPuCEegMelCv+9C2g2YSo0gvg0mCSxBFOvo/khu9X2t+
         egsrK3ryHpZCMTbNDYEgIZLFj2541be4T0v5FWl5pW2VuaU7IaIf68cZ3t7vgznyeB6P
         srB3CPt3K+ZPBQB9Lj9ip2TYWIrblyCtrt5bKE6fSslNK0iberxnMOMWoKW+fkUHFTrl
         A0ZxZBSKBCNS+s/4TObcmp6lNkErWsOZzd3hqVAgKgnGQsgwlPioRksXZ1dz3u8P7xLZ
         Yx1A==
X-Gm-Message-State: AOJu0Yx9mBAoenUUkkfh+oc84oBbNoTd5icEcAaF6Nq9/obz99cmFXrB
	Eu5Dz4Dyyhn+IIl5/G7a2SwNvZsobBb6VA==
X-Google-Smtp-Source: AGHT+IFwbs5pWLsJXQ2+pUMSzfRVQ2ym1X2Fwi3bxKT6cANJLh811Aeu3ekpMMi253iblSahgxheYA==
X-Received: by 2002:a05:6a20:72a8:b0:19a:81ff:d24a with SMTP id o40-20020a056a2072a800b0019a81ffd24amr409703pzk.60.1705045778088;
        Thu, 11 Jan 2024 23:49:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090a388100b0028c95804922sm5882465pjb.51.2024.01.11.23.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 23:49:37 -0800 (PST)
Message-ID: <2792ce50-c95c-41b8-b564-7d1f98361e78@linaro.org>
Date: Fri, 12 Jan 2024 08:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, Andy Hsieh
 <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-3-jstephan@baylibre.com>
 <feb4e04f-8282-4b52-b785-07bf15008e06@linaro.org>
 <20240112074141.GA21256@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240112074141.GA21256@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_234941_726456_E7963232 
X-CRM114-Status: GOOD (  18.23  )
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

On 12/01/2024 08:41, Laurent Pinchart wrote:
> On Fri, Jan 12, 2024 at 08:34:45AM +0100, Krzysztof Kozlowski wrote:
>> On 10/01/2024 15:14, Julien Stephan wrote:
>>> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>>>
>>> This adds the bindings, for the ISP3.0 camsv module embedded in
>>> some Mediatek SoC, such as the mt8365
>>>
>>> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>> Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
>>> ---
>>>  .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
>>>  MAINTAINERS                                   |   1 +
>>>  2 files changed, 110 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>> new file mode 100644
>>> index 000000000000..097b1ab6bc72
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>> @@ -0,0 +1,109 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (c) 2023 MediaTek, BayLibre
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek CAMSV 3.0
>>> +
>>> +maintainers:
>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> +  - Julien Stephan <jstephan@baylibre.com>
>>> +  - Andy Hsieh <andy.hsieh@mediatek.com>
>>> +
>>> +description:
>>> +  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
>>> +  receivers. The number of CAMSVs depend on the SoC model.
>>
>> DMA should not go to media, but to dma
> 
> They're not generic DMA engines. The CAMSV is a video capture device
> that includes a DMA engine, much like pretty much all the other video
> capture devices.

OK, some more explanation would be useful in description.

> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt8365-camsv
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: camsv base
>>> +      - description: img0 base
>>> +      - description: tg base
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: cam clock
>>> +      - description: camtg clock
>>> +      - description: camsv clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: cam
>>> +      - const: camtg
>>> +      - const: camsv
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: connection point for camsv0
>>
>> This explains me nothing. What type of connection point? How does it fit
>> the pipeline going to the display?
> 
> The description seems wrong, it should state
> 
>         description: Connection to the SENINF output
> 
> or something similar.

I am still not sure whether DMA engine should be connected via graphs.

Best regards,
Krzysztof


