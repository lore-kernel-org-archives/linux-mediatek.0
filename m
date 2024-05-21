Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944BC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+M1w3zP69leNzDYGB+eQJBf2fU2ra4ePF0HjjDxYy4=; b=3OmVjaZN7T2NjC7OAjWQ7NLTEz
	v5ssynWvMeK2YGm5qytV4t5F3GFYboTt5qtMv7o0x39wecItfS1mqGIYQVPNoohGSaNb5kbCSlfRY
	Uy2uErUJ9GaUgxALCVq8OuhwC6ReE1tFq+/m6d8ZLAIUDZhU5K1hQyGwNX2CaKNAoXBHuWkayTMN5
	2eD+hPdVh1hD8T9cVgugFg254GI5NVKI1zHO5z9hGDz554I1bgBHwrQR45fo6ogWYMCLtn9qiknJd
	tCX3q/bo4QmSrc3wnSsdiXzfTjKTCZ3INP9sJwLjL+0lN5lpz2AaqHLMtla4IdHBax14xIgdsDseC
	SNtqG/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Jcq-0000000GYmi-3THZ;
	Tue, 21 May 2024 07:09:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Jcn-0000000GYl2-0AvO;
	Tue, 21 May 2024 07:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716275365;
	bh=2kRe9Ce8rakW5lnoclVrGvOqgAaS9QJgR7+JBCR7qys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMb57hvRLq5Ogx/eVkr0GikvvOOcmA5elS88vCrGss1/i4ZaMGyJDakkzpsPqdKT0
	 orLLIzRjSegeeBGqdqT+YLzJOOqeU4I3VEw+Wyz6V/8JUomxmKVqURakWOBdWDGMhc
	 a8uCQLH53IZiJhwL5OhP7wuPoxDUYVsSHadDZiP0iwDeoqLby10l9/7WR9H1v92C4z
	 GO4BQg9kw2QgpPDnELBL9rBKXBR05jMVNEwyv7QDoC9dNX7xJ579aMYDO0a3pLAUBx
	 e4xY/BitVag16MsRrKACbRbrpr6Ufokn02bNWB4NaOnAPDNsq22TPAVjmswEHYFEQY
	 Uo90BDiUZNPUQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97C6B378202E;
	Tue, 21 May 2024 07:09:21 +0000 (UTC)
Message-ID: <f3646d66-01f0-476c-8b7f-5df102790fcb@collabora.com>
Date: Tue, 21 May 2024 12:39:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/ci: build virtual GPU driver as module
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
 <20240517092502.647420-4-vignesh.raman@collabora.com>
 <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_000929_258190_D020BA9C 
X-CRM114-Status: GOOD (  19.92  )
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

On 20/05/24 16:32, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:59PM +0530, Vignesh Raman wrote:
>> With latest IGT, the tests tries to load the module and it
>> fails. So build the virtual GPU driver for virtio as module.
> 
> Why? If the test fails on module loading (if the driver is built-in)
> then it's the test that needs to be fixed, not the kerenel config.
> 
> It's fine as a temporal workaround, but please include a link to the
> patch posted to fix the issue.

I will recheck this issue and post a link to the fix.

Regards,
Vignesh

> 
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - No changes.
>>
>> ---
>>   drivers/gpu/drm/ci/build.sh       | 1 -
>>   drivers/gpu/drm/ci/igt_runner.sh  | 6 +++---
>>   drivers/gpu/drm/ci/image-tags.yml | 4 ++--
>>   drivers/gpu/drm/ci/test.yml       | 1 +
>>   drivers/gpu/drm/ci/x86_64.config  | 2 +-
>>   5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
>> index a67871fdcd3f..e938074ac8e7 100644
>> --- a/drivers/gpu/drm/ci/build.sh
>> +++ b/drivers/gpu/drm/ci/build.sh
>> @@ -157,7 +157,6 @@ fi
>>   
>>   mkdir -p artifacts/install/lib
>>   mv install/* artifacts/install/.
>> -rm -rf artifacts/install/modules
>>   ln -s common artifacts/install/ci-common
>>   cp .config artifacts/${CI_JOB_NAME}_config
>>   
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
>> index 20026612a9bd..55532f79fbdc 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>>               export IGT_FORCE_DRIVER="panfrost"
>>           fi
>>           ;;
>> -    amdgpu)
>> +    amdgpu|virtio_gpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
>> -        mv /install/modules/lib/modules/* /lib/modules/.
>> -        modprobe amdgpu
>> +        mv /install/modules/lib/modules/* /lib/modules/. || true
>> +        modprobe --first-time $DRIVER_NAME
>>           ;;
>>   esac
>>   
>> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
>> index 60323ebc7304..328f5c560742 100644
>> --- a/drivers/gpu/drm/ci/image-tags.yml
>> +++ b/drivers/gpu/drm/ci/image-tags.yml
>> @@ -4,9 +4,9 @@ variables:
>>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>>   
>>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
>> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
>> +   DEBIAN_BUILD_TAG: "2024-05-09-virtio"
>>   
>> -   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>> +   KERNEL_ROOTFS_TAG: "2024-05-09-virtio"
>>   
>>      DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
>>      DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 612c9ede3507..864ac3809d84 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -350,6 +350,7 @@ virtio_gpu:none:
>>     script:
>>       - ln -sf $CI_PROJECT_DIR/install /install
>>       - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
> 
> Is it necessary to create it manually here?
> 
>>       - mkdir -p $CI_PROJECT_DIR/results
>>       - ln -sf $CI_PROJECT_DIR/results /results
>>       - install/crosvm-runner.sh install/igt_runner.sh
>> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
>> index 1cbd49a5b23a..78479f063e8e 100644
>> --- a/drivers/gpu/drm/ci/x86_64.config
>> +++ b/drivers/gpu/drm/ci/x86_64.config
>> @@ -91,7 +91,7 @@ CONFIG_KVM=y
>>   CONFIG_KVM_GUEST=y
>>   CONFIG_VIRT_DRIVERS=y
>>   CONFIG_VIRTIO_FS=y
>> -CONFIG_DRM_VIRTIO_GPU=y
>> +CONFIG_DRM_VIRTIO_GPU=m
>>   CONFIG_SERIAL_8250_CONSOLE=y
>>   CONFIG_VIRTIO_NET=y
>>   CONFIG_VIRTIO_CONSOLE=y
>> -- 
>> 2.40.1
>>
> 

