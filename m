Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A8C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO50GyjH39bxbc5EOT1/9MA3fLxrVQNmcbavUHwbgME=; b=ODD2LLNg9lVgGU2HOl+Y2D50Gr
	m7OZzSqIqXvVc9ecIp2+s+wRETl95QjC8aIQ5BQPN95yse4kWF9CjgTrkU/jX7LX7lhDJsYz4BcWJ
	cIKGwA7AaSZ5U6ii8Hulkpf6H+Q3X9bdA9gfFpVBsRd95DibbEpUch8nIjzDmcEG2sGRqjUyFpqmJ
	J/Bd1WaJ2OWL/WB9UwL/HnRbDxJQeIJKeaWqHeqKfwslJp8T8mVAsIt2+SagUqzKLfKw6eFjizTA3
	n1tGp3GD6PQkK1EiX8sAOH3dhT0KPnJhQglkAZMjZ79A05WD6Q3ziWOdI/w3LN1himgqXyM2Qb3yi
	ResJ9FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmmp-00000005MD1-1PEl;
	Wed, 05 Jun 2024 09:18:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmml-00000005MB7-1R98;
	Wed, 05 Jun 2024 09:18:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF2FDDA7;
	Wed,  5 Jun 2024 02:18:44 -0700 (PDT)
Received: from [10.57.39.129] (unknown [10.57.39.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 147E13F792;
	Wed,  5 Jun 2024 02:18:16 -0700 (PDT)
Message-ID: <f44611fd-523a-4b4d-accd-20fdfbac178a@arm.com>
Date: Wed, 5 Jun 2024 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add support for Mali on the MT8188
 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_021824_007282_879B7856 
X-CRM114-Status: GOOD (  19.30  )
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

On 04/06/2024 13:39, AngeloGioacchino Del Regno wrote:
> MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
> compatible and platform data using the same supplies and the
> same power domain lists as MT8183 (one regulator, three power
> domains).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ef9f6c0716d5..4e2d9f671a0d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> +static const struct panfrost_compatible mediatek_mt8188_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,

I think this is a little confusing. Ideally we'd drop the existing
mediatek_xxx_supplies which are the same as default_supplies and just
use that instead.

> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> +	.pm_domain_names = mediatek_mt8183_pm_domains,

We'd want at least a comment explaining that this isn't a typo (i.e. /*
mt8188 uses the same pm domains as mt8183 */). But I'm also wondering if
it would be sensible to simply have one domain list, something like:

--->8---
static const char * const mediatek_pm_domains[] = { "core0", "core1",
						    "core2", "core3",
						    "core4" };

static const struct panfrost_compatible mediatek_mt8183_data = {
	...
	.num_pm_domains = 3,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8186_data = {
	...
	.num_pm_domains = 2,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8188_data = {
	...
	.num_pm_domains = 3,
	.pm_domain_names = mediatek_pm_domains,
};
...
static const struct panfrost_compatible mediatek_mt8192_data = {
	...
	.num_pm_domains = 5,
	.pm_domain_names = mediatek_pm_domains,
};
--->8---

OTOH what you've got it no worse than what we already had, so it's up to
you whether you want to tidy this up or just add a comment so it doesn't
look like there's a typo.

Steve

> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +};
> +
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>  static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>  							   "core3", "core4" };
> @@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>  	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
> +	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  	{}
>  };


