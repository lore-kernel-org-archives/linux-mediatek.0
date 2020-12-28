Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477D3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 10:29:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E55F5221F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 10:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E55F5221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VF7K73iIFPp+SFHLkDGw64+jW6/2ekbkxlOLJZIBVtM=; b=W0xJtoqWAmfKDUSN9O5DZlPy3
	4H1CT8YerdqD5ItqP9o04cjzb/SMsnaIAsdJgCnviaozK2yoMZ/ZRX2OcIrcOCRjh7I4gPOrEtDkG
	HggLc66FeWziR5PnlBT1OLLZJCbuc6bOIbuYatxZRspUPpHN4TbP5Pu2oEsw/gNlp23psIlipmvkq
	ep+j8Gdl1ZTbdUTBjJEsbcJqT4KpJ5iAKR9SHuarvnsajo1Nzlyogt6gXR2DH/uONYFegjbHSz64T
	BO3UXhqV57rT1VjRdFf4DSbwWI3kTx7YIeXEKRM1816x1nwnhQDP/jsyYqbKrE3tlbb+55Z3I1SKp
	Tyufs/OmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktplg-0002JT-RJ; Mon, 28 Dec 2020 10:28:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktplc-0002IO-Sg; Mon, 28 Dec 2020 10:28:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72D431FB;
 Mon, 28 Dec 2020 02:28:37 -0800 (PST)
Received: from [10.57.30.50] (unknown [10.57.30.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EDF13F6CF;
 Mon, 28 Dec 2020 02:28:33 -0800 (PST)
Subject: Re: [PATCH] thermal: cpufreq_cooling: fix slab OOB issue
To: Michael Kao <michael.kao@mediatek.com>, fan.chen@mediatek.com,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
References: <20201223074849.1989-1-michael.kao@mediatek.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <010350df-e094-cf12-1c17-f56aa4b20b9f@arm.com>
Date: Mon, 28 Dec 2020 10:28:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201223074849.1989-1-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_052845_138367_753B8D0C 
X-CRM114-Status: GOOD (  22.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 brian-sy yang <brian-sy.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/23/20 7:48 AM, Michael Kao wrote:
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

Thank you for looking at this and sending a fix.

It's worth to add the 'fixes' line:

Fixes: 371a3bc79c11b ("thermal/drivers/cpufreq_cooling: Fix wrong 
frequency converted from power")

IIRC that patch was sent to stable trees. Might be worth to check
and apply this fix.


> 
> Signed-off-by: brian-sy yang <brian-sy.yang@mediatek.com>


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>


> ---
>   drivers/thermal/cpufreq_cooling.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> index cc2959f22f01..fb33b3480a8f 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -123,7 +123,7 @@ static u32 cpu_power_to_freq(struct cpufreq_cooling_device *cpufreq_cdev,
>   {
>   	int i;
>   
> -	for (i = cpufreq_cdev->max_level; i >= 0; i--) {
> +	for (i = cpufreq_cdev->max_level; i > 0; i--) {
>   		if (power >= cpufreq_cdev->em->table[i].power)
>   			break;
>   	}
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
