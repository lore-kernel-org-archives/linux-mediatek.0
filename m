Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33913C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgldI+82xaPUxW9jFm83l+ZVCizNwJg+yeI6zrnzsq4=; b=JKpDz2jBzaG60PU4cXoVhqAPRL
	YMZH1EOuUKZbkfTNvwFAXlh+eyNMsF0Nzje4qbPp5p1Ijg1eiUACk5MDYnRg62Ob4eFGL6WFkD9LA
	EJYy0wosQ5JoNi7l6jZZcrIBEdvAtWtAaetPW0ZopsO8Q8HrDjSeJjrczduWaYGdcTpSo4m8k3+rZ
	xcV0ciWTz7c80VUKvVg1+gY9xd7pjv/8Zvgp6jDce4zaWS5OjWO/M2QxV9nyeAogMJowYGpQ82Yly
	YWEg0OTuvaGkfDs5roW0jZr3rArkGtQIMzms077Zmvbk1nNFYPThM17QUdu3ZWUwyPPrVL66heUuJ
	mYcSkCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMJe-009Xrz-E0; Mon, 16 Jan 2023 10:02:10 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMJH-009Xjw-G4
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 10:01:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id v10so38791606edi.8
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 02:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgldI+82xaPUxW9jFm83l+ZVCizNwJg+yeI6zrnzsq4=;
        b=BCpiKjVBNdeZIXfLzwWGp6kixGj7UhUJC6Jg3ImNGeisAS1niXVyRhbI37ToWhVVov
         Gau4+9ctE1TDM13aqvWzu+yVTrjdC7tpaxBvH6lbm1K8ZLSAoYqj1tnfDNhaIggJy8Ix
         U/m66LrjGiz/kInp/qy2Q4BcTg2Hx+cyJ/wha7WUftpsKznaWllLTHXTxs4JOuEAtz2K
         Rk1Gp73r2z4eTAFbP20g0pkZLqvAsF50G1T9htpwAMzxU64m8827iOUAbuqItmOd2E4A
         HnjayK4LMsTaDCKG/ax7O7cRtjDYaN817bWhHtQmCMNH239aO/y0pjmUOszBeipZH+p1
         C2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgldI+82xaPUxW9jFm83l+ZVCizNwJg+yeI6zrnzsq4=;
        b=4MZdEOOqKOBByuGrvbCn5dNOjMG3jEt7T7GP8viqRTF6r+y0osUtELdNxZgng5Od1W
         4sCnxDgyB/Bfd0fzDDeCuHNmY8CghCfKz2Aj9BMFHqSOoC58cEDw+msi2iRQzUyfKqAO
         GJnSrKd/ip/VGCbHTLrAyZ43y/l+VGcW129PRuLFRQUlW96cxzd8b7w9WTtqWoAnFqsG
         XybRd4GD6+kAZ4Wcp6BxMOswVSnp0tiBKcdwFVGb6f5kIkagUzwbbqqmZBszOITMT5jR
         iBAFXcv20Ma2w98Br1NnL0f4NUP2zgKdGwHyny0Lhzl9LKeJoXcMgXm9y/My7h525T0v
         VVdw==
X-Gm-Message-State: AFqh2kqIqtsMTSzWygH2dlrSIqf9AKBCnsyzIEiWs0mmnH7To6VpoFTX
	Lk9WzwumGvJGwXe8X0fmEIivCA==
X-Google-Smtp-Source: AMrXdXvnFV6jO2U3anaxOMJIRIEJtNv8DD9RTL58GFnKUvxRRdcA3m/m4J+pPGsSPdTOMxg7f/nfCA==
X-Received: by 2002:a05:6402:520b:b0:48b:58be:472c with SMTP id s11-20020a056402520b00b0048b58be472cmr78238671edd.18.1673863303450;
        Mon, 16 Jan 2023 02:01:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q24-20020a056402249800b0046ac460da13sm11336099eda.53.2023.01.16.02.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:01:43 -0800 (PST)
Message-ID: <dbf5fc36-11c6-ae54-a19c-5fc9924aa18d@linaro.org>
Date: Mon, 16 Jan 2023 11:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND v3 01/13] dt-binding: mediatek: add bindings for MediaTek
 mt8195 MDP3 components
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
 <a5ef36df5bf8c483d327247199f5494be13b1efa.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a5ef36df5bf8c483d327247199f5494be13b1efa.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_020147_550691_F96CC52E 
X-CRM114-Status: GOOD (  18.42  )
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

On 16/01/2023 10:39, Moudy Ho (何宗原) wrote:
> Hi Krzysztof,
> 
> Thank you for taking the time to help review, I would like to ask a
> modification as follows.
> 
> On Mon, 2023-01-16 at 09:10 +0100, Krzysztof Kozlowski wrote:
>>>
> 
> (snip)
> 
>> On 16/01/2023 04:21, Moudy Ho wrote:
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> aal.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> aal.yaml
>>> new file mode 100644
>>> index 000000000000..d2e1b5245778
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> aal.yaml
>>
>> Filename should match compatible, unless you already expect this
>> binding
>> will cover other devices. If so, why not adding them now?
>>
> 
> May I rename this file to "mediatek,mt8195-mdp3.yaml"
> 
>>>
> 
> (snip)
> 
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> color.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> color.yaml
>>> new file mode 100644
>>> index 000000000000..1d8aa5dc76b9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>>> color.yaml
>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-color.yaml*__;Iw!!CTRNKA9wMg0ARbw!lcferrFFP-mshDHNL-rwJLgNKDrXF9fXoljpqL30k5YKTNvCwuC3webzR32VnQQoPeFvSvAewNkeupcT4mjdEwNEKP4V$ 
>>>  
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!lcferrFFP-mshDHNL-rwJLgNKDrXF9fXoljpqL30k5YKTNvCwuC3webzR32VnQQoPeFvSvAewNkeupcT4mjdEz618JHq$ 
>>>  
>>> +
>>> +title: MediaTek Media Data Path 3 COLOR
>>> +
>>> +maintainers:
>>> +  - Matthias Brugger <matthias.bgg@gmail.com>
>>> +  - Moudy Ho <moudy.ho@mediatek.com>
>>> +
>>> +description:
>>> +  One of Media Data Path 3 (MDP3) components used to adjust hue,
>>> luma and
>>> +  saturation to get better picture quality.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt8195-mdp3-color
>>
>> This is exactly the same as previous file. Why do you split the
>> binding?
>> It really looks unnecessary.
>>
>> Probably all other files should be also squashed.
>>
> 
> and convert all other bindings into individual compatible enums to
> squash all files?
> 
>   compatible:
>     enum:
>       - mediatek,mt8195-mdp3-color
>       - mediatek,mt8195-mdp3-aal

Yes, all devices which have exactly the same properties in one binding
file. Their compatibles listed in enum.

You can keep the separate bindings which differ from each other.

Best regards,
Krzysztof


