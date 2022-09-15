Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CADC6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd+JAIxoatS6fqpZjKg+PafGJDvgpv06EAtknvwbZaQ=; b=wBXCtwvfJ7ejOk60n45giGq26w
	ZXfMoPScpUnmfAYdwfEX9oAyKQEGvWP9J5VVo/gSu2pHWOg911gRHrgZO0QLdRqSc3fxoYFWpMxMb
	wtyYGd7NjwzLTRUbsrJMM0sVXPlHOFbZ1rpqjVNwFgB6fIsuHF8aHdqle++3JFN2yW65av/OG37zz
	tylKz525BTfx1mYJ8XG0VqoK67oiSldeOMBpl8cgzTVxfKl0V9R3FsJIhp1jDZYlOpXl3Wwg+rJtv
	QFm9IKCRdKUYjZPZvHwn/IHxxtdp6Moim+Z+/zGp9Y+XDU5YYRHs/vpk+QQme5M94n/PTru5YX+kC
	9PlBsD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrbU-00DOoh-Lc; Thu, 15 Sep 2022 16:20:40 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrbR-00DOb0-9i; Thu, 15 Sep 2022 16:20:38 +0000
Received: by mail-ed1-x529.google.com with SMTP id z13so13733018edb.13;
        Thu, 15 Sep 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Kd+JAIxoatS6fqpZjKg+PafGJDvgpv06EAtknvwbZaQ=;
        b=F72x7QYZIhbmFjR0ChiYcfO63EjAeyERPyBY55RLEnhiiokBPHqF50G9KkbcsNROkA
         lYQEegvB+fu3ppSt53cWMXH+tkODzC8u62kgMKqmu0OhOAxg+BrNr6XVxIE2nNV8P4bI
         P71fNfJnKryq4wYh4Geo7Ow9ztj5pRH/lDi5sTHfQPwPziIuSOTSD3LJojcshvV7couK
         0odQpei6AzHdQZLYwpxEZ0GVfoRsgLFDyI2/l/trh/4lUZu9GYR+H06Xi4BhjZFdWNrE
         0T1xy5zADQ3cvJbuBqlZ+znEVnuXjTQVQ8GF7rwRIg3WCgCwMoQSAGM/NfpkgmOdxb4d
         EE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Kd+JAIxoatS6fqpZjKg+PafGJDvgpv06EAtknvwbZaQ=;
        b=s1kwQRpNH1t27R2eGdA8ITiMGEbs8uqYTSpNELvLJBajq8Sn10LKFjXxLjkvpqfksc
         K9VMe4UCbMAHZYC+EKeW/Nk7Q6Mp/tsIVcMslvQiZWHcbxqO2uyGXJZ4X1KUS3ZEM6x0
         lLfTi/CdHcw+dvZy5UnT+QOOB1Pg6h7LFXKUdnC46as/vkU0U8ogZSuHo472inNF8Dld
         P4WQo3lypMHL5V2drnra2nL0UEVwl17VK55NKHzQGHtJWP1eLZ7muTkgjpXzbFcm1HZr
         8W/ASJDw1g78nNxjQiyYpkG/+J3X9z+WMGOpuKgTAsvMkWtkiDxVkVB9hF46+XHvT2Q/
         Kh/Q==
X-Gm-Message-State: ACrzQf0+PWdqCLmDWeEJX88t+75ulj8VdQEu7IHUysa2mYrkqHaYgitW
	jTNXHUj/cN4uU24si5lLL9s=
X-Google-Smtp-Source: AMsMyM63oHtUjcmEQaYXKXqjqIFTLT8HB0HjfWwV868jYlpt/GWlhdq2iBhj+mSI9knUF4WLNHgqkw==
X-Received: by 2002:aa7:cd8e:0:b0:452:2682:a955 with SMTP id x14-20020aa7cd8e000000b004522682a955mr516912edv.379.1663258834101;
        Thu, 15 Sep 2022 09:20:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906315500b00772061034dbsm1534324eje.182.2022.09.15.09.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:20:32 -0700 (PDT)
Message-ID: <a8e18b62-f49f-7c99-e046-3ee609e11627@gmail.com>
Date: Thu, 15 Sep 2022 18:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-2-jason-jh.lin@mediatek.com>
 <1b739216-8bb1-162b-1af5-24acba7324bf@gmail.com>
 <296155e2a12a474439ba092e73b4bcffbf3d3edc.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <296155e2a12a474439ba092e73b4bcffbf3d3edc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_092037_397727_D000629D 
X-CRM114-Status: GOOD (  26.35  )
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

Hi Jason,

On 15/09/2022 03:24, Jason-JH Lin wrote:
> Hi Matthias,
> 
> Thanks for the reviews.
> 
> On Wed, 2022-09-14 at 23:24 +0200, Matthias Brugger wrote:
>>
>> On 14/09/2022 20:23, Jason-JH.Lin wrote:
>>> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
>>> pipelines binding to 1 mmsys with the same power domain, the same
>>> clock driver and the same mediatek-drm driver.
>>>
>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>>> to
>>> 2 different power domains, different clock drivers and different
>>> mediatek-drm drivers.
>>>
>>> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
>>> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
>>> Quality)
>>> and they makes VDOSYS0 supports PQ function while they are not
>>> including in VDOSYS1.
>>>
>>> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
>>> component). It makes VDOSYS1 supports the HDR function while it's
>>> not
>>> including in VDOSYS0.
>>>
>>> To summarize0:
>>> Only VDOSYS0 can support PQ adjustment.
>>> Only VDOSYS1 can support HDR adjustment.
>>>
>>> Therefore, we need to separate these two different mmsys hardwares
>>> to
>>> 2 different compatibles for MT8195.
>>>
>>> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
>>> SoC binding")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> I'm not sure Krzysztof gave his Acked-by tag.
> 
> I'll remove this tag.
>>
>>> ---
>>>    .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
>>> 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..a53b32c0a608 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -32,6 +32,8 @@ properties:
>>>                  - mediatek,mt8186-mmsys
>>>                  - mediatek,mt8192-mmsys
>>>                  - mediatek,mt8195-mmsys
>>> +              - mediatek,mt8195-vdosys0
>>
>> As I said in the last submission, we should make mediatek,mt8195-
>> mmsys as a
>> fallback of vdosys0. Actually mediatek,mt8195-mmsys is only used for
>> the
>> fallback of vdosys0.
> 
> I think adding both vdosys0 and vdosys1 can make the description of
> this patch clearer.
> 
> It's find to me to only add "mediatek,mt8195-vdosys0" in this patch.
> So I'll remove the "mediatek,mt8195-vdosys1" at the next version.
> 

That's not what I wanted to suggest. Up to now in upstream kernel compatible 
mediatek,mt8195-mmsys enables support fro vdosys0. The vdosys1 is not yet 
upstream, so no support.
If we change the compatible, we should keep mediatek,mt8195-mmsys as fallback of 
"mediatek,mt8195-vdosys0" so that older device tree blobs won't break with a 
newer kernel.
For "mediatek,mt8195-vdosys1" we do not need a fallback compatible as the code 
never reached upstream, so no breakage expected.

Hope I explain myself now.

Regards,
Matthias


> Regards,
> Jason-JH.Lin
>>
>> Regards,
>> Matthias
>>
>>> +              - mediatek,mt8195-vdosys1
>>>                  - mediatek,mt8365-mmsys
>>>              - const: syscon
>>>          - items:
>>
>>

