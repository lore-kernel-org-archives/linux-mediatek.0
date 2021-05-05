Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63824C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 12:35:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C25DE613BC
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 12:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C25DE613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XUeUo6cbXRA9ZhHwm9Jv5+Ki3Ky/bm0+qwzoA10x+jU=; b=neKMXRoXR7W2pO5IdAuD9pwHq
	roCGiJY2MZiW1bNzyNXjcHPlq1vRlbyNK7Te7v1yson+maEfdtB58Ect4IpOgruIPUtop4vJtNTd+
	kaqrRKM0SB0pe7cBNVJUK68Eduqp/E8Qb1qALBnhfzKNxdvvgEdYVHq5iaJ3ky6DRWsbD1MAP95DY
	yfdJhvDXYwML99Gw+gkFVeNOEEUQO/c6VLu3ft/1cfTrdx/nlkcwMVv29ZvGc50PdPCDZP1lmyYJW
	x5B4WycEAArh4IUjvGOaYAVUXGjK+hKpUwP4W5xo5gG7w2d4T5CTXhIS9udopz+1YMBUGzWmMkr7w
	0F4yyJbSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leGk0-001DAF-8n; Wed, 05 May 2021 12:35:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leGjm-001D8g-Nt; Wed, 05 May 2021 12:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=LGttcvBGhPHsxu3WFvrp4fbzp00qhsZZFYepa2h7u0M=; b=K8J4jdXZd4iOycVwmx0T+mZW04
 tDSISYs9BPuXMADnt4s2pe8oUEcv13RoUvfghVCVr5HlA+qpuExgEAUj8PUXUzqJYI2DTR4hAWCfe
 vbyiKzp/O9ACyVevM0bJtqmzPORBf0OF8jKHc5YyQFBfJNHMtnISQ+LnsykWzYOtWIpvSyEhRzc+D
 /w2twUJq3DdDi2zANGPnnMrlKZdQXH8k5jToMcL7uuYBQtdvhHd4SQmuuECEbiUJ0QM9TMZJ4zPDA
 E3VB/5EgkIpsqWQspHP07OC+vr7p6WIaq6texyQKZ20zOoK1pyEXWaAoeSkHCAy4u8B6pa0fYfDmY
 7soA7lrw==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leGjj-004kYE-IC; Wed, 05 May 2021 12:34:45 +0000
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwxF3yppz6yhyt;
 Wed,  5 May 2021 20:28:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:34:38 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:34:37 +0100
Date: Wed, 5 May 2021 13:32:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: <linuxarm@huawei.com>, <mauro.chehab@huawei.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 18/25] media: mtk-vcodec: fix PM runtime get logic
Message-ID: <20210505133258.00002ae4@Huawei.com>
In-Reply-To: <b8d69ce52e4e455aa8c6e629e215a52847c7c9e0.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <b8d69ce52e4e455aa8c6e629e215a52847c7c9e0.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_053443_903316_0F8C0973 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed,  5 May 2021 11:42:08 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, the driver just assumes that PM runtime logic
> succeded resuming the device.
> 
> That may not be the case, as pm_runtime_get_sync()
> can fail (but keeping the usage count incremented).
> 
> Replace the code to use pm_runtime_resume_and_get(),
> and letting it return the error code.
> 
> This way, if mtk_vcodec_dec_pw_on() fails, the logic
> under fops_vcodec_open() will do the right thing and
> return an error, instead of just assuming that the
> device is ready to be used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 +++-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 8 +++++---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  | 2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 147dfef1638d..f87dc47d9e63 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -126,7 +126,9 @@ static int fops_vcodec_open(struct file *file)
>  	mtk_vcodec_dec_set_default_params(ctx);
>  
>  	if (v4l2_fh_is_singular(&ctx->fh)) {
> -		mtk_vcodec_dec_pw_on(&dev->pm);
> +		ret = mtk_vcodec_dec_pw_on(&dev->pm);
> +		if (ret < 0)
> +			goto err_load_fw;
>  		/*
>  		 * Does nothing if firmware was already loaded.
>  		 */
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index ddee7046ce42..6038db96f71c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -88,13 +88,15 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
>  	put_device(dev->pm.larbvdec);
>  }
>  
> -void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(pm->dev);
> +	ret = pm_runtime_resume_and_get(pm->dev);
>  	if (ret)
> -		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
> +
> +	return ret;
>  }
>  
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 872d8bf8cfaf..280aeaefdb65 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -12,7 +12,7 @@
>  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
>  void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
>  
> -void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
> +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
