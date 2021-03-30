Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E49C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 03:02:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74F86195D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 03:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74F86195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mv/ovLbhxaI6JpO4rtKdm7N0NMJCRyezbXeyWB8R3lg=; b=nQjdIN8LnPegxuhddbbS4qoCY
	1HVVPA3Y6naLGZ8TIOEDEZNB3x1rmf8V7WuUCubkVqOAz9xnmfMaSoeTVoF0WUyibHpgFCk/dc3C6
	aJYmWZsJEH57hac2pRZDy4I2HbQ84Hrgfvu0l4on7CsOoumu+WzB5AvddGw+dRZKQ5NhHl3FR18DD
	I38D9TgCCQGGMbjEMXN74H6PZPvUVMORmOGzwnlF/mdXv4z3M8YUvjZvLEHhM5p+fw1saHGOrcje5
	d3/6JudOqbcHN4NCBS0oAxCAkrymJ/TYnNH5qLsWwWqWR45p1lv4zPizNeUcZDto7VLZfJMvqI/Na
	4nw8djvKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR4dq-002WkZ-Dl; Tue, 30 Mar 2021 03:02:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR4dJ-002WhT-Nx; Tue, 30 Mar 2021 03:01:36 +0000
X-UUID: 1b190ff9d065450ea9655ba6a7dd464b-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h3tgTgAhTPVHl6C7nGiDPVcZVqzWaFEKu+Mj0evMIr4=; 
 b=LI7e3Glzwpjv1aUej04C4LHb49W1O+HP+7QCPeYeNiwA4nkulkaLUAjZKbYHa+kRIPbMAy1thXHAoqgRTqNU235yUxSLgW3TvMS5vlolspzNH3jHdEQ31HWUtfeX6ONqGonQuGvD1wl5dqC1buA0UCC7mYVMLyMBDi1Ta0S9fpk=;
X-UUID: 1b190ff9d065450ea9655ba6a7dd464b-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 910363157; Mon, 29 Mar 2021 19:01:28 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:51:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 10:51:24 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 10:51:24 +0800
Message-ID: <1617072684.13941.2.camel@mtksdccf07>
Subject: Re: [PATCH v2] thermal: cpufreq_cooling: fix slab OOB issue
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>, <fan.chen@mediatek.com>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>, brian-sy yang
 <brian-sy.yang@mediatek.com>, <linux-kernel@vger.kernel.org>, "Eduardo
 Valentin" <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 30 Mar 2021 10:51:24 +0800
In-Reply-To: <20201229050831.19493-1-michael.kao@mediatek.com>
References: <20201229050831.19493-1-michael.kao@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_040134_340937_06FF9745 
X-CRM114-Status: GOOD (  20.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Daniel,

Kindly ping.
Can this patch be merged? Or any comment?

BR,
Michael

On Tue, 2020-12-29 at 13:08 +0800, Michael Kao wrote:
> From: brian-sy yang <brian-sy.yang@mediatek.com>
> 
> Slab OOB issue is scanned by KASAN in cpu_power_to_freq().
> If power is limited below the power of OPP0 in EM table,
> it will cause slab out-of-bound issue with negative array
> index.
> 
> Return the lowest frequency if limited power cannot found
> a suitable OPP in EM table to fix this issue.
> 
> Backtrace:
> [<ffffffd02d2a37f0>] die+0x104/0x5ac
> [<ffffffd02d2a5630>] bug_handler+0x64/0xd0
> [<ffffffd02d288ce4>] brk_handler+0x160/0x258
> [<ffffffd02d281e5c>] do_debug_exception+0x248/0x3f0
> [<ffffffd02d284488>] el1_dbg+0x14/0xbc
> [<ffffffd02d75d1d4>] __kasan_report+0x1dc/0x1e0
> [<ffffffd02d75c2e0>] kasan_report+0x10/0x20
> [<ffffffd02d75def8>] __asan_report_load8_noabort+0x18/0x28
> [<ffffffd02e6fce5c>] cpufreq_power2state+0x180/0x43c
> [<ffffffd02e6ead80>] power_actor_set_power+0x114/0x1d4
> [<ffffffd02e6fac24>] allocate_power+0xaec/0xde0
> [<ffffffd02e6f9f80>] power_allocator_throttle+0x3ec/0x5a4
> [<ffffffd02e6ea888>] handle_thermal_trip+0x160/0x294
> [<ffffffd02e6edd08>] thermal_zone_device_check+0xe4/0x154
> [<ffffffd02d351cb4>] process_one_work+0x5e4/0xe28
> [<ffffffd02d352f44>] worker_thread+0xa4c/0xfac
> [<ffffffd02d360124>] kthread+0x33c/0x358
> [<ffffffd02d289940>] ret_from_fork+0xc/0x18
> 
> Fixes: 371a3bc79c11b ("thermal/drivers/cpufreq_cooling: Fix wrong frequency converted from power")
> Signed-off-by: brian-sy yang <brian-sy.yang@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
> 
> Changes from v1:
> - add fixes tag
> - add reviewed-by
> 
>  drivers/thermal/cpufreq_cooling.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> index cc2959f22f01..fb33b3480a8f 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -123,7 +123,7 @@ static u32 cpu_power_to_freq(struct cpufreq_cooling_device *cpufreq_cdev,
>  {
>  	int i;
>  
> -	for (i = cpufreq_cdev->max_level; i >= 0; i--) {
> +	for (i = cpufreq_cdev->max_level; i > 0; i--) {
>  		if (power >= cpufreq_cdev->em->table[i].power)
>  			break;
>  	}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
