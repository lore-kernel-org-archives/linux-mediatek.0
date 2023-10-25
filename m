Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41593C07545
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9kyPYaH34uXr/cQUy0a+/J35UlgWvNyNVDDPOzDD20=; b=oeNLB+wjoSZe2B
	Iq8KNIJ+9u1AN0BQ2A+r8g7LjKL7RujxubuiBzqu4fkU0coCkfoZSnQikKg3eXJDI9/HWPCi4fB1n
	jVQh8mHNq6Yb8PrInpkLPwDO0zrONLt0QJQZkT5A87v0iKdYlWBnYcCXuLHjo9PwpHMfiGGUoiNnK
	mUeouEyR3KJto3Wp6SoDu+XEBbD+ZW1mdjVrQFsQjsz+C3nkfQo/prORdOBaT64JYUhJMQd5iLt65
	3ektlnLDQa8gG08oQDLaBMta4Y1t4KwuEIEl8fUB2+a4pPwrBiMgyNUwXNMvmTiY242ZdFjSV6lvy
	yyIjF5G66wqyp1NE/E6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfHe-00CZJB-0i;
	Wed, 25 Oct 2023 14:54:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfHb-00CZHF-00
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 14:54:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo9090674a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245691; x=1698850491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9kyPYaH34uXr/cQUy0a+/J35UlgWvNyNVDDPOzDD20=;
        b=kvjLFTpTx0eLm+EahFfmvPZJHoYvxOUJGNdn4ABUFMfwcMRg81wr5aXX3mDnAo4m2+
         6WyO71isIOJtnqPSfrBpEEZXZc300lksb4uNlK8ukKHXd4l7gXXFHxhMgV2jlL69QNWe
         cnoTE4dvb9ymIuCT0anO7WrPGHVqRCrtuVEJ2lq444JQoCV4W8mwDm6QpIisewDpQYxm
         x+JDkzfCpJFvVLm/PiIPyerg7BVrhtXTLE0gdg4gAYAZBVztS+o04sGdaANK8t+G9uEA
         8mL5XJy/osV0N+6vUtDb/Fzhk//Q4KJYgX6QIYDwVCTprJdS0wFAONO6zSiiTN+3nqJP
         XUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245691; x=1698850491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9kyPYaH34uXr/cQUy0a+/J35UlgWvNyNVDDPOzDD20=;
        b=Ejyy7hFT6il+pA/9idEHFcH9F4YiUzbpjYEJYV3lO0UJgft5N4+K+yXyZLkQ81dN1h
         /G/VLsQbWxP2BjGF9+3vwpkR1P93qmG/FWRVhZiMzkfEvKE2xPtV9UxZ1YWqA73ySoth
         Les4LcxyHPxUZy3I3Bqrs9jUienfdnMxqo1MTxSIQhWyI8Us8VvRXsXqMqgncZLZhuMc
         KksioGmcIadJhH+uAnfDLllMUNLSyVyTSa51Tw5yP3v5PTq2Y/BLnsI0GU1RceUigff9
         fQk2cj+2/VxK1UgqbHSLTGr8tQodMVrtMdVfSVSYDVPL2N93sNPdRRgw0Qu/8tGdSGZA
         DjRg==
X-Gm-Message-State: AOJu0YwpFA35L2RyX5yhf2BiNnBCPjqJdWp1510m9XHZ0ArY8Tr4RzQn
	7vanBxnA8a8coNtNCVRl+6PK5A==
X-Google-Smtp-Source: AGHT+IGj0fFxYNY36al9jSzjkXSJLC5nVtaMMT/PBL+VhovZqKrqS244UWVpW3AW6QcPC7cKDl3T6A==
X-Received: by 2002:a05:6402:40ce:b0:53e:94f8:85aa with SMTP id z14-20020a05640240ce00b0053e94f885aamr13877701edb.0.1698245690869;
        Wed, 25 Oct 2023 07:54:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id gy5-20020a0564025bc500b0053d9cb67248sm9448133edb.18.2023.10.25.07.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 07:54:49 -0700 (PDT)
Message-ID: <d33bf9c9-b6a6-42aa-acc7-675b2c7aa1f9@linaro.org>
Date: Wed, 25 Oct 2023 16:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Conor Dooley <conor@kernel.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-4-hsinyi@chromium.org>
 <20231024-bobbed-although-06f341259ebb@spud>
 <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_075455_039934_3D127F57 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/10/2023 20:22, Hsin-Yi Wang wrote:
> On Tue, Oct 24, 2023 at 8:17 AM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Oct 23, 2023 at 05:02:26PM -0700, Hsin-Yi Wang wrote:
>>> Add makomo sku0 and sku1 which uses different audio codec.
>>>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> index fe8c488a3207..b131e0bdbf01 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>>> @@ -250,6 +250,18 @@ properties:
>>>                - google,kodama-sku32
>>>            - const: google,kodama
>>>            - const: mediatek,mt8183
>>> +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
>>> +        items:
>>> +          - const: google,makomo-rev4-sku0
>>> +          - const: google,makomo-rev5-sku0
>>
>> With these bindings, how does one describe a makomo-rev5-sku0?
>> What you have here is only suitable for describing the makomo-rev4-sku0.
>>
> makomo-rev5-sku0 and makomo-rev4-sku0 uses the same dts:
> 
> compatible = "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
>                       "google,makomo", "mediatek,mt8183";
> 
> In this case, can bindings be listed like that?

If they use the same DTS, then I would expect rev5 (as newer model, more
specific) followed by rev4 (older).

Best regards,
Krzysztof


