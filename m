Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1851C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etxMVrTTVJSTddGDgARHAHEO1RrGD5Hs7SuIw9ap/3I=; b=vXohkSEveCLQAc8LoqhZwqQVaO
	99AID4TFyJYUkXILsU+yFA2hpHVyeS8SSPfElPWxyo2KxdjUyOB0SNNvlglbfmQDgo8Vo9Pbqh/Hk
	GmzU3QTaexcKETvlmw+HOjlhPWgxLnV2cSdZmiNtrs6qu/8L3+S8koxdlu4cyjUn6sxuWGggV3d9a
	PCZeAIAp8T+bnzJmUBdc/DI/p83jd5EASZb3UTV6zi54v7HLeav4Sz6WQ17K1myrO0/jLqFzv91LR
	xu2/TqxoJ3X1HWIth2R898glOoUTFPApBFgetszgu4/oUzHifzPOMff6RKW8YibSUdvlw40U6v+T1
	wTrZo0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvLm-0073fe-29; Tue, 29 Nov 2022 07:48:18 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvLP-0073WG-WC
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:47:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id c1so21182685lfi.7
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etxMVrTTVJSTddGDgARHAHEO1RrGD5Hs7SuIw9ap/3I=;
        b=rJ2CHbAyVDgULRTpj4MDVg2dwBK1HADystIZFbvhbTYoLIME+/tt+UNXjiftguq7ib
         w244K+6QPoVERfMg79BoElJO38d82eLScZZat5sFVE49snZOfOK2/+f0fnJIKBPDeYwr
         FMbKUIjfcevvcaBgXAKIO3MbRsFR3P6ZtMV7rNa9PIY4woHjOWMCcZuqv4pX0tOMHtUg
         i6K9FHqMYrX/NmhNXcCLLkLhSjNQEx5ifmowHQHPkWFrl7Bjgf4qKioahqfbJwtbyu+O
         kUj+dvJ58qD1SX7rLqgkoUAxuWicMcWgz3BzKtCsL8WBGDD+0gJi4HnxuReDXO62n9lO
         ykmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etxMVrTTVJSTddGDgARHAHEO1RrGD5Hs7SuIw9ap/3I=;
        b=Jd2ZTspFqiKVKxcyKWMJCHnP0D6S4GTPXu+H24VQ6rWbjpu2eWzlSJCqFVOCKNf7fD
         HmDpHXBB7BUxI7SPdbzmBvtt5oSDry4TVRVi6/OmQRUyNKw3ENX9e74dc1cTcUPksKEI
         Ta8F4Bla6brRvaXR9lrfrDniDCBJXZhE5hvjqQEdqatlF0EqqV4KtdAEN8DdnzGTcVNL
         Xz9AWvlJOlL954pfHQLQw77H7QXTveesKYbHp8rnMEX0oIaCyyE0HOszP81EWWwg/CJ4
         rMHHBoXZQstVJiOnhgg/MP2oBfbFEEEjYrO1apq8Ls9XcODkKgPy8flG9mov5nDPBf+d
         5Y7A==
X-Gm-Message-State: ANoB5pmz7T4mFwpepBA4ooOyXD/8BScUG25iPhRrUYoF7Z0jBupVzHrm
	oS3vYP3y+5u6giSuPG23sl7jqg==
X-Google-Smtp-Source: AA0mqf67TcbUg0koPs/HiroxNXgbbcwrSRcrk/nihBw0w3MO/AQgLVDwdMtZH+S68ivSZKmzzQx01Q==
X-Received: by 2002:a19:ae18:0:b0:4aa:c879:5bc with SMTP id f24-20020a19ae18000000b004aac87905bcmr12172113lfc.498.1669708074608;
        Mon, 28 Nov 2022 23:47:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k16-20020a0565123d9000b0049e9122bd1bsm2080686lfv.164.2022.11.28.23.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 23:47:54 -0800 (PST)
Message-ID: <e512b7fd-3404-3c2d-dbf6-dc66ee662a06@linaro.org>
Date: Tue, 29 Nov 2022 08:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi
 bindings
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
 <8b8e4b23-a3bc-7e3d-199a-e8f591d05d71@linaro.org>
 <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5f76482d33933c19e191ea618f8622cd0660597f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_234756_055652_10342160 
X-CRM114-Status: GOOD (  11.23  )
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

On 29/11/2022 03:50, Xiangsheng Hou (侯祥胜) wrote:
> Hi Krzysztof,
> 
> On Mon, 2022-11-28 at 10:00 +0100, Krzysztof Kozlowski wrote:
>> On 28/11/2022 03:06, Xiangsheng Hou wrote:
>>> 1. add mt7986 IC bindings
>>
>> Subject: drop second, redundant "bindings".
> Will be fixed in next series.
> 
>>>    clocks:
>>> +    minItems: 2
>>>      items:
>>>        - description: clock used for the controller
>>>        - description: clock used for the SPI bus
>>> +      - description: clock used for the AHB bus dma bus, this
>>> depends on
>>> +                     hardware design, so this is optional.
>>
>> Optional for which variants? For all of them?
> It`s only needed for the item 3 nfi_hclk. Is it proper with this
> description or any other suggestion.

I understand third clock is optional. For which variants/compatibles it
is optional? Add allOf:if:then restricting it.

Best regards,
Krzysztof


