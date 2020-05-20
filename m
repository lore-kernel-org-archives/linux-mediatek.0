Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9341AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 15:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DB8206BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 15:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPLUtAYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DB8206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IXRsLZu0sqI8yIXkn930rLwSODBanesZ9tSpm1m3gg=; b=CPLUtAYDpsStra
	bAECaxQjLTEHbped718VKjnPzn3M8/1JuCGAsJwnAuzngXiHfmrN/pDP66Y17kwld1Vkz/ypdkxAJ
	zVFtPUBuN/NZtrnI7V/oP96txlC7LZh54Y3xHjk8pwRBHzMM9zoBTAwFX7cMCCzuau5iMVT7CHi1S
	Fpk6tFmRzKz4cK+3Y1ZJo6ObKqpocfcoYsT7jaZ5H+wtdqJTlcX5oYD4J1zOT2NvzCOhwzMgvj9nm
	rCq5w9hti5sapojK3MZQAlI+VG7zSXcyx5f726DTh497XZRYE3Xm8hegfXFOGcWElzCvJsULPg2w1
	a22J2QnyzSopYzj9fS7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQbG-0006RH-1h; Wed, 20 May 2020 15:25:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQbD-0006Qm-3Q
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 15:25:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 0699A2A2C69
Subject: Re: [BUG] Cannot boot on MT8173 if Mediatek thermal is enabled
To: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <8d66199a-84cb-5080-cd24-f746d1db5c5a@collabora.com>
 <34c9fc56-ca19-cf59-af71-4273f91338b9@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <56e774bc-5029-5836-2da1-dcabe3143d29@collabora.com>
Date: Wed, 20 May 2020 17:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <34c9fc56-ca19-cf59-af71-4273f91338b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_082539_403779_12921DED 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: renze@rnplus.nl, michael.kao@mediatek.com,
 "drinkcat@chromium.org" <drinkcat@chromium.org>, roger.lu@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 20/5/20 17:21, Matthias Brugger wrote:
> 
> 
> On 20/05/2020 17:09, Enric Balletbo i Serra wrote:
>> Dear all,
>>
>> I've been testing the Acer Chromebook R 13 (elm - MT8173) for a while. Today I
>> enabled the Mediatek thermal driver (CONFIG_MTK_THERMAL=y) and I started to get
>> that hang [1]
>>
> 
> Did you try to bisect to find out what broke it?
> 

I don't even know if this worked at some point, I was running/testing my kernels
with CONFIG_MTK_THERMAL disabled. From the log doesn't seem to have a lot of
changes so I suspect this issue is there since long time.


> Regards,
> Matthias
> 
>> The stacktrace points point to this function:
>>
>> static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>>
>> More precisely to this call:
>>
>> 		raw = readl(mt->thermal_base +
>> 			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
>>
>> this call, is in a loop and ends trying to access to conf->msr[4]
>> (conf->msr[MT8173_TSABB]) which doesn't exist as per the following struct
>>
>> static const int mt8173_msr[MT8173_NUM_SENSORS_PER_ZONE] = {
>> 	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2, TEMP_MSR3
>> };
>>
>> I think the datasheet will help here to clarify what is happening but is not
>> public, so I can really check. Anyway seems that or the mt8173_msr struct is
>> wrong or the mt8173_bank_data is wrong or there is something else.
>>
>> Could anyone with the information or with this hardwware knowledge take a look,
>> please.
>>
>> Thanks,
>>  Enric
>>
>>
>> [1]
>> [    2.222488] Unable to handle kernel paging request at virtual address
>> ffff8000125f5001
>> [    2.230421] Mem abort info:
>> [    2.233207]   ESR = 0x96000021
>> [    2.236261]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    2.241571]   SET = 0, FnV = 0
>> [    2.244623]   EA = 0, S1PTW = 0
>> [    2.247762] Data abort info:
>> [    2.250640]   ISV = 0, ISS = 0x00000021
>> [    2.254473]   CM = 0, WnR = 0
>> [    2.257544] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041850000
>> [    2.264251] [ffff8000125f5001] pgd=000000013ffff003, pud=000000013fffe003,
>> pmd=000000013fff9003, pte=006800001100b707
>> [    2.274867] Internal error: Oops: 96000021 [#1] PREEMPT SMP
>> [    2.280432] Modules linked in:
>> [    2.283483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6+ #162
>> [    2.289914] Hardware name: Google Elm (DT)
>> [    2.294003] pstate: 20000005 (nzCv daif -PAN -UAO)
>> [    2.298792] pc : mtk_read_temp+0xb8/0x1c8
>> [    2.302793] lr : mtk_read_temp+0x7c/0x1c8
>> [    2.306794] sp : ffff80001003b930
>> [    2.310100] x29: ffff80001003b930 x28: 0000000000000000
>> [    2.315404] x27: 0000000000000002 x26: ffff0000f9550b10
>> [    2.320709] x25: ffff0000f9550a80 x24: 0000000000000090
>> [    2.326014] x23: ffff80001003ba24 x22: 00000000610344c0
>> [    2.331318] x21: 0000000000002710 x20: 00000000000001f4
>> [    2.336622] x19: 0000000000030d40 x18: ffff800011742ec0
>> [    2.341926] x17: 0000000000000001 x16: 0000000000000001
>> [    2.347230] x15: ffffffffffffffff x14: ffffff0000000000
>> [    2.352535] x13: ffffffffffffffff x12: 0000000000000028
>> [    2.357839] x11: 0000000000000003 x10: ffff800011295ec8
>> [    2.363143] x9 : 000000000000291b x8 : 0000000000000002
>> [    2.368447] x7 : 00000000000000a8 x6 : 0000000000000004
>> [    2.373751] x5 : 0000000000000000 x4 : ffff800011295cb0
>> [    2.379055] x3 : 0000000000000002 x2 : ffff8000125f5001
>> [    2.384359] x1 : 0000000000000001 x0 : ffff0000f9550a80
>> [    2.389665] Call trace:
>> [    2.392105]  mtk_read_temp+0xb8/0x1c8
>> [    2.395760]  of_thermal_get_temp+0x2c/0x40
>> [    2.399849]  thermal_zone_get_temp+0x78/0x160
>> [    2.404198]  thermal_zone_device_update.part.0+0x3c/0x1f8
>> [    2.409589]  thermal_zone_device_update+0x34/0x48
>> [    2.414286]  of_thermal_set_mode+0x58/0x88
>> [    2.418375]  thermal_zone_of_sensor_register+0x1a8/0x1d8
>> [    2.423679]  devm_thermal_zone_of_sensor_register+0x64/0xb0
>> [    2.429242]  mtk_thermal_probe+0x690/0x7d0
>> [    2.433333]  platform_drv_probe+0x5c/0xb0
>> [    2.437335]  really_probe+0xe4/0x448
>> [    2.440901]  driver_probe_device+0xe8/0x140
>> [    2.445077]  device_driver_attach+0x7c/0x88
>> [    2.449252]  __driver_attach+0xac/0x178
>> [    2.453082]  bus_for_each_dev+0x78/0xc8
>> [    2.456909]  driver_attach+0x2c/0x38
>> [    2.460476]  bus_add_driver+0x14c/0x230
>> [    2.464304]  driver_register+0x6c/0x128
>> [    2.468131]  __platform_driver_register+0x50/0x60
>> [    2.472831]  mtk_thermal_driver_init+0x24/0x30
>> [    2.477268]  do_one_initcall+0x50/0x298
>> [    2.481098]  kernel_init_freeable+0x1ec/0x264
>> [    2.485450]  kernel_init+0x1c/0x110
>> [    2.488931]  ret_from_fork+0x10/0x1c
>> [    2.492502] Code: f9401081 f9400402 b8a67821 8b010042 (b9400042)
>> [    2.498599] ---[ end trace e43e3105ed27dc99 ]---
>> [    2.503367] Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b
>> [    2.511020] SMP: stopping secondary CPUs
>> [    2.514941] Kernel Offset: disabled
>> [    2.518421] CPU features: 0x090002,25006005
>> [    2.522595] Memory Limit: none
>> [    2.525644] ---[ end Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b ]---
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
