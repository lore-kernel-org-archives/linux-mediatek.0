Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862B1C07E95
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 16:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42ACF60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 16:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42ACF60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cc0OSb6xev0Fn9v6wwV79Oy5uk3QJYFYnCbEdN1NS8=; b=zGLimWpWiep65/W14b1kbcvPxz
	1WEnh9+hWzIXf/l8FbY+lNg9W7TSJCaSWq46TvUynzpjF2TBX4qQVjsgDu7+8q+mOBKyVs5CWE+fX
	M/TJ+KCa4QPA9Q5jarQKuXZQIytU8FkgmO/VuU5nmnANzdxFNZXhbPiepPrcWOThZyIaE+QoAqUAj
	/zPprVyff7s8YDRU4VbPB6d0ULNdBproV1ZUxccCuDl8MzJTlA/G3q0OZOK1ng2LJj4qpT7pVQUS7
	9zY0Mm1gd78mJzbCyRs6+ujAuVt2cMt4xFZAtlhRaOyAKvq4T0+GEXDwnklfUOG9z1+upGmZIifis
	MlPN6wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5WBG-00AWxG-2C; Mon, 19 Jul 2021 16:31:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5W2M-00ASos-Qz
 for linux-mediatek@lists.infradead.org; Mon, 19 Jul 2021 16:22:36 +0000
Received: from [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc] (unknown
 [IPv6:2a02:810a:880:f54:121:b44d:bc4b:65bc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E1B01F42D19;
 Mon, 19 Jul 2021 17:22:32 +0100 (BST)
Subject: Re: [PATCH v6 12/14] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@google.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210705053258.1614177-1-acourbot@chromium.org>
 <20210705053258.1614177-13-acourbot@chromium.org>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a0a8b9a1-df9e-0e30-9ce6-36759f707e27@collabora.com>
Date: Mon, 19 Jul 2021 18:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705053258.1614177-13-acourbot@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_092235_232058_949023FC 
X-CRM114-Status: GOOD (  25.01  )
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



On 05.07.21 07:32, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> The stateless API requires a media device for issuing requests. Add one
> if we are being instantiated as a stateless decoder.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>   drivers/media/platform/Kconfig                |  2 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 +++++++++++++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
>   3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ae1468aa1b4e..aa277a19e275 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -315,6 +315,8 @@ config VIDEO_MEDIATEK_VCODEC
>   	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>   	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>   	select V4L2_H264
> +	select MEDIA_CONTROLLER
> +	select MEDIA_CONTROLLER_REQUEST_API
>   	help
>   	  Mediatek video codec driver provides HW capability to
>   	  encode and decode in a range of video formats on MT8173
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 1460951f302c..c8a84fa11e4a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -14,6 +14,7 @@
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
>   
>   #include "mtk_vcodec_drv.h"
>   #include "mtk_vcodec_dec.h"
> @@ -316,6 +317,30 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_event_workq;
>   	}
>   
> +	if (dev->vdec_pdata->uses_stateless_api) {
> +		dev->mdev_dec.dev = &pdev->dev;
> +		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> +			sizeof(dev->mdev_dec.model));
> +
> +		media_device_init(&dev->mdev_dec);
> +		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
> +		dev->v4l2_dev.mdev = &dev->mdev_dec;
> +
> +		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, dev->vfd_dec,
> +							 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +		if (ret) {
> +			mtk_v4l2_err("Failed to register media controller");
> +			goto err_reg_cont;
> +		}
> +
> +		ret = media_device_register(&dev->mdev_dec);
> +		if (ret) {
> +			mtk_v4l2_err("Failed to register media device");
> +			goto err_media_reg;
> +		}
> +
> +		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->num);

the media's node minor is not vfd_dec->num

> +	}
>   	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
>   	if (ret) {
>   		mtk_v4l2_err("Failed to register video device");
> @@ -328,6 +353,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_dec_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		media_device_unregister(&dev->mdev_dec);
> +err_media_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +err_reg_cont:
>   	destroy_workqueue(dev->decode_workqueue);
>   err_event_workq:
>   	v4l2_m2m_release(dev->m2m_dev_dec);
> @@ -360,6 +391,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>   
>   	flush_workqueue(dev->decode_workqueue);
>   	destroy_workqueue(dev->decode_workqueue);
> +
> +	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
> +		media_device_unregister(&dev->mdev_dec);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +		media_device_cleanup(&dev->mdev_dec);
> +	}
> +
>   	if (dev->m2m_dev_dec)
>   		v4l2_m2m_release(dev->m2m_dev_dec);
>   
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 8fb333a99a40..d4f840a7bbcb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -389,6 +389,7 @@ struct mtk_vcodec_enc_pdata {
>    * struct mtk_vcodec_dev - driver data
>    * @v4l2_dev: V4L2 device to register video devices for.
>    * @vfd_dec: Video device for decoder
> + * @mdev_dec: Media device for decoder
>    * @vfd_enc: Video device for encoder.
>    *
>    * @m2m_dev_dec: m2m device for decoder
> @@ -426,6 +427,7 @@ struct mtk_vcodec_enc_pdata {
>   struct mtk_vcodec_dev {

This structs has a lot of duplicated fields for enc/dec
Since the device represents either a decoder or an encoder,
I think all those dupliactes can be removed, so for example
instead of having both 'dec_irq' and 'enc_irq' we can have just 'irq'

Thanks,
Dafna

>   	struct v4l2_device v4l2_dev;
>   	struct video_device *vfd_dec;
> +	struct media_device mdev_dec;
>   	struct video_device *vfd_enc;
>   
>   	struct v4l2_m2m_dev *m2m_dev_dec;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
