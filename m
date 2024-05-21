Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E8C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPu6Kq++kDE6qclpWVSKcklJKFws72EPlNnYDVEeoqo=; b=z56XKOg7/XDdWWAQUk0ZKKMcHK
	YRph5VP2xOsjy5Mt70I7RvFyL7NJUuc5RDPVRjsJ3BeZ4BGWQe7zhX4acFJXo4Y8/mDZxOcucZKra
	AbWrHTdE48tdf0W0RHHY7f9dfmhxmilIU1qUlcz6/hRnXjeN719rXwhDJdYcTPpzABYiUVrCUBIZ0
	XvGurU/nItEuVJfF0A2fmaYf7GJZSep651eoj9Eomk5HZlFlpM5GQkhx6oo7xDsoHB4Zn/nd6vjq9
	SHeu06p2eys/nk60pGq6PyPlC9TVWp4HHAYhPxr9MxbO7cXh4wh2orOutMyXAWGwtTn1B1uY+NMiu
	QTR5gKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JQW-0000000GWbt-1TCq;
	Tue, 21 May 2024 06:56:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JQS-0000000GWau-48ct;
	Tue, 21 May 2024 06:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716274598;
	bh=TfIOtUcqbwJkZ6notRudlNbUTFukk69iQGuDM3mE/MU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j8hBCfaCITG8b7pfUhoD1HKU00f770m7cYI7bu4vJH8rk/LXn0Yf+54WofcnvQcjO
	 EBrwL0Jt2wDVrxrr+0JBpPbNrJOira99dUdCUm9/dP/GWui7vnBWQNV3pOEVCaXWfP
	 KIkcTRj8vFjREo+/EPduJnkDhULrUqWVhWOHchgYqBE6VpSp3LlufdpcPgqZgmEoMb
	 0Xi1EdMqEXTobHSa/oC9awjBJi9zI4qGB7izvFUBxKilyV71NgrBMi44w52x5Tklr3
	 l7edZajr7e5ZeXhaq1i2UPch5QdDzhEK/PASHKWT3nl9DpEwW0izTYnOWML1e/u8Iq
	 K8mL3G0ETrAaA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B376378202E;
	Tue, 21 May 2024 06:56:35 +0000 (UTC)
Message-ID: <87fba814-eb5a-4b6a-800b-158987fca1d8@collabora.com>
Date: Tue, 21 May 2024 12:26:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
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
 <20240517092502.647420-3-vignesh.raman@collabora.com>
 <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_235645_209023_4A7C0392 
X-CRM114-Status: GOOD (  16.21  )
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

On 20/05/24 16:30, Dmitry Baryshkov wrote:
> On Fri, May 17, 2024 at 02:54:58PM +0530, Vignesh Raman wrote:
>> Stop vendoring the testlist into the kernel. Instead, use the
>> testlist from the IGT build to ensure we do not miss renamed
>> or newly added tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Fix testlist generation for arm and arm64 builds.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  |   34 +
>>   drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>>   drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>>   3 files changed, 39 insertions(+), 2765 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
>> index 7859554756c4..e62244728613 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
> 
> [...]
> 
>> @@ -26,6 +50,16 @@ meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>>   ninja -C build install
>>   
>> +if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu
>> +elif [[ "$KERNEL_ARCH" = "arm" ]]; then
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib
>> +else
>> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib64
> 
> Could you please clarify this part? The arm64 vs arm don't look logical
> from my point of view.
> 
> The rest LGTM.

The libs are installed in the below path for different arch.

 > find . -name libigt.so
./x86/igt/lib64/libigt.so
./arm64/igt/lib/aarch64-linux-gnu/libigt.so
./arm/igt/lib/libigt.so
~/igt-build

So for arm64 it is 'lib/aarch64-linux-gnu' and arm it is 'lib'.

s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/arm64/igt.tar.gz
s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/arm/igt.tar.gz
s3.freedesktop.org/artifacts/vigneshraman/linux/1179691/x86_64/igt.tar.gz

Regards,
Vignesh

> 
>> +fi
>> +
>> +generate_testlist
>> +
>>   mkdir -p artifacts/
>>   tar -cf artifacts/igt.tar /igt
>>   

