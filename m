Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A7BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4980660FD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4980660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoB/i8Zd9GZsfeSr3HK/yhS2QaZYSOLb9DFhqVolJ5Q=; b=QszKs3KN1YMDl9
	gmIF42EDV+qdTeDdS7P4Vg+7340fjkQElFuIc55970tSHc3KUX+9jgt8QjZPHbofYSNr4UkWfOBTM
	Ys87mYsaW4cFrWnAgNGGDRZXOHd/iVBR8bmai8+58WAy31bs/gtjNjO1JwfDWgsjwk2mkAGfCZgLA
	zLOcLU6PuSgVcyk9SNUwPlKgP8AHi3KVLuVVb4AoNbOZQi2b5gETUHYnFQpZpUFvlpcObSl29equf
	5PK4Zm4erskn6zu1Uu3lWOwIfEW+XbbD3DiAJHiJpXA7CweoLj6Ykx3wqmsZjLkVkFWjKGwzINcDQ
	uqBrVzF6/lx/HDF4d2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIT7a-002NLZ-E4; Tue, 24 Aug 2021 09:53:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIT7Y-002NKG-67
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 09:53:29 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so1439506pjb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y+4TOdfiSrPLpilk4nXd191TRaZiBNSbpfGRJDlN6Xo=;
 b=vPgvA0tj4fvHTKQGRUrcP0uEeIWCIRwx+dPJ6dGccUF4YIgoRJa+YVOsvkIXM21I0r
 n+md7zdI3okOy4xHX2uVtw783gUKvQGN5vS5Kd8z8bZeqhWfyHpbFf712EFyTnRzILHO
 Fvpv41PaTn2x2nvZYTzPVHay+ErepF7RQjpvl2RKg08jljTn3PUK7B6ZXkJPLyQjPA5R
 Cgb6O0uWM12qKePazoJpJfVQwpLh/yijFHX6lG3Kydkg9t0WMCPO6RAIhSh0puWhCvQY
 hSmYuO7p42PAYBusuAytm80hxGYWdSwc5bkZ9WYl1vTXb/DzNSZwZOvk4vY4MXno7w8q
 uF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y+4TOdfiSrPLpilk4nXd191TRaZiBNSbpfGRJDlN6Xo=;
 b=G1Cbs0R1o62i/S8LPQHwMW9XepD2hD1poxekzPoYoNY6hMsY69tuKEwlJWfL4Uo8nW
 BXsixaE855zgt5igUkoHWO/FJL9MR+NvqBYu1aJ7xdKjpukRfMQkDs516GXn3YLVP5jv
 y/EgNi6TX03Z6ILHeGafQyWBTGl/Ku+mmT39YUVmqwzqH8Z83lvyIDWPxxiAbIiaHYbv
 oO2ptnGXMbTE8K/Npf+xhq28c5WPqEs+em96YZhDbM7rf8AjbZPdsbeOcJu5gHGEPAY7
 G1uOdSxkEzB1FfQzXOMvwjVtnayD/kU0oGe6Bnx2CDWSYGYKTNoA8x1M2kZxVFqIoNmF
 bTRw==
X-Gm-Message-State: AOAM530/eE3SULVY3MNlBmOEBnlpwE87xpOg7H5jIcIGAIvUCXGWzRWX
 LXYQ2zBtkymag2k3uLVkdnlUjA==
X-Google-Smtp-Source: ABdhPJxht4KPxR628aDJtIWzZmmfHxaeU2++K2HaMoN6ksTkRxgKPtCCpNOp59sviJumX/HyYX3arw==
X-Received: by 2002:a17:90a:8905:: with SMTP id
 u5mr3456576pjn.95.1629798806963; 
 Tue, 24 Aug 2021 02:53:26 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
 by smtp.gmail.com with ESMTPSA id p29sm18874522pfw.141.2021.08.24.02.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 02:53:26 -0700 (PDT)
Date: Tue, 24 Aug 2021 17:53:21 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 4/9] media: mtk-vcodec: Add venc power on/off interface
Message-ID: <YSTBkZg0LBJGJsrE@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-5-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-5-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_025328_293430_1C7A0A90 
X-CRM114-Status: GOOD (  20.74  )
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

On Mon, Aug 16, 2021 at 06:59:29PM +0800, Irui Wang wrote:
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -16,6 +16,7 @@
>  #include "mtk_vcodec_intr.h"
>  #include "mtk_vcodec_util.h"
>  #include "venc_drv_if.h"
> +#include "mtk_vcodec_enc_pm.h"
Please try to maintain the order.

> @@ -285,11 +291,12 @@ static int fops_vcodec_release(struct file *file)
>  	mtk_v4l2_debug(1, "[%d] encoder", ctx->id);
>  	mutex_lock(&dev->dev_mutex);
>  
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
>  	mtk_vcodec_enc_release(ctx);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> -	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +	mtk_vcodec_enc_power_off(ctx);
Any reason to move the v4l2_m2m_ctx_release()?

> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -12,6 +12,7 @@
>  
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vcodec_util.h"
> +#include "mtk_vcodec_enc_hw.h"
Please try to maintain the order.

> +int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
> +{
> +	int i, ret;
> +	struct mtk_venc_comp_dev *venc_comp;
> +
> +	/*
> +	 * frame_racing mode needs power on all available component devices.
> +	 */
> +	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
> +		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
> +		if (!venc_comp)
> +			return 0;
> +
> +		ret = mtk_smi_larb_get(venc_comp->pm.larbvenc);
> +		if (ret < 0) {
> +			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
> +				goto pw_err;
The goto statement has extra indent layer.

> +int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
> +{
> +	int i;
> +	struct mtk_venc_comp_dev *venc_comp;
> +
> +	/*power off all available component device*/
Need extra space between /* */.

> +int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
> +{
> +	int ret;
> +	struct mtk_vcodec_dev *dev = ctx->dev;
> +
> +	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
> +		ret = mtk_venc_enable_comp_hw(dev);
> +		if (ret < 0) {
> +			mtk_v4l2_err("enable venc comp hw fail :%d", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = mtk_smi_larb_get(dev->pm.larbvenc);
> +		if (ret < 0) {
> +			mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
It seems the function doesn't need struct mtk_vcodec_ctx.

Does mtk_vcodec_enc_power_on(struct mtk_vcodec_dev* ) make more sense?

> +int mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct mtk_vcodec_dev *dev = ctx->dev;
> +
> +	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE)
> +		mtk_venc_disable_comp_hw(dev);
> +	else
> +		mtk_smi_larb_put(dev->pm.larbvenc);
> +
> +	return 0;
> +}
It seems the function doesn't need struct mtk_vcodec_ctx.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
