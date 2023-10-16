Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04888CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 05:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljLUfJ605ma450XY7PNUj3Yr/a3QuI1zYReWh/UDky8=; b=CPSPIiWxWV6T3ZN6wPSPqDiU3q
	mFfwirdTB9wz4evmEwWnij3rSKOIR6fe2cCpKoLHDkUdrZg+QxmhNBbRJ96m7u1SKqoIROYRnu0uu
	LL8UN371r6NG9rTUywKbMp5CQAk/8wpeeeM0WFFM6CYKBHgovYDAFOc1tlDbcNVxQVGR8NML7EWD7
	lzJHC/l3TfPQzBQNiMVoH5wnheEmSqHL/wthEiaByKZQuVDNOasZTGhQGheZkz3gycpDKE8eLAOHT
	HGVMK148aL8B8tqbrg+Du9pdXwKih5rQpBsg/Pob+uFc7f7Qi2U+kGg6DGjFvUTlQ3SgOz+PDW9f5
	3RVDsbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsFoK-008LBG-2W;
	Mon, 16 Oct 2023 05:06:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsFoH-008L9b-2u
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 05:06:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53e84912038so2004210a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Oct 2023 22:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697432791; x=1698037591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ljLUfJ605ma450XY7PNUj3Yr/a3QuI1zYReWh/UDky8=;
        b=CIdFGQ008O69Jb9Wq+Bz0hvo6Gs8pDxkXnbKGVymhPvlBjDXCcf27O3knaXFAUQm29
         4BoUZU+191enASY3OQoi3TNFRk8q1rPGNyWOoGNbxaaeNxIZ1eLmFsuwpuKQXIJB6mXH
         tNenEg86u5rk3Vces+8unG8+QnF6l5+vBcexgoMFsDLZDwTPZXgAHx2ba2wH0S4K6pi3
         zZkktOcdGmrOivUxJ81u3rPN/jgOdZFcQIig5cRxNzRlhtDUkefUp11PhmSigfuuHdzI
         M0cY1vU0+jB8QHEEZCTTG+gB6jTjybMjWv3dE6Z3MAkpAdjP8HOibKGDX3esWhtf+BTw
         qpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697432791; x=1698037591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljLUfJ605ma450XY7PNUj3Yr/a3QuI1zYReWh/UDky8=;
        b=Dqtj3qCu2yBqSrZOwDvP2UjjAvGyxKsw9PbjMVBE61UR32yThN0FpKE0CGGydMMzwq
         f/co2SFMPtnvz69Ld6jftP66OWyt9lnQ1o/uEpo02SazoPGHLOXK1eZ003P+02C8KbQp
         oda7R9O++P62oVPtJAdYNAcp+z1tZHLmmzT6WV6ruHwPRMJOEmDcWiL6gS3glM0t7s0B
         byk+qQxFkTLsLhDhF4X8HKVmiM1yYR4jW2pAXldakF1DtdxCT1VB8jxCjzCvistsSq5l
         eQPz/OoKkfrh8TDUZPnuFM7YwSxa7teINxc+lNdkRRxQd/yzcZMuVDXHoDcVEQNsYuu5
         xTlw==
X-Gm-Message-State: AOJu0YzhYPdp66WpkqyrFO5/hS6MQuMqgKU8zj/9xKM8KCTR5+AfTiXW
	fzWBG/vAxJJKZORVEiQF2cG2Bg==
X-Google-Smtp-Source: AGHT+IFmlppKIfIeLxzkFAIjRYC4PTqJ/fa4UN+nQcWy5Nx6i1olN86boxhNG3/NjoCFqfMjEEBeAQ==
X-Received: by 2002:a17:907:8b8c:b0:9a2:28dc:4166 with SMTP id tb12-20020a1709078b8c00b009a228dc4166mr31041615ejc.75.1697432791464;
        Sun, 15 Oct 2023 22:06:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b00977cad140a8sm3247163ejx.218.2023.10.15.22.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 22:06:30 -0700 (PDT)
Message-ID: <5d7f8083-5bcc-4742-aa46-48e63072fc6b@linaro.org>
Date: Mon, 16 Oct 2023 07:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: Add bindings for THine THP7312
 ISP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
 <20231012193737.7251-2-laurent.pinchart@ideasonboard.com>
 <aaa41ff2-d2e3-4c25-9654-065a02275619@linaro.org>
 <20231015123923.GB23177@pendragon.ideasonboard.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231015123923.GB23177@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_220633_976453_98C3CED1 
X-CRM114-Status: GOOD (  14.92  )
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

On 15/10/2023 14:39, Laurent Pinchart wrote:
>>> +        properties:
>>> +          data-lanes:
>>> +            description:
>>> +              This property is for lane reordering between the THP7312 and the
>>> +              SoC. The sensor supports either two-lane, or four-lane operation.
>>> +              If this property is omitted four-lane operation is assumed. For
>>> +              two-lane operation the property must be set to <1 2>.
>>> +            minItems: 2
>>> +            maxItems: 4
>>> +            items:
>>> +              maximum: 4
>>> +
>>> +  sensors:
>>> +    type: object
>>> +    description: List of connected sensors
>>
>> I don't understand why do you list sensors here. From the binding
>> description I understood these are external sensors, which usually sit
>> on I2C bus.
> 
> Good question :-)
> 
> The sensors connected to the THP7312 input are controlled over I2C by
> the THP7312 itself. The host operating system doesn't have access to
> that I2C bus. The sensors are listed here because their power supplies
> need to be controlled by the host operating system.

OK

> 
>>> +
>>> +    properties:
>>> +      "#address-cells":
>>> +        const: 1
>>> +
>>> +      "#size-cells":
>>> +        const: 0
>>> +
>>> +    patternProperties:
>>> +      "^sensor@[01]":
>>> +        type: object
>>> +        description:
>>> +          Sensors connected to the first and second input, with one node per
>>> +          sensor.
>>> +
>>> +        properties:
>>> +          thine,model:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            description:
>>> +              Model of the connected sensors. Must be a valid compatible string.
>>
>> Then why this isn't compatible?
> 
> We picked a vendor-specific property to avoid implying that the sensor
> nodes will result in devices being created by the host operating system.
> I don't mind using "compatible" instead, but as far as I understand, a
> compatible string implies that corresponding device DT bindings should
> exist, and that won't be the case here necessarily.

OK, looks sensible to me.

Best regards,
Krzysztof


