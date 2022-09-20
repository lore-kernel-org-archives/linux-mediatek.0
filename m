Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED95C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JevgRfzZajHh1ivJNGDpznKCTFD71WO98dSUBcXwKkQ=; b=s6yIL8DrVaw1Ke4BAy+TdfM989
	t65G2a473lUCkgoV+oEk/99KirJ6yOzgqYl80cjuwl/nBdR+i1w/6EanTqMUnUHQwX1LvBwixe+oh
	YpLYK9zTd69rrHTINUXHqwXNTpOZZ4/eprOneucjlbXrO8D67VL13wX9AG84jaGvU3oOFYrrrVYVC
	GC/MvHaJC2Kea+fYjZ73muMov2FRrp1CXVRUvoA+ZsuDvjDt3pHMBI8HKzZk+jjyibtlGyHB1lqXj
	ImchV/AVKUleSkN/lBbTYT1GXKyugkI5jg/llll6INyA78wCewxxk64USs+riX6Z/uTFO8+AMNvyf
	ZLlnWS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYfM-001paa-RN; Tue, 20 Sep 2022 08:31:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYf8-001pOo-44
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 08:31:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id t7so2980852wrm.10
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JevgRfzZajHh1ivJNGDpznKCTFD71WO98dSUBcXwKkQ=;
        b=RX0Sh3F73nodOtMqcJB/O8rzrlHYjazqjbR0QpQCoECZr75KPLgR4sOLNwcFXQ/mb2
         ocYdGlBdFq5gxdrmtwLlgKJx7CPj7DCcjt7O90xgAeId7bZD2NqxAGBNIZBI63+B6Gm6
         5Mv/XsAAnBPMlXwZ4NvzJ/2+k7GfxdLo+hIDkr2yBCndqzhFwr1cQuxn8yiHHfbzVa70
         p+hFmiJrEY5C8ExPWVKJuvCBr59i9oD+Iv1TBWW8n1ri7b1R1I3LAy3v1Dt5abozJCzL
         pYzUesSsyGvIT93+sGO9TQ8kl2wz9sMUIw0OTLC20i7B2/Tlq7dQJjmaaYs84HSyGQLA
         0x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JevgRfzZajHh1ivJNGDpznKCTFD71WO98dSUBcXwKkQ=;
        b=zHNzC4YhhFWMHPCBXqR3h7Esr4WVNXpCbWz9BgDNDwh8K3E8J/aLJyukP4mzb1dRVu
         91bWcgHxRvuZasGTflQp0lwnlq3O65UwwJnISEPZxpA1PoWizn/zlj4IAHqeepht9Kvt
         czmH2Z9txJUH26O2zeZ8RBqMRu/1q49KwRLpFQP/S7KbyFujndigowSn65UkqMFJBA67
         JosCMn7iBvBk9+eRV1yTSXXckmKg2GlMkDXQ9WQ/uCQ4sXkCnG9Y5lxU6inB4oDw29gz
         vfpNdypnCBwx4IhD7NODrcAO5ih7N7VaG1A32s3IoLxWA9bz4UWgaM9btAM5C+xciHYg
         s0jw==
X-Gm-Message-State: ACrzQf1+Zy1ux2m5K9dw77nYuTXSlOEfCSHXe4Q1Q6iLdwruXMU3jIJ9
	6OdK5klvOtNz+T9UV5x+k/s/JA==
X-Google-Smtp-Source: AMsMyM74xfiWSJJs+Nvny1x9cNy0Hheub/jdfRKhfI5KVZk44pOGzg1LeUSMI5Exgk7YsBAOw7rzgg==
X-Received: by 2002:a5d:6388:0:b0:228:c792:aabe with SMTP id p8-20020a5d6388000000b00228c792aabemr13008936wru.689.1663662681325;
        Tue, 20 Sep 2022 01:31:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m19-20020a05600c3b1300b003a319b67f64sm2272271wms.0.2022.09.20.01.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:31:20 -0700 (PDT)
Message-ID: <66e00dce-d9fe-efc6-1121-8e7f4001d655@linaro.org>
Date: Tue, 20 Sep 2022 10:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND] dt-bindings: timer: Add compatible for MediaTek
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220818124602.20394-1-johnson.wang@mediatek.com>
 <4a7e5e729f85c112a235e6bdd8bd337f90eabbf5.camel@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <4a7e5e729f85c112a235e6bdd8bd337f90eabbf5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013126_501472_1478DACC 
X-CRM114-Status: GOOD (  14.54  )
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

On 20/09/2022 07:20, Johnson Wang wrote:
> On Thu, 2022-08-18 at 20:46 +0800, Johnson Wang wrote:
>> Add dt-binding documentation of timer for MediaTek MT8188 SoC
>> platform.
>>
>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-
>> timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-
>> timer.txt
>> index f1c848af91d3..8bbb6e94508b 100644
>> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
>> @@ -25,6 +25,7 @@ Required properties:
>>   	For those SoCs that use SYST
>>   	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
>>   	* "mediatek,mt8186-timer" for MT8186 compatible timers (SYST)
>> +	* "mediatek,mt8188-timer" for MT8188 compatible timers (SYST)
>>   	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
>>   	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
>>   	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
> 
> Hi Daniel,
> 
> Just a gentle ping on this.
> Could you please review this patch and give us some suggestion?


I've applied the patch

Thanks

   -- D.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

