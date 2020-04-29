Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E175C83000
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 14:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EDF520731
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 14:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OR9Zsl1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EDF520731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH3wR1WHSpZ4TY0ExTiTrCur0EGGsyIjLVSxBxaWbRs=; b=OR9Zsl1nyl4Lvv
	7XVG0ctTurqitQBroppL45VctkjMJAKPWoRhOS66xe5VWUYCFyqW9Uh6yk+q7rGN29NJ0mGOOXAOi
	cu5h1QKULgYzIw6tBxjZ/g5k6w5haysV6oHjOYl7IAdJwhGbnVqQNTmqqy2GITrLdWPukB4FO7PDz
	mosnEcyOn4vEjP72iixGsfF6Tqy4b7S1IdUfb698AQal3p0IwGNVGzpy1tnVZ9o34lWCgdQwY40tJ
	v1z4mu5zVvL5Mex5AjlTa0LtPiWKKfPPeMQMzIrN+A5s01JeCkrE2+yIG1iN28QHJtyBYMGZtWOTB
	/apCSDjJOgV461bPqgHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTnII-0007pl-Qs; Wed, 29 Apr 2020 14:02:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTnI7-0007gB-71; Wed, 29 Apr 2020 14:02:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CB2E32A05D5
Subject: Re: [PATCH v3 -next] drm/mediatek: Fix Kconfig warning
To: YueHaibing <yuehaibing@huawei.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, ck.hu@mediatek.com
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <20200429071337.49528-1-yuehaibing@huawei.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <178db061-7068-e688-dd5a-0d767e57c22c@collabora.com>
Date: Wed, 29 Apr 2020 16:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429071337.49528-1-yuehaibing@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_070223_384698_CE2C43D8 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.orc,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi YueHaibing,

Thank you for your patch.

On 29/4/20 9:13, YueHaibing wrote:
> WARNING: unmet direct dependencies detected for MTK_MMSYS
>   Depends on [n]: (ARCH_MEDIATEK [=y] || COMPILE_TEST [=n]) && COMMON_CLK_MT8173_MMSYS [=n]
>   Selected by [y]:
>   - DRM_MEDIATEK [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_MEDIATEK [=y] || ARM && COMPILE_TEST [=n]) && COMMON_CLK [=y] && HAVE_ARM_SMCCC [=y] && OF [=y]
> 
> Make DRM_MEDIATEK depend on MTK_MMSYS to fix this.
> 
> Fixes: 2c758e301ed9 ("soc / drm: mediatek: Move routing control to mmsys device")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Definitively we shouldn't select the MTK_MMSYS and we should depend on MTK_MMSYS
instead, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
> v3: make DRM_MEDIATEK depends on MTK_MMSYS
> v2: select COMMON_CLK_MT8173_MMSYS instead of adding DRM_MEDIATEK dependency  
> ---
>  drivers/gpu/drm/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index c420f5a3d33b..aa74aac3cbcc 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -6,12 +6,12 @@ config DRM_MEDIATEK
>  	depends on COMMON_CLK
>  	depends on HAVE_ARM_SMCCC
>  	depends on OF
> +	depends on MTK_MMSYS
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL
>  	select MEMORY
> -	select MTK_MMSYS
>  	select MTK_SMI
>  	select VIDEOMODE_HELPERS
>  	help
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
