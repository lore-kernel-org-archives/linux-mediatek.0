Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE992C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 15:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E42D61B29
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 15:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E42D61B29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHuAto7hTWpg1a4iQEeLaJoZjZQ8Fvba2FMETMjKCXg=; b=gEzhIZRkYReElr
	znD/+ovDxSQhtBrv2pmqEB2CLHG5YnwLxsG6BACo6BKF9NssuWrbzHC+3RxeIniI24SlrpluomBft
	jMUmwn4YoriMem6oZ2a2wVpQcwuqsX3QBsnQw1bWrwrVmmM/mZ+D6UmSHVfHpLJmclY7+QJI/yso9
	z9f+MaxcboS1YaFN2v/AYh7lx+vLI9YSa6F3iHkx3wNoHh0F7eXDnOo7aY0UCWOKnqDmxWzLIz/Yg
	B94hRcH+pH6oUCFpkUh+rKQVuotG6OlFBOwf0qn3Xyh3abV2VTuialhMr3lsKUAQGGKYiCOnzXRgx
	Xxd1gr6a+Hv8GDlNHfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnMQW-005Hs2-Ux; Wed, 17 Nov 2021 15:00:44 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnMP3-005HFW-U4
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 14:59:15 +0000
Received: by mail-oi1-x234.google.com with SMTP id s139so6868473oie.13
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7vwEIGRd/k9q1/+y5hcDE349ZZtS7AT1p1s0Zcv7eNE=;
 b=dyMkyVuNdoMZvjI0ierM6RaC+RN6oZin+Sqkd6bM4mvd/cAUZGfbRBwTCXK9XUFmuN
 mXgtExUa30oDoPk+WTTAI1T5ZRYSd4uYAV9c1BwGZRHJRpCT2QgD7iUbSlREZtVlvQpu
 f9TGzhoiu6KJWaCx1V/SDwv+0onqKWgI0s4GDYG4CM8s0KQs8XsTvkgtTQS8i1wu0Oxg
 eeLY9uEKOL+rBGbFB+RpsGTLtaa/G3fnVpgbOmgbQREfHNDM/1cRc5Nc4InEoFfPPAcc
 EXVJO2rTtFu+xrwo8hIQ0lbV2JMwne2ZPX3GA40CtnmJ/VWSD5SoPNV24nZQ6b9HGQzI
 UTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7vwEIGRd/k9q1/+y5hcDE349ZZtS7AT1p1s0Zcv7eNE=;
 b=55DkTFaTIL+vJYfKXMlPzn5nCXGwml7VTpolzaR9oUqBQIeSJtt/+Zczd85b+4TveM
 kH5U9D1Bzqu8Bv+6W4YoOcvk9qh4dUeW7C5u68JdiYukOHnRD1UZaEWt9tHUI03usVws
 54ZsPcuF6fy6kkWA5h1JCxPfTRZlWqJceJzYxff+O2cMfTOhz64GI9ivakG9ldCHN1IC
 QYXZDOVS4dI7TH5s1UCNvaJE/BV9lD2DyM76Kmw+mQ4Fy9Ots4FYHttw+qXBWHoRXyUG
 RwAkaj4MU38gC/XRbyY+/oJcV3DK0/lml0a2yXDRTz6ha6k40YFViTGA4kk+B3aeFdz6
 vQzQ==
X-Gm-Message-State: AOAM5337LMab88PrfBIZ1ZfWZgMuh5bYOesRiid4RY2IuG6J0WvRQmte
 LHZV1X5VcEUK4FqJ5IEI+ng4kA==
X-Google-Smtp-Source: ABdhPJxm262/4sVs9neZzycZF3skmMRjr0n4bKAnJHM153HG6gX0GlpzV3dRgWlWYAIctxlrkuPVhA==
X-Received: by 2002:aca:b386:: with SMTP id c128mr179202oif.161.1637161152006; 
 Wed, 17 Nov 2021 06:59:12 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e21sm15160ote.72.2021.11.17.06.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:59:11 -0800 (PST)
Date: Wed, 17 Nov 2021 08:59:07 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: ohad@wizery.com, mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return
 error code
Message-ID: <YZUYu9Ko1lTgPslz@builder.lan>
References: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_065914_018327_D483C6C3 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue 02 Nov 09:15 CDT 2021, Mark-PK Tsai wrote:

> Use %pe format string to print return error code which
> make the error message easier to understand.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..2242da320368 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  					   dma_get_mask(rproc->dev.parent));
>  	if (ret) {
>  		dev_warn(dev,
> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
> -			 dma_get_mask(rproc->dev.parent), ret);
> +			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> +			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>  	}
>  
>  	/* parse the vrings */
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
