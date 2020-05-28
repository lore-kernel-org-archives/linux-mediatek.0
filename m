Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7EFC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895C3207D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 14:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erehHOev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcLTuLXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 895C3207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=167qyFXVJg8LTFIPedbr8vH7hoNN2ak23OQtFPeia8A=; b=erehHOevThiGgi
	G1lNLMF85PDdIKjH9BeT9XtiZ6GMdTYkeOKKGC/7KSvr9Aa9K97yhn/KSOXHlkXv/2n7dpW9VnICu
	2FNP6sERRC40Us+pRxrMa1Q7qWuJsV8aNPqC4F5t0CsNyrfPdDdnk6xxQvGpF6RXHBE72yLnfNods
	OKid+D0Sz/Vc/Z9jl7Dqzj04YrW/L3/Ps4I4r83ObCkPs24WddZ3BCITsC1loIytAygc8hCiiwki8
	ScnI7Yxw7mTOOnZUg+UOPxm1+FUSgQ0OBWdEgnoOHh61sa0dGx3cqRON652WuEAKMXOh++7wCPGyX
	Wps84OBIiA6dhgx2LbCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJOL-0001vY-8z; Thu, 28 May 2020 14:20:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJOH-0001v6-KL
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 14:20:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so11423925wro.1
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPoUuL6Dv3FbUOdae0mVHTVe3I7ZQu1CwxSO94NCHkA=;
 b=GcLTuLXggmlXwez8m8jazNXdQNVbGxt3jejxpjMQ97TEXSWpQO3aT0cAfzTylKLoFH
 rKdccvEJyDUQrGmuU92IJ7L9LO/IzhLtvBRo4P5hhx/aCJFyjea4JXf76W/cbI/jeUMh
 2RkdiRPb5cz5icA/aIZ4jiftaGZbVw5rPwumI4nE0jIz43vUnlBMiBnrKD8ioY0qbyGr
 cxYxicvAd3mFDoJAG/kPusoxy16xu/I1n8wU7gZMSqAZXXse0yPHm4Hd1f6X7c9MywEo
 Ho4lettqbnaYPLaDT7cng6xWOCPiePKf96oXQCv8ibN3P2J71ex7mLxtLdwE6fuZpl7P
 7LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kPoUuL6Dv3FbUOdae0mVHTVe3I7ZQu1CwxSO94NCHkA=;
 b=soKQ7ha7/VfkxbLLtyiLotWYacYsSBoB3qTfdIYW7WKCJSRuGuuEoIwmT/tvzLG1hx
 HuUrr9OgWBAU0r7Bvqr6IBJYadWDpwf7IBjWxfa9kfYpTaxDWnXHqolW1JXy3ZVff22v
 akG/zeQ7bZID/7OKR6worodKxb4dxq+okicHqyfBlJaW8jDVf3QrIU+lCUUlasd3OT2C
 IO7kLmXUepz0SA7bhalXr3NDZEie3GAXlU88+G8HJtwkn/vDwTl9/tgL6djsw3Muwduo
 WFhxFfR6eWVy9tH0gE38BZrt/nzBcTf1uXAvKuCZhxJ03yqGgJTWdMEvHF/joox0zNJ/
 R7eQ==
X-Gm-Message-State: AOAM530VysfGAbluqcLOr7gUIVhcqJoE/elYuP/59vL6xfz+kFRCqx72
 h1/vfxYlXWsVBUPZf1UTlVo6UAq6
X-Google-Smtp-Source: ABdhPJyXiNnbGeXOZEyU0M0eIwqhCyG/G1cQNQiOQYcM/Uv46OemVmGc+lwJ1rSTk2P5ng4jGPvpxg==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr3672840wrt.159.1590675611932; 
 Thu, 28 May 2020 07:20:11 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id s2sm6056279wmh.11.2020.05.28.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 07:20:11 -0700 (PDT)
Subject: Re: [BUG] Cannot boot on MT8173 if Mediatek thermal is enabled
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Michael Kao <michael.kao@mediatek.com>
References: <8d66199a-84cb-5080-cd24-f746d1db5c5a@collabora.com>
 <34c9fc56-ca19-cf59-af71-4273f91338b9@gmail.com>
 <56e774bc-5029-5836-2da1-dcabe3143d29@collabora.com>
 <c01722de-7ef3-f43a-8bc9-cd6581004dba@collabora.com>
 <1590634780.22554.1.camel@mtksdccf07>
 <39c5d33a-d8ef-31d0-6864-62a62e12b2b1@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1d682fad-fc50-9f40-4f8b-ac73a4f41f05@gmail.com>
Date: Thu, 28 May 2020 16:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <39c5d33a-d8ef-31d0-6864-62a62e12b2b1@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_072013_678501_C6A0BF65 
X-CRM114-Status: GOOD (  19.52  )
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
Cc: roger.lu@mediatek.com, Hsin-Yi Wang <hsinyi@chromium.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 renze@rnplus.nl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/05/2020 10:08, Enric Balletbo i Serra wrote:
> Hi Michael,
> 
> On 28/5/20 4:59, Michael Kao wrote:
>> On Wed, 2020-05-20 at 18:12 +0200, Enric Balletbo i Serra wrote:
>>> Hi Matthias et all,
>>>
>>> On 20/5/20 17:25, Enric Balletbo i Serra wrote:
>>>>
>>>>
>>>> On 20/5/20 17:21, Matthias Brugger wrote:
>>>>>
>>>>>
>>>>> On 20/05/2020 17:09, Enric Balletbo i Serra wrote:
>>>>>> Dear all,
>>>>>>
>>>>>> I've been testing the Acer Chromebook R 13 (elm - MT8173) for a while. Today I
>>>>>> enabled the Mediatek thermal driver (CONFIG_MTK_THERMAL=y) and I started to get
>>>>>> that hang [1]
>>>>>>
>>>>>
>>>>> Did you try to bisect to find out what broke it?
>>>>>
>>>>
>>>> I don't even know if this worked at some point, I was running/testing my kernels
>>>> with CONFIG_MTK_THERMAL disabled. From the log doesn't seem to have a lot of
>>>> changes so I suspect this issue is there since long time.
>>>>
>>>
>>> So the commit that introduces the problem is:
>>>
>>> commit eb9aecd90d1a39601e91cd08b90d5fee51d321a6
>>> Author: Michael Kao <michael.kao@mediatek.com>
>>> Date:   Fri Feb 1 15:38:07 2019 +0800
>>>
>>>     thermal: mediatek: fix register index error
>>>
>>>     The index of msr and adcpnp should match the sensor
>>>     which belongs to the selected bank in the for loop.
>>>
>>>     Fixes: b7cf0053738c ("thermal: Add Mediatek thermal driver for mt2701.")
>>>     Signed-off-by: Michael Kao <michael.kao@mediatek.com>
>>>     Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
>>>
>>>
>>>>
>>>>> Regards,
>>>>> Matthias
>>>>>
>>>>>> The stacktrace points point to this function:
>>>>>>
>>>>>> static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>>>>>>
>>>>>> More precisely to this call:
>>>>>>
>>>>>> 		raw = readl(mt->thermal_base +
>>>>>> 			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
>>>>>>
>>>>>> this call, is in a loop and ends trying to access to conf->msr[4]
>>>>>> (conf->msr[MT8173_TSABB]) which doesn't exist as per the following struct
>>>>>>
>>>>>> static const int mt8173_msr[MT8173_NUM_SENSORS_PER_ZONE] = {
>>>>>> 	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2, TEMP_MSR3
>>>>>> };
>>>>>>
>>>>>> I think the datasheet will help here to clarify what is happening but is not
>>>>>> public, so I can really check. Anyway seems that or the mt8173_msr struct is
>>>>>> wrong or the mt8173_bank_data is wrong or there is something else.
>>>>>>
>>>>>> Could anyone with the information or with this hardwware knowledge take a look,
>>>>>> please.
>>>>>>
>>>>>> Thanks,
>>>>>>  Enric
>>>>>>
>>>>>>
>>>>>> [1]
>>>>>> [    2.222488] Unable to handle kernel paging request at virtual address
>>>>>> ffff8000125f5001
>>>>>> [    2.230421] Mem abort info:
>>>>>> [    2.233207]   ESR = 0x96000021
>>>>>> [    2.236261]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>>>> [    2.241571]   SET = 0, FnV = 0
>>>>>> [    2.244623]   EA = 0, S1PTW = 0
>>>>>> [    2.247762] Data abort info:
>>>>>> [    2.250640]   ISV = 0, ISS = 0x00000021
>>>>>> [    2.254473]   CM = 0, WnR = 0
>>>>>> [    2.257544] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041850000
>>>>>> [    2.264251] [ffff8000125f5001] pgd=000000013ffff003, pud=000000013fffe003,
>>>>>> pmd=000000013fff9003, pte=006800001100b707
>>>>>> [    2.274867] Internal error: Oops: 96000021 [#1] PREEMPT SMP
>>>>>> [    2.280432] Modules linked in:
>>>>>> [    2.283483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6+ #162
>>>>>> [    2.289914] Hardware name: Google Elm (DT)
>>>>>> [    2.294003] pstate: 20000005 (nzCv daif -PAN -UAO)
>>>>>> [    2.298792] pc : mtk_read_temp+0xb8/0x1c8
>>>>>> [    2.302793] lr : mtk_read_temp+0x7c/0x1c8
>>>>>> [    2.306794] sp : ffff80001003b930
>>>>>> [    2.310100] x29: ffff80001003b930 x28: 0000000000000000
>>>>>> [    2.315404] x27: 0000000000000002 x26: ffff0000f9550b10
>>>>>> [    2.320709] x25: ffff0000f9550a80 x24: 0000000000000090
>>>>>> [    2.326014] x23: ffff80001003ba24 x22: 00000000610344c0
>>>>>> [    2.331318] x21: 0000000000002710 x20: 00000000000001f4
>>>>>> [    2.336622] x19: 0000000000030d40 x18: ffff800011742ec0
>>>>>> [    2.341926] x17: 0000000000000001 x16: 0000000000000001
>>>>>> [    2.347230] x15: ffffffffffffffff x14: ffffff0000000000
>>>>>> [    2.352535] x13: ffffffffffffffff x12: 0000000000000028
>>>>>> [    2.357839] x11: 0000000000000003 x10: ffff800011295ec8
>>>>>> [    2.363143] x9 : 000000000000291b x8 : 0000000000000002
>>>>>> [    2.368447] x7 : 00000000000000a8 x6 : 0000000000000004
>>>>>> [    2.373751] x5 : 0000000000000000 x4 : ffff800011295cb0
>>>>>> [    2.379055] x3 : 0000000000000002 x2 : ffff8000125f5001
>>>>>> [    2.384359] x1 : 0000000000000001 x0 : ffff0000f9550a80
>>>>>> [    2.389665] Call trace:
>>>>>> [    2.392105]  mtk_read_temp+0xb8/0x1c8
>>>>>> [    2.395760]  of_thermal_get_temp+0x2c/0x40
>>>>>> [    2.399849]  thermal_zone_get_temp+0x78/0x160
>>>>>> [    2.404198]  thermal_zone_device_update.part.0+0x3c/0x1f8
>>>>>> [    2.409589]  thermal_zone_device_update+0x34/0x48
>>>>>> [    2.414286]  of_thermal_set_mode+0x58/0x88
>>>>>> [    2.418375]  thermal_zone_of_sensor_register+0x1a8/0x1d8
>>>>>> [    2.423679]  devm_thermal_zone_of_sensor_register+0x64/0xb0
>>>>>> [    2.429242]  mtk_thermal_probe+0x690/0x7d0
>>>>>> [    2.433333]  platform_drv_probe+0x5c/0xb0
>>>>>> [    2.437335]  really_probe+0xe4/0x448
>>>>>> [    2.440901]  driver_probe_device+0xe8/0x140
>>>>>> [    2.445077]  device_driver_attach+0x7c/0x88
>>>>>> [    2.449252]  __driver_attach+0xac/0x178
>>>>>> [    2.453082]  bus_for_each_dev+0x78/0xc8
>>>>>> [    2.456909]  driver_attach+0x2c/0x38
>>>>>> [    2.460476]  bus_add_driver+0x14c/0x230
>>>>>> [    2.464304]  driver_register+0x6c/0x128
>>>>>> [    2.468131]  __platform_driver_register+0x50/0x60
>>>>>> [    2.472831]  mtk_thermal_driver_init+0x24/0x30
>>>>>> [    2.477268]  do_one_initcall+0x50/0x298
>>>>>> [    2.481098]  kernel_init_freeable+0x1ec/0x264
>>>>>> [    2.485450]  kernel_init+0x1c/0x110
>>>>>> [    2.488931]  ret_from_fork+0x10/0x1c
>>>>>> [    2.492502] Code: f9401081 f9400402 b8a67821 8b010042 (b9400042)
>>>>>> [    2.498599] ---[ end trace e43e3105ed27dc99 ]---
>>>>>> [    2.503367] Kernel panic - not syncing: Attempted to kill init!
>>>>>> exitcode=0x0000000b
>>>>>> [    2.511020] SMP: stopping secondary CPUs
>>>>>> [    2.514941] Kernel Offset: disabled
>>>>>> [    2.518421] CPU features: 0x090002,25006005
>>>>>> [    2.522595] Memory Limit: none
>>>>>> [    2.525644] ---[ end Kernel panic - not syncing: Attempted to kill init!
>>>>>> exitcode=0x0000000b ]---
>>>>>>
>>
>>> Hi Enric,
>> I will help to fix this crash. If it is urgent, you can revert the patch
>> locally first for mt8173.
>>
> 
> Thanks, the reverted patch is what I am carrying ;-)
> 

As Enric mentioned v4.8-rc1 will claim support for MT8173 based Chromebooks, so
we should make sure that a fix gets in in the first rc's (best would be rc2). If
I got that right, best would be if we have a fix in around 4 weeks.

Please let me know if you can't make it and we can revert the commit in the
rc-phase. Also I'd prefer a proper fix.

Enric what do you think?

Regards,
Matthias

> It'd be nice have this fixed for next MR or during the upcoming release cycle,
> it will probably start next week. During the next merge window will land the
> support for MT8173 Elm and Hana, so those boards will be affected by this and
> will break. Actually, there is no much boards supported in mainline using MT8183
> (only EVB), so in the worse case I can send a revert or a partial revert of the
> patch.
> 
> Thanks,
>  Enric
> 
>> The last sensor in mt8173_bank_data[2] is MT8173_TSABB.
>> Its index is 4. But there is not index 4 in mt8173_msr and
>> mt8173_adcpnp.
>> That is the root cause for your reference.
>>
>> static const struct mtk_thermal_data mt8173_thermal_data = {
>> 	.auxadc_channel = MT8173_TEMP_AUXADC_CHANNEL,
>> 	.num_banks = MT8173_NUM_ZONES,
>> 	.num_sensors = MT8173_NUM_SENSORS,
>> 	.vts_index = mt8173_vts_index,
>> 	.cali_val = MT8173_CALIBRATION,
>> 	.num_controller = MT8173_NUM_CONTROLLER,
>> 	.controller_offset = mt8173_tc_offset,
>> 	.need_switch_bank = true,
>> 	.bank_data = {
>> 		{
>> 			.num_sensors = 2,
>> 			.sensors = mt8173_bank_data[0],
>> 		}, {
>> 			.num_sensors = 2,
>> 			.sensors = mt8173_bank_data[1],
>> 		}, {
>> 			.num_sensors = 3,
>> 			.sensors = mt8173_bank_data[2],
>> 		}, {
>> 			.num_sensors = 1,
>> 			.sensors = mt8173_bank_data[3],
>> 		},
>> 	},
>> 	.msr = mt8173_msr,
>> 	.adcpnp = mt8173_adcpnp,
>> 	.sensor_mux_values = mt8173_mux_values,
>> };
>>
>>
>>
>> /* MT8173 thermal sensor data */
>> static const int mt8173_bank_data[MT8173_NUM_ZONES][3] = {
>> 	{ MT8173_TS2, MT8173_TS3 },
>> 	{ MT8173_TS2, MT8173_TS4 },
>> 	{ MT8173_TS1, MT8173_TS2, MT8173_TSABB },
>> 	{ MT8173_TS2 },
>> };
>>
>> static const int mt8173_msr[MT8173_NUM_SENSORS_PER_ZONE] = {
>> 	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2, TEMP_MSR3
>> };
>>
>> static const int mt8173_adcpnp[MT8173_NUM_SENSORS_PER_ZONE] = {
>> 	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2, TEMP_ADCPNP3
>> };
>>
>> /* MT8173 thermal sensors */
>> #define MT8173_TS1	0
>> #define MT8173_TS2	1
>> #define MT8173_TS3	2
>> #define MT8173_TS4	3
>> #define MT8173_TSABB	4
>>
>> Best Regards,
>> Michael
>>> _______________________________________________
>>> Linux-mediatek mailing list
>>> Linux-mediatek@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
