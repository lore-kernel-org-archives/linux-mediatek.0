Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A522AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:29:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFF26143D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 07:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFF26143D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WnyO6qzTgH7Mb/Hfre9KFy6XRvKs+MfPy4KQ6OIztyw=; b=kIrK7AdwzHRJTxRBql3EWMSR+
	Zsv+i7cS7nqwbEtUm8JIta0On4qGdsRPr8fCBpmpJOAAcjf4oaNmo5VK5eNHrXSg0jWDqmsZyI1+h
	9n7p0iscIcKy5msctIMgy4iiGV3j///L+qtW/PsuPPOChyhyRHYHPK5XfF7tIlPKN3G8arucq2U85
	+nnmTLlmnTMSTrebeOpdmEo7/ibZk4K8t+djxwRgldReO1zt3Q/P7csTx6mqYIsTq0Gr4X0s4lNrk
	xKGonhZDGVVmcRBxptsZuQBwqGa2bHDArfiOaJGIFqQoBaV6g2mKRV/HkaWBv7mmMePakvKyqYWAH
	gwdEDscMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc16d-005DH4-D7; Thu, 29 Apr 2021 07:29:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc16b-005DGb-C3
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 07:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=irx+AKzVobrOXchjacnMXLOcJZVMn6WEAoeMBWB+Psk=; b=SOPOsbGLoNxBvPz0RA23bETqIA
 /yYd+B1tz2OPrqCqjX74w2rha22guFm4j0AIueA8U1tpK/SlnrsBH3SLWbeYGahrgTVdIBPQH512h
 Tb+K+JO65eM/AIAvKdQezgYK4lGbjshpaIpYdQG1aFZa2R2l9un5xT5uM8Qcoafuo+b43LNJHfAS6
 J0J8uZWl1wIDLuAwYKjXYMdKBxSWlCoQkiauWMkKX5t1657k9mpJ7kLcn+dAiCtV3iHIqOm/VnAGI
 TuopxgYxnJbIWPNv11PZ4MdVv5S7CQS+bkk+8HLhhvBSh6Hzuy1GXqW6x+CmDfk5pqJQl6laX4DeB
 x4E43Y8g==;
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc16Y-000Rrn-AL
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 07:28:59 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id c16TlpDS3iDzSc16WlkRRL; Thu, 29 Apr 2021 09:28:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619681337; bh=irx+AKzVobrOXchjacnMXLOcJZVMn6WEAoeMBWB+Psk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=ekCX0NTElJI5yRJR/QKxGUS/Glv+c/W2Bwd+vxyASmVphgckLzjRezwYrT2dXCo8K
 7TfOBzTi48l1A+jnag8XiUQcKAoRyrSG/a1m6NGRtv4d39HmXvDOJM688WYEXQi2fS
 meSgVTQDVQrXBx6drXk1RH624zfdqCashIH9BlLuSHkz5K/9nzeFd1RKDwYhmVWFXC
 WvYeeYYCg4goYDbfzA4e5telyeCB3MIkUt52I7Bg+fv3LF2qhGnk1oYUQUnDTsuBKQ
 UGUs1vapTtybv0VfAXeJmBogOQcJtXmsSgUpOpAfJ/fCFe6HREvowp1g4CW/+QBkDx
 FcD2nlAp91yXg==
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
To: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
Date: Thu, 29 Apr 2021 09:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-8-acourbot@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4xfKmi/SGORAUg0f3nHpt2gRRLP6BFQwGcgLu/Gzt9IyC42z6wVdrRmIO8uK/pxq7KxBnzXd3UhoZjt9jqiH5C7PtiMw/pdVT4fI7ilAA3L8RsXzI2YRac
 zqi82jkMFZKRKdjLWm0KB+/YtIwdgzlHd8TTZ+ms3Gu1V6NYmwLO7snmkHmZjKeUE5R+5qKarwJwYVseZuQaaQ+HAOz1lqIzfUgBtWJ4rpyCcQ2395Yt4V00
 xLlwZ7DfC63NxJfk7ud8l1rEiJZDcRVVcvdL7ixSVTRwtY1lIUuu0Zcp1ShyZbOyl8QjuQknEztDZPbsxWp6lJ+l64dEvqXiS8pwpyIlgW6VXXPnF6fBkz23
 U3o0SSREogb0BQxHB0kuKp6UIBJq8A3ieffobATJo+HCDxJewrJJA/7ZSY5x4K4ZE82D+FPBTQjCakOBHZCkFS/Dza9ICgrw9Z71s74GedwAFO8ngF6Zj/hb
 kHMbdyDQw+HCMp8TUlH602vSQb70227lurFW6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_002858_540566_1DB59AFF 
X-CRM114-Status: GOOD (  20.14  )
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

On 27/04/2021 13:15, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> The stateless API requires a media device for issuing requests. Add one
> if we are being instantiated as a stateless decoder.

Why for the stateless decoder only? Why not create one for all?

It's not a blocker, but I would recommend looking at this.

Regards,

	Hans

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
>  	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
>  	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>  	select V4L2_H264
> +	select MEDIA_CONTROLLER
>  	help
>  	  Mediatek video codec driver provides HW capability to
>  	  encode and decode in a range of video formats on MT8173
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
>  		goto err_event_workq;
>  	}
>  
> +	if (dev->vdec_pdata->uses_stateless_api) {
> +		dev->mdev_dec.dev = &pdev->dev;
> +		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> +				sizeof(dev->mdev_dec.model));
> +
> +		media_device_init(&dev->mdev_dec);
> +		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
> +		dev->v4l2_dev.mdev = &dev->mdev_dec;
> +
> +		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec,
> +			dev->vfd_dec, MEDIA_ENT_F_PROC_VIDEO_DECODER);
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
> +		mtk_v4l2_debug(0, "media registered as /dev/media%d",
> +			vfd_dec->num);
> +	}
>  	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
>  	if (ret) {
>  		mtk_v4l2_err("Failed to register video device");
> @@ -336,6 +362,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_dec_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		media_device_unregister(&dev->mdev_dec);
> +err_media_reg:
> +	if (dev->vdec_pdata->uses_stateless_api)
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +err_reg_cont:
>  	destroy_workqueue(dev->decode_workqueue);
>  err_event_workq:
>  	v4l2_m2m_release(dev->m2m_dev_dec);
> @@ -368,6 +400,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>  
>  	flush_workqueue(dev->decode_workqueue);
>  	destroy_workqueue(dev->decode_workqueue);
> +
> +	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
> +		media_device_unregister(&dev->mdev_dec);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +		media_device_cleanup(&dev->mdev_dec);
> +	}
> +
>  	if (dev->m2m_dev_dec)
>  		v4l2_m2m_release(dev->m2m_dev_dec);
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
>  	struct v4l2_device v4l2_dev;
>  	struct video_device *vfd_dec;
> +	struct media_device mdev_dec;
>  	struct video_device *vfd_enc;
>  
>  	struct v4l2_m2m_dev *m2m_dev_dec;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
