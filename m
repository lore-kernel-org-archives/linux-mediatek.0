Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDBC25B10
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 19:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=; b=u4l+pMpNyqJumTFAUc6OeOBXY8
	3Q0qe4r7oCcpz/ARArRFncrsB+1aGdm7tXuLf1lhuV5s+9JZyCxNK4R7DHhpKIVKwCoRZwpQuhyzi
	goeQbHVtvmL77rOsfzr/2FqCyWB3mzT/YmzUpLAWx/CRVIbwTlqqzqNr59/Du1fGFiRn8awe5K9wT
	o4j5IquZ/fSv5I5E91DhQCs3Q1UxokdnLmhZt9p0vLe2HJvMLaj/7nrBmI3IiERxF4hTqdPU6dC/X
	E08dPX3QkETgP7IeF6WJxh3NmQW/0l34DFK4IcBgY/nJ7XURq1gQ+1luoSBGVhdBFkCpieXuOJDww
	nrPHuhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s44Es-00000008Y0W-3Tly;
	Mon, 06 May 2024 19:43:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s44Eo-00000008Xyn-1w9b
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 19:43:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ec486198b6so18699015ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 May 2024 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715024578; x=1715629378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=iudp7ZPRMOw6sPPtbH1HfvhKoY5yNdOyA5m64W1HvMhKwR7evUUJmNL4/cb4YYvmM2
         bjQ+CrXmjFsTCcmtf0NG89HcmKYurGPREt2v8aQTNj/rELUzy+UzEb2+chiUzvdogpSi
         xtCMu6oksqZ7lnl+v0EJHzl4VCayNw6nUI9raACKf7So8L20BlGDDtJkVo9hjM3nmx+x
         Mq3eKh321mjaheaYNI3nAqJqh6uGR8YmSRgwXaQkM3QfAab+gkMpVgkYkEJCVtbkJU4L
         nWgQfhquPi2h79IyvIUjfGMzpSdCACIzFERVngw6mz4hDhFXXeb96FV8AOkDc8rTw9MY
         ta/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715024578; x=1715629378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAOWZHhFt8Wc+lwUcH+BSWxp87XVVq5/2anFeAYpi+Y=;
        b=fv28KAbAr1HjaWhr8ALnKPFxlERCY40nf1T/+DbSRgvX4N3YoOe/YBhetFAH19UVJ7
         Y2bQxpTd+uYWZ23CzGzWG4e+iYK5i0ioIEPhJtnCO2nPA4OvVdkDRAX5/N9DQIjmZQ2q
         ZxF9fUOrsf5a84uieYCdVKq8dRHmtqnK5QIbb/a66R6De2QgWjWW7CMXUohiO/KpEHtg
         ts+8EZofJ4yKJszZEUM8z/txY10GIszbXDZrnWe5GSZzFXqJL4qC3KcgAyMd432hu65r
         yzRkuXn4sCmdgXOHoT6FnWm7572FhKIfRtjWbUELW9DaK702VLcKUkwM2upmjHLZWi1J
         oRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02VHA82FLJGWt52hVsvp8eJnhIWH5ae9U4EtQZY75XI61RdSU5uQjNCkkIQ2u2Aa+jSOXVMeQXFoZWXbH8feFFCsXevisXv5fyrpXHnb8cuAY
X-Gm-Message-State: AOJu0YwRBLXYZ60KFVhKoiTk0kdomtsgTHTJZ2G91+BXdkwfen1lEGyu
	0fpbmkqWI7wEh/TJthFv/28qrHY/6LfgpKrV8/CnabDvSDAgzeKgmSNxeBcog88=
X-Google-Smtp-Source: AGHT+IGwS1FDFCkf5egNjpQBZQYUjij5H16IdPJ7aQt+EL6jbiC0XsfnTSn1KSAGBqBRJX2WD4uCeg==
X-Received: by 2002:a17:902:c412:b0:1eb:1663:c7f7 with SMTP id k18-20020a170902c41200b001eb1663c7f7mr13806723plk.43.1715024578211;
        Mon, 06 May 2024 12:42:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d0a8:32b:6e71:43af])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001e435350a7bsm4904648pln.259.2024.05.06.12.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:42:57 -0700 (PDT)
Date: Mon, 6 May 2024 13:42:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Olivia Wen <olivia.wen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <Zjkyrx5j8R+ejwbv@p14s>
References: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_124302_881895_45B5C111 
X-CRM114-Status: GOOD (  16.16  )
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

On Sat, May 04, 2024 at 02:26:46PM +0300, Dan Carpenter wrote:
> Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
> allocation failure it leads to a NULL dereference in the caller.
> 
> Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e281d28242dd..b8498772dba1 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
>  	if (!scp->share_buf) {
>  		dev_err(dev, "Failed to allocate IPI share buffer\n");
> +		ret = -ENOMEM;
>  		goto release_dev_mem;
>  	}

Applied

Thanks,
Mathieu

>  
> -- 
> 2.43.0
> 

