Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AE4C4363C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3BA212CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCVXanQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA3BA212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/uXhnAp0zs/2TX1X9QWrfc6bH4MIOgJW1KZ9jikJR0k=; b=NCVXanQPvw+weaDafwxjJCCQB
	r0Emdx8hLh74HQd3PjtR0JOC8Lxbw3q2Xzal8wwm3C8FO5PbRi/81K0C84xbGP5nCzlUnXJ1e+45N
	Hh8ajRW2HzrZXR742ogYdRRrPMKVRFloqS6GXWD+2oI6w+gGpVX/zEuKua5ax/Vas071yyWDPSUN2
	UehR81eGUNd52DtZtcKxNczKBLGbJRa0e3olbC6AUltiwbzHFtnC1AenZ14O6JknJIMdeBouAdzdk
	Fr9HBdoNNa0V7IGWzboNVGhoukMF3PsiGTpYXKUVyXcuKxjNrZbGv+0okvh6ehKOTWWF/rswq3jkC
	xrGE4oykg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ76f-0007jk-Fu; Wed, 07 Oct 2020 10:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ76a-0007iO-9K; Wed, 07 Oct 2020 10:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9A411B3;
 Wed,  7 Oct 2020 03:55:29 -0700 (PDT)
Received: from [10.57.52.96] (unknown [10.57.52.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0795F3F71F;
 Wed,  7 Oct 2020 03:55:19 -0700 (PDT)
Subject: Re: [PATCH] [v2] thermal: core: add upper and lower limits to
 power_actor_set_power
To: Michael Kao <michael.kao@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com
References: <20201007024332.30322-1-michael.kao@mediatek.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <9ecedd8a-fbc3-895c-d79c-f05af5c90ae5@arm.com>
Date: Wed, 7 Oct 2020 11:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201007024332.30322-1-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_065532_414214_1F2FEFD8 
X-CRM114-Status: GOOD (  23.95  )
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
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 10/7/20 3:43 AM, Michael Kao wrote:
> The upper and lower limits of thermal throttle state in the
> DT do not apply to the Intelligent Power Allocation (IPA) governor.
> Add the clamping for cooling device upper and lower limits in the
> power_actor_set_power() used by IPA.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>   drivers/thermal/thermal_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 72bf159bcecc..a260e4a575f3 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -674,7 +674,7 @@ int power_actor_set_power(struct thermal_cooling_device *cdev,
>   	if (ret)
>   		return ret;
>   
> -	instance->target = state;
> +	instance->target = clamp_val(state, instance->lower, instance->upper);
>   	mutex_lock(&cdev->lock);
>   	cdev->updated = false;
>   	mutex_unlock(&cdev->lock);
> 

Please check the patch with scripts/checkpatch.pl before sending.
It's again base64 encoded, I was able to apply it on my end with
--ignore-whitespace, but still some odd char is there.

If Daniel is OK to fix it when applying to the thermal branch, then:

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>

I would send a few patches on top of this one, to fully support the
upper and lower limits in IPA.

Regards,
Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
