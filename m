Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715D6C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 04:37:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EF2611CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 04:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EF2611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+BWDNwl5bVn+93cdrcRyxgs/du4IF9x8ZiZhc4iz/0E=; b=kCObiss4u4gczkrD1tZdRbfyx
	p/zhsGdJoA+6e9gLy5OlgX/fsru9p42AmMBTYJqu+o24hfPnn2gpuvJtyiKN9bllB5//L/24yUpsw
	z3i39YWV7qkNBX2IP5+t6qEAyySfIaZtzUszuUYjqNrCjJsDkZJg4Z1V5uZWV4w+wPIXa3ouBzyVg
	0gqFlm6SN497m8n+shvQrIEpYPkEdBRSPQdFlgWmIhx6gGmrzQlZ5iYybjBxDcLv3INVHXWsVayZj
	udSGFKN4wNwa97dsqHuo5P47Py2Y4QDQ5unjCZRMOugv39uJvAdEKj+ZSNZUGhKg+i5H11vch5O+8
	uFzJB3E1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liUzr-00Dgfi-O7; Mon, 17 May 2021 04:36:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liUyg-00DgXi-S0
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 04:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9qPWRHR+PUcFLbaucVvojL1MaT1ICFcyjD+jNvEEGdg=; b=oBLRv/CCI6KoL/8WeOzxuQ38YN
 R+8ZhORLdFZxwRxqUxjDoJdfnkkmOMD+I0KPG1OiZ2zY6DfqbWg3DrD/yhpw0abNVA4jMofcLPBQb
 rQRkYYaQABYxGonXoqtIGiVK90UNYN4FiLdwv/0haZU9PYz3h1mOY7cVcgEnxh7pE8VOdWjBFle1z
 RKMnPGhMwFCmO2RJVYnhpgm+rnqjNttbKTxmHih10FK3qqGY5itP7Knv4BO+hNd/vwmlTZu7R4NLE
 2uVp9a1q9UhFCQwaO6nqfMZEWOs3rmgO/+gVAvOYyhIKeIsDM2W4U5IBX0UUu35RvqryWiPjfFebS
 VPLOIIfg==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liUyd-00DTYX-3F
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 04:35:37 +0000
Received: by mail-il1-x12b.google.com with SMTP id h11so4907427ili.9
 for <linux-mediatek@lists.infradead.org>; Sun, 16 May 2021 21:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9qPWRHR+PUcFLbaucVvojL1MaT1ICFcyjD+jNvEEGdg=;
 b=AlTeHTsWilvuYwm9xksxhaCVaXuNSjuJ8FquZYO31IrTM+Y339sDWT8JHoCnXnzIIT
 AjBipQYY76/Bu+Esgj9jMeOKCiKyqka7FvDAUdvfYW24dhaxjlVdoQiDMrBhXWb2dbwU
 vskUTHlYPU20jMMANw3Pg1HegjmHdM8pkUezU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qPWRHR+PUcFLbaucVvojL1MaT1ICFcyjD+jNvEEGdg=;
 b=QvQ3P8FWfmGX5ZJ959avtYqu7CkBiTJJYXSwMq55HK2J/Kcl73Kzc8b+5RKKiOQpTW
 cuqf8JqVmeMsK9F4nKXYpzOL5jC4XVyT3RyLRvC13qD1QtS0mziHYqrLWO6hwgBrAuG6
 xA1YXA01TfNfgmgAw0mmF4WcDGlo1R2zgOm0795jJDFw1HhvIIzr2L/zOtGp7otKLcCe
 iHCm8zdOhE66KqFXicZW2fCpatqeFui8pDFdyTwqfDpXdpEHWP0DdIfE44BBEWeBcWuO
 r+k7bjs96G5QTiGkgVi8ykSI0a4nAmzm+XHHoLaLrpn95hD/JA+6T+AvcH5HxmVgg2Lg
 exeQ==
X-Gm-Message-State: AOAM530ZCxu/0mtwyxWa92lZC8y84VZCwAPCdKcVQtC7GNyQ5YFA6JLB
 vOYdvHOKM7XHQQt7d8eWWHurktJQS29baRG/UFE/bw==
X-Google-Smtp-Source: ABdhPJzoRYq5Zv23D3UkkHYKjX4FehsOCDj3SbfFabhwmX4Id9eUzexY6pzchM5x0sFFg7FADcEPVYyFS/WFm/wJU3s=
X-Received: by 2002:a92:360e:: with SMTP id d14mr50144021ila.106.1621226133306; 
 Sun, 16 May 2021 21:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
In-Reply-To: <20210427111526.1772293-8-acourbot@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 17 May 2021 12:35:07 +0800
Message-ID: <CAJMQK-g=bnr9bAkvN61sFapX_XOKmUF8LPivtCEzUhP-LjoHUw@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_213535_504192_33FC9331 
X-CRM114-Status: GOOD (  23.12  )
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

On Tue, Apr 27, 2021 at 7:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>
> The stateless API requires a media device for issuing requests. Add one
> if we are being instantiated as a stateless decoder.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/Kconfig                |  1 +
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ae1468aa1b4e..4154fdec2efb 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -315,6 +315,7 @@ config VIDEO_MEDIATEK_VCODEC
>         select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>         select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>         select V4L2_H264
> +       select MEDIA_CONTROLLER

Should this also select MEDIA_CONTROLLER_REQUEST_API config?

Thanks
>         help
>           Mediatek video codec driver provides HW capability to
>           encode and decode in a range of video formats on MT8173
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 533781d4680a..e942e28f96fe 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -14,6 +14,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
>
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_dec.h"
> @@ -324,6 +325,31 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_event_workq;
>         }
>
> +       if (dev->vdec_pdata->uses_stateless_api) {
> +               dev->mdev_dec.dev = &pdev->dev;
> +               strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> +                               sizeof(dev->mdev_dec.model));
> +
> +               media_device_init(&dev->mdev_dec);
> +               dev->mdev_dec.ops = &mtk_vcodec_media_ops;
> +               dev->v4l2_dev.mdev = &dev->mdev_dec;
> +
> +               ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec,
> +                       dev->vfd_dec, MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +               if (ret) {
> +                       mtk_v4l2_err("Failed to register media controller");
> +                       goto err_reg_cont;
> +               }
> +
> +               ret = media_device_register(&dev->mdev_dec);
> +               if (ret) {
> +                       mtk_v4l2_err("Failed to register media device");
> +                       goto err_media_reg;
> +               }
> +
> +               mtk_v4l2_debug(0, "media registered as /dev/media%d",
> +                       vfd_dec->num);
> +       }
>         ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
>         if (ret) {
>                 mtk_v4l2_err("Failed to register video device");
> @@ -336,6 +362,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         return 0;
>
>  err_dec_reg:
> +       if (dev->vdec_pdata->uses_stateless_api)
> +               media_device_unregister(&dev->mdev_dec);
> +err_media_reg:
> +       if (dev->vdec_pdata->uses_stateless_api)
> +               v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +err_reg_cont:
>         destroy_workqueue(dev->decode_workqueue);
>  err_event_workq:
>         v4l2_m2m_release(dev->m2m_dev_dec);
> @@ -368,6 +400,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>
>         flush_workqueue(dev->decode_workqueue);
>         destroy_workqueue(dev->decode_workqueue);
> +
> +       if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
> +               media_device_unregister(&dev->mdev_dec);
> +               v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +               media_device_cleanup(&dev->mdev_dec);
> +       }
> +
>         if (dev->m2m_dev_dec)
>                 v4l2_m2m_release(dev->m2m_dev_dec);
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 78d4a7728ddf..10edd238c939 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -383,6 +383,7 @@ struct mtk_vcodec_enc_pdata {
>   * struct mtk_vcodec_dev - driver data
>   * @v4l2_dev: V4L2 device to register video devices for.
>   * @vfd_dec: Video device for decoder
> + * @mdev_dec: Media device for decoder
>   * @vfd_enc: Video device for encoder.
>   *
>   * @m2m_dev_dec: m2m device for decoder
> @@ -418,6 +419,7 @@ struct mtk_vcodec_enc_pdata {
>  struct mtk_vcodec_dev {
>         struct v4l2_device v4l2_dev;
>         struct video_device *vfd_dec;
> +       struct media_device mdev_dec;
>         struct video_device *vfd_enc;
>
>         struct v4l2_m2m_dev *m2m_dev_dec;
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
