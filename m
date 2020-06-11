Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40104C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:17:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F9C20853
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p16TGRDF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AxV/Sk0D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F9C20853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaoBmSiug+pa2FZPr09vPNt4mnY0zLXnVlwiDHnpxMA=; b=p16TGRDFsj0+Ik
	1TngdPPbYt51B2HI6lj6NMd/DnBy12ABBpHGv7HQqlvjGIxwwDoHGmYnCqckfvUoDuQtY7+a1nQjj
	8Y427jk/smJ2EkgK2qW3LwH3HmrAFiokxJXPs29lG5nli8LQKlS9YUuCwjUdXTxZ2r4euGPmtYdJY
	IcA0PLwrCioHLkfd98Dbenpb9+0tAt/MMlXkdN6xW3UmVXklhi7dB0P8w/O0rbQsX9texv+UE7uy6
	yCCaf4JBc55/u0fykTZrQHUolN2d093+c8nF3kBVcQyMrAfzgFU2smYpUJzmCWn9TYCmTuB4nWj5g
	/4aLaXs3bdtpdJqteKKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjO1R-0007t4-0S; Thu, 11 Jun 2020 14:17:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjO1H-0007kv-QW
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 14:17:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id y20so5224150wmi.2
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RNw0t5OF2i7drNguzCKs4BhL36r2VlgNY7GbFOTjqzw=;
 b=AxV/Sk0DEDT54gQbWwbuHMzsD6e/E7rOARS21Yrb+YqlY/aM5Ccc/oKi9TqQiGSafa
 H9j+XMp2do7JhHGU93olyhpUGKoWHDkgt21qI8IRXXvvFnxLEBNRt2Yt55Pvowjathtg
 7jandyKb8/7FIK5JeEn2ibq1k2C0PxlylKzYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RNw0t5OF2i7drNguzCKs4BhL36r2VlgNY7GbFOTjqzw=;
 b=iMRNZKAN6/YaSvY/RC9PdksD12xDlpb5MqkMzgRCqZiTCXyM7qS7l0XvMs0POlM+Rt
 yKKQr3HFhaKXRIZmgPPaAWXCcZuSWtwJIlrgkDsyoMm4khlteCMd6Awc7IHJX6aQ2GFg
 2kXGnOM/dKyrhBHWljWiIEVoCdPvY/3RP9xvfAOnTMIXwaWEN5wgxY0T25lVhQTHyuwt
 q0sw2Z5YLzMWy5shOXej289bIW0oOrKsqaMpr9eGjEplYwIGumI0mtXDQhhRwioYZ/GA
 VdzrAwGGm8ZTknBuiRjzCXhknp1VpqzjWazpqwNw6ug0W0GOpMJK2BSm5mnKQ/4IsSzf
 Wurg==
X-Gm-Message-State: AOAM530e/v7eNPMrzgSj1WQoVrK0I0aglNo5nXe3V3bvHbcW9OkLlZF4
 YZc6kroowm+xrcJ/LAjZGa8PZQ==
X-Google-Smtp-Source: ABdhPJwxfmfetZw9SoQatIxsaEyd3GfuKkNflglFUsvZOtyhVxP2C6KyLrgx+G/tzAa2Jda/IPxaig==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr8521727wmf.69.1591885040174; 
 Thu, 11 Jun 2020 07:17:20 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id t7sm4879946wrq.41.2020.06.11.07.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:17:19 -0700 (PDT)
Date: Thu, 11 Jun 2020 14:17:18 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH RESEND v9 07/18] media: platform: Improve the
 implementation of the system PM ops
Message-ID: <20200611141718.GA158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-9-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-9-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_071727_854792_2A76E8FE 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:42PM +0800, Xia Jiang wrote:
> Add v4l2_m2m_suspend() function call in mtk_jpeg_suspend() to make sure
> that the current frame is processed completely before suspend.
> Add v4l2_m2m_resume() function call in mtk_jpeg_resume() to unblock the
> driver from scheduling next frame.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: use v4l2_m2m_suspend() and v4l2_m2m_resume() to improve the
>     implemention of the system PM ops
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7f74597262fc..49bdbf1c435f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1208,10 +1208,13 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
>  static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
>  {
>  	int ret;
> +	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
>  	if (pm_runtime_suspended(dev))
>  		return 0;
>  
> +	v4l2_m2m_suspend(jpeg->m2m_dev);
> +
>  	ret = mtk_jpeg_pm_suspend(dev);
>  	return ret;
>  }

This could be simplified into:

{
	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);

	v4l2_m2m_suspend(jpeg->m2m_dev);
	return pm_runtime_force_suspend(dev);
}

> @@ -1219,12 +1222,15 @@ static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
>  static __maybe_unused int mtk_jpeg_resume(struct device *dev)
>  {
>  	int ret;
> +	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
>  	if (pm_runtime_suspended(dev))
>  		return 0;
>  
>  	ret = mtk_jpeg_pm_resume(dev);
>  
> +	v4l2_m2m_resume(jpeg->m2m_dev);
> +
>  	return ret;
>  }

Similarly here:

{
	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
	int ret;

	ret = pm_runtime_force_resume(dev);
	if (ret < 0)
		return ret;

	v4l2_m2m_resume(jpeg->m2m_dev);
}

The pm_runtime_force_*() helpers will make sure that the right runtime PM
state is restored.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
