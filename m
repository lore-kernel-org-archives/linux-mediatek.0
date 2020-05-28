Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F95AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 03:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB8020888
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 03:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A7KHiY8e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K6Xelxsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB8020888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QYbhcP8PrcfEnyQBeRE2AmrtJ8QUoNeTvY0RoMFQys=; b=A7KHiY8e/ETVps
	rtBh75nApoh4Nz1jjJXc4N7N+Hc7xmKxDc5BBxsCW7OWhKI/1d4JI777bQtT5HggCuqRLTwRDhQjh
	OPfRVJRtCg43S0hEqLynJ5Rd4auREsTeysD0BIXtLsFn5PoZnwjsB7CKyiruOmB9oov7iFnCWd5se
	DN8n/wiFmErOr7x202TwcSPa61QfRMkhTqj5UODnNgr6u++YLVFB6Ap/gwjNLq8JWm4zMkCO9a/Pd
	8hEn8pKqeWbKbZOGoKBAGt5PPTv+/bTkKY0SfqPtJzzDomLH05vE2Dgw4bDgxgM2R6WZeVX7g/cvC
	gqmfReXw4q4E2gHHDrEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je8lu-00073R-7f; Thu, 28 May 2020 02:59:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je8lo-00072l-Qv
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 02:59:52 +0000
X-UUID: 53aea73f942f470d8f37e97ab93bd5f8-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=INHwr3VuUiVrcJ6tLVznxDSn1wKJwaTfiiJj6yY/y+4=; 
 b=K6XelxsdpI6ENYgQh/HQLn+kM5QqjE95dWso1T9dNw6IK5oCkrKnXzKLJmzmBvcJJVKa6gEB/gIFsBD4wfI0Rj8My+FrhwbAUr04E/Kx8F+bsA5X0NogoDDmozgSPtkCdTuTZRAwBwMFzeEhPt7CeLKx2TDH0x+D6dGShPC9R1w=;
X-UUID: 53aea73f942f470d8f37e97ab93bd5f8-20200527
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 619149830; Wed, 27 May 2020 18:59:44 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 19:59:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 10:59:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 10:59:39 +0800
Message-ID: <1590634780.22554.1.camel@mtksdccf07>
Subject: Re: [BUG] Cannot boot on MT8173 if Mediatek thermal is enabled
From: Michael Kao <michael.kao@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 28 May 2020 10:59:40 +0800
In-Reply-To: <c01722de-7ef3-f43a-8bc9-cd6581004dba@collabora.com>
References: <8d66199a-84cb-5080-cd24-f746d1db5c5a@collabora.com>
 <34c9fc56-ca19-cf59-af71-4273f91338b9@gmail.com>
 <56e774bc-5029-5836-2da1-dcabe3143d29@collabora.com>
 <c01722de-7ef3-f43a-8bc9-cd6581004dba@collabora.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_195948_880170_F196761B 
X-CRM114-Status: GOOD (  24.46  )
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
Cc: "drinkcat@chromium.org" <drinkcat@chromium.org>, roger.lu@mediatek.com,
 renze@rnplus.nl, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 18:12 +0200, Enric Balletbo i Serra wrote:
> Hi Matthias et all,
> 
> On 20/5/20 17:25, Enric Balletbo i Serra wrote:
> > 
> > 
> > On 20/5/20 17:21, Matthias Brugger wrote:
> >>
> >>
> >> On 20/05/2020 17:09, Enric Balletbo i Serra wrote:
> >>> Dear all,
> >>>
> >>> I've been testing the Acer Chromebook R 13 (elm - MT8173) for a while. Today I
> >>> enabled the Mediatek thermal driver (CONFIG_MTK_THERMAL=y) and I started to get
> >>> that hang [1]
> >>>
> >>
> >> Did you try to bisect to find out what broke it?
> >>
> > 
> > I don't even know if this worked at some point, I was running/testing my kernels
> > with CONFIG_MTK_THERMAL disabled. From the log doesn't seem to have a lot of
> > changes so I suspect this issue is there since long time.
> > 
> 
> So the commit that introduces the problem is:
> 
> commit eb9aecd90d1a39601e91cd08b90d5fee51d321a6
> Author: Michael Kao <michael.kao@mediatek.com>
> Date:   Fri Feb 1 15:38:07 2019 +0800
> 
>     thermal: mediatek: fix register index error
> 
>     The index of msr and adcpnp should match the sensor
>     which belongs to the selected bank in the for loop.
> 
>     Fixes: b7cf0053738c ("thermal: Add Mediatek thermal driver for mt2701.")
>     Signed-off-by: Michael Kao <michael.kao@mediatek.com>
>     Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
> 
> 
> > 
> >> Regards,
> >> Matthias
> >>
> >>> The stacktrace points point to this function:
> >>>
> >>> static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
> >>>
> >>> More precisely to this call:
> >>>
> >>> 		raw = readl(mt->thermal_base +
> >>> 			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
> >>>
> >>> this call, is in a loop and ends trying to access to conf->msr[4]
> >>> (conf->msr[MT8173_TSABB]) which doesn't exist as per the following struct
> >>>
> >>> static const int mt8173_msr[MT8173_NUM_SENSORS_PER_ZONE] = {
> >>> 	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2, TEMP_MSR3
> >>> };
> >>>
> >>> I think the datasheet will help here to clarify what is happening but is not
> >>> public, so I can really check. Anyway seems that or the mt8173_msr struct is
> >>> wrong or the mt8173_bank_data is wrong or there is something else.
> >>>
> >>> Could anyone with the information or with this hardwware knowledge take a look,
> >>> please.
> >>>
> >>> Thanks,
> >>>  Enric
> >>>
> >>>
> >>> [1]
> >>> [    2.222488] Unable to handle kernel paging request at virtual address
> >>> ffff8000125f5001
> >>> [    2.230421] Mem abort info:
> >>> [    2.233207]   ESR = 0x96000021
> >>> [    2.236261]   EC = 0x25: DABT (current EL), IL = 32 bits
> >>> [    2.241571]   SET = 0, FnV = 0
> >>> [    2.244623]   EA = 0, S1PTW = 0
> >>> [    2.247762] Data abort info:
> >>> [    2.250640]   ISV = 0, ISS = 0x00000021
> >>> [    2.254473]   CM = 0, WnR = 0
> >>> [    2.257544] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041850000
> >>> [    2.264251] [ffff8000125f5001] pgd=000000013ffff003, pud=000000013fffe003,
> >>> pmd=000000013fff9003, pte=006800001100b707
> >>> [    2.274867] Internal error: Oops: 96000021 [#1] PREEMPT SMP
> >>> [    2.280432] Modules linked in:
> >>> [    2.283483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc6+ #162
> >>> [    2.289914] Hardware name: Google Elm (DT)
> >>> [    2.294003] pstate: 20000005 (nzCv daif -PAN -UAO)
> >>> [    2.298792] pc : mtk_read_temp+0xb8/0x1c8
> >>> [    2.302793] lr : mtk_read_temp+0x7c/0x1c8
> >>> [    2.306794] sp : ffff80001003b930
> >>> [    2.310100] x29: ffff80001003b930 x28: 0000000000000000
> >>> [    2.315404] x27: 0000000000000002 x26: ffff0000f9550b10
> >>> [    2.320709] x25: ffff0000f9550a80 x24: 0000000000000090
> >>> [    2.326014] x23: ffff80001003ba24 x22: 00000000610344c0
> >>> [    2.331318] x21: 0000000000002710 x20: 00000000000001f4
> >>> [    2.336622] x19: 0000000000030d40 x18: ffff800011742ec0
> >>> [    2.341926] x17: 0000000000000001 x16: 0000000000000001
> >>> [    2.347230] x15: ffffffffffffffff x14: ffffff0000000000
> >>> [    2.352535] x13: ffffffffffffffff x12: 0000000000000028
> >>> [    2.357839] x11: 0000000000000003 x10: ffff800011295ec8
> >>> [    2.363143] x9 : 000000000000291b x8 : 0000000000000002
> >>> [    2.368447] x7 : 00000000000000a8 x6 : 0000000000000004
> >>> [    2.373751] x5 : 0000000000000000 x4 : ffff800011295cb0
> >>> [    2.379055] x3 : 0000000000000002 x2 : ffff8000125f5001
> >>> [    2.384359] x1 : 0000000000000001 x0 : ffff0000f9550a80
> >>> [    2.389665] Call trace:
> >>> [    2.392105]  mtk_read_temp+0xb8/0x1c8
> >>> [    2.395760]  of_thermal_get_temp+0x2c/0x40
> >>> [    2.399849]  thermal_zone_get_temp+0x78/0x160
> >>> [    2.404198]  thermal_zone_device_update.part.0+0x3c/0x1f8
> >>> [    2.409589]  thermal_zone_device_update+0x34/0x48
> >>> [    2.414286]  of_thermal_set_mode+0x58/0x88
> >>> [    2.418375]  thermal_zone_of_sensor_register+0x1a8/0x1d8
> >>> [    2.423679]  devm_thermal_zone_of_sensor_register+0x64/0xb0
> >>> [    2.429242]  mtk_thermal_probe+0x690/0x7d0
> >>> [    2.433333]  platform_drv_probe+0x5c/0xb0
> >>> [    2.437335]  really_probe+0xe4/0x448
> >>> [    2.440901]  driver_probe_device+0xe8/0x140
> >>> [    2.445077]  device_driver_attach+0x7c/0x88
> >>> [    2.449252]  __driver_attach+0xac/0x178
> >>> [    2.453082]  bus_for_each_dev+0x78/0xc8
> >>> [    2.456909]  driver_attach+0x2c/0x38
> >>> [    2.460476]  bus_add_driver+0x14c/0x230
> >>> [    2.464304]  driver_register+0x6c/0x128
> >>> [    2.468131]  __platform_driver_register+0x50/0x60
> >>> [    2.472831]  mtk_thermal_driver_init+0x24/0x30
> >>> [    2.477268]  do_one_initcall+0x50/0x298
> >>> [    2.481098]  kernel_init_freeable+0x1ec/0x264
> >>> [    2.485450]  kernel_init+0x1c/0x110
> >>> [    2.488931]  ret_from_fork+0x10/0x1c
> >>> [    2.492502] Code: f9401081 f9400402 b8a67821 8b010042 (b9400042)
> >>> [    2.498599] ---[ end trace e43e3105ed27dc99 ]---
> >>> [    2.503367] Kernel panic - not syncing: Attempted to kill init!
> >>> exitcode=0x0000000b
> >>> [    2.511020] SMP: stopping secondary CPUs
> >>> [    2.514941] Kernel Offset: disabled
> >>> [    2.518421] CPU features: 0x090002,25006005
> >>> [    2.522595] Memory Limit: none
> >>> [    2.525644] ---[ end Kernel panic - not syncing: Attempted to kill init!
> >>> exitcode=0x0000000b ]---
> >>>

> Hi Enric,
I will help to fix this crash. If it is urgent, you can revert the patch
locally first for mt8173.

The last sensor in mt8173_bank_data[2] is MT8173_TSABB.
Its index is 4. But there is not index 4 in mt8173_msr and
mt8173_adcpnp.
That is the root cause for your reference.

static const struct mtk_thermal_data mt8173_thermal_data = {
	.auxadc_channel = MT8173_TEMP_AUXADC_CHANNEL,
	.num_banks = MT8173_NUM_ZONES,
	.num_sensors = MT8173_NUM_SENSORS,
	.vts_index = mt8173_vts_index,
	.cali_val = MT8173_CALIBRATION,
	.num_controller = MT8173_NUM_CONTROLLER,
	.controller_offset = mt8173_tc_offset,
	.need_switch_bank = true,
	.bank_data = {
		{
			.num_sensors = 2,
			.sensors = mt8173_bank_data[0],
		}, {
			.num_sensors = 2,
			.sensors = mt8173_bank_data[1],
		}, {
			.num_sensors = 3,
			.sensors = mt8173_bank_data[2],
		}, {
			.num_sensors = 1,
			.sensors = mt8173_bank_data[3],
		},
	},
	.msr = mt8173_msr,
	.adcpnp = mt8173_adcpnp,
	.sensor_mux_values = mt8173_mux_values,
};



/* MT8173 thermal sensor data */
static const int mt8173_bank_data[MT8173_NUM_ZONES][3] = {
	{ MT8173_TS2, MT8173_TS3 },
	{ MT8173_TS2, MT8173_TS4 },
	{ MT8173_TS1, MT8173_TS2, MT8173_TSABB },
	{ MT8173_TS2 },
};

static const int mt8173_msr[MT8173_NUM_SENSORS_PER_ZONE] = {
	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2, TEMP_MSR3
};

static const int mt8173_adcpnp[MT8173_NUM_SENSORS_PER_ZONE] = {
	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2, TEMP_ADCPNP3
};

/* MT8173 thermal sensors */
#define MT8173_TS1	0
#define MT8173_TS2	1
#define MT8173_TS3	2
#define MT8173_TS4	3
#define MT8173_TSABB	4

Best Regards,
Michael
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
