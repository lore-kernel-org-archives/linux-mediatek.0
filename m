Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfwTPQ9qGk6tf/toEm7sKuIJjywrfUOQ6OCNEam+1L4=; b=yJy0HDidpIrEoX
	3ldMFe7lAT3ABh09Nu6IT3wgCUMsDfDeXerRJ+UBZxNOKa01FX12/O6JluUQWxWPikT6R9AxBRRSV
	ZwOdajpEXlu6DSKtDT4Jl3YOwZ8pNaD/trFzPKoeLR+nsO/tci35w4+khiF8E/QRAt+R56fmuJ2g9
	PomTzjtSPPasIrEeEK0SigR64GEIKuQ78MckFUq3HqPEbpYoI0sbnfT7Qwba1M91qOBHd6WYapvAU
	8b+/lmgufStKnqyWXKDZvOsXx1DbN+8UOhR8tP0O7+iWq+9wMFIutP8BVbVmof8hOTVNV5Z6iKzEZ
	NWrBSr5pgvqaey1ZzZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtAI6-00GL6w-GG; Fri, 03 Dec 2021 15:16:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtAAG-00GJ49-Bk
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 15:07:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id y13so12637228edd.13
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 07:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rQ5ApB0ZPIcQi1X7PS6LivqOFWhSDFxReULmsEQ/x1I=;
 b=egVUF4DA/O5x1D7pWspWl98sdEHj87pVaRYAkyyFCFwz2/vknCdCMU6Ciu0W3meLbF
 PBna+ZZk3/po9HfGz+uMyHhzlytjssNW9iteGHXkAsy3a2TqNon9Kw1D2zy7O1BVf2q8
 4zHB+zV6LIPskCJQ4/DFxzAU+T3h6Sod+FL9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rQ5ApB0ZPIcQi1X7PS6LivqOFWhSDFxReULmsEQ/x1I=;
 b=ENuXTRwK3LJxjGTw9aSd1H216ZxE/QTbHaWm56iIHJKRou9MgPhcSur4D0YftE93v1
 W7evavGQO97fGbTzlhs6x6Qv8nB0v+WXRmbcbtXqnKqmtCMXl7NG96izYMsG0AtK/tue
 JNOylkvYdJvXMfQbD0CBEUrJy50P+hcXCQANTLuT1Zc/5WGRpnK9axKFV4bvVg18e6+/
 IitFvCpBv3QTNhhwn3vzzeCCSH7Tn6ee+YeWNnbfgDYjcQ/URszpUJ85b5+3TIEvYeDw
 4i79bJNj97lJbYk18+NKrXFbi/HLkkKxI7fM+Z7PrfHHL8EtDPBMlsvXXWhPbYDwr4bw
 fQAw==
X-Gm-Message-State: AOAM530kJlZh2CtqNe1/ujBkEC3+Yx1iQFNTCgTTa1ggKkhjWSjsSJWo
 N+ZrriKI2ULaI+qZUh7mnGgHgQ==
X-Google-Smtp-Source: ABdhPJyh2T9bEMe7PD8PXtMt1dLCfoZrdhHTZ4rRB/6mvvvioaUSceTOjrwRRsQ75iP1hljjZDm0OA==
X-Received: by 2002:a50:e18e:: with SMTP id k14mr27491053edl.147.1638544074682; 
 Fri, 03 Dec 2021 07:07:54 -0800 (PST)
Received: from gmail.com ([100.104.168.197])
 by smtp.gmail.com with ESMTPSA id gz26sm2106725ejc.100.2021.12.03.07.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 07:07:54 -0800 (PST)
Date: Fri, 3 Dec 2021 16:07:36 +0100
From: Ricardo Ribalda <ribalda@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
Subject: Re: [PATCH V6, 3/5] media: mtk-jpegenc: add jpegenc timeout func
 interface
Message-ID: <YaoyuAFD8IaSij6S@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638501230-13417-4-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_070756_501120_CD61A496 
X-CRM114-Status: GOOD (  22.51  )
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

kyrie.wu wrote:

> Generalizes jpegenc timeout func interfaces to handle HW timeout.

Where do you call schedule_delayed_work() and init hw_param?
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
> V6: no change
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++++++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 23 +++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 7d013de..baab305 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +struct mtk_jpeg_hw_param {
> +	struct vb2_v4l2_buffer *src_buffer;
> +	struct vb2_v4l2_buffer *dst_buffer;
> +	struct mtk_jpeg_ctx *curr_ctx;
> +};
> +
>  enum mtk_jpegenc_hw_id {
>  	MTK_JPEGENC_HW0,
>  	MTK_JPEGENC_HW1,
> @@ -122,6 +128,8 @@ struct mtk_jpegenc_comp_dev {
>  	struct mtk_jpeg_dev *master_dev;
>  	struct mtk_jpegenc_pm pm;
>  	int jpegenc_irq;
> +	struct delayed_work job_timeout_work;
> +	struct mtk_jpeg_hw_param hw_param;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> index 4ccda1d..e62b875 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -183,6 +183,24 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
>  	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
>  }
>  
> +static void mtk_jpegenc_timeout_work(struct work_struct *work)
> +{
> +	struct delayed_work *Pwork =
> +		container_of(work, struct delayed_work, work);
Please use to_delayed_work()
> +	struct mtk_jpegenc_comp_dev *cjpeg =
> +		container_of(Pwork, struct mtk_jpegenc_comp_dev,
> +		job_timeout_work);
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	struct vb2_v4l2_buffer *src_buf;
> +
> +	src_buf = cjpeg->hw_param.src_buffer;
> +
> +	mtk_jpeg_enc_reset(cjpeg->reg_base);
> +	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info->jpegenc_clk);
> +	pm_runtime_put(cjpeg->pm.dev);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +}
> +
>  static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>  {
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> @@ -194,6 +212,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>  	struct mtk_jpegenc_comp_dev *jpeg = priv;
>  	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
>  
> +	cancel_delayed_work(&jpeg->job_timeout_work);
Isn't here a race condition is the delayed work is being exectuted?
> +
>  	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
>  		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
>  	if (irq_status)
> @@ -322,6 +342,9 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>  
>  	dev->plat_dev = pdev;
>  
> +	INIT_DELAYED_WORK(&dev->job_timeout_work,
> +		mtk_jpegenc_timeout_work);
> +
>  	ret = mtk_jpegenc_init_pm(dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
