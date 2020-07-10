Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03959C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:58:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F35207D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5iC/kuL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuxVkXnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F35207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jHt3Eeobyyb42b9QtX71mzsj+JDcI/HkTESV99dUjFE=; b=K5iC/kuLYUYPXBLn4unLIplxq
	Rujlvl3/slWAy8K7BVsTvJMBRWqOM0/gO7qWvVOkIDwNg7fgCCaOqyQEmJu3bBC6kfUiRkXUvQIVj
	opyZpCwk8gS5c9FsALJVgLMgOd+ft4aEbZUUWgzSJAolFeEWgMrUjHBTTrsbA99EIIvdU5mkmi8xy
	k8hW/6ahEOQTGGePIrwYKxcbTdFc/pV9fkNnt6mTU0owetp+75JEq4dpirUWB1FznaZp+BN7zy+Ut
	ZHFxql+4yvZ9Oq5pXjI1dnI0PEJY6MMBg+u9sbUgcC6+hpgIlYg3xKYYimxCk8KY0iete4OTwJaJ3
	NuCWeXNZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttXa-0004IA-8Q; Fri, 10 Jul 2020 13:58:14 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttXX-0004Hd-S3; Fri, 10 Jul 2020 13:58:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id q15so6276500wmj.2;
 Fri, 10 Jul 2020 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rFeUaiviFA43oUAWOSP16FbhvRxDnaaNa57FTdxWXIQ=;
 b=FuxVkXnj4j0bqqNMYJa5KKPvEmhjjAi4TZ5MoxjxQIjmWK9OVlOQIgDp932SjuHDr+
 lH4V1dc0SGx5xJe0t3StiB/BH/jIab0VsVNBbGnk5de+rlWiCbKwAujyJmLsZX8cnXjY
 WTMYsiX70wL4TFQ46Pdq50QLU8katOWrofsvO2FcToGCpjY8aYP5el0UxVIETXlFh7xQ
 ZuwwI1vPCuO+dk+Mvah6lY1/YrOfh1Pw1orhEhX/MEPkQuK+3e+KeqJHpBPd+E/JxgW2
 6QkZvrTqCRsQbo2G0pUiqHLFTMlh5RM0O8Q70ohRVf+fVrJKX2LZ9F0Ge17ZHMwHqOlu
 mTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rFeUaiviFA43oUAWOSP16FbhvRxDnaaNa57FTdxWXIQ=;
 b=Jc5j4NHbrXJFZBtrQKg+euGSYoOa4dQezf2dAm4e3wqi6w/nctROIrQe2kDPg1ZJJz
 VUbiRIsj3+kGThW7kIm10piib7iR9Q3r5LTYhtnGK6YPi6gB/yAb+gMM1ALrMItZCD9V
 kd45cwZWU20y0PjkZy1O6CG2GO6xh/VGPmAoY7GQzB++L9t92bAfKZDuM1UO4sY3B5Ql
 bXZNfVbmG4QFi1lAZfD9IFt9qsMlLE3alKSSPbKFHm2oDR/QpA4XN8pMoTV9IV01yZSk
 s97fIbypo7Ryoj4jK8wNRgiG5l9A2biNr58WZKU2hgPJR1czrRcWNMg8lY6CIbYC7hKg
 ax8w==
X-Gm-Message-State: AOAM530CDu9tXvWDwSi1DnJ3srtamfXepjFUMR6fNEUo18oKLo4I5S3h
 O7KgNjRZNQABwSMuQnlQnJM=
X-Google-Smtp-Source: ABdhPJwAnPyWA75gjJ0MUJJA5Fa4VwezmNZwmDXmU7nC2ZapiXTGID33S9gCzWnZJWIXHBxOK5MSzg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr5236550wmh.121.1594389490961; 
 Fri, 10 Jul 2020 06:58:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id v18sm11155377wrv.49.2020.07.10.06.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:58:10 -0700 (PDT)
Subject: Re: [PATCH] Revert "thermal: mediatek: fix register index error"
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>
References: <20200707103412.1010823-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <98369dbc-2e2a-a1bd-f3cd-68f33f66b882@gmail.com>
Date: Fri, 10 Jul 2020 15:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707103412.1010823-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_095811_994355_DADDFFF4 
X-CRM114-Status: GOOD (  30.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, linux-pm@vger.kernel.org,
 Michael Kao <michael.kao@mediatek.com>, Eduardo Valentin <edubezval@gmail.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 12:34, Enric Balletbo i Serra wrote:
> This reverts commit eb9aecd90d1a39601e91cd08b90d5fee51d321a6
> 
> The above patch is supposed to fix a register index error on mt2701. It
> is not clear if the problem solved is a hang or just an invalid value
> returned, my guess is the second. The patch introduces, though, a new
> hang on MT8173 device making them unusable. So, seems reasonable, revert
> the patch because introduces a worst issue.
> 
> The reason I send a revert instead of trying to fix the issue for MT8173
> is because the information needed to fix the issue is in the datasheet
> and is not public. So I am not really able to fix it.
> 
> Fixes the following bug when CONFIG_MTK_THERMAL is set on MT8173
> devices.
> 
> [    2.222488] Unable to handle kernel paging request at virtual address ffff8000125f5001
> [    2.230421] Mem abort info:
> [    2.233207]   ESR = 0x96000021
> [    2.236261]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.241571]   SET = 0, FnV = 0
> [    2.244623]   EA = 0, S1PTW = 0
> [    2.247762] Data abort info:
> [    2.250640]   ISV = 0, ISS = 0x00000021
> [    2.254473]   CM = 0, WnR = 0
> [    2.257544] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041850000
> [    2.264251] [ffff8000125f5001] pgd=000000013ffff003, pud=000000013fffe003, pmd=000000013fff9003, pte=006800001100b707
> [    2.274867] Internal error: Oops: 96000021 [#1] PREEMPT SMP
> [    2.280432] Modules linked in:
> [    2.283483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6+ #162
> [    2.289914] Hardware name: Google Elm (DT)
> [    2.294003] pstate: 20000005 (nzCv daif -PAN -UAO)
> [    2.298792] pc : mtk_read_temp+0xb8/0x1c8
> [    2.302793] lr : mtk_read_temp+0x7c/0x1c8
> [    2.306794] sp : ffff80001003b930
> [    2.310100] x29: ffff80001003b930 x28: 0000000000000000
> [    2.315404] x27: 0000000000000002 x26: ffff0000f9550b10
> [    2.320709] x25: ffff0000f9550a80 x24: 0000000000000090
> [    2.326014] x23: ffff80001003ba24 x22: 00000000610344c0
> [    2.331318] x21: 0000000000002710 x20: 00000000000001f4
> [    2.336622] x19: 0000000000030d40 x18: ffff800011742ec0
> [    2.341926] x17: 0000000000000001 x16: 0000000000000001
> [    2.347230] x15: ffffffffffffffff x14: ffffff0000000000
> [    2.352535] x13: ffffffffffffffff x12: 0000000000000028
> [    2.357839] x11: 0000000000000003 x10: ffff800011295ec8
> [    2.363143] x9 : 000000000000291b x8 : 0000000000000002
> [    2.368447] x7 : 00000000000000a8 x6 : 0000000000000004
> [    2.373751] x5 : 0000000000000000 x4 : ffff800011295cb0
> [    2.379055] x3 : 0000000000000002 x2 : ffff8000125f5001
> [    2.384359] x1 : 0000000000000001 x0 : ffff0000f9550a80
> [    2.389665] Call trace:
> [    2.392105]  mtk_read_temp+0xb8/0x1c8
> [    2.395760]  of_thermal_get_temp+0x2c/0x40
> [    2.399849]  thermal_zone_get_temp+0x78/0x160
> [    2.404198]  thermal_zone_device_update.part.0+0x3c/0x1f8
> [    2.409589]  thermal_zone_device_update+0x34/0x48
> [    2.414286]  of_thermal_set_mode+0x58/0x88
> [    2.418375]  thermal_zone_of_sensor_register+0x1a8/0x1d8
> [    2.423679]  devm_thermal_zone_of_sensor_register+0x64/0xb0
> [    2.429242]  mtk_thermal_probe+0x690/0x7d0
> [    2.433333]  platform_drv_probe+0x5c/0xb0
> [    2.437335]  really_probe+0xe4/0x448
> [    2.440901]  driver_probe_device+0xe8/0x140
> [    2.445077]  device_driver_attach+0x7c/0x88
> [    2.449252]  __driver_attach+0xac/0x178
> [    2.453082]  bus_for_each_dev+0x78/0xc8
> [    2.456909]  driver_attach+0x2c/0x38
> [    2.460476]  bus_add_driver+0x14c/0x230
> [    2.464304]  driver_register+0x6c/0x128
> [    2.468131]  __platform_driver_register+0x50/0x60
> [    2.472831]  mtk_thermal_driver_init+0x24/0x30
> [    2.477268]  do_one_initcall+0x50/0x298
> [    2.481098]  kernel_init_freeable+0x1ec/0x264
> [    2.485450]  kernel_init+0x1c/0x110
> [    2.488931]  ret_from_fork+0x10/0x1c
> [    2.492502] Code: f9401081 f9400402 b8a67821 8b010042 (b9400042)
> [    2.498599] ---[ end trace e43e3105ed27dc99 ]---
> [    2.503367] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    2.511020] SMP: stopping secondary CPUs
> [    2.514941] Kernel Offset: disabled
> [    2.518421] CPU features: 0x090002,25006005
> [    2.522595] Memory Limit: none
> [    2.525644] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]--
> 
> Cc: Michael Kao <michael.kao@mediatek.com>
> Fixes: eb9aecd90d1a ("thermal: mediatek: fix register index error")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Daniel, Zhang, Amit: can you take this as a bugfix for v5.8 please? We waited 
long enough to get a proper fix for the driver, but nothing was posted on the 
mailinglist. Also we don't know if this will break mt2701 or not, we prefer to 
have a working mt8173 as this is actually a SoC that is available to the general 
public (as a chromebook product).

I propose to take this revert for now and hope that MediaTek will fix the driver 
for good in the near future.

Regards,
Matthias

> ---
> 
>   drivers/thermal/mtk_thermal.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 6b7ef1993d7e..42c9cd0e5f77 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -594,8 +594,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   	u32 raw;
>   
>   	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> -		raw = readl(mt->thermal_base +
> -			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
> +		raw = readl(mt->thermal_base + conf->msr[i]);
>   
>   		temp = raw_to_mcelsius(mt,
>   				       conf->bank_data[bank->id].sensors[i],
> @@ -736,8 +735,7 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>   
>   	for (i = 0; i < conf->bank_data[num].num_sensors; i++)
>   		writel(conf->sensor_mux_values[conf->bank_data[num].sensors[i]],
> -		       mt->thermal_base +
> -		       conf->adcpnp[conf->bank_data[num].sensors[i]]);
> +		       mt->thermal_base + conf->adcpnp[i]);
>   
>   	writel((1 << conf->bank_data[num].num_sensors) - 1,
>   	       controller_base + TEMP_MONCTL0);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
