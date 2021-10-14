Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CB3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCDF60FDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCCDF60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omBAscIKKzHV2u8npEp1c7eQ9VjHRbKb+IfMPWkbOsk=; b=nDx3ZUV6136zEAamoDOD1iY3Sp
	gEC5VjT2XgARdEpWy28JQl795v/Dl3VQJYpQa7526P2r/r1WoIBpjNjg0ONS7r28py+hgKqT06juN
	cEZgETXsprFNnZkJbb0bUhGbRUYImjG0+Gqe65QZ6+XpaMoDTsk2ZkSBBOw6hY3ncu2EpMNj4dx98
	IMKCr3P5znachdKkTNXgxNtrphEtaYuYoWgCw/wl5iq1tSigsXgpCtSpq4X0ZBUSh2vnOKjrtZEsp
	FdpaJOwi3gA+B1dHNv5NeleMcM8MJ60yHuGstiT1nmahQpAh605zt38px2r1q40ALW2+I8II2Buc0
	vX/RlWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb12b-003Ist-7h; Thu, 14 Oct 2021 13:45:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb12O-003IpP-R1; Thu, 14 Oct 2021 13:44:50 +0000
Received: from [IPv6:2a02:810a:880:f54:d539:cc83:9c4a:6738] (unknown
 [IPv6:2a02:810a:880:f54:d539:cc83:9c4a:6738])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 424E11F44C6D;
 Thu, 14 Oct 2021 14:44:45 +0100 (BST)
Subject: Re: [PATCH v7, 03/15] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-4-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6f3e94fe-8e02-e79d-858d-620a057b87f2@collabora.com>
Date: Thu, 14 Oct 2021 15:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-4-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_064449_198015_95FA2E38 
X-CRM114-Status: GOOD (  26.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11.10.21 09:02, Yunfei Dong wrote:
> Using the needed param for pm init/release function and remove unused
> param mtkdev in 'struct mtk_vcodec_pm'.
> 

I see that there is a lot of code duplication between mtk_vcodec_release_dec_pm.c and mtk_vcodec_release_enc_pm.c
I think if you bother to factor the decoder you should do the same factor to the encoder, but actually the much better thing to do
is to unify all code duplication between these two files, just for example of identical functions:

mtk_vcodec_enc/dec_clock_on/off
mtk_vcodec_release_enc_pm
mtk_vcodec_init_dec_pm

In addition, the function mtk_vcodec_dec_pw_on can be remove since it only calls pm_runtime_resume_and_get.
It would be much better to call pm_runtime_resume_and_get directly and not hide it in a different function

Thanks,
Dafna

> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
>   5 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 8db9cdc66043..dd749d41c75a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	if (IS_ERR(dev->fw_handler))
>   		return PTR_ERR(dev->fw_handler);
>   
> -	ret = mtk_vcodec_init_dec_pm(dev);
> +	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
>   		goto err_dec_pm;
> @@ -379,7 +379,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   err_dec_alloc:
>   	v4l2_device_unregister(&dev->v4l2_dev);
>   err_res:
> -	mtk_vcodec_release_dec_pm(dev);
> +	mtk_vcodec_release_dec_pm(&dev->pm);
>   err_dec_pm:
>   	mtk_vcodec_fw_release(dev->fw_handler);
>   	return ret;
> @@ -422,7 +422,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>   		video_unregister_device(dev->vfd_dec);
>   
>   	v4l2_device_unregister(&dev->v4l2_dev);
> -	mtk_vcodec_release_dec_pm(dev);
> +	mtk_vcodec_release_dec_pm(&dev->pm);
>   	mtk_vcodec_fw_release(dev->fw_handler);
>   	return 0;
>   }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 6038db96f71c..20bd157a855c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -13,18 +13,15 @@
>   #include "mtk_vcodec_dec_pm.h"
>   #include "mtk_vcodec_util.h"
>   
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +	struct mtk_vcodec_pm *pm)
>   {
>   	struct device_node *node;
> -	struct platform_device *pdev;
> -	struct mtk_vcodec_pm *pm;
> +	struct platform_device *larb_pdev;
>   	struct mtk_vcodec_clk *dec_clk;
>   	struct mtk_vcodec_clk_info *clk_info;
>   	int i = 0, ret = 0;
>   
> -	pdev = mtkdev->plat_dev;
> -	pm = &mtkdev->pm;
> -	pm->mtkdev = mtkdev;
>   	dec_clk = &pm->vdec_clk;
>   	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
>   	if (!node) {
> @@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   		return -1;
>   	}
>   
> -	pdev = of_find_device_by_node(node);
> +	larb_pdev = of_find_device_by_node(node);
>   	of_node_put(node);
> -	if (WARN_ON(!pdev)) {
> +	if (WARN_ON(!larb_pdev)) {
>   		return -1;
>   	}
> -	pm->larbvdec = &pdev->dev;
> -	pdev = mtkdev->plat_dev;
> +	pm->larbvdec = &larb_pdev->dev;
>   	pm->dev = &pdev->dev;
>   
>   	dec_clk->clk_num =
> @@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   	return ret;
>   }
>   
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>   {
> -	pm_runtime_disable(dev->pm.dev);
> -	put_device(dev->pm.larbvdec);
> +	pm_runtime_disable(pm->dev);
> +	put_device(pm->larbvdec);
>   }
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 280aeaefdb65..a3df6aef6cb9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -9,8 +9,9 @@
>   
>   #include "mtk_vcodec_drv.h"
>   
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +	struct mtk_vcodec_pm *pm);
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 3b1e5e3a450e..973b0b3649c6 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
>   	struct mtk_vcodec_clk	venc_clk;
>   	struct device	*larbvenc;
>   	struct device	*dev;
> -	struct mtk_vcodec_dev	*mtkdev;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..0c8c8f86788c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>   	pdev = mtkdev->plat_dev;
>   	pm = &mtkdev->pm;
>   	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> -	pm->mtkdev = mtkdev;
>   	pm->dev = &pdev->dev;
>   	dev = &pdev->dev;
>   	enc_clk = &pm->venc_clk;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
