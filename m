Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C925EC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BxRk1PJc+XW+qEn8Ij5zM9MBUl9XatvAPXfsp+KF0k=; b=HXoKynxeC+oCqGL56EP1nuYFUx
	+HpsXv+XzU25GSWtqyQ00feSlux1jAuu31pSY2w+jHwtsbdR37cDxKkQEARQBjG3GXa3mfmM00ICA
	ktgVNYuyIjpQeg+G73ykxTQuV2iGTgsYPcM2Ye5I0yHqTc+aF3wOk71gUtn0zrGRMBfOZaHBi0vxf
	ktYbcUFlquOuVG4MCxevNAzCiQ3shvKcuxqTVzSURBOt0SJUPBp3MAhzcp6Z8T5caFxmp9ny7J9du
	gHqvemmsuMkbffwPPPmEK5nXvzdzPpLuGWKivM5ka8/u28+WqLO8dJaJPFvgX5QJBP7dw/3/eHHKR
	43DbRC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pki42-009bHA-2w;
	Fri, 07 Apr 2023 09:07:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pki3z-009bFc-1m
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:07:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-932072d4c00so210199966b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680858438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BxRk1PJc+XW+qEn8Ij5zM9MBUl9XatvAPXfsp+KF0k=;
        b=nkw+ddycbW5GjtdYGmkun62fRdFQENsmzY6BQjEiOlj8CA7TBenBvvXCinnKeAVPnW
         e3WureIZ4KLMhI/pJRQaDe7kvwwjrRtW3RLdcLBm2604TpgQLsn5FBK3s4XG2IxOfxwV
         qhiX67+b7XRHjv5s////3QhTRmAkz3WgSplFukprZLA/nFDKK3TSPWBVR5eonu9kO7fN
         Irm9/TTEtC/nyGuzI5xnvumhfqfGUUNf3JiZLwkS8SZZGV+cV8944LvYPQFwYv2bYB9d
         taRWaETWQxS88AOebWZD2RNJx9gFFMQgKMJJu7LoS+4tiAaFmEqgpP3cNs/2NDjd+1bH
         EiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BxRk1PJc+XW+qEn8Ij5zM9MBUl9XatvAPXfsp+KF0k=;
        b=yTqTk6NOVSk6MKdVToUb/ZYuuDz3P+t1gaFVV8nd19snMh4wQ8iaSlcApXDkBI52J5
         ZrjTe/D7BhuvYRJFT06QE/crt0wUgaz0R5Gki5yloNimW9V4LW3qh62lvFKtnn1wAb7V
         iKOV7ysVex3S0QOHW28D9k6mtcFEAUflGAQarrJC9pZ2eQxwQheAoYOYj8j9VBUIEv2C
         dawx90+qyevfKPSetRcpD4Fr3rNRHP8++Fh0zu/hgpQ4jA7vpewb6z82IBt+F/NoKvOk
         YcmeGCWJHPvTqTiFVD77f0s82vtmlGi+7Dh1/3qvsktOUmSqMpqXxMs1Rp8ufQHIlGw0
         nESg==
X-Gm-Message-State: AAQBX9dmYZBRvl5rVkECyYZ9Q/XG2C2CdhsBWzkx0zu498s4aZLFdHPr
	sWb9sPmT9wbav/h2OmPniB7SLw==
X-Google-Smtp-Source: AKy350Yp72jRlPW6PS3fGi3S7qmBR7ADa8EpkJ1qdw9IUSi7baFQV7muxP54AqpFgd65vqFrgqsC4w==
X-Received: by 2002:a50:fb8b:0:b0:4fd:29a1:6a58 with SMTP id e11-20020a50fb8b000000b004fd29a16a58mr2318193edq.19.1680858437893;
        Fri, 07 Apr 2023 02:07:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id b20-20020a056402351400b004bf5981ef3dsm1619711edd.94.2023.04.07.02.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 02:07:17 -0700 (PDT)
Message-ID: <951841d3-59a4-fa86-5b45-46afdb2942dd@linaro.org>
Date: Fri, 7 Apr 2023 11:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port
 bindings for MT7988
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-3-arinc.unal@arinc9.com>
 <23c8c4b5-baaa-b72b-4103-b415d970acf2@linaro.org>
 <5b3a10ff-e960-1c6e-3482-cb25200c83c6@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5b3a10ff-e960-1c6e-3482-cb25200c83c6@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020719_612362_B8C58D41 
X-CRM114-Status: GOOD (  18.02  )
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

On 06/04/2023 21:18, Arınç ÜNAL wrote:
> On 6.04.2023 22:07, Krzysztof Kozlowski wrote:
>> On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
>>> to be used is internal. Add this.
>>>
>>> Some bindings are incorrect for this switch now, so move them to more
>>> specific places.
>>>
>>> Address the incorrect information of which ports can be used as a user
>>> port. Any port can be used as a user port.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> ---
>>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
>>>   1 file changed, 46 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index 7045a98d9593..605888ce2bc6 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -160,22 +160,6 @@ patternProperties:
>>>         "^(ethernet-)?port@[0-9]+$":
>>>           type: object
>>>   
>>> -        properties:
>>> -          reg:
>>> -            description:
>>> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
>>> -              for user ports.
>>> -
>>> -        allOf:
>>> -          - if:
>>> -              required: [ ethernet ]
>>> -            then:
>>> -              properties:
>>> -                reg:
>>> -                  enum:
>>> -                    - 5
>>> -                    - 6
>>> -
>>
>> I have doubts that the binding is still maintainable/reviewable. First,
>> why do you need all above patterns after removal of entire contents?
> 
> The 'type: object' item is still globally used. I'd have to define that 
> on each definitions, I suppose?

Doesn't it come from dsa.yaml/dsa-port.yaml schema?

> 
>>
>> Second, amount of if-then-if-then located in existing blocks (not
>> top-level) is quite big. I counted if-then-using defs, where defs has
>> patternProps-patternProps-if-then-if-then-properties.... OMG. :)
> 
> Yup, not much to do if we want to keep the information. I'm still 
> maintaining this though. ¯\_(ツ)_/¯

Maybe it should be split into few bindings sharing common part.

Best regards,
Krzysztof


