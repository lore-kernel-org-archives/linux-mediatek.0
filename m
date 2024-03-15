Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE085C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqQfr1BX/Vyk7/MTTBl/AV/wcIuejYwxyWbUdll3AI0=; b=DckUCDCyBsW+Hcez136ZmBeRQ7
	ZV8wCWkqRSdarEyl+1/s5zvElQ46b+Rfm5HBlJgAcfgMr+AR0/Oi25TmH7f2Qdk8SfFjz62cCahGc
	9Ddm79PSTTiXpixJ0ei8TGmbLeW3YvBWNw6nDH+XB7QSTIWg9tjVutspufCh16YHs11hoTaexMmLF
	oZ7XLOMzfoHcz7jjT5HC4O6+Cm/5p9lpny7XetluSEMDXIcwQ+toNcg9Ll2P6c4OBrLUvDyYno5qh
	GLuaICVnDzYiZEKIMkuHhwRxPayY3Qgs6S2WJQBBpgagmS1bkGaScDS10j3tr3O0wJlbc1htZQbv+
	U/WInmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6FK-0000000070x-1bzE;
	Fri, 15 Mar 2024 12:01:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6FH-000000006yo-2nGY;
	Fri, 15 Mar 2024 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710504059;
	bh=wo5KaJTO7g4XTsjvDT5W1hhUtD1zGfjPtDK9XkU/fsw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1jxPqcrx/ox/m1AOEkf/cnIgOag7fS4EFgxhaRQR6tv37YpNkhmjwMdziiVEDa5Ii
	 RNa47ceM168TpFQcoHUTRQsLKpALlajcmXvRzc3Aw6eyITrsBKbWXLiIS7XmVwchyD
	 h5lL1gNiFConcL3rmgtDIyYiVK6Hc82QbbabKl1p1QQnWDyh/PcK2+4k9dGRIziPs/
	 rhPXT6O2yWCSelSqW+RmWE/S9PbgExcDvLe0LyzkQ2OUNEKrRDltU0nCcQ724VDc9W
	 hnpyxuJitqatKY1oiW2YO9yXCgvwSlEH269TMeWB26+lPF9wKOwdYMIzVLOQ1YhbCX
	 vi5pfjpYCvEEA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D3E8A378105A;
	Fri, 15 Mar 2024 12:00:53 +0000 (UTC)
Message-ID: <00b4af3b-bbb6-4057-969f-5882220858a3@collabora.com>
Date: Fri, 15 Mar 2024 09:00:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] drm/ci: uprev IGT and update testlist
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-4-vignesh.raman@collabora.com>
 <4f927c99-9ea2-424e-85a7-bd05d0817dab@collabora.com>
 <af5b6e38-306d-ae79-42af-88e6e9a32cff@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <af5b6e38-306d-ae79-42af-88e6e9a32cff@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_050107_930294_6462576B 
X-CRM114-Status: GOOD (  20.58  )
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



On 15/03/2024 08:12, Vignesh Raman wrote:
> Hi Helen,
> 
> On 07/03/24 19:05, Helen Koike wrote:
>>
>>
>> On 06/03/2024 00:06, Vignesh Raman wrote:
>>> Uprev IGT and add amd, v3d, vc4 and vgem specific
>>> tests to testlist. Have testlist.txt per driver
>>> and include a base testlist so that the driver
>>> specific tests will run only on those hardware.
>>> Also add testlists to the MAINTAINERS file.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> ---
>>>
>>> v3:
>>>    - New patch in series to uprev IGT and update testlist.
>>>
>>> v4:
>>>    - Add testlists to the MAINTAINERS file and remove amdgpu xfails 
>>> changes.
>>>
>>> ---
>>>   MAINTAINERS                              |  11 ++
>>>   drivers/gpu/drm/ci/gitlab-ci.yml         |   2 +-
>>>   drivers/gpu/drm/ci/igt_runner.sh         |  12 +-
>>>   drivers/gpu/drm/ci/testlist-amdgpu.txt   | 151 +++++++++++++++++++++++
>>>   drivers/gpu/drm/ci/testlist-msm.txt      |  50 ++++++++
>>>   drivers/gpu/drm/ci/testlist-panfrost.txt |  17 +++
>>>   drivers/gpu/drm/ci/testlist-v3d.txt      |  73 +++++++++++
>>>   drivers/gpu/drm/ci/testlist-vc4.txt      |  49 ++++++++
>>>   drivers/gpu/drm/ci/testlist.txt          |  84 ++++++-------
>>>   9 files changed, 398 insertions(+), 51 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
>>>   create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 3bc7e122a094..4da66ca92f1a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1665,6 +1665,8 @@ L:    dri-devel@lists.freedesktop.org
>>>   S:    Supported
>>>   T:    git git://anongit.freedesktop.org/drm/drm-misc
>>>   F:    Documentation/gpu/panfrost.rst
>>> +F:    drivers/gpu/drm/ci/testlist-panfrost.txt
>>> +F:    drivers/gpu/drm/ci/testlist.txt
>>
>> I wonder if we should have both here, since the second is not used right?
> 
> Yes, we need to use both here. testlist-panfrost.txt includes 
> testlist.txt. So we have moved the driver specific tests to
> testlist-panfrost.txt and have a base testlist.txt.
> 
> 
>>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>>> b/drivers/gpu/drm/ci/igt_runner.sh
>>> index f1a08b9b146f..77cd81fe6d1a 100755
>>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>>> @@ -74,10 +74,20 @@ if ! grep -q "core_getversion" 
>>> /install/testlist.txt; then
>>>   fi
>>>   set +e
>>> +if [ "$DRIVER_NAME" = "amdgpu" ]; then
>>> +    TEST_LIST="/install/testlist-amdgpu.txt"
>>> +elif [ "$DRIVER_NAME" = "msm" ]; then
>>> +    TEST_LIST="/install/testlist-msm.txt"
>>> +elif [ "$DRIVER_NAME" = "panfrost" ]; then
>>> +    TEST_LIST="/install/testlist-panfrost.txt"
>>> +else
>>> +    TEST_LIST="/install/testlist.txt"
>>> +fi
>>
>> Maybe simplify this with:
>>
>> TEST_LIST="/install/testlist-$DRIVER_NAME.txt"
>>
>> if [ ! -f "$TEST_LIST" ]; then
>>      TEST_LIST="/install/testlist.txt"
>> fi
> 
> Yes, this is much better. Thanks.
> 
>>
>> Another question I have: shouldn't testlist-$DRIVER_NAME.txt and 
>> testlist.txt be merged? Or they are really mutually exclusive?
> 
> We have testlist-$DRIVER_NAME.txt per driver and it includes a base 
> testlist.txt

I'm confused, it seems that from the code or it uses 
testlist-$DRIVER_NAME.txt or it uses testlist.txt, you don't merge them 
by code, which means that drivers don't need to follow changes to 
testlist.txt.

If testlist-$DRIVER_NAME.txt already includes tests in testlist.txt, 
than testlist.txt doesn't need to be added in the MAINTEINERS file in 
all drivers.

Helen

> 
> Regards,
> Vignesh

