Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E0CCD195
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Oct 2025 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmdiKecUbb6YX9YvPMSe8XD6pQJ50/nRtQt/S9vV0Yc=; b=UN30WgUpTQUQgupWGKo8obXKQM
	+RjIiiFkLCu+AypeIt7p43INPgpst9RCmN11WIorol6gKQwvLsnLVPaDXmyG4tbruZnDnefkG62zS
	phsVr29bKFV83LgiFqtAHTZ5Xlg+pCoUUkw3OsONSJV8d1hCt5pOUcJboNfrXKVuZbVRKZ0KST+Pg
	GQyjq+FcvUx4DpMpTFuKuaJO2wf8bpOtKDjlEg9lV4Is7sF0baNWgN8504ZVgqUfaDs1sEsYYgbtf
	M2KzA6+tRmHALBDm23UVqHfBzUDfUYsilw4uYMMxosflFq923/lNI6eXKFct4BHZUhC5UKN1CiBRi
	4AseKiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ewA-00000006y3W-2boV;
	Fri, 17 Oct 2025 07:31:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ew7-00000006y1h-10hR;
	Fri, 17 Oct 2025 07:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760686296;
	bh=+BMP92K4asKFaGVxNw7U7Zl5UFujoFolv1nhfrtKbto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WLaKsOv+PriMSUKniOrtmEXJaysfC6roB605EvkuYZgZ5pOgtRwb+klzkqa3zLy+3
	 TziAC0z7uf7vMRQkkUdOgda1bI6JuvZkfnjGPNTDaJ4Ey8bPBDjhJ+H7qY4UCKvAOd
	 11GI3+ZY+7NHLI7bkbomSD675uSgk5FnOxSmPX5EW5zNcIRKWb+8X0kI9t6LIQ7Qpt
	 w/HCWZHSP9yOLVJJP1to35UeXykuyZiBYpNLnm9UWk6LjOTg7bLwPGG9FtWCuy3Uhx
	 gtk5SbONRX3EalYkRgfIVhqafdHuNcxJcnoQEyRdWVBA4yOxYzDi+FSvC4aW/NcmHD
	 Nz3MB0AbQjHkg==
Received: from [192.168.50.250] (unknown [171.76.80.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B11C217E0FAD;
	Fri, 17 Oct 2025 09:31:32 +0200 (CEST)
Message-ID: <6769d162-ab1c-4427-a0be-22c0b62673c3@collabora.com>
Date: Fri, 17 Oct 2025 13:01:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal
 jobs
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-2-vignesh.raman@collabora.com>
 <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_003139_447973_DA337C66 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Rob,

On 16/10/25 20:22, Rob Clark wrote:
> On Fri, Jul 18, 2025 at 3:54 AM Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
>>
>> These devices are being moved to LAVA. The jobs will be enabled and the
>> job definitions will be updated once the move is complete.
> 
> fwiw, the runners are up and running in LAVA now

Thanks. I will enable them and send v2.

Regards,
Vignesh

> 
> BR,
> -R
> 
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/test.yml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 81147e86bfd0..53d19ffaaf61 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
>>       GPU_VERSION: ${DEVICE_TYPE}
>>       RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
>>
>> -msm:apq8016:
>> +# FIXME: Disable the bare-metal jobs. These devices are being moved to LAVA.
>> +# Once the move is complete, update the job definitions accordingly.
>> +.msm:apq8016:
>>     extends:
>>       - .baremetal-igt-arm64
>>     stage: msm
>> @@ -165,7 +167,7 @@ msm:apq8016:
>>     script:
>>       - ./install/bare-metal/fastboot.sh || exit $?
>>
>> -msm:apq8096:
>> +.msm:apq8096:
>>     extends:
>>       - .baremetal-igt-arm64
>>     stage: msm
>> --
>> 2.47.2
>>


