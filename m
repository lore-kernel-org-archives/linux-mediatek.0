Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D41CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 06:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY7m9OO9DJRK7nx+OwbLIMDz5NZRZl9FgzIxNwD1NWc=; b=BKohGyi9YlmRjmZxfTM+Y01Bc5
	x4OkexMG6c7ZIzrQdp7l1Gi4W3SFvVXQ5aHMEuiqIGbnc51IDKfXWtpfboZQwgz29XynhTirpfRL1
	Ewbe6NWCRJUK29/JOAJF35OJ1A0u25rUcia8UYjMT0LLaXOP5Rt1KZ/KAovWajvd3KdnDW9gV0IFW
	Gre82l8yRx691E3SU2L1M2Mxtk5I8zqFT74c0L4BEguDF3tPqsjmQq47Cv1VnOTeq/IrEigOrJ6tM
	AYyXoq85tenW59oEo2G5R0jg8SMzGVzWu6QdSufxTeBV+PT19Bm+fvUvk2sLkKySdR+HPtWUKk2xN
	bQN2M2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrXnG-00000009vxB-1qiP;
	Tue, 02 Apr 2024 06:38:50 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrXnD-00000009vvG-0IRV;
	Tue, 02 Apr 2024 06:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712039917;
	bh=qJ2dEukUQYHmEsmyw7ZbHI+ur/eWAO9V0o+2VTjVyKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=txDJvUuo77oktz3jmtd4lM0A60gu44Qfn+EdrSsVl2vZAMFCKl38AIQ1VOQlhmv/E
	 tFRlfqiGYTZE57dpvnEpyDHFxaMq0ZRRuC4TG4rpMAbtwBY3ztzCR8BdyyL3zpEyyy
	 lnxJ3Gsr2XSmpOgUnKTceku5iUpbG5pdWn2pTeEysWe/Io8SMnjdlXfvsEEDCG4lyA
	 P0L4HpM59sWUDQDYHoRYeA4Da/SqPgkfTkHqNHD4jXBi9NQHSG3bpruiljKcHk1V3j
	 V7DlJi1wO5HnLdXlfbG5fpNtxMOpK/im+J7NvCG0QzU9ypIsiqjClQwV6xaKMhwnOT
	 cyiR2dBIIlQwQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E60837803EE;
	Tue,  2 Apr 2024 06:38:33 +0000 (UTC)
Message-ID: <d21abe07-074b-4158-a544-d2f50d0bdeac@collabora.com>
Date: Tue, 2 Apr 2024 12:08:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] drm/ci: rockchip: Add job to test panfrost GPU
 driver
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
 <20240401061235.192713-10-vignesh.raman@collabora.com>
 <17c5f479-8d25-411a-816f-506320359ab5@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <17c5f479-8d25-411a-816f-506320359ab5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_233847_250032_BDCA4C8B 
X-CRM114-Status: GOOD (  18.47  )
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

On 01/04/24 22:13, Helen Koike wrote:
> 
> 
> On 01/04/2024 03:12, Vignesh Raman wrote:
>> For rockchip rk3288 and rk3399, the GPU driver is panfrost.
>> So add support in drm-ci to test panfrost driver for rockchip
>> SOC and update xfails. Skip KMS tests for panfrost driver
>> since it is not a not a KMS driver and skip driver-specific tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Btw, just a nit, I would squash this with the previous commit, so we 
> don't have a point in history with panfrost tests, than without them, 
> than with them again. But with or without this change:
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>

Maybe I will move the skipping kms tests and other driver specific tests 
  to the previous commit.

Regards,
Vignesh

> 
> Thanks
> Helen
> 
>> ---
>>
>> v2:
>>    - Add panfrost GPU jobs for rockchip SOC with new xfails.
>>
>> v3:
>>    - Skip KMS tests for panfrost driver since it is not a not
>>      a KMS driver and update xfails. Add the job name in GPU_VERSION
>>      and use it for xfail file names instead of using DRIVER_NAME.
>>
>> v4:
>>    - Remove the gpu suffix in job and rename xfails accordingly.
>>
>> v5:
>>    - Skip driver-specific tests.
>>
>> ---
>>   drivers/gpu/drm/ci/test.yml                         | 10 ++++++++++
>>   drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt |  1 +
>>   drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt |  8 ++++++++
>>   drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt |  1 +
>>   drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt |  8 ++++++++
>>   5 files changed, 28 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 96b299c32c07..8c90ae5a51e6 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -191,11 +191,21 @@ rockchip:rk3288:
>>       - .rk3288
>>       - .rockchip-display
>> +panfrost:rk3288:
>> +  extends:
>> +    - .rk3288
>> +    - .panfrost-gpu
>> +
>>   rockchip:rk3399:
>>     extends:
>>       - .rk3399
>>       - .rockchip-display
>> +panfrost:rk3399:
>> +  extends:
>> +    - .rk3399
>> +    - .panfrost-gpu
>> +
>>   .i915:
>>     extends:
>>       - .lava-igt:x86_64
>> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
>> new file mode 100644
>> index 000000000000..abd35a8ef6f4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
>> @@ -0,0 +1 @@
>> +panfrost_prime@gem-prime-import,Crash
>> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>> new file mode 100644
>> index 000000000000..41a846a59644
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>> @@ -0,0 +1,8 @@
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> +
>> +# Skip driver specific tests
>> +msm_.*
>> +^amdgpu.*
>> +v3d_.*
>> +vc4_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
>> new file mode 100644
>> index 000000000000..6f5e760d5ec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
>> @@ -0,0 +1 @@
>> +panfrost_prime@gem-prime-import,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
>> new file mode 100644
>> index 000000000000..41a846a59644
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
>> @@ -0,0 +1,8 @@
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> +
>> +# Skip driver specific tests
>> +msm_.*
>> +^amdgpu.*
>> +v3d_.*
>> +vc4_.*

