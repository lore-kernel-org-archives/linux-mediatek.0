Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50999CDB474
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HN2I5nh+oC2ndVXRmDeD0vH83PJI24dhJj907LkvOWw=; b=pYTDWhpaJpEOMkAARSSYoazxES
	4mM59/eVG2iwN3yNfxN3BtCst5YnmQv7dI/yU808b+UDwikCAnJaWteEMDw1KKhErVyWH2LKwHBiO
	DuftC859FA8FAQZzJO9lkOlqxAXoTwwVbyuWKbXolLcFU5kv2/k44azhFigW+jj74Lpf4MTZoLfys
	Wa/h0FtLCMd1ZAZVkidiRNhhMX6yk9ew2aXpMCC3RZDA3cV8+BfOduKOsB1IXWsErGQX+pVXu7nLB
	uJclfM9YC5lCaReoz5F1IXfIk8IUd6HUkIdzz1ToVrCUaslzJLW+eNBa0eSPx2zxIrPACVXCU36hG
	LymBIY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlZD-001eMD-0z;
	Fri, 20 Oct 2023 09:13:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlZA-001eJv-2B
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 09:13:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32da9ef390fso409541f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Oct 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697793171; x=1698397971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HN2I5nh+oC2ndVXRmDeD0vH83PJI24dhJj907LkvOWw=;
        b=wMhgrojHdicXnlAONEb5s3DGpABcHn2H6TVurUdvkhtX9ooBbEaWANJAw9a9yGGttb
         bgar2pejxOMGbmq5XJDiIpTXFORD2y3h5k/acyh+eBNBa8+8gXC0QUa8NFnriSWzozVD
         aE3OPbd69C1Qo8H8LIMzr4ucecO/pGRT3Rh1Dy5P7v1J0sC5uXVPmJXHXqhUiE12mc/B
         DawLAWxpUIC6icPXJ44m0r1JSmCZrJiBZrdazm/VpkkTth6X9sbFwRD0ge5rxSG8zsPX
         Wv6WCjLJwplLjqEv7LwvxEAoHoxtyC/9lVrooonriBsMJGnjY+SWby93GXz6ObDqr/x0
         ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697793171; x=1698397971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN2I5nh+oC2ndVXRmDeD0vH83PJI24dhJj907LkvOWw=;
        b=e4MGzl+0rKSH+rhragRNS0st97OE1xp6FehK1b7aQLX4BpvcIKymgwcb126fGOVYSJ
         WlUXgyyyUaGfOOKrD3i9xbjFVu+rJpLhqTT2x4ybcOTwi77cyl5HHYcKgWNYLICPrYij
         szn9dP0xDCopNqSmOtJ5W/ubzdM6t8MUZfG++CkVtC6f9cWdBZrXBI+GFJgFiFObOQZc
         EUHoAmQd4DP0+pkzucFYyBX2V63dRHsJmhAS+kfMjwS4HOa6Eu1k42eQAvGZQvmgGKAT
         71ixnNA56DLhMjT2rD1PoUIiyQ9s3DjbniBFnP9ETAtpvDJXtwFg9A8vjrS1GP9Tugrp
         a57g==
X-Gm-Message-State: AOJu0YzcdSZfRWVkoEovbzMDSextKMzN8+KbACUfmu6xAGfI/9y3yDFV
	xSpHjZdiBVZBwwrbbaWzaMHYlg==
X-Google-Smtp-Source: AGHT+IFrVuKPZhg0zJdZexCqaj7pqlOmDrWzjoDPWGv0gcDBn9w4Ij8iPuihVcJZ3HcNx4v4d4BZ0Q==
X-Received: by 2002:a05:6000:11c7:b0:31f:b120:143 with SMTP id i7-20020a05600011c700b0031fb1200143mr852303wrx.59.1697793171074;
        Fri, 20 Oct 2023 02:12:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b003200c918c81sm1237195wrr.112.2023.10.20.02.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 02:12:50 -0700 (PDT)
Message-ID: <00a64eaa-0e6d-419a-a54f-d67fe2b60a7b@linaro.org>
Date: Fri, 20 Oct 2023 11:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud>
 <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
 <20231013-panic-vaseline-350c10e7d585@spud>
 <CAGXv+5EmLDWi3Lnca1vPft=9z9Cp2L2ee08in_b_21hipf9ieQ@mail.gmail.com>
 <20231014-proud-levers-eb03f30a0a9a@spud>
 <CAGXv+5F-x9m2WYZm-YLaxqio=VnfKkL26gLFbayJctBEJrSM6A@mail.gmail.com>
 <20231018-earpiece-dimmed-81c0f728d0b6@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231018-earpiece-dimmed-81c0f728d0b6@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_021312_714961_EE434713 
X-CRM114-Status: GOOD (  12.03  )
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

On 18/10/2023 17:07, Conor Dooley wrote:
>>> Then it seems like what you need is something like
>>> oneOf:
>>>   - items:
>>>       - const: google,tentacruel-sku262144
>>>       - const: google,tentacruel
>>>       - const: mediatek,mt8186
>>>   - items:
>>>       - enum:
>>>           - google,tentacruel-sku262145
>>>           - google,tentacruel-sku262146
>>>           - google,tentacruel-sku262147
>>>       - const: google,tentacruel-sku262144
>>>       - const: google,tentacruel
>>>       - const: mediatek,mt8186
>>>
>>> What you have at the moment just seems like a hack because you want to
>>> stuff all of these compatible strings into a single dts.
>>
>> It is. And it works OK downstream. The reason we want to stuff them in
>> one dts is because the firmware will not generate the fallback to
>> sku262144 as the scheme above suggests.
> 
> I'm not going to ack the hack that you have here, sorry. Maybe Rob or
> Krzysztof will. The list your firmware generates above doesn't even
> match the contents of this patch, with the extra "rev-4" compatibles.

No Acks from me either... Chromebooks board compatibles are a long
standing confusion for me and every time I forget why this is so
counter-intuitively. My comments for changing this were rather receiving
feedback "but our firmware likes it that way".
OTOH, board compatibles just have to be unique, so we could accept some
weird, counter-intuitive combinations... but it does not mean I should
be happy with them.

Best regards,
Krzysztof


