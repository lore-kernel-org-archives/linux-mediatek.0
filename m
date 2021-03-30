Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E597C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:43:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CEB6196A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4CEB6196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zssV/10H3vSOFOhmsBICt1UZelC4N2XuWDYsgp2IrkQ=; b=YNn5rnvZWWxwHLZEOh1sPLoZg
	CwcfA5uME+rYd8oMALGJ22OPXWQiDpy90j0IZghQX6EmS50mmQHyHb9AW+FvyTY97X4FZk/ew4Pa6
	SmUtuBP/cS4qRw6aGEz7w2jDwbOa3YTIxLV/rol3UuZ67RRwFHwhbjxflqTBCFnRldbDBXxpVvLBs
	RHj0GlSgPV+qCrF46t+UE+RyARzsHHqiyg8GA3GAyXEQm1qd1FNVY7Led5H/gYG0ANnu99v4i+ETs
	NUTjR34m9grILnalxNM/4LDTvyfVKWp4PcEo3XAytObJoUQLxJmsuJ2roMCspIit29iaJIdQnGaka
	zhJKHS4qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAuC-003Ggq-Bo; Tue, 30 Mar 2021 09:43:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAtz-003GdL-9G; Tue, 30 Mar 2021 09:43:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 822021F45916
Subject: Re: [PATCH] drm/mediatek: Add missing MODULE_DEVICE_TABLE()
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210203110717.686204-1-enric.balletbo@collabora.com>
Message-ID: <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
Date: Tue, 30 Mar 2021 11:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210203110717.686204-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_104311_482341_0CE32560 
X-CRM114-Status: GOOD (  21.14  )
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

Hi,

On 3/2/21 12:07, Enric Balletbo i Serra wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> This patch adds the missing MODULE_DEVICE_TABLE definitions on different
> Mediatek drivers which generates correct modalias for automatic loading
> when these drivers are compiled as an external module.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

A gentle ping for someone to review this patchset :-)

Thanks,
  Enric

> ---
> 
>  drivers/gpu/drm/mediatek/mtk_cec.c      | 2 ++
>  drivers/gpu/drm/mediatek/mtk_dpi.c      | 1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 1 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c      | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c     | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c | 1 +
>  6 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index cb29b649fcdb..3b86e626e459 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -7,6 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/interrupt.h>
> +#include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  
> @@ -247,6 +248,7 @@ static const struct of_device_id mtk_cec_of_ids[] = {
>  	{ .compatible = "mediatek,mt8173-cec", },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
>  
>  struct platform_driver mtk_cec_driver = {
>  	.probe = mtk_cec_probe,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 52f11a63a330..2680370652fd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -822,6 +822,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>  	},
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
>  
>  struct platform_driver mtk_dpi_driver = {
>  	.probe = mtk_dpi_probe,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f49a809689b..e4645c8ae1c0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -470,6 +470,7 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>  	  .data = &mt8183_mmsys_driver_data},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
>  
>  static int mtk_drm_probe(struct platform_device *pdev)
>  {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0527480c07be..c71ce62d1bec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1193,6 +1193,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
>  	  .data = &mt8183_dsi_driver_data },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
>  
>  struct platform_driver mtk_dsi_driver = {
>  	.probe = mtk_dsi_probe,
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 8ee55f9e2954..b4696a9d73f7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1818,6 +1818,7 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>  	},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
>  
>  static struct platform_driver mtk_hdmi_driver = {
>  	.probe = mtk_drm_hdmi_probe,
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> index 62dbad5675bb..6207eac88550 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> @@ -335,6 +335,7 @@ static const struct of_device_id mtk_hdmi_ddc_match[] = {
>  	{ .compatible = "mediatek,mt8173-hdmi-ddc", },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
>  
>  struct platform_driver mtk_hdmi_ddc_driver = {
>  	.probe = mtk_hdmi_ddc_probe,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
