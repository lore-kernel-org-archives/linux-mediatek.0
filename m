Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDB2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV5yp4moMkrVYUc/CaHl4almlCVw/eYz0Zt5LSwa6CA=; b=4Jlk7gUQ5GRQ3l5Jpm7ncmdhGy
	Z6RqJMJRMfxfFNnxKnYy8KT3nhaTQ3O6eiZkc7NxY0UmkRw4Ob31/q7LdhiRTTH4wW5DGQM0BOP77
	aOZQ2zTqto5jZ294nrX2HeA07EHsE3Cfxfu5tFBZWOWi5/B/YU58qFxdCm7K/Q+0L8m/HfEa/XbYL
	i7r7u2YgUnHjsncLiE51kqN7EkVxptlc1LAQrqE0NoNVo8efin0RE5/IAh2roRGcQCT/fsVtpUDyt
	OI1RyE/3/qTKS6XIdVSEA1/DumkaAIM4SqpuyZJH854wmFbsyziql1IUMTFQ/mO/n1GkCf34KlN8p
	LvkSC1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTpdL-00000008BT2-3drO;
	Sat, 27 Jan 2024 20:50:35 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTpdE-00000008BSP-2pEF;
	Sat, 27 Jan 2024 20:50:28 +0000
Message-ID: <a098990b-a599-4478-92ad-8d2d1cce2c6e@infradead.org>
Date: Sat, 27 Jan 2024 12:50:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] media: media-entity.h: Fix kerneldoc
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
 <e6b72dff-911e-4923-9996-b3b7db36fb8e@infradead.org>
 <ZbVOGaw-8qU2QNle@kekkonen.localdomain>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZbVOGaw-8qU2QNle@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/27/24 10:40, Sakari Ailus wrote:
> Hi Randy,
> 
> On Fri, Jan 26, 2024 at 05:51:06PM -0800, Randy Dunlap wrote:
>>
>>
>> On 1/26/24 15:16, Ricardo Ribalda wrote:
>>> The fields seems to be documented twice.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  include/media/media-entity.h | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>>> index 2b6cd343ee9e..c79176ed6299 100644
>>> --- a/include/media/media-entity.h
>>> +++ b/include/media/media-entity.h
>>> @@ -337,10 +337,6 @@ enum media_entity_type {
>>>   * @info.dev:	Contains device major and minor info.
>>>   * @info.dev.major: device node major, if the device is a devnode.
>>>   * @info.dev.minor: device node minor, if the device is a devnode.
>>> - * @major:	Devnode major number (zero if not applicable). Kept just
>>> - *		for backward compatibility.
>>> - * @minor:	Devnode minor number (zero if not applicable). Kept just
>>> - *		for backward compatibility.
>>>   *
>>>   * .. note::
>>>   *
>>>
>>
>> I'd say that this is correct based on
>> https://patchwork.kernel.org/project/linux-media/patch/20231223050707.14091-1-rdunlap@infradead.org/
>>

Ah, I see. Thank you.

>>
>> Hans, can you please explain this message from you, on 2024-Jan-22, that
>> I cannot find in the media patchwork:
> 
> It's in linuxtv.org Patchwork here
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20231223050707.14091-1-rdunlap@infradead.org/>
> and also in the media stage tree (as indicated by the state) but not yet in
> master AFAIU.
> 
>>
>>
>> Subject: [git:media_stage/master] media: media-entity.h: fix Excess kernel-doc description warnings
>>
>>
>>
>> This is an automatic generated email to let you know that the following patch were queued:
>>
>> Subject: media: media-entity.h: fix Excess kernel-doc description warnings
>> Author:  Randy Dunlap <rdunlap@infradead.org>
>> Date:    Fri Dec 22 21:07:07 2023 -0800
>>
>> Remove the @major: and @minor: lines to prevent the kernel-doc warnings:
>>
>> include/media/media-entity.h:376: warning: Excess struct member 'major' description in 'media_entity'
>> include/media/media-entity.h:376: warning: Excess struct member 'minor' description in 'media_entity'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>>  include/media/media-entity.h | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> ---
>>
>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
>> index 2b6cd343ee9e..c79176ed6299 100644
>> --- a/include/media/media-entity.h
>> +++ b/include/media/media-entity.h
>> @@ -337,10 +337,6 @@ enum media_entity_type {
>>   * @info.dev:	Contains device major and minor info.
>>   * @info.dev.major: device node major, if the device is a devnode.
>>   * @info.dev.minor: device node minor, if the device is a devnode.
>> - * @major:	Devnode major number (zero if not applicable). Kept just
>> - *		for backward compatibility.
>> - * @minor:	Devnode minor number (zero if not applicable). Kept just
>> - *		for backward compatibility.
>>   *
>>   * .. note::
>>   *
>>
>>
>>
>> Thanks.
> 

-- 
#Randy

