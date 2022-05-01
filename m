Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2861C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIyKxSQ3DLWR/RzNyK7n2CLcBTgttyj3e0/S4N3Bzto=; b=MUgdlapEfr120t
	bS/Sdl2+JqOGOhwoC8WDOhWnMqE05ISQ5ZzIqfn1UzB/BpAbOVpb3oEcmjq9l2qpiVSMR67C98Ja5
	F/hf6dDDgv9wqAnSVebXXu1i+ZFXoWrDNBR3DpJb8JiyYJFxOUmZf/1GgkBxmiewTdF4mt61/pggL
	+93Ar7QxNcaGlBgJvUy29wAiQVwGOMM9zuDv87vzKicEoVq2UcffTtoPy/BvHZE5Wf2zDqBAzU2t9
	qQ0FkPT8qbNVBsdD+MM62WpCTrIVMl/EXg+4F9umVDzKXx5s9beFV4XS75SRKLNLEY7DxaMVl0fAW
	GARCb6mnPf4o6fraMsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl57d-00Fvg5-FU; Sun, 01 May 2022 08:40:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl57S-00FvcR-JF
 for linux-mediatek@lists.infradead.org; Sun, 01 May 2022 08:39:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id y3so22756484ejo.12
 for <linux-mediatek@lists.infradead.org>; Sun, 01 May 2022 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9WVzij1T8iCMekan0Ad5/KsKpQIIUWQ6B5EMe3d2lrs=;
 b=mROR3otRplC07o1VILVg/gxS1mFRixD2TxOi5OqbbxVM8XZNnOv0hIHidqUUQIbpSI
 xbIyoUrjYdvXKlAVk8j8F7eowgb7y3rZNC3lVTcgsBfxxWMEEqZTr6GUzJAu0CQI+LDF
 FzoPuSFw5yU6Kw8NYH4Oy9oEgvf1nV8vbjsonJYwytOtaGjhY/lWmINanDMK8664ea3I
 UOO7ZdRQYyB0Wi/NdV2SgrFSvWbiMcRV2yoVk4zaqk2BJozbzhniZZLURoAJFmsKPzwQ
 VPvpptkjPqULmqY7ZamztTW4t6t7+LkfI/giQJIuqbQN2Ar/gifMbZmUW3rHskp2k1wY
 XgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9WVzij1T8iCMekan0Ad5/KsKpQIIUWQ6B5EMe3d2lrs=;
 b=vgqhMbxGrU1e67yMLu6QrKKc1esGQQf7qZDTwO+SH1FMiOxDkvbAkrmGp8F3Hjjt10
 fFr3ht9bxxEBHK79pFKwZc/jF94uMrGTxmNxSHFlBVZoTaw1RIYvs4Wm3vil/ipSmm7v
 N0nix7k2+9YOrd+Xx2klmYal3fYw+FE6w8wLl7MSXPcRGvIQBhhLKJ0jjfOxHMBwJeKq
 nUMreRAUBA46z56/Px5KZbrBH1eMZXhOG2B6c302fjGS9UZPNZ7Rg0W/LBH7ZHE871TU
 Kvn+QGqJ5VKzPSETQxRt88X1cB1zUQGyEGiOVkJBD6Vzk2m6d4Px/BSPabe6prUXwRCJ
 r9bA==
X-Gm-Message-State: AOAM530NRi4LSbNxsYdP86A01eSp1sfFzgj9ejyWHFxDXWCE83J+Nsmc
 jgCbhJAwWEhpz/WMsx0lASH/Wg==
X-Google-Smtp-Source: ABdhPJxSZX/QiQu3+AxPRtWO5Bwf8OHfZj8Hk0L0xj2XTUlRIcS57LBeqeX+kbSIvh5SbCQrJkPHBw==
X-Received: by 2002:a17:906:5d0c:b0:6f3:dce6:a69a with SMTP id
 g12-20020a1709065d0c00b006f3dce6a69amr6963489ejt.23.1651394392331; 
 Sun, 01 May 2022 01:39:52 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 hy25-20020a1709068a7900b006f3ef214db5sm2380978ejc.27.2022.05.01.01.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 01:39:51 -0700 (PDT)
Message-ID: <ec18c8f7-d25f-895f-c8c7-1a33e59cc973@linaro.org>
Date: Sun, 1 May 2022 10:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Cellopoint <cellopoint.kai@gmail.com>
References: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
 <c9239316-40af-724b-cace-7da5bf7e8e21@linaro.org>
 <cf3062c9ebc69642bdc16ce32ed3260486969b04.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cf3062c9ebc69642bdc16ce32ed3260486969b04.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_013954_687888_A6C13BE6 
X-CRM114-Status: GOOD (  17.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/05/2022 10:26, Jason-JH Lin wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Fri, 2022-04-29 at 22:58 +0200, Krzysztof Kozlowski wrote:
>> On 29/04/2022 10:30, Jason-JH.Lin wrote:
>>> Power:
>>>   Refine description and add item number for power-domains
>>> property.
>>>
>>> GCE:
>>>   Refine description and add item number for mboxes property and
>>>   mediatek,gce-client-reg property.
>>>
>>> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power
>>> and gce properties")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> 
> [snip]
>  
>>>    mboxes:
>>> +    minItems: 1
>>> +    maxItems: 24
>>
>> Wait, no, I wrote it should be 16 for one device and 24 for other,
>> not
>> 24 for all...
>>
> 
> Ok, I thought maxItems: 24 contained 16, but it's not clear enough.
> 
> 
> I'm not sure how to describe different maxItems for different
> platforms. Does it come like this?
> 
> 1. Remove the maxItems in mboxes property.

mboxes:
  maxItems: 24

> 2. Add the allOf condition before the line "additionalProperties:
> false". E.g.
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: mediatek,mt8173-mmsys
>     then:
>       properties:
>         mboxes:
>           maxItems: 16
>     else:
>       properties:
>         mboxes:
>           maxItems: 24

and you can skip the "else". In general looks fine.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
