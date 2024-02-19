Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC02C48BF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 12:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bAalTo2/sOkJ3wHteyygc3R50wOSZRU3XoVN8/m4M0=; b=eXVRhxBNKOPhXjOiWKeTxxrw2Q
	w2orAzs5w63oDfU0WicPBt+psetgt2vqyxCCZPd4j4oaHYGuQOwmybaKXidmIW82PWAIF7X3r4S6j
	1IJsGL7w1RHbs8vfrsxjZEW1xtkDbNB6X96sulrD8M37L6v1Qs3E9/eup5/7l0eH5WDryjCSXo/qd
	VGAzcje5ciZifmB1A1Mg5znjqxfzMY5t9E9AZRWTzRHwPz3Lv44uLIofE9+fKgv9O9ZHNjjzaWG+b
	SaDnxJGnpe8phhJfwY2wVxY7yYjwYlw777nJDhyhaRiEKPC/6m06kaojuBa+3E7qwA/meWMtr57ky
	LdCjRHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38d-0000000AThG-31ep;
	Mon, 19 Feb 2024 12:52:51 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38Z-0000000ATfF-34LJ;
	Mon, 19 Feb 2024 12:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708347164;
	bh=RlJFnwC8vtKaCRSiqNBP6fs/G9L9iiOg4PIBPGdT9RU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSMVtvfseBUsWHd8wUrB3Ibay4Sz6yDaBFlcdwRfZDu7OZb7dzMN2z0D228h83b6D
	 PpHL+rGH/nqw5fLvRNk0jDlXSVOeD+27wus48q7YrBG5qxc76/KkCQDljqy1MsDZOg
	 micgwVxeWwS1qrGtK/yRCjih5BWeqUr+rSoZhV0Z2LWmIXEhYqyR5UdWrHsBHxQ3hk
	 3f8yGFskfV80sMOw1Ns3IAE1L+6rlsI+WFiFTnx1pnW2UyOPiW5fC1axJ0Sh5/7tR5
	 dup+DkxrWG2e7wJVyBV3261jSKXDSlqC5EGojjeSlnX1DpYtub6lbmZX5ichLsNbwC
	 RYVQj6nkYBqZA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F4A437820C1;
	Mon, 19 Feb 2024 12:52:40 +0000 (UTC)
Message-ID: <e69a275c-4415-4f0c-bae4-af8112357ef6@collabora.com>
Date: Mon, 19 Feb 2024 09:52:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
 <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
 <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_045247_924314_2521E4CD 
X-CRM114-Status: GOOD (  18.22  )
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



On 19/02/2024 06:39, Vignesh Raman wrote:
> Hi Helen,
> 
> On 09/02/24 23:51, Helen Koike wrote:
>>
>>
>> On 30/01/2024 12:03, Vignesh Raman wrote:
>>> For mediatek mt8173, the GPU driver is powervr and for mediatek
>>> mt8183, the GPU driver is panfrost. So add support in drm-ci to
>>> test panfrost and powervr GPU driver for mediatek SOCs and update
>>> xfails. Powervr driver was merged in linux kernel, but there's no
>>> mediatek support yet. So disable the mt8173-gpu job which uses
>>> powervr driver.
>>>
>>> Add panfrost specific tests to testlist and skip KMS tests for
>>> panfrost driver since it is not a not a KMS driver. Also update
>>> the MAINTAINERS file to include xfails for panfrost driver.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>
>> Hi Vignesh, thanks for your work.
>>
>> I'm still wondering about a few things, please check below.
>>
>>> ---
>>>
>>> v2:
>>>    - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, 
>>> add xfail
>>>      entry to MAINTAINERS.
>>
>> Maybe we should review how the xfails failes are named. I think they 
>> should start with the DRIVER_NAME instead of GPU_VERSION.
>>
>> For instance, consider the following job:
>>
>> mediatek:mt8183-gpu:
>>    extends:
>>      - .mt8183
>>    variables:
>>      GPU_VERSION: mediatek-mt8183-gpu
>>      DRIVER_NAME: panfrost
>>
>> And we have mediatek-mt8183-gpu-skips.txt
>>
>> If there is an error, we want to notify the panfrost driver 
>> maintainers (and maybe not the mediatek driver maintainers), so 
>> MAINTAINERS file doesn't correspond to this.
> 
> Agree.
> 
>>
>> How about a naming <driver name>_<hardware/gpu>_<type: gpu/display> ?
>>
>> powervr_mediatek-mt8173_gpu-skipts.txt
>> mediatek_mediatek-mt8173_display-skipts.txt
>> panfrost_mediatek-mt8183_gpu-skips.txt
>> mediatek_mediatek-mt8183_display-skips.txt
>> ...
>>
>> What do you think?
> 
> Yes we can keep this naming. In this case do we still need gpu/display 
> in the xfails file name?

If you think this split is not required, then I'm fine dropping it.

Regards,
Helen

> 
> Regards,
> Vignesh

