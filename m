Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E610C27C44
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSOG+4dIcOJ+9tRtsuE41alokKTpntQ+uCKvQMVUpCM=; b=bGOj0/ATlVR9g9VQuxzcCqYLlb
	SOvz9MCVHgGsy37rzg+7gdGC1VS1Z8FDED07KmlrLuOn29fxEevwXgeJcIjXx8Z8mm5alqu6kwszb
	aUMrK1nIc6sYZMKT3UWF/mmJrswjf7OOKM2a+3E4W9zuuMckJ757bqqklu3ETQJnmPef0mMmGvQ3r
	jNcycIXYvC1eYFU6IFLsfW9zLdQXVFDBV2aB1CnBVOSH8G20SLyVeZiuFk9DlnuxtAr7i0cbvsGgg
	6m6G9L09dnbIsN342b5CwwErErgT6CKP0/77uSp1nWeHpdl2AbsMns7B2BXZf5pXpJG6Wvss1MRx4
	dDF5gFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFvH-00000003gpE-3Ppb;
	Wed, 29 May 2024 09:48:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFvD-00000003gk3-1Cd4;
	Wed, 29 May 2024 09:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716976108;
	bh=qf6ymj3RFfkiiaCFpxQKjdAF3Bl843ub+B+34Y8z/as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=McsTEN60Vjt8NdHBol50pxTr9PPR0mANAwkso+KggPtbLZ96gx6WFt39jPm6RaST2
	 9WqjTcIfbEqEMhdoXNljZZnOeUD6j0Y4bb4lPy08ZQ3TCXVOmmqJSvKdPGkTUDWURP
	 VXfmKfgIig01ItkT2gCBlOaVsCXhP8ScrJn91p4t5ICU3QWERtAcUqalqq35HiaG4h
	 0q5we2lYK1Ihh8muJAvwG+jH9RT1I3ZRltKrUpY80G3rY4+t/ccXt201Zkg9R2Oz77
	 FaIYlc7dSvWos34mvwzBQejHsnFwEeLUGa2WrJvFiFAgKvkFZSmJrJh+6Z7HPjYq7C
	 Dvhq2jHBKWPTQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 86B76378205D;
	Wed, 29 May 2024 09:48:24 +0000 (UTC)
Message-ID: <12f14064-fd1c-4e9c-94ee-ba7d492a4056@collabora.com>
Date: Wed, 29 May 2024 15:18:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
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
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
 <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_024839_577704_CE969E0C 
X-CRM114-Status: GOOD (  14.92  )
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

On 29/05/24 13:39, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
>> test-list.txt and test-list-full.txt are not generated for
>> cross-builds and they are required by drm-ci for testing
>> arm32 targets. This is fixed in igt-gpu-tools. So uprev
>> IGT to include the commit which fixes this issue. Also
>> disable building xe driver tests for non-intel platforms.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Split IGT uprev to seperate patch.
>>
>> v3:
>>    - No changes.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
>> index b7d2a49a6db3..eddb5f782a5e 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>>                  -Dlibunwind=enabled                   \
>>                  -Dprefix=/igt"
>>   
>> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
>> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
>> +fi
>> +
>>   mkdir -p /igt
>>   meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 8f32de63d92e..1b29c3b6406b 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -5,7 +5,7 @@ variables:
>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>     TARGET_BRANCH: drm-next
>>   
>> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
> 
> Let's land this, then I'll ask to uprev to
> dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
> writeback tests on MSM devices.

Sure. Once this is merged, we can uprev to the latest IGT.

Regards,
Vignesh

> 
>>   
>>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>> -- 
>> 2.40.1
>>
> 

