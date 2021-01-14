Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC0C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 15:10:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851B923A5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 15:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 851B923A5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q6KFelOr6cil5Q9wfB/OpEomrfWZNrL0wYHSGHOX2zo=; b=GY9/TvfciHSkEELXZKcOCch+4
	9MfmhnI5gNOcKVlK29yNWy8bM9WHYZp+puPDsO7byce9eVvtTBmhUZJIMg45sxqxGwCGY0+Yy/WAc
	O9lrQsxfI0yNMPzmid9kklaXdSmkkswsfzEUMoIGZuCaMDdciaUHyfehORpSdkdEupk6KbOOQKYVD
	mXXGL1/wOmm1txf1RIVvT2RjqH/ZHyiVJOSm++uK74FawtZXrWLxoP1Zdu/jhcL4yHSbu759rh9jy
	RIGNsHe7kgJMH/MChejQ24qLhKQBgGUg4vHtJqIwvEsRDV69efFYltbKs4G+pW3yMmiC99MBWqXMJ
	7w99H9o1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04Gl-0000f0-V3; Thu, 14 Jan 2021 15:10:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04Gi-0000dp-7t; Thu, 14 Jan 2021 15:10:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C5641042;
 Thu, 14 Jan 2021 07:10:33 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CF6A3F70D;
 Thu, 14 Jan 2021 07:10:31 -0800 (PST)
Subject: Re: [PATCH v10 4/4] drm/panfrost: Add mt8183-mali compatible string
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
From: Steven Price <steven.price@arm.com>
Message-ID: <6e2a6e89-1b5b-eb75-df91-d0f243ab7ec5@arm.com>
Date: Thu, 14 Jan 2021 15:10:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113140546.v10.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_101036_359233_D3F698AF 
X-CRM114-Status: GOOD (  21.12  )
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/2021 06:07, Nicolas Boichat wrote:
> Add support for MT8183's G72 Bifrost.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> 
> (no changes since v7)
> 
> Changes in v7:
>   - Fix GPU ID in commit message
> 
> Changes in v6:
>   - Context conflicts, reflow the code.
>   - Use ARRAY_SIZE for power domains too.
> 
> Changes in v5:
>   - Change power domain name from 2d to core2.
> 
> Changes in v4:
>   - Add power domain names.
> 
> Changes in v3:
>   - Match mt8183-mali instead of bifrost, as we require special
>     handling for the 2 regulators and 3 power domains.
> 
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 83a461bdeea8..ca07098a6141 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
>   	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>   };
>   
> +const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> +const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
> +static const struct panfrost_compatible mediatek_mt8183_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
> +	.supply_names = mediatek_mt8183_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +	.pm_domain_names = mediatek_mt8183_pm_domains,
> +};
> +
>   static const struct of_device_id dt_match[] = {
>   	/* Set first to probe before the generic compatibles */
>   	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
>   	{ .compatible = "arm,mali-t860", .data = &default_data, },
>   	{ .compatible = "arm,mali-t880", .data = &default_data, },
>   	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
> +	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, dt_match);
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
