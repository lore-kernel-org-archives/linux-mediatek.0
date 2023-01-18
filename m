Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1530BC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gK8o2Y7reHAMOMVQV1NSBRgNT3cGc7DMsQikEldiSbI=; b=Q7hiH1BRg3/700Rt4Kw76ZUTuj
	e5fsHaZYApY8c2hImGytWV00lQ9NYpiaC36hA2f+DZ8PkdPOJhDaow1TzBJI0a1veZg0LOLzCLkd/
	5sScZf85oxBbJDBtIRPYjdINO84+jxwQjUuTJA3lx2A+Qf8Kn+1qaCmjI0CcdqLcelD9eF8X5LOfn
	nK5ASkwwf7ijqGCgdliP8nTNuKHGBvGKS+wJ5QADbUahPCnEe7JFuY5rEheEF/oOiMXCxLHRrf+cb
	oFKcxjadrYNQ9TfAijRRPq60fgZA2bLTb1RZFMxr5nrAUlKJcE/2Iq8gbef9o4gEF7FYTvteHn/R1
	qD8ZBM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7re-000x4h-KV; Wed, 18 Jan 2023 12:48:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7qz-000woY-Fg
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 12:47:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1456837wmq.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gK8o2Y7reHAMOMVQV1NSBRgNT3cGc7DMsQikEldiSbI=;
        b=jtbzq6oRKAc24SZ+A3rDy+tQplPXJxB3XqhjdRocPvAQVmH7d4Y5IqNPLvywIBa4qn
         9vGbE/jjtt8BzzUgKJfYNTwp/i5CG/zYnWXe4bLRLuVA+syACJg/i9ojwv/pB7jefG97
         zO+PqHcKWrUKcnaSzlu6OpI9ZSCyMmB6OTDMiW0AsNm5ipqHzI3xYObWBMt9IfD4Dnty
         jJJop/zZyG+OA82/cMAu50KKtHYUBDtTxt67NIImVfM1HffdIFT+eDzflIiqoOola5l7
         GvV/kGv41OathEVFB6UxTjVGOLvnlf6K0LWG9HlAWz5gdq9zwYKXZUrHoHob6M/TqQkE
         AVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gK8o2Y7reHAMOMVQV1NSBRgNT3cGc7DMsQikEldiSbI=;
        b=LJNX1G1koAFD3xHeVxWH1NAU92EM6AaO39QLzgfQ54Pg8v5SHrmmPF0cbhgCLs27C+
         HrHtwgxwHE3pCSo9uH3/tObBBEqlzxxZG/oQDnS6HcTZ0vBPxiP/LsHy98iv5iqqZjm3
         JakLHkLDcZILPUsZ6OMM8oicHJCCRr4huSE+UfASm+bqqG/Ww9cDXmzxEIRtL2zFHGB5
         QvJIs0g9dokclEC21jdwa3s9myJxCHkkGx5mEr0l5FZJJso8DIUCJOYb/5tvMLiGnsCv
         mtv0AJDE6IH8oGfoA1DxRsl6w6JMv4joi2IK5YCGm4TzlcsJPPdYx0d/Z8tM4IeYx9Rg
         hmww==
X-Gm-Message-State: AFqh2kojGv3BsJ9Q65OAZZdFAKSjXR3ICQxN7PSMt/U/e4SRFopggNI4
	vQGhqOZtARP0cg2dtUBfAreMHA==
X-Google-Smtp-Source: AMrXdXuDAKEnalP/OhK8Zy5tavc5exXluG1UAm4pHSXwlJdzB7qa5JtQH+D7YJlwjtCHFr+bpPo96A==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id r21-20020a05600c35d500b003db0fc4d018mr3028764wmq.40.1674046061596;
        Wed, 18 Jan 2023 04:47:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b003d9fba3c7a4sm1782153wmc.16.2023.01.18.04.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 04:47:41 -0800 (PST)
Message-ID: <392acd9d-ab7e-a5d0-67cd-162f49d2e6b6@linaro.org>
Date: Wed, 18 Jan 2023 13:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND v3 01/13] dt-binding: mediatek: add bindings for MediaTek
 mt8195 MDP3 components
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
 <20230116032147.23607-2-moudy.ho@mediatek.com>
 <f24a54f1-2720-3345-9596-bb8d388ba16f@linaro.org>
 <bd6bbc3d126a39dd8b8499e891b152c25b6713a7.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd6bbc3d126a39dd8b8499e891b152c25b6713a7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044745_643560_91A721C8 
X-CRM114-Status: GOOD (  15.11  )
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

On 18/01/2023 09:52, Moudy Ho (何宗原) wrote:
> On Mon, 2023-01-16 at 09:10 +0100, Krzysztof Kozlowski wrote:
>> On 16/01/2023 04:21, Moudy Ho wrote:
> 
> (snip)
> 
>>> +  mediatek,gce-client-reg:
>>> +    description:
>>> +      The register of client driver can be configured by gce with
>>> 4 arguments
>>> +      defined in this property, such as phandle of gce, subsys id,
>>> +      register offset and size.
>>> +      Each subsys id is mapping to a base address of display
>>> function blocks
>>> +      register which is defined in the gce header
>>> +      include/dt-bindings/gce/<chip>-gce.h.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    maxItems: 1
>>
>> items with items syntax instead:
>>
>>
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml*L42__;Iw!!CTRNKA9wMg0ARbw!lcferrFFP-mshDHNL-rwJLgNKDrXF9fXoljpqL30k5YKTNvCwuC3webzR32VnQQoPeFvSvAewNkeupcT4mjdE_roxWUo$ 
>>  
>>
>>> +
> 
> (snip)
> 
>>> +
>>> +  mediatek,gce-client-reg:
>>> +    description:
>>> +      The register of client driver can be configured by gce with
>>> 4 arguments
>>> +      defined in this property, such as phandle of gce, subsys id,
>>> +      register offset and size.
>>> +      Each subsys id is mapping to a base address of display
>>> function blocks
>>> +      register which is defined in the gce header
>>> +      include/dt-bindings/gce/<chip>-gce.h.
>>
>> Full, real path please, so it could be validated with tools.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Sorry to bug you again about this property, could it be changed to
> following form.
> 
>     mediatek,gce-client-reg:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:
>         items:
>           - description: phandle of GCE
>           - description: GCE subsys id
>           - description: register offset
>           - description: register size
>       description:
>         ... defined in <include/dt-bindings/gce/mt8195-gce.h>.
>      maxItems: 1 
>   
> Also, is the include header path still necessary in this form?

No.

Best regards,
Krzysztof


