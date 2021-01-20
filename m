Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E984FC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:28:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847A4233FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 18:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847A4233FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rb7A9mdUyZIrOjHaE+hVr6NLwG4UcMU4SjtgLDqYbdw=; b=Mae8IOxBOYclfuqb3rp71edW+
	pNqkKpPYuXT1gY8w62ffTRjUFuJ5JHj2S91ZM6+1k5Nd/LQ0Z7h8/0Wx2mg5rIF8C+SwPP894TRtd
	jl4YIeichE539xZFA4q1G8y6XACZOUPcCQVFGFgH1l6ZpuCR0A6POGHV0o3odYcv51JrnPAHFVPZJ
	32VSYcKTz0zTh4LZR90BEUtZ3D2K0renJ6rxPDNGrYzhlUBIArZNfidgNDij7c3TzwHLV8UJsFNZR
	+buBW//sh8LhIW/FKvDHdO0/rBCqRGAKWps4hh0C/7Uqi7AsRB52RADxUnXZIuTX1loFF69V9eUew
	bAca09GSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2ID2-0001XT-K1; Wed, 20 Jan 2021 18:28:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2ICy-0001WW-PM; Wed, 20 Jan 2021 18:27:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37755233FC;
 Wed, 20 Jan 2021 18:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611167274;
 bh=vjunBYcfmoEhuHi9C00Jr/Jy+8HJAFrvRPfYznGtIKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gOl9shjTzknM9YiyVLg9dZpn6FPVTXhF3re+4Dh0axFEclqb8yWnyEHrKdOmMjR+i
 vkKu30xXDhQ9/ZOu/EdxM6Bf2LDygaMhNq7CQY/0OXxeucuA+89zc0gZj6YG+fo/L8
 KpT/C8dtakbHF3pKeFXKDqoR0IsE1XjLCZTkq62DlAHw+jyn+Ej0FmY+Qdrn99+Tun
 eq/Btp6HnjeAEmzuy+B8SAPWVnLsN7I9X0/dIoN9Qfa8CBrY9E3LV5nElSVNjTtvl4
 J0vx02VldRiUZgcLrRTbpNUmYeUgqkgFHbFdi6DdhGiXHAgktbfNxMb6xj7JoxhAwh
 q4DXrejRfHD/w==
Date: Wed, 20 Jan 2021 19:27:48 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in
 mtk mutex driver
Message-ID: <YAh2JGUUpMcgyke0@ziggy.stardust>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106231729.17173-4-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_132756_907482_FD6417F9 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 07:17:27AM +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk mutex is used by both drm and mdp driver, so change disp/ddp term to
> mutex to show that it's a common driver for drm and mdp.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  30 +--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>  drivers/gpu/drm/mediatek/mtk_mutex.c    | 305 ++++++++++++------------
>  drivers/gpu/drm/mediatek/mtk_mutex.h    |  26 +-
>  5 files changed, 182 insertions(+), 183 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/mediatek/mtk_mutex.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
> index 1c8a253f4788..98a060bf225d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mutex.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
[...]
>  
> -static const struct of_device_id ddp_driver_dt_match[] = {
> +static const struct of_device_id mutex_driver_dt_match[] = {
>  	{ .compatible = "mediatek,mt2701-disp-mutex",
> -	  .data = &mt2701_ddp_driver_data},
> +	  .data = &mt2701_mutex_driver_data},
>  	{ .compatible = "mediatek,mt2712-disp-mutex",
> -	  .data = &mt2712_ddp_driver_data},
> +	  .data = &mt2712_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8167-disp-mutex",
> -	  .data = &mt8167_ddp_driver_data},
> +	  .data = &mt8167_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
> -	  .data = &mt8173_ddp_driver_data},
> +	  .data = &mt8173_mutex_driver_data},
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, ddp_driver_dt_match);
> +MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

I think it would make sense in a follow-up patch to update the binding
to use "mediatek,mt2701-mutex" to reflect that mutex is used for drm and
mdp driver. Make sense?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
