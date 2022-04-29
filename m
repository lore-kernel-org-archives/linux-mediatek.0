Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8V9HkSRJmiiwprx2l1VfPoFzxoIoZqhGKKQIxX+hmo=; b=pgdQqXiRKJbjMv
	YJ/04o6w+OaZtA2/Sjq1ZnffXgCK6WrKvvFaAaI8N4g259LM8cfqRS1aQm/r7NjbsG7405t0RHfrW
	sN/u08Cv6CE3T3Xp3WEP8dFf8km3wPdr0u3vFcwb0j04edl1K2OcsBjGnc0SqnOEtjaWIEnQ2Vd71
	7uDtVQ9jb31L+kCF/IPYNDLzEn2RUFrbd3z5ssHr6AlNmOYR0JXaW5dnFHYIVobK2LDQx0FHKscT0
	hrG70Cz2goDNPcYUVkwvA9g5nBE0vCrN+gc1EwRmKqZzB7OVG5O/FGmX6ftGlYWdqkrq1Gmmegk/Z
	crAZ9ZCNIrQiNBdqGQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJbj-009eHE-1D; Fri, 29 Apr 2022 05:55:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJbT-009eDf-FC
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 05:55:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e23so7826571eda.11
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tiRmC4Zpm+WzZdfPPf3eIqtx2v1z2PlQ5klf7MS2cC0=;
 b=Sy1yUI6B+p62yU4OE5CybcS0dn4IsYnHX21AnK3jTRJDftkbL2iPDYuSpqrliK2OpC
 bETFYpKn3DqtdPa24gwQFivtTO/Uo07qFmxt3d7Rlbz/qf/tYM+hg2Qek80iCrTW2hNl
 rU0xy/A68hwUqgcNeFeIj/8EFur+QMXm+MGH4bm2rF50ZQ8iaqPrNPPXsU2U0P/Q2usq
 TK9Eb6vuPEoZfxH4hxlxpQxZwVkd+j7JPQk7w41dO+6dKSKPT9mLe+wjw+2N7AEKdMPh
 xCSekEPqi/2n3sD4z3nRH/OuxiY+wSXLsNLd/KQmkN7zYin4uOsPs2Bxj2c4C8kyCUjD
 pZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tiRmC4Zpm+WzZdfPPf3eIqtx2v1z2PlQ5klf7MS2cC0=;
 b=CoYxHUsgeljEzLIJMnmG09br4WFnDYr1xH3WdjKPlUQjD+ETR/yoTUKrFnvvvwvQ7L
 wLzHScbT9er4Rx25gIIA3ombmxA1tTyZgE5qOq9m1k1xmRmfATndyOEl95Tvhu7BwHKz
 qR5kqnoQdXDBoShXOtVhkmNpFyvee39yYW4h8KK1CTxvdcsnEcMEFRE+nIBnalbZCYYG
 6Hecb8oLHyckAbHEv+GRMONxh042AdEAGm+lFb3nsT29yr5izdJx3DnsR1+3d06JxREJ
 ZyDozBXVGBlCowRZEH+M7Ywr6cFU9pUPFMhPdu1JQmK9Ks5lVUGl1bbrsgQ05vDq44q+
 LO2w==
X-Gm-Message-State: AOAM5336oOZmOUWaRa9NvEuKFY5OT4m9sRJ59+k/tANyTpldIS9cT7XI
 fzoma2BMs2SE5Abe0IfqM8V4vw==
X-Google-Smtp-Source: ABdhPJyd6awJqF4Aj3EuNQSwmNFuKI2U8jPGpFxZhZpwUe09oa8q6leKP/ayFl3jEPCm66cP+pFNyw==
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr39000077edf.205.1651211739111; 
 Thu, 28 Apr 2022 22:55:39 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w3-20020a170907270300b006f3ef214e4bsm317988ejk.177.2022.04.28.22.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 22:55:38 -0700 (PDT)
Message-ID: <9779588a-5bda-ea82-64a0-c13d48d89eff@linaro.org>
Date: Fri, 29 Apr 2022 07:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
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
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
 <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
 <60338c26047f47c77fdc7d4eff6a7dee43853e1b.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <60338c26047f47c77fdc7d4eff6a7dee43853e1b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_225543_599964_12CBB72B 
X-CRM114-Status: GOOD (  16.14  )
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

On 29/04/2022 06:10, Jason-JH Lin wrote:
> Yes, we cannot have infinite number for this, but we can use not only
> one mbox channel for one mmsys.
> 
> Its maximum number is equal to GCE HW thread number.
> The maximum number in mt8195 is 24 and mt8173 is 16.
> 
> But we currently using 1.
> So I'm not sure if I need to set the maxItems for this?

Yes. 24 for mt8195 and 16 for mt8173.

> 
>>
>>>      description:
>>> -      Using mailbox to communicate with GCE, it should have this
>>> -      property and list of phandle, mailbox specifiers. See
>>> -      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for
>>> details.
>>> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +      If using mailbox to communicate with GCE, it should have
>>> this
>>> +      property. GCE will help configure the hardware settings for
>>> the
>>> +      current mmsys data pipeline.
>>>  
>>>    mediatek,gce-client-reg:
>>> -    description:
>>> -      The register of client driver can be configured by gce with
>>> 4 arguments
>>> -      defined in this property, such as phandle of gce, subsys id,
>>> -      register offset and size.
>>> -      Each subsys id is mapping to a base address of display
>>> function blocks
>>> -      register which is defined in the gce header
>>> -      include/dt-bindings/gce/<chip>-gce.h.
>>> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Why removing ref? Does your binding work after such change?
> 
> I removed it unexpectedly, I'll add it back.

Just be sure you test it before submitting...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
