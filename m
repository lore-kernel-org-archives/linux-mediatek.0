Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7982BC43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVKm3fxoQl9zKA+SaACoS6203m2m41ZcRZ3DLV/+E/Q=; b=tSa7fAcGq5xfTr862MYM7on1YL
	qUjRZNyjtIqNsfxH/twgS09+Z9trIIxa5eNEn6rB/qZ10SrRtsU4+T5se5+nx1YfQE+r6n7q67MW7
	6DzSyTnDGXI/v5ihQ+qIxS102zLQOaonqUmPLeFk4iI7PgD4jtkBFuXS9ZXo/8R5JwIwr1Y90FHB7
	2sT2HGxfMmFn4qihNkhhIZdqqXdnJ699l9p5kX6E6i1TuetfVF3j6oUX6TE0JvIuGE7PShrvIRwkR
	HbHMW5s0UrKlUdW7bS2SiBQJi9IkfeoTtJzege5HGoaRaeTaPWqM+gsjo8KhyKlKbrBIogE/7M6KN
	8/KJ/fIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA3X-007ua8-Kp; Thu, 24 Nov 2022 11:06:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyA3K-007uQI-2D; Thu, 24 Nov 2022 11:05:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BD31B8276B;
	Thu, 24 Nov 2022 11:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F74BC433D6;
	Thu, 24 Nov 2022 11:05:52 +0000 (UTC)
Message-ID: <de2198dd-16a7-f412-932d-a75cccf801e0@xs4all.nl>
Date: Thu, 24 Nov 2022 12:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
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
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <722194a3d413ca15069554ebab1f34dec25057eb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_030558_439912_6ED303A9 
X-CRM114-Status: GOOD (  20.39  )
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

Hi Krzysztof,

On 05/10/2022 13:58, Allen-KH Cheng (程冠勳) wrote:
> Hi Krzysztof,
> 
> On Wed, 2022-10-05 at 09:30 +0200, Krzysztof Kozlowski wrote:
>> On 05/10/2022 09:21, Allen-KH Cheng (程冠勳) wrote:
>>> Hi Rob,
>>>
>>> On Fri, 2022-09-30 at 17:00 -0500, Rob Herring wrote:
>>>> On Fri, Sep 30, 2022 at 07:22:36PM +0800, Allen-KH Cheng wrote:
>>>>> In order to make the names of the child nodes more generic, we
>>>>> rename
>>>>> "vcodec" to "video-codec" for decoder in patternProperties and
>>>>> example.
>>>>
>>>> They are either generic or they aren't. Until something generic
>>>> is 
>>>> defined, I don't think it's worth the churn to change.
>>>>
>>>>
>>>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>>> angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8
>>>>> ++++----
>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>> subdev-
>>>>> decoder.yaml
>>>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>> subdev-
>>>>> decoder.yaml
>>>>> index c4f20acdc1f8..67fde48f991c 100644
>>>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>> subdev-decoder.yaml
>>>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>>>> subdev-decoder.yaml
>>>>> @@ -91,7 +91,7 @@ properties:
>>>>>  
>>>>>  # Required child node:
>>>>>  patternProperties:
>>>>> -  '^vcodec-lat@[0-9a-f]+$':
>>>>> +  '^video-codec-lat@[0-9a-f]+$':
>>>>
>>>> Just 'video-codec' doesn't work?
>>>>
>>>
>>> Thanks for your reply.
>>>
>>> hmm, I think 'vidoe-codec' does wrok.
>>>
>>> There are two seperate hardwares for the MTK video codec.
>>> codec-lat and codec-core.
>>>
>>> Is it ok to keep two child node names for various hardwares?
>>>
>>
>> Aren't they still codecs?
>>
>> Best regards,
>> Krzysztof
> 
> Yes, They are both hardware deocders. Lat is responsible for the
> bitstream and write the outcome to the lat buffer. Core will decode the
> lat buffer and write the outcome to the output buffer. Each frame will
> be decoded cyclically by these two hardware deocders.

So is this patch OK to be merged? Or do you still want changes?

Regards,

	Hans

