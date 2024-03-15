Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F4BC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6Z6+LzWR8VnQ1MHAIQqSX3nYYo4plRfZHfUVAmQTDA=; b=OESlSq37GvnAk4dQuU+E3gI0yt
	r7Pb9tRHoz19tdEBoGclDKtHoJ7eFCQ3+/tvha0Xh1W8xCy5YRMrO3CXuvD1cmo7lNVDKG+LiB1Wp
	ihw5lxlrAJPPqrZx2HBYz3HqfuHizksnjw2yD0/PQvBdbPXqxwFEZKSu4wKWwx+Hug8c7loYdRlgH
	YoE33V7dvaNWl6WStbK56c0nh+2N+RAWsIA3XuQXDQ2/65Ww0KHDGncbYXPu6XdAtVhZR0oJ7MHhb
	Bgxlgez0RvFIVCS9Eo7pvz2/LLlct/2OlksQKRaBOwY9Hn2uZ866KYPgfNaZFPz492JUXu9DMm9bk
	gGtJZcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5XB-0000000HaAW-0JKp;
	Fri, 15 Mar 2024 11:15:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5X7-0000000Ha9v-2DUE;
	Fri, 15 Mar 2024 11:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710501328;
	bh=dl7ZhBIyNJ+zkeATWSO3R1GGYspWpDZBRDyyr6jhFxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZAY3hiq1mwwA9m59SLy+T5ZuyG+SM7R9K57TZdw85wxld+66CUWGg0yvUtTXQO9D
	 pKbyloDvRwGnDg1vBhSyXLJe6gJT0BNToA7zZaayOesHRR9Tpsf1391diB/dUnRHl0
	 g2XY6gmD+97I6E7ftZRYWQX+1yu1aY4StsUWhGewTo0Dzhv+qWUIpdI2cLEuj77axT
	 QzXGamsy7SRP5kXVa4v2eiO6L9jk0R7xrWxeiz01jTL1521s1ulgHBPOanmL0yqFAx
	 MzP7PrH37lOM/mKdm+Od5RmybnW4NakayucXCBEoztypsIGWC+NoSszFhyfvNBx2ci
	 9ZMN33QjAeDbQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B6FE37820D8;
	Fri, 15 Mar 2024 11:15:24 +0000 (UTC)
Message-ID: <4b88ae15-ac1c-c77f-69cf-26cd192ee908@collabora.com>
Date: Fri, 15 Mar 2024 16:45:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 05/11] drm/ci: mediatek: Refactor existing mediatek
 jobs
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-6-vignesh.raman@collabora.com>
 <e53fd362-c2c2-4935-b6a3-c73decd23d10@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <e53fd362-c2c2-4935-b6a3-c73decd23d10@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041529_720046_6827F628 
X-CRM114-Status: GOOD (  17.96  )
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

Hi Helen,

On 07/03/24 19:32, Helen Koike wrote:
> 
> 
> On 06/03/2024 00:06, Vignesh Raman wrote:
>> For mediatek mt8173 and mt8183, the display driver is mediatek.
>> Currently, in drm-ci for mediatek, only the display driver is
>> tested. Refactor the existing mediatek jobs so that gpu driver
>> testing jobs can be added later and update xfails accordingly.
>> Since the correct driver name is passed from the job to test gpu
>> and display driver, remove the check to set IGT_FORCE_DRIVER
>> based on driver name.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Refactor the patch to rename job to indicate display driver testing,
>>      rename the existing xfail files, and remove IGT_FORCE_DRIVER from 
>> the
>>      script since it's now set by the job.
>>
>> v3:
>>    - Add the job name in GPU_VERSION and use it for xfail file names 
>> instead
>>      of using DRIVER_NAME. Also update xfails.
>>
>> v4:
>>    - Remove the display suffix in job and rename xfails accordingly.
>>      Remove the change adding job name in GPU_VERSION.
>>
>> ---
>>   drivers/gpu/drm/ci/igt_runner.sh              | 10 ---------
>>   drivers/gpu/drm/ci/test.yml                   | 21 ++++++++++++++-----
>>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 15 -------------
>>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 13 ++++++++++++
>>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 21 ++++++++++++-------
>>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  8 +++++++
>>   6 files changed, 50 insertions(+), 38 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>> b/drivers/gpu/drm/ci/igt_runner.sh
>> index 77cd81fe6d1a..711f32772e48 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
>>   set -e
>>   case "$DRIVER_NAME" in
>> -    rockchip|meson)
>> -        export IGT_FORCE_DRIVER="panfrost"
>> -        ;;
>> -    mediatek)
>> -        if [ "$GPU_VERSION" = "mt8173" ]; then
>> -            export IGT_FORCE_DRIVER=${DRIVER_NAME}
>> -        elif [ "$GPU_VERSION" = "mt8183" ]; then
>> -            export IGT_FORCE_DRIVER="panfrost"
>> -        fi
>> -        ;;
>>       amdgpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't 
>> have the module in /lib
>>           mv /install/modules/lib/modules/* /lib/modules/.
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 0857773e5c5f..f8f48523ada3 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -282,29 +282,40 @@ amdgpu:stoney:
>>       - .lava-igt:arm64
>>     stage: mediatek
>>     variables:
>> -    DRIVER_NAME: mediatek
>>       DTB: ${DEVICE_TYPE}
>>       BOOT_METHOD: depthcharge
>>       KERNEL_IMAGE_TYPE: ""
>> -mediatek:mt8173:
>> +.mt8173:
>>     extends:
>>       - .mediatek
>>     parallel: 4
>>     variables:
>>       DEVICE_TYPE: mt8173-elm-hana
>> -    GPU_VERSION: mt8173
> 
> Looks like it make sense to keep GPU_VERSION here, no?
> Same comment for .mt8183.

Yes, will keep the GPU_VERSION here for mediatek jobs and others also.

Regards,
Vignesh


