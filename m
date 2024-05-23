Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333DC25B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr/i6uTEy/kxqbTbD3pdV5MDYkslXz52+26bUDYnanA=; b=HfkiHgJxRnvgZizUSQfNkJvQY5
	NkfZqlw/lVrRy7+ywWABp3ItKm2j7lJn4qImuNYJE9jCHjLzTVj6mBn6tP7VKg3TnYnbmKYwMUkEW
	D+vwg3rkKaCUJkDT1DJPR/veJQjRhUN21EUirtxe9YITZeQhU0ERKBp3ZgimcJVXhO8kvwQ5n+oNe
	Wlra1xtg/S+oPV9CKJgAfFC5MZ4OT/Z4TkhWIcdwOh71exnKvX3rxDXcZ4DP/6S7UbMbHAvN/RAgT
	VkzbYipVRcJ9OlWm56xjiqH5eN2mWGNKnP6TEWbEHtSB/86PNa74eMStoy38SCujCbkZ1zYyE1LEz
	7azMV9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1c7-00000005Abb-2Y5N;
	Thu, 23 May 2024 06:07:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA1c3-00000005AaZ-17JM;
	Thu, 23 May 2024 06:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716444457;
	bh=ous1oe/kRPBiEhDvboed42vXxlkNgqhP3ypAKRJeMQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=coShTuf2hYo7TRLfb7IfCR4Zujw4PpdPG/DQ3NeLkqe74gGerapIkIcVEgSnRTEdu
	 iOlykt96+WfRFsm4hkM0sokeNs/qFailldaa+TvEqawT9IqysUGEFIomjMQ0oZ89W8
	 abpgCL8RunDK5HZKJmbOM/zlXZMAaHlbb5d0T5BertoWrBqCyjfkyVoCfCQ+KNHYBi
	 ZwR4PFk8JEyOe44RHUQtaYpgxxES0m4vpV6y45qmXnufBqR0eluXBefdpqyTFNgmu0
	 r/ZWUUGsW01BBxSm2uF2EbAXIVUcnL0IjG1GlADRP0rMZvgtnTUbnHj4cy3ivwp3V1
	 Z8oTMTKl/pE1g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 119D137820E5;
	Thu, 23 May 2024 06:07:33 +0000 (UTC)
Message-ID: <9cd0667a-12ee-4d45-80e8-dc34259bf01d@collabora.com>
Date: Thu, 23 May 2024 11:37:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
 <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_230739_509549_34320281 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Dmitry,

On 20/05/24 16:13, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
>> zlib.net is not allowing tarball download anymore and results
>> in below error in kernel+rootfs_arm32 container build,
>> urllib.error.HTTPError: HTTP Error 403: Forbidden
>> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
>>
>> Uprev mesa to latest version which includes a fix for this issue.
>> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
>>
>> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
>> mesa-rootfs, update the variables accordingly. Also copy helper scripts
>> to install, so that the ci jobs can use these scripts for logging.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Uprev to recent version and use id_tokens for JWT authentication
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>>   drivers/gpu/drm/ci/build.sh       |  6 +++--
>>   drivers/gpu/drm/ci/container.yml  | 12 +++------
>>   drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>>   drivers/gpu/drm/ci/image-tags.yml |  2 +-
>>   drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>>   drivers/gpu/drm/ci/test.yml       |  2 ++
>>   7 files changed, 44 insertions(+), 28 deletions(-)
>>
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 8bc63912fddb..612c9ede3507 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -150,6 +150,8 @@ msm:sdm845:
>>       BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>>       GPU_VERSION: sdm845
>>       RUNNER_TAG: google-freedreno-cheza
>> +    DEVICE_TYPE: sdm845-cheza-r3
>> +    FARM: google
> 
> I see that this is the only user of the FARM: tag. Is it correct?

No, we need to add FARM variable for other jobs as well.

> Also we miss DEVICE_TYPE for several other boards. Should we be adding
> them?

Yes, device type needs to be added for msm:apq8016, msm:apq8096, virtio_gpu.

I will add this. Thanks.

Regards,
Vignesh

> 
>>     script:
>>       - ./install/bare-metal/cros-servo.sh
>>   
>> -- 
>> 2.40.1
>>
> 

