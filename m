Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FDCC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 19:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CD3206D9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 19:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmInBHJn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WffJI4fY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10CD3206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xu06ICH6zWIM2k9LKJBJUMald8J3HUy33omjgPD7VZI=; b=AmInBHJncyLeK5ZdJlO8XJUBu
	92jyz9rVHpLoOL/sY++/Herjl4aitfYK/68GMackvg9LYA1v4Wz8GHcsL5HIKv/CJ4+1/Mbi0v+DW
	y0q0VIpmXUBNoC9XWQ6PuBD8OkQ7K9Urjg9Pm2Ka6bJJn0dRRN6GnNBKuZPCWoFQJ0WtKEq8vHz8P
	NzcVvQZDMq3uGg52VEApZ0ufq5aXRFZLYVTA8dh2xmG99KJNkXdWxXgsaWJZjD0DVYHmvIQChXDue
	H+A6TJG1OpwJEBWjhlE/sj7osoKO78Zc1uI3U+H6YI3EcklCF/Z85ipXbmcJG8A70uhir6mzw3hmg
	l9E0RrWqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaO6W-0004Wu-WB; Wed, 04 Nov 2020 19:05:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaO6T-0004Ul-Pg
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 19:05:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id f38so17384224pgm.2
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 11:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e3RgBMCNd6sKZVbOqvGd6J+ApVrztDEwtVCn4pPL4cY=;
 b=WffJI4fYp4FmcCF8nhmDGr00/Y8B8NnS9ajFsJns0MLqg4gebReZE6TRQPBIoh6Etu
 9qykh1g3rHXSVsje8HrlVgj1qIOwf2hJReWpMctR7Ua12XZIKKmWYJraVxLPIXx8mx1C
 PwlFC4Lx6B5D8B5nKMn+YVEZt8Yqx3diDzr6LPjXkuxxkR78nDntu3DZaqWsYp1RQomk
 aAYcB333lTvasR1WznLCjCwPcgBiwA06BjuZf/0iNa/pmvyQ3tFD8stopS600nXWYQFk
 FgQhVtTHZAlNesMYo+BKuIFzp+Afoky5/qQv3GOlCdBK6jMzY2x63MQKQ/s8nOTvFy2l
 vtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e3RgBMCNd6sKZVbOqvGd6J+ApVrztDEwtVCn4pPL4cY=;
 b=OTNcXsv7Mpaj3DZSZebLcqtjrXeAuTtrmJvccz6GspDUeoY62LRYPgf49S8JxLxGDu
 71/wi3KRipMPjiF3pLp9IISA8Ptdf+dxgUWCpcabloQKEHWsjpOOeJa79EpyItxCto9S
 MYuAJmkq9PtBy1DSY2BKagcdR9zEv9BigujLGebVjBGQHogGJ9OAaGxZ2+vC/H07Bz2w
 RrdsuXDgv7oJBUgO9tcHn4MfiU07ypMFErKQCvH7rfdDys1AkJE7AjaqB7tdfXUo/92z
 BOGIkCK1YAUZy4U3lzOK4NY7bqHtj5qt8QCx2eENj9hy9weFMXHQw4GgeWqIGkcXS1Lx
 AwBQ==
X-Gm-Message-State: AOAM532ucTTwWHYKG63DcB+x0q/Zaaq3AGXxTZi6eeX/0WG6gU5HHzUZ
 hbSWNhv/1mFvP7snZVqKTieuAg==
X-Google-Smtp-Source: ABdhPJwSb7Xs5JU7LvSxnxDJzTwVF5qjpqXYY4TsO/ILSHq1xQbXdfVIMJi3nS5qDmjPiCZ98ePPXg==
X-Received: by 2002:a17:90a:5310:: with SMTP id
 x16mr5606218pjh.62.1604516750131; 
 Wed, 04 Nov 2020 11:05:50 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm3210275pfd.177.2020.11.04.11.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:05:49 -0800 (PST)
Date: Wed, 4 Nov 2020 12:05:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
Message-ID: <20201104190547.GD2893396@xps15>
References: <20201102074007.299222-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102074007.299222-1-acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_140553_926366_99F9EAA3 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel test robot <lkp@intel.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexander,

On Mon, Nov 02, 2020 at 04:40:07PM +0900, Alexandre Courbot wrote:
> Now that this driver can be compiled with COMPILE_TEST, we have no
> guarantee that CONFIG_OF will also be defined. When that happens, a
> warning about mtk_scp_of_match being defined but unused will be reported
> so make sure this variable is only defined if of_match_ptr() actually
> uses it.
> 
> Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 577cbd5d421e..f74f22d4d1ff 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -772,12 +772,14 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
>  };
>  
> +#if defined(CONFIG_OF)
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> +#endif

I think it is better to add a "depends on OF" in the Kconfig.

Thanks,
Mathieu

>  
>  static struct platform_driver mtk_scp_driver = {
>  	.probe = scp_probe,
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
