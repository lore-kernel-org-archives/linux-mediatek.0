Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C979DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI1rcDm2izo91a4xYpDxT/SLBcJ/F5Ad/wzzFCiV+VE=; b=KwQJOv7IhQgEdvFaNekLxPtQ4l
	Xlc7bIflsz+KKIrCOo+eAYdh3pu2Nu/dyz7ZdtLY1WfpFzorobw+Bv+0T2mPf9hAaxIVFnsFIZcmr
	x7QyLaSLPDkmeiOB+v5gibdf6Ht/tEBZrQASTEi81rkH7AShxeWE1hPa3LoOSuBqkPmoBRzcQcn0K
	xL0mq7T8hqt48AGxOOBCyZwm0zVycTTttXE8ncr6R1zGhfMwCWTAwvA2j5ZkINRlUPP7stsh+1fDi
	cYDwlPd61gdANOABQ0vZD6Q1IY1TTgBmH2Ck8P2p4zxXwC3daWJgJ921aXO8TbklMW42qNYYeec6O
	2pjp4MyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MBG-00G6tI-Ea; Wed, 30 Nov 2022 12:27:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MBE-00G6ro-9A
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 12:27:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id j4so26724140lfk.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 04:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dI1rcDm2izo91a4xYpDxT/SLBcJ/F5Ad/wzzFCiV+VE=;
        b=Ji445Whez+WyQciiZuyiJmg9wIw+mMslsDzUx2Q5q+VuLSsSCaMsGA0band7jhsste
         q29kC52WC6Lp7l2/6ARvcEH8jbvM5DcbRpXbRSBIk9Opw8A2sc+WXtPpiLliXrwcPXvO
         tgXSLjgPugXRe9QR6oNwiDRVo2q2qjOXOkHLKl0suJTb3JBAIrYXn8KkzUl6tMRZDVGM
         DLwagTVcZvHr+0WmfdXdIGhID87hi+Q6SeDwEndVXX+P0K9MC2OU/MafUGxViYc36L0O
         l3164KBJPJSaxIsuocM6PQpz9UztAz5jqocXDSuz6gFg4ige6SQm5faDr8PAp41fqR4l
         Rq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dI1rcDm2izo91a4xYpDxT/SLBcJ/F5Ad/wzzFCiV+VE=;
        b=VAqHy4EVpMmR+nYsZzJEFY1KiGB+hXNgEpO+ThDWbmRksDRy/C9Q16LQLCBJRmnQy0
         XxEplqko2XxtcSknZS9HXjPkwf/hATFLDrl52PyT8R6PgxtrZS8WWdgue8NDBNgwmOf4
         kNf9t6HkkGPvTNjfxfKdA1jDlmU0RvOo/ozCXCCdCaz5pQ5CxRER9mygoLofxNk5/kGx
         e/ffNAl4XeYA0rcFjS57q2xDhe4vE3MMlxYslzWDQJW0WfzVuD9d7sTO/Kvu58mwwOGh
         E8nx4Hg2yHkJ03T9mvSmNTZVgau+2RwUmRXtVv9rTbsf/Flq+e66FbIE5lMae0McjDgW
         Sy7Q==
X-Gm-Message-State: ANoB5pkDyTYQEr91WNeUiibwtPM1bwgLwMKjIeFI02Hjx7LvhcMP+7Q8
	IrjKhPvD2kCjIAWWaOpP8gezFQ==
X-Google-Smtp-Source: AA0mqf60JfOxxNgy8P3VlfJbyaVrLdhiMyX6biwGhIsWg1ouQukE2tDQdlXo4sjBnFx/9AKPnNlHEA==
X-Received: by 2002:a05:6512:33c5:b0:4b5:237a:fb0d with SMTP id d5-20020a05651233c500b004b5237afb0dmr2459878lfg.658.1669811229479;
        Wed, 30 Nov 2022 04:27:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o15-20020ac24e8f000000b00497a61453a9sm234996lfr.243.2022.11.30.04.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 04:27:08 -0800 (PST)
Message-ID: <faa53c31-2642-7504-f04d-81bef2793399@linaro.org>
Date: Wed, 30 Nov 2022 13:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible string
 for MT7986 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.or,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
 <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
 <cdc79d9b-7afe-1aaf-3692-171370abaa3c@linaro.org>
 <Y4dIBW4Kped5klgD@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y4dIBW4Kped5klgD@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_042712_368900_6D401297 
X-CRM114-Status: GOOD (  17.35  )
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

On 30/11/2022 13:09, Daniel Golle wrote:
> On Wed, Nov 02, 2022 at 04:43:35PM -0400, Krzysztof Kozlowski wrote:
>> On 31/10/2022 18:16, Daniel Golle wrote:
>>> Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
>>> found in MT7981 and MT7986 SoCs.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>>> index 5c7e7bdd029abf..efc16ab5b22b5d 100644
>>> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>>> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>>> @@ -13,6 +13,7 @@ Required properties:
>>>    - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
>>>    - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
>>>    - "mediatek,mt7622-thermal" : For MT7622 SoC
>>> +  - "mediatek,mt7986-thermal" : For MT7981 and MT7986 SoC
>>
>> Then recommended is to have specific compatible followed by fallback (so
>> 7986 followed by 7981)
> 
> I'm a bit confused about the order you are suggesting. It may seem
> counter-intuitive, but MT7986 was released before MT7981, the thermal
> units found in both SoCs seems to be exactly identical.
> Or are you suggesting to list MT7981 first to maintain alphabetical
> order? Because in terms of precedence, MT7986 has been there first, and
> hence I'd list 7986 first, followed by 7981, ie. the opposite of the
> order you were suggesting.
> 

I have no clue which came first. Choose whatever is reasonable.

Best regards,
Krzysztof


