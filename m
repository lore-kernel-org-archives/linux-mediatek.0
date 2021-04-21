Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C80C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:17:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF65961440
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF65961440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a8UgF0U7D9WvDblpa95SXwMN9GwoxZxylfuVFgAYeI8=; b=kF+OO/2oXphlK1+ZizR4SzP6g
	Ae9p4jdaFc6Vu6LolZe0FnswO7hN/qDLUuG0LuD39y29GU0F4sR7mq/txMJ3hUzrh8pw34a5IBVSz
	PCKSUUaOfx/q3Dt+vjn+0inVI9tJrIEbbsaqZZ/0x8CTPsGsVzNGz3NBYiea66UHqc2Wsn6zSAm1a
	fHel2pf259CiVPcI2WeWPdthYD7plA2WG3iLJi8HT9hgzn140X355w5O4p87P+PKAS16qvPT/+e6+
	JDSyLLxhlLPGVgXznGz9hmZEK0u3QmSdnE7Ubbx1cDUT39nBj7MUUMY9d+rM3iZXk+lrdFkPmr4CQ
	SeRmumryg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCje-00ERgR-VS; Wed, 21 Apr 2021 13:17:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCjO-00EReB-JX; Wed, 21 Apr 2021 13:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HDPjZMjWCZKqakVSIF2+cy5E4MqjSXUEPkpK+UOoNls=; b=ge0kb2q0GnCOpPANmX0vie1BLf
 4x6FCuwz8b2ZuNE7qqipHRcLcXMcKDjQD/M+iaflkrWGJ/JYkyAueN+Eb13NL+ten7qM2QYGT06h5
 AUjhkSBWy5FbjMSC4YcInG4n0izilTON1sEVrXC6Nxq1Wjj4TxT9/ltRueenhIcGPwmpqJwMFVEsj
 hJbPGOxx/DfOMMkVsrtAqyodriqspJ64cVqa3huyNLqpmbBMwmfoFJgffCd3Zl6yR74pvvpKhqnAw
 ueh7R0Yd4pOzR4vvR6xaD/cLgZboBgBy3VTTVIb7oNAIjAJLoH6RrLO1F4BLP7vzX9lfD2N325CiR
 8XPfzaKQ==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCjH-00CuK2-VM; Wed, 21 Apr 2021 13:17:25 +0000
Received: from maud (unknown [IPv6:2600:8800:8c03:4000::11ea])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B8F551F42E3B;
 Wed, 21 Apr 2021 14:17:09 +0100 (BST)
Date: Wed, 21 Apr 2021 09:17:04 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 boris.brezillon@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v13 4/4] drm/panfrost: Add mt8183-mali compatible string
Message-ID: <YIAl0HRoAKD58C0R@maud>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <20210421132841.v13.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132841.v13.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061720_164192_01F61817 
X-CRM114-Status: GOOD (  20.75  )
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

Not that you need it but this patch is Reviewed-by: Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com>

On Wed, Apr 21, 2021 at 01:28:55PM +0800, Nicolas Boichat wrote:
> Add support for MT8183's G72 Bifrost.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
>  - Fix GPU ID in commit message
> 
> Changes in v6:
>  - Context conflicts, reflow the code.
>  - Use ARRAY_SIZE for power domains too.
> 
> Changes in v5:
>  - Change power domain name from 2d to core2.
> 
> Changes in v4:
>  - Add power domain names.
> 
> Changes in v3:
>  - Match mt8183-mali instead of bifrost, as we require special
>    handling for the 2 regulators and 3 power domains.
> 
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 83a461bdeea8..ca07098a6141 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -665,6 +665,15 @@ static const struct panfrost_compatible amlogic_data = {
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
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
>  static const struct of_device_id dt_match[] = {
>  	/* Set first to probe before the generic compatibles */
>  	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -681,6 +690,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "arm,mali-t860", .data = &default_data, },
>  	{ .compatible = "arm,mali-t880", .data = &default_data, },
>  	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
> +	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
