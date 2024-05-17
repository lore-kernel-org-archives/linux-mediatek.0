Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4ECC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buaaQ/FZmEo3j8/vGmgqZyVrY+cQ6I001lhcHvr1mvk=; b=jjaMf9vRYmYkHZNtvpGac6gu0d
	I/nD+Hfw0HD0X299IB0WeQict7i8CvR5iZ4zthK9uua/ZDW4+RgPI2qamj9mODLBjZO9A5m6DOZ9E
	T3jrpVro2PSSDMBScmZ53MAjMME887ETbzXYjg8r6OtC5zipuJiB0F53dBj+V78wfbd0CuO1vkuqI
	krHxAb1Bytay//XRq+3u9iVbMF6pZLB2rRjdOjwoC4jVtjoR4PFuafBBEtcSu4ShtoupZpD5YfjVW
	hOk3eAvoRl/adtLma9y4UxLhFyf6/ANqaHIwU7d89cbxWVl7e/93q9l1U/cM5kpJyI6YRqts3y7EO
	pMKRoTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vgP-00000007dv8-0NVT;
	Fri, 17 May 2024 11:23:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vgL-00000007duM-2TFD;
	Fri, 17 May 2024 11:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715945004;
	bh=t1oRx5quleIZIXruOJvRYEzRTKhRag7Aj8Fnm51J3kM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2OD+hhn9SW30Ydu2LGewa9jzaESmHUxXrkr6SlPCRV/WKO52/YU3erv82twMgl6jd
	 waq6Kfi1E+O8RJTeThqg+6nIvh+3yzcqcPwaiDJ+/gx8I96WmeW/+8beC5M/hWStfy
	 uxNLCv8pkW2Qeor+69gghAnSjOkqRMCc+FnHzCVI6Lvjp2o/2twpw5aOFN1hB4t+Ng
	 +Xf2M+25tZrk4k3Y5agl7SLQs1dNpU5Hy+WTCvSufIJPRu3aRrlRdtxlOK7VDFjQbn
	 8GwmUXZJEWrKW/+y5V5oSysosvm8vtbqiTKmJ5r1HciVkkBYgrnsRLuH9YmIXDIciP
	 MkbeFu6BLjsyw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 60B3537821B5;
	Fri, 17 May 2024 11:23:23 +0000 (UTC)
Message-ID: <af6cad98-fde0-440d-8d26-05045387df08@collabora.com>
Date: Fri, 17 May 2024 13:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek/dp: fix spurious kfree()
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240517093024.1702750-1-mwalle@kernel.org>
 <de0191f3-271b-4f0e-aa73-910543587c9d@collabora.com>
 <D1BVE3G40OVL.3KX13LU75M122@kernel.org>
 <0d8f89d4-e16e-4c8d-b983-38df8fcc387e@collabora.com>
 <D1BVPABXTSPH.22ML1GLOMHEJR@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D1BVPABXTSPH.22ML1GLOMHEJR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_042326_061959_3D6C5317 
X-CRM114-Status: GOOD (  19.24  )
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

Il 17/05/24 13:21, Michael Walle ha scritto:
> On Fri May 17, 2024 at 1:09 PM CEST, AngeloGioacchino Del Regno wrote:
>> Il 17/05/24 13:07, Michael Walle ha scritto:
>>> On Fri May 17, 2024 at 12:35 PM CEST, AngeloGioacchino Del Regno wrote:
>>>> Il 17/05/24 11:30, Michael Walle ha scritto:
>>>>> drm_edid_to_sad() might return an error or just zero. If that is the
>>>>> case, we must not free the SADs because there was no allocation in
>>>>> the first place.
>>>>>
>>>>> Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection")
>>>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>>>> ---
>>>>>     drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>>>>> index 536366956447..ada12927bbac 100644
>>>>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>>>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>>>>> @@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
>>>>>     		 */
>>>>>     		const struct edid *edid = drm_edid_raw(drm_edid);
>>>>>     		struct cea_sad *sads;
>>>>> +		int ret;
>>>>>     
>>>>> -		audio_caps->sad_count = drm_edid_to_sad(edid, &sads);
>>>>> -		kfree(sads);
>>>>> +		ret = drm_edid_to_sad(edid, &sads);
>>>>> +		/* Ignore any errors */
>>>>> +		if (ret < 0)
>>>>> +			ret = 0;
>>>>> +		if (ret)
>>>>
>>>> Eh, this will never work, because you're clearing the error before checking
>>>> if there's any error here?!?! :-P
>>>
>>> Don't get what you mean? Yes, I'm ignoring the error. Thus, in case
>>> of an error ret will be zero and there will be no free. If ret was
>>> zero, there won't be a free either. So you're left with the "normal"
>>> case, where you have to free the sads. Just like before.
>>>
>>>> Anyway in reality, it returns -ENOMEM if the allocation was not successful...
>>>> in the event that any future update adds any other error we'd be back with the same
>>>> issue, but I'm not sure how much should we worry about that.
>>>>
>>>> To be extremely safe, we could do...
>>>>
>>>> if (ret != -ENOMEM)
>>>> 	kfree(sads)
>>>>
>>>> audio_caps->sad_count = ret < 0 ? 0 : ret;
>>>
>>> Which is the same as above, but you only check for ENOMEM?
>>>
>>
>> Yes, the point is to avoid kfree(sads) for -ENOMEM only, as other errors that may
>> be introduced later might still allocate it and leave it allocated.
> 
> Honestly, I doubt that any sane function will allocate memory, then
> return an error and expect the caller to free it.
> 

My point was "you never know". But that wasn't a strong opinion anyway.

It's ok for me regardless of what you choose, either follow what I said or don't,
the end result is the same, you're still fixing the issue and both ways are
acceptable, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


