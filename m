Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB5CC4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 06:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD7624656
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 06:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mM556YTK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IdRx2Km3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD7624656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6MX88Irk7+gtnvGegg9WTDDhhe7X3NcHyHSXKNzUdQ=; b=mM556YTKbcs5FI
	q2OEbkcLAD8mM8cRMuqgwfj+J3wKgXipQUVIPeP3gDTlbNmzw5V+IKCbNxhYPN0vV7EhUhHLuz8Ti
	GFaLDJtucKAyc+w1IPXxJ9cRuhaqNZvLbDxjweJgX5bVxP8KxSrO3V/yfG1mCIHLzIt9L5ulYBEQF
	D921XsESCilTum3OkGBXfgLs+GFZdj9hvpElIqj+cc8jt8EqSiu9XzrrQIXkVLq3S+S567xPvCjVh
	f6y1x5QeyOKcnjXJeevxP/MIweOEIcI81MMqq3IdYDCkdPp2vVEHDHZujsmXiy0FPmvh2UfZjTGwk
	0m+qD9KFBAEyGXdcFVfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7CVh-0002Rv-QU; Thu, 27 Feb 2020 06:19:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7CVe-0002RQ-Uj; Thu, 27 Feb 2020 06:19:00 +0000
X-UUID: df2d80f3b51a4e059aebde6f4983a1fb-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8hObMDkCZhI/DRnWGjAJpxpuzXkK7SPUl3OhA8dm39o=; 
 b=IdRx2Km31sN0fY3wFTEotJ/PWfrQ+GfiQdnfHck4R92x/7fk5b3SmddFlVXYUnJh5uUkCTTqNxgMTiXyMsfkKmPDPDD4/ZCGudXlhUpvOFVttzeccpdVabIs1ESzVgfnSwHHuuk/j5TXRAZv4jbu1RF3lFPCCFcXKjJz938M+3o=;
X-UUID: df2d80f3b51a4e059aebde6f4983a1fb-20200226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 391251375; Wed, 26 Feb 2020 22:18:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 22:09:37 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 27 Feb 2020 14:09:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 14:09:25 +0800
Message-ID: <1582783776.30808.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Remove debug messages for function calls
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 14:09:36 +0800
In-Reply-To: <20200226112723.649954-1-enric.balletbo@collabora.com>
References: <20200226112723.649954-1-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_221858_997576_441D23B8 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Wed, 2020-02-26 at 12:27 +0100, Enric Balletbo i Serra wrote:
> Equivalent information can be nowadays obtained using function tracer.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 -----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 --
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index a236499123aa..882c690d3f13 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -192,7 +192,6 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
>  	int ret;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = clk_prepare_enable(mtk_crtc->ddp_comp[i]->clk);
>  		if (ret) {
> @@ -212,7 +211,6 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
>  		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
>  }
> @@ -257,7 +255,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  	int ret;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	if (WARN_ON(!crtc->state))
>  		return -EINVAL;
>  
> @@ -298,7 +295,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  		goto err_mutex_unprepare;
>  	}
>  
> -	DRM_DEBUG_DRIVER("mediatek_ddp_ddp_path_setup\n");
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>  		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
>  					 mtk_crtc->ddp_comp[i]->id,
> @@ -348,7 +344,6 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  	struct drm_crtc *crtc = &mtk_crtc->base;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		mtk_ddp_comp_stop(mtk_crtc->ddp_comp[i]);
>  		if (i == 1)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 17f118ee0e57..4934834977b3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -570,7 +570,6 @@ static int mtk_drm_sys_suspend(struct device *dev)
>  	int ret;
>  
>  	ret = drm_mode_config_helper_suspend(drm);
> -	DRM_DEBUG_DRIVER("mtk_drm_sys_suspend\n");
>  
>  	return ret;
>  }
> @@ -582,7 +581,6 @@ static int mtk_drm_sys_resume(struct device *dev)
>  	int ret;
>  
>  	ret = drm_mode_config_helper_resume(drm);
> -	DRM_DEBUG_DRIVER("mtk_drm_sys_resume\n");
>  
>  	return ret;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
