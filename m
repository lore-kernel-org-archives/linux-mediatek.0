Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02268C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 09:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A7864DFD
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A7864DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0+UmF+Va5vkWU+rG85PsMEiDE/6H6V60EreSmHc9XeM=; b=YT/S3UaZvkHeiSBIhKRMKvshc
	l/xBnwnslgDXn8mHQMj92IghcMfq6Aj+E0WukUYX9O4xc1Kybe9rzcl6msfIq/FpQ1ARVV4c+doUQ
	SiOt4wW0gVO7wTexj2ovXr6Zpy3bfCdCA8s0sEnUkXKLK9hxTdl7oLxaXLh/hNBVlsc9AIGeus0Q3
	VUOjwXD03taEdpwam8nt8lFzGEWpx8YnWEUq8e752MmBDv4Rnob8rlOZP8L6K7iE1YFKpN9blmU1A
	q9emX5qTld87dARwfW1Qb2f3hCZ+1DTkQin/DAIPkCSwq2RwWoQeKCC3jCMxssJcyCDxilI3H8SMI
	cbyrZGOEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8gSZ-0005L9-Q9; Sun, 07 Feb 2021 09:34:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8gSW-0005KY-Jc; Sun, 07 Feb 2021 09:34:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D72364E2A;
 Sun,  7 Feb 2021 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612690462;
 bh=vHdplIXe2RStxmKLVaI73uahI+H48WMD9Z6xwvPREOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GA/UugZBRdxo19A6s+kxnmLYt1SAraTqqy+qtZGDoDGBadsBnv9WRNv/5kN2nKcNH
 ZG6VqjBDUysIN8Z+S7aj6UwU7ES0p+Icio6RJ/+5COw0I6i8uTq+s2Njpe6vtvY1QN
 G9dHiZBV26PMMg8Nv6cmeNwIrGuQdj7mjAQNhL20=
Date: Sun, 7 Feb 2021 10:34:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Youling Tang <tangyouling@loongson.cn>
Subject: Re: [PATCH] staging: fix ignoring return value warning
Message-ID: <YB+0GmywKAQVBIjG@kroah.com>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_043424_824287_797E3377 
X-CRM114-Status: GOOD (  23.85  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devel@driverdev.osuosl.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
> Fix the below ignoring return value warning for device_reset.
> 
> drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>         device_reset(&pdev->dev);
>         ^~~~~~~~~~~~ ~~~~~~~~~~
> drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>         device_reset(&pdev->dev);
>         ^~~~~~~~~~~~ ~~~~~~~~~~
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  drivers/staging/mt7621-dma/mtk-hsdma.c    | 6 +++++-
>  drivers/staging/ralink-gdma/ralink-gdma.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
> index bc4bb43..d4ffa52 100644
> --- a/drivers/staging/mt7621-dma/mtk-hsdma.c
> +++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
> @@ -682,7 +682,11 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	device_reset(&pdev->dev);
> +	ret = device_reset(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to reset device\n");
> +		return ret;
> +	}
>  
>  	dd = &hsdma->ddev;
>  	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
> diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> index 655df31..df99c47 100644
> --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> @@ -833,7 +833,11 @@ static int gdma_dma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	device_reset(&pdev->dev);
> +	ret = device_reset(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to reset device\n");
> +		return ret;
> +	}
>  
>  	dd = &dma_dev->ddev;
>  	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
> -- 
> 2.1.0
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
