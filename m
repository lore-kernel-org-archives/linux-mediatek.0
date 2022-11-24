Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99486C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3sDEE3qa8mV6Z8JLdbIcpk1y3W4FOR+C6lE//MJGBA=; b=F33s1QTWBMXuTmnxNLoNPXCiZN
	MkW85YaqEjjQh8iJmrPy4ADQRhga6Z+2l7w7LYSHLaSz3sramPI+Mttv/xJM3xEfz+t2kTQi1IpiR
	0yQyyWAXKGI4NKOhi/ZvIWeuTI376Yh9KETUCjlj40BK5ogATq86MhBBUsxoAX4cHEEswvdBQRqMk
	RpLD8ABPlC85NU0ZRUclIL/q5gAI/C25crQiAsG/esApAnNS6PSLpHNatwWfrVJYae2ciDrvdrvkf
	6wSfQ/uZKoncG2oTbi0z+DADe+qIrF/CxWi9ORXUULfBQe+AhuxtEUOIiv/bQAJppqGgbzPYeGw1y
	YpTwFXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA6n-007wPG-K4; Thu, 24 Nov 2022 11:09:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA6T-007wEI-7U
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 11:09:14 +0000
Received: by mail-lj1-x235.google.com with SMTP id z4so1611578ljq.6
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Nov 2022 03:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3sDEE3qa8mV6Z8JLdbIcpk1y3W4FOR+C6lE//MJGBA=;
        b=YwQsbws8Gdut4vqlvVwAGqR8yxlaet5b02SqRYH3b0ZOLIOkqiXHr0liDJUuIBNQyW
         cVkcsW6I8skCy4wXVnS+/xcCumMDaz5WbutbsK1JL/l4IE9Hsgul8ap1f92eYSEckq2P
         v5lmf34VWNXMvRyZkGdjoSNe0ReDIaw8qUsnpO+Pe//H72gJCw123DL4Jp9JSan1t6ba
         sFFMTZr+y+jq5hyy56MCzDOG1hQIcaCu4tX1KhmLiQrwNehIyQLgOgv0WcTIf8a6TaMa
         q0IBbHrj0u1x6rzKuOzKYlFWes7H/+dHxcVeCxPUM/8JPmq1zZmcndQxWBN0+kvYipjB
         kzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3sDEE3qa8mV6Z8JLdbIcpk1y3W4FOR+C6lE//MJGBA=;
        b=PKLU3js8PkUeX09yZdIIEM2mo7a7gKjFPOdpyluOFZn5zbN4uhpivpjut8ReuLc93w
         h9cooJN1HWQWDnLCj9SDXzKYxT/cbaE7fmsc4IonNEdXN6l0QOrujv3DcHsfSjl77GiX
         yJOy47ts87TzX2Z2UEXHs5qbvoukF8dvH+0G0pQ33QnFT6UIn7tjhZH9b67E3AtkFElc
         mFxT0Z2jTOcdWj78pgugCc3/6vjPsmElUG2bQGsVeNijfJHdCLoPOO0vs8oJ5S6l2bjh
         7pHQhD8yHvote7rnBxfUPgvQQdDEXq/7XbRGE60sPsUsyJ7/bve2W4drcDqizEGeD69F
         C5Yg==
X-Gm-Message-State: ANoB5pmqBrPtQwhlO+NsB1ACHtnQQLtG2WfE1kDhzePqDbpY0IzdEugt
	qpqFhpJNiZgtBYDAFH9V8j4n/AO9NcogcO9S
X-Google-Smtp-Source: AA0mqf6LyBiVykGyk7kCz9xb1VAXnYbL3E7n7XIc4SDO7ASJrU0aMhqJ7FUYBvNj2MY6wbI+eH7zYw==
X-Received: by 2002:a2e:7017:0:b0:277:18ee:c91e with SMTP id l23-20020a2e7017000000b0027718eec91emr10976398ljc.363.1669288149407;
        Thu, 24 Nov 2022 03:09:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020ac248a4000000b0049944ab6895sm85882lfg.260.2022.11.24.03.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:09:08 -0800 (PST)
Message-ID: <3012ca1a-c583-4148-8a96-f9ecf61a07dd@linaro.org>
Date: Thu, 24 Nov 2022 12:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>, "robh@kernel.org" <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
 <20220930220011.GA1107972-robh@kernel.org>
 <ffc56eb60a3ef74c815c8d3c170a0df51958e20d.camel@mediatek.com>
 <24361bea-ecfe-b6e1-e755-5151220767f2@linaro.org>
 <722194a3d413ca15069554ebab1f34dec25057eb.camel@mediatek.com>
 <de2198dd-16a7-f412-932d-a75cccf801e0@xs4all.nl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <de2198dd-16a7-f412-932d-a75cccf801e0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_030913_291015_2F1B60CD 
X-CRM114-Status: GOOD (  17.46  )
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

On 24/11/2022 12:05, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 05/10/2022 13:58, Allen-KH Cheng (程冠勳) wrote:
>> Hi Krzysztof,
>>
>> On Wed, 2022-10-05 at 09:30 +0200, Krzysztof Kozlowski wrote:
>>> On 05/10/2022 09:21, Allen-KH Cheng (程冠勳) wrote:
>>>> Hi Rob,
>>>>
>>>> On Fri, 2022-09-30 at 17:00 -0500, Rob Herring wrote:
>>>>> On Fri, Sep 30, 2022 at 07:22:36PM +0800, Allen-KH Cheng wrote:
>>>>>> In order to make the names of the child nodes more generic, we
>>>>>> rename
>>>>>> "vcodec" to "video-codec" for decoder in patternProperties and
>>>>>> example.
>>>>>
>>>>> They are either generic or they aren't. Until something generic
>>>>> is 
>>>>> defined, I don't think it's worth the churn to change.
>>>>>
>>>>>
>>>>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>>>> angelogioacchino.delregno@collabora.com>
>>>>>> ---
>>>>>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8
>>>>>> ++++----
>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>>> subdev-
>>>>>> decoder.yaml
>>>>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>>> subdev-
>>>>>> decoder.yaml
>>>>>> index c4f20acdc1f8..67fde48f991c 100644
>>>>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>>> subdev-decoder.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>>> subdev-decoder.yaml
>>>>>> @@ -91,7 +91,7 @@ properties:
>>>>>>  
>>>>>>  # Required child node:
>>>>>>  patternProperties:
>>>>>> -  '^vcodec-lat@[0-9a-f]+$':
>>>>>> +  '^video-codec-lat@[0-9a-f]+$':
>>>>>
>>>>> Just 'video-codec' doesn't work?
>>>>>
>>>>
>>>> Thanks for your reply.
>>>>
>>>> hmm, I think 'vidoe-codec' does wrok.
>>>>
>>>> There are two seperate hardwares for the MTK video codec.
>>>> codec-lat and codec-core.
>>>>
>>>> Is it ok to keep two child node names for various hardwares?
>>>>
>>>
>>> Aren't they still codecs?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Yes, They are both hardware deocders. Lat is responsible for the
>> bitstream and write the outcome to the lat buffer. Core will decode the
>> lat buffer and write the outcome to the output buffer. Each frame will
>> be decoded cyclically by these two hardware deocders.
> 
> So is this patch OK to be merged? Or do you still want changes?

The patch should be changed as Rob pointed out - use "video-codec" name.

Best regards,
Krzysztof


