Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D99C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQYt+5snOV549oU/+ra1rZAifNQ+D1HxN1LkSK01lZw=; b=FIP8o97FlLC/Ny
	LawQrqdzPdJL+phsA4+lhdVGUkles0FoOnfqT4k8I7qiW9PotMLp/P07S1DwRBVU2Efl80p6ot7jF
	e4p2o5el3W/RIo1v22Eg+2kduPY9R6m8cH/I/9dbcMabL2nUNqXahmmAyVrcf7l1ZI++dhc9DK1C/
	EkC1lMzMeuAx0UyW3dq+V0/v/8EesD5uGkIkJfEWirBxhRxmDWtd09pykc3P9Xo8jIFzFpzsCgP6V
	LN7C0/DQ0oGw/yM0oqTBeIyC25hjg2ut9IC1gXCJzY+6ub160b9zEQpv6fYFcn/5eHxb78KtUHu4M
	TlYpiEaBmGEXvp1OszGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKm4O-00Bpbd-Oc; Thu, 17 Feb 2022 19:04:00 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKm4K-00Bpau-QT
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 19:03:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id m7so6542976pjk.0
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 11:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tuph2oj2GgXsuvbqidnNP8qpmrKej2apMqYW+XlK6Io=;
 b=C7v6YuXskwE5qqpjDquE19isFipjTh1a/uDmHHgGHzZq6nxIgVIcXz0Tvef+YJUXfD
 /fOMZKaBq3o9L0h62DdfmhCpLXnjrlGsT6tvTA3OkGLsPpUyB57xHPAF5MkFqR5a+kip
 kgGIYl0PFM7/69QzaYLLFMMNoxoA0i3tO/GXalyqztUKmLK//gfgpkHB3b8dCn4tvPG/
 wpDw9bt2jtqAjegT0L4ztLATo8agSVK6Z7jhB482JsQn7TfRch6Z/GUhMCe80VN/+xHL
 Lx+N1DvwYhm/VtGicXdCe8g9444RI+lVkVrO1v0vNXGmsoJViHV3JGVYHEogOO17yn/t
 N/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tuph2oj2GgXsuvbqidnNP8qpmrKej2apMqYW+XlK6Io=;
 b=uxbDEYuUhpAibYHuDR/Rd32/igBOqmZo7bizgyHy8rOmgtyb5WWs5f3WlLHrahgSOC
 XRu6FJq2n7bnL/Adr7gm9G0x1cAy8x8F0QQpFWqyIWfxuQnnY+9ZOPu1U1VThnW8vmvp
 wze6LuowsKLuOOMvyQEZva2V0z/AgQfFz/W7YlcgYsGd27JnYeUMRd23jSCTE5gC+67L
 ujlGMZ9OrsEUU4zg9YKEqa3gkmtVNnI0ntJDDvGfh7mmnYEI/v93FfsD2UxSLFmzSvRO
 z/3LDIl3gTdlZ7mbcTIP1vBZvEaj5MOie47TvEqX5xstDPF/YBoAqijNBER1/CFWrXf9
 Dmbw==
X-Gm-Message-State: AOAM530JArIal0ibpB+495NI/DrIE6Lm0LeBJ3lKIYMODMrIbYXeRMb+
 eDxAf4a+9EjywAalciAakvJlPg==
X-Google-Smtp-Source: ABdhPJwJUoF80WtVQZUaVb6gZsyH67X15ro43d+R6cMm9UpbR3H5yWr2lfCLx+jtXRjbrHysWmFIaA==
X-Received: by 2002:a17:90a:a385:b0:1b9:cfb8:de07 with SMTP id
 x5-20020a17090aa38500b001b9cfb8de07mr4400794pjp.162.1645124636039; 
 Thu, 17 Feb 2022 11:03:56 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id nu11sm2701119pjb.36.2022.02.17.11.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:03:52 -0800 (PST)
Date: Thu, 17 Feb 2022 12:03:49 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Message-ID: <20220217190349.GA477215@p14s>
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_110356_893357_4746E7D2 
X-CRM114-Status: GOOD (  23.07  )
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

Hi Angelo,

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

I spent well over an hour tracing through the meanders of the code to end up in
scp_ipi_register() which, I think, leads to the above.  But from there I don't
see how an IPI can come in and that tells me my assumption is wrong.

Can you give more details on the events that lead to the above?  I'm not saying
there is no problem, I just need to understand it.

Thanks,
Mathieu

> [   18.228399]                                lock(&mtk_subdev->channels_lock);
> [   18.228405]   lock(&scp->ipi_desc[i].lock);
> [   18.264405]
> 
> To solve this, simply unlock the channels_lock mutex before calling
> mtk_rpmsg_register_device() and relock it right after, as safety is
> still ensured by the locking mechanism that happens right after
> through SCP.
> Notably, mtk_rpmsg_register_device() does not even require locking.
> 
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
