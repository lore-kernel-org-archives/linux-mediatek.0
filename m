Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E847EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1JVzPt3voLBSHe9BZckhsWM0cx9IRilGOm3Q2zga6M=; b=RQZOO/LG11PKCd
	laEJclsMV5RbpVk+YII6PYABVJANktggF54vwtMFqYQh0Ky72PuOc2c7BQ19J2AUcbxsblzdRN/Ij
	BKCfFa+Yaew+rLdfLh0vyPSpU9FqNTR9kCT80tb2/LIxXNbhwagFGgCxNxBJs3ET1yeCn6QUcGF3V
	a1Sg1tnGGWadYg86/Qz2augBHql84A8K/hPKktrmY+2gM9JHV8N/fEvlW9TOud6AmEoyzKMB2sbNA
	Lp72p7Ovhb98y9X3m+WlCmZAX3+q/qoXCZpARG5iugu53VWZl9VNigFVIWhMIU4mYFh6FUdEYg5LT
	3raLy1L/6Jc7dIq+esuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk7zv-0083E3-DN; Thu, 28 Apr 2022 17:32:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk7zj-00839M-S4
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 17:32:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so6229646pje.1
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4oxf671PX/b/5YLLWBM8S/3ylJrxHqVxe323lh/h3FQ=;
 b=n0tbH4XbRXNmX0pG3Dadr/bXh5a2HX6a9+K1mtMJa42hf2a79qQ++Vd+aSEd6qrWdJ
 /t+OQbBesdE/dnniWLn3mYbFD/o+MkgeHMJXjJR5F40fSxLxPHfq3DVe4xIk0ezkc8Me
 /bJbEMMa5supZWWaPlyALzVGvg5j9m/lGHaKr6DSpHIDkTgU1VR7jA+K2os8BCi9G1Ab
 OBnNJjSAxqi/3debNrG4NdC5JdqZkTo3DbYxVCYQsQ0qCeiWclZfH8l0GA03vXq2qFKr
 jbNDdy6MX3m5tegL4SGS09tJA/c0uUH1Jrv8yvIXJBcAAkGgnb9M7AOGWDR9XGl42sLO
 4GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4oxf671PX/b/5YLLWBM8S/3ylJrxHqVxe323lh/h3FQ=;
 b=XwqzDjkXN5DZnr5BKNYCH2Rs/fr4Elj7Jefdno0Dgnb4iwENzfpLFGCy1E9vqA7xBq
 Cowc5iEJYSzZphNFkb5FWM1vEAbJnJfng+u2u651hFTFyMCpYyw05lShAIQQo5ZETztI
 4Ao4xvajG0WU8xFgZg0pr/rRgPkpCl6Z9N3ky0YO8xi/wUmwp0bYzny+o9pe91hPT0uz
 ldB0K/+lzrW3FPcmyM7NWMMSbt+T9qYwQyyBF5UrGVq62WxZxWJiqmWASipqobd2laBw
 qZ63HlRocB2/QBpBQhH7dh/tESVOXRZhgiTKycF5MIqnUcbD8eJ3Uy5lWbG0CCtQQkdh
 0FRQ==
X-Gm-Message-State: AOAM531iIrxnzvpjc1pK+P08RiM9NUqgnBNVrjqlFRqJ2NUumGA6sWX9
 M+kKsorWBk1SN4CfXXLmYwagiA==
X-Google-Smtp-Source: ABdhPJxIerott8Cy7D5882uOAWxFbbVSilYSlujg9dCoKfmkpgRndxCK5//0UxB36McM5Z8WP4F4JA==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a338:c568 with SMTP id
 nu3-20020a17090b1b0300b001d2a338c568mr51409101pjb.129.1651167111951; 
 Thu, 28 Apr 2022 10:31:51 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 v189-20020a622fc6000000b004fb72e95806sm439830pfv.48.2022.04.28.10.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 10:31:50 -0700 (PDT)
Date: Thu, 28 Apr 2022 11:31:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220428173148.GA2268704@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_103159_951325_E76E6F75 
X-CRM114-Status: GOOD (  24.94  )
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

On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
> During execution of the worker that's used to register rpmsg devices
> we are safely locking the channels mutex but, when creating a new
> endpoint for such devices, we are registering a IPI on the SCP, which
> then makes the SCP to trigger an interrupt, lock its own mutex and in
> turn register more subdevices.
> This creates a circular locking dependency situation, as the mtk_rpmsg
> channels_lock will then depend on the SCP IPI lock.
> 
> [   18.014514]  Possible unsafe locking scenario:
> [   18.014515]        CPU0                    CPU1
> [   18.014517]        ----                    ----
> [   18.045467]   lock(&mtk_subdev->channels_lock);
> [   18.045474]                                lock(&scp->ipi_desc[i].lock);
> [   18.228399]                                lock(&mtk_subdev->channels_lock);
> [   18.228405]   lock(&scp->ipi_desc[i].lock);
> [   18.264405]

I finally understand the problem, something that would have been impossible
without the pastebin you provided in your latest email.  Please add the content
of that pastebin to the changelog and send another revision (checkpatch
warnings can be ignored).

> 
> To solve this, simply unlock the channels_lock mutex before calling
> mtk_rpmsg_register_device() and relock it right after, as safety is
> still ensured by the locking mechanism that happens right after
> through SCP.

The integrity of the subdev->channels list is guaranteed by relocking the
mutex, I'm not sure what "through SCP" adds to the sentence. 

> Notably, mtk_rpmsg_register_device() does not even require locking.
>

I don't agree with the above sentence - if locking doesn't happen in
mtk_rpmsg_create_device(), there can be two CPUs accessing the list at the same
time.

Thanks,
Mathieu

> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 5b4404b8be4c..d1213c33da20 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -234,7 +234,9 @@ static void mtk_register_device_work_function(struct work_struct *register_work)
>  		if (info->registered)
>  			continue;
>  
> +		mutex_unlock(&subdev->channels_lock);
>  		ret = mtk_rpmsg_register_device(subdev, &info->info);
> +		mutex_lock(&subdev->channels_lock);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Can't create rpmsg_device\n");
>  			continue;
> -- 
> 2.33.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
