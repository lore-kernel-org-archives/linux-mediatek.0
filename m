Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79574C678D5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJBmf2Z8Q7ZeQFMRBJ2hUCFj93WttsNBI3W0yFwZXAY=; b=z7YcqcrffvssabrhnKXjt5AakB
	whBBDo/bGprikkvVjGtEVVJeLTdLAu9W3Gkf0X1Jz18xoUGv44hu5sjuykzXPA4FBpw25fV3QizxR
	1onNybUm8VhlnxwkIbb/G9tPFNfzu95l2rCQVN2fEVU41ktyOmdv9p6NAO5eHyuLVevzG2WwBxa7i
	5NpQcGXs3AlwblelRI65KmX64uQErDAIJmhcwgxlPHE7Y9CPppBpKZ7epqquV3WJ8KsTXbaIqAloF
	U0ljvHAKB+vPdouh1ffzfW+PxgWs6G0u5KHey2VYx3/1E/B37ko5KB3DDSgwpR5orMCvHQKGYRWnN
	qH1wTsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa48e-007I4B-Vr; Thu, 09 Mar 2023 00:28:08 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa48T-007Hzk-OF; Thu, 09 Mar 2023 00:27:59 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-17711f56136so624236fac.12;
        Wed, 08 Mar 2023 16:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678321674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJBmf2Z8Q7ZeQFMRBJ2hUCFj93WttsNBI3W0yFwZXAY=;
        b=bWYKVfqfrWQUTIOwy24/YGiEMDgukGeAfM1EvAy+kI0hiLaep5/qT0an+TwU+Ckcws
         komc/X9CBQLEqMR1MLdrJDCvrBrfIzBlO5snWhyvzOOdg9QlvbZ7XIvvj0okhwMC6n0J
         Kv7bav1KnUGjmrxW3X4MAHmkEBq30ZvI9y/sBDSdHEx2fWotlg3pHLizVcqwA54L2lu7
         7t1KLUNCE16Zdce/yJBj0IMKokUQZm2IEHlVz9rGtfhA2mtRaTI7GMq1aI56BSB32NBo
         LOJpIP97hQ6OfOF7DvQFzVjor5pLetAfYIHtYX11vjfvlqzmzYEleHYfRHOm6wg75oeB
         exsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678321674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJBmf2Z8Q7ZeQFMRBJ2hUCFj93WttsNBI3W0yFwZXAY=;
        b=eD8jlvXP1K8CWYz0Wp7YVog1Fq4wsmD573d/ge9kS8Lg6sNmzo83Lr0kX79GiS57dz
         X726zPtBGcaHyDOtz7uEdO4gq0ZCgnWs+2rRsQIwZN8VF+7NY3HJ2My6rHIdvHJc2NTz
         dMCd0ClhqqVCFWn+fMqw3gyCrbcIOOw7RcgB61adGuUA3liynZ+ZZSzvx4upW5iQV3Ph
         EbhCp5ty4ndRuLsyoMRN74Vea6MWDz0TbG5lD0RdfULIhs0TbJmfx9MCWyWy+X+WtZgf
         qtwyQqI690UqvvOiJZRsv7UXzqktqkUCoHGylAxGwga3OWfdsprLv43pnZW9SU8OGf6p
         ySlg==
X-Gm-Message-State: AO0yUKXK6cvWaGZFMGpPGgoOSW/uRnrpG4Q/RVTguPf+7XcK7yNXEcMc
	mXk2cwCt4l8kM3p0nPXZ/h8=
X-Google-Smtp-Source: AK7set8fOyHTZ3eMSb4goRruY3pl5S+G/Jv+leAO+WOaHhIExM7GxVJtVFjbF2Ong4tU3+90AlSvyw==
X-Received: by 2002:a05:6870:9728:b0:163:4a41:ea94 with SMTP id n40-20020a056870972800b001634a41ea94mr2019979oaq.49.1678321673943;
        Wed, 08 Mar 2023 16:27:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d26-20020a4a821a000000b004c60069d1fbsm6707818oog.11.2023.03.08.16.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 16:27:53 -0800 (PST)
Date: Wed, 8 Mar 2023 16:27:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zheng Wang <zyytlz.wz@163.com>
Cc: mchehab@kernel.org, bin.liu@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, hackerzheng666@gmail.com,
	1395428693sheep@gmail.com, alex000young@gmail.com
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Message-ID: <d27127a1-2572-4ad4-b69c-8a6f53384009@roeck-us.net>
References: <20230302093715.811758-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302093715.811758-1-zyytlz.wz@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_162757_830800_19643050 
X-CRM114-Status: GOOD (  23.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 02, 2023 at 05:37:15PM +0800, Zheng Wang wrote:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
> 
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> 
> CPU0                  CPU1
> 
>                     |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>   v4l2_m2m_release  |
>     kfree(m2m_dev); |
>                     |
>                     | v4l2_m2m_get_curr_priv
>                     |   m2m_dev->curr_ctx //use
> 
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 969516a940ba..364513e7897e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  static int mtk_jpeg_remove(struct platform_device *pdev)
>  {
>  	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
> -
> +	cancel_delayed_work(&jpeg->job_timeout_work);

The empty line is needed (coding style). Also, this doesn't cancel
the worker if it is already running. This should probably be
cancel_delayed_work_sync(). Even then the question is if it is
possible that new work is queued before the device is unregistered.

Guenter

>  	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->vdev);
>  	v4l2_m2m_release(jpeg->m2m_dev);
> -- 
> 2.25.1
> 

