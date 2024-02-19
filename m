Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931CBC54766
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7Ph/z+mp8SdKv4/R27rzqJyPb/qOZiGgoVlwoEl/6Y=; b=34VfqR4PBm/bo72lBU52YaojyG
	KeMC0Gks8ndpKJOYUb3HxRlrMbYmZOz6uExyLBs3WCbG1tXtOQv4SSCtZuqVP8uOabBX95t0aQedg
	Wjc08lm2UNbgFMV9BfRFMplqEzphQCp2l9J4L+5DS42TCaSxB8XDvGPN7jLXGQnDowIp0tgkBoaCQ
	GyYet0srRVmVjiLvIsJCL8V0l0duOLn+6+2/NLsEqsNndUCrqg3Gn8xPwqN0qahJddzfsqHM0cBhh
	0Yqw2WZBGcb3HacK+NDFHorFm0p6sj5bB6MEhf9jhWawEbEGdaFL6qFlzdqDi4rhERY7lrv8NKIIn
	kgRp99LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc07k-00000009rUj-15Jp;
	Mon, 19 Feb 2024 09:39:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc07h-00000009rSf-1MOD;
	Mon, 19 Feb 2024 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708335579;
	bh=eNBh5JpwUZ0+jl/Gio0qtOi4bqHTZ3A6braWYxV+N2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N25pmdsXyywrOwI3pBlJJ9qyR2MkR8q6uB3CEdJxb22cjIEUTV3I/LsBj3+n52fsm
	 WJa1Zu7W/6w5Te2yZ3oDPsbgi6qLCuTVN6VlHN1voEp/+JOHxvd24ZA5UJyDDzsnv6
	 Wks3OSsVQItOebQ4HMoHnZUYw5dc36UsfbVewRU3xARO/xgW9NCApWwKJm49xOA5zR
	 71dN1CQjT9BRyCT+MT91hf0zmuyhOjEIliWrHS16NyE2XBJ6cwDskUyh2PtMDO7qKL
	 Xzl7p77dQahXD+X8d6BCOXdMaspzjqrOobTHhhXIZ1cjfuWWngoCf7vzSeaIH1SyOV
	 hwwazeNZPOWJQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2572237801C1;
	Mon, 19 Feb 2024 09:39:32 +0000 (UTC)
Message-ID: <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
Date: Mon, 19 Feb 2024 15:09:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
 <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_013941_570969_5BA98FC2 
X-CRM114-Status: GOOD (  22.85  )
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

On 09/02/24 23:51, Helen Koike wrote:
> 
> 
> On 30/01/2024 12:03, Vignesh Raman wrote:
>> For mediatek mt8173, the GPU driver is powervr and for mediatek
>> mt8183, the GPU driver is panfrost. So add support in drm-ci to
>> test panfrost and powervr GPU driver for mediatek SOCs and update
>> xfails. Powervr driver was merged in linux kernel, but there's no
>> mediatek support yet. So disable the mt8173-gpu job which uses
>> powervr driver.
>>
>> Add panfrost specific tests to testlist and skip KMS tests for
>> panfrost driver since it is not a not a KMS driver. Also update
>> the MAINTAINERS file to include xfails for panfrost driver.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Hi Vignesh, thanks for your work.
> 
> I'm still wondering about a few things, please check below.
> 
>> ---
>>
>> v2:
>>    - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, 
>> add xfail
>>      entry to MAINTAINERS.
> 
> Maybe we should review how the xfails failes are named. I think they 
> should start with the DRIVER_NAME instead of GPU_VERSION.
> 
> For instance, consider the following job:
> 
> mediatek:mt8183-gpu:
>    extends:
>      - .mt8183
>    variables:
>      GPU_VERSION: mediatek-mt8183-gpu
>      DRIVER_NAME: panfrost
> 
> And we have mediatek-mt8183-gpu-skips.txt
> 
> If there is an error, we want to notify the panfrost driver maintainers 
> (and maybe not the mediatek driver maintainers), so MAINTAINERS file 
> doesn't correspond to this.

Agree.

> 
> How about a naming <driver name>_<hardware/gpu>_<type: gpu/display> ?
> 
> powervr_mediatek-mt8173_gpu-skipts.txt
> mediatek_mediatek-mt8173_display-skipts.txt
> panfrost_mediatek-mt8183_gpu-skips.txt
> mediatek_mediatek-mt8183_display-skips.txt
> ...
> 
> What do you think?

Yes we can keep this naming. In this case do we still need gpu/display 
in the xfails file name?

Regards,
Vignesh

