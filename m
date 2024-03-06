Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56FC54E49
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 02:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0sS6Ud5KG9xg7eFKCI0mRSSLLKlawcj1qnRSHcIvnw=; b=OhdpoEFwDCEaHvMqegnpYhgEIt
	EuVtisgmc9pB8+4y+7CtTZNO4pZaY35WKFBMTtDWPnQWdycOE/2+IUWox8nAMJ8lc7z/nb9D7Eubb
	t0o/C9r+vqM16xp0U8kuAlv7JzloAfFQnZwXjS0gjS8+pzwkSy99uLDSPL3j9eMa516dj0uJxw0TP
	sHSHF8fPFK3Mi5Y7Z9jSqHiqfwL3szbLR/2kKfecmvqIOSxVjFzCPGSXj4J4ANaqcbV6Ob1Gqfbeb
	PJOpPnyBWmc9vN+qu/WT+kNTDDjWhbCIbthy7BC64vlAmtaLoHtaTtZA8ieYCJ2aGe6+T7ciWWpdw
	bHjB67+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhDL-0000000G14t-06xX;
	Wed, 06 Mar 2024 02:41:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhDG-0000000G13e-2RHK;
	Wed, 06 Mar 2024 02:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709692854;
	bh=mgOhO0IDZgLwsPvXZt6ogw3x+b9+CWMm5P2F9Ag7u7o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MZr+N44xWgYx/KeDYYxby6i5AzGFwBKGEf04A7jZxAjv/oiqSPM+Iac/PrkzORUkH
	 A1WXgZKX3mcU8AvNMeimSYpUq9t+Juc6tBMXKanpqny19+fjNt1wAbIolq2ednOBDw
	 tanlqsaUCXZnB1wseZjvY1ci9HHDWh3b5k5xvDYaV1PxT0tMOW9DklPtS7+xuMdDdG
	 OjxOq2VbGWANCyPIMv2jX4XA0pChfI+Awtt/4eJr+aZkeUYEHzXwriZbtWCFwW466B
	 MAgE7dgS0n1Wqkcs5dR+rnPHEJ1gCpsR2axSkhPy+RRHhGjmInK6oQcXWqffprHr2V
	 nCXUY3ZHF6V3g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0AC53780624;
	Wed,  6 Mar 2024 02:40:51 +0000 (UTC)
Message-ID: <ea5d08ef-a9bb-5102-4357-21dbae3462cd@collabora.com>
Date: Wed, 6 Mar 2024 08:10:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 9/9] drm/ci: uprev IGT and update testlist
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org, airlied@gmail.com
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-10-vignesh.raman@collabora.com>
 <26f6426d-dcb6-4b14-b031-368b2248e9e7@igalia.com>
 <799653a3-e079-4e17-9d68-c0e384a216b0@igalia.com>
 <e1f56317-b70d-0b81-75f0-fef50616e026@collabora.com>
In-Reply-To: <e1f56317-b70d-0b81-75f0-fef50616e026@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_184058_895494_1C54155E 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Maíra,

On 19/02/24 14:22, Vignesh Raman wrote:
> Hi Maíra,
> 
> On 10/02/24 23:50, Maíra Canal wrote:
>> On 2/10/24 15:17, Maíra Canal wrote:
>>> On 1/30/24 12:03, Vignesh Raman wrote:
>>>> Uprev IGT and add amd, v3d, vc4 and vgem specific
>>>> tests to testlist. Have testlist.txt per driver
>>>> and include a base testlist so that the driver
>>>> specific tests will run only on those hardware.
>>>>
>>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>>> ---
>>>>
>>>> v3:
>>>>    - New patch in series to uprev IGT and update testlist.
>>>>
>>>> ---
>>>>   drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>>>>   drivers/gpu/drm/ci/igt_runner.sh              |  12 +-
>>>>   drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 
>>>> ++++++++++++++++++
>>>>   drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
>>>>   drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
>>>>   drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
>>>>   drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
>>>>   drivers/gpu/drm/ci/testlist.txt               | 100 ++++--------
>>>>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  24 ++-
>>>>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   9 +-
>>>>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  10 +-
>>>>   11 files changed, 427 insertions(+), 70 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
>>>>   create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
>>>>
>>>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml 
>>>> b/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> index bc8cb3420476..e2b021616a8e 100644
>>>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>>>> @@ -5,7 +5,7 @@ variables:
>>>>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>>>>     TARGET_BRANCH: drm-next
>>>> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
>>>> +  IGT_VERSION: b0cc8160ebdc87ce08b7fd83bb3c99ff7a4d8610
>>>>     DEQP_RUNNER_GIT_URL: 
>>>> https://gitlab.freedesktop.org/anholt/deqp-runner.git
>>>>     DEQP_RUNNER_GIT_TAG: v0.15.0
>>>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>>>> b/drivers/gpu/drm/ci/igt_runner.sh
>>>> index f001e015d135..2fd09b9b7cf6 100755
>>>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>>>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>>>> @@ -64,10 +64,20 @@ if ! grep -q "core_getversion" 
>>>> /install/testlist.txt; then
>>>>   fi
>>>>   set +e
>>>> +if [ "$DRIVER_NAME" = "amdgpu" ]; then
>>>> +    TEST_LIST="/install/testlist-amdgpu.txt"
>>>> +elif [ "$DRIVER_NAME" = "msm" ]; then
>>>> +    TEST_LIST="/install/testlist-msm.txt"
>>>> +elif [ "$DRIVER_NAME" = "panfrost" ]; then
>>>> +    TEST_LIST="/install/testlist-panfrost.txt"
>>>> +else
>>>> +    TEST_LIST="/install/testlist.txt"
>>>> +fi
>>>> +
>>>
>>> Isn't V3D and VC4 testlists missing?
> 
> Yes. We need to add ci jobs to test v3d/vc4. The initial idea was just 
> to split the testlist per driver and add vc4/v3d tests so that it can be 
> used in future. I will add the jobs as part of v4.

To include RPi jobs, we need to tweak mesa-ci to pass kernel and dtb and 
update mesa-ci in drm-ci. So will send this as a seperate patch/series.

Regards,
Vignesh

