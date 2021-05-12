Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEA0C43462
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:42:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FC461040
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 16:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FC461040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nsun20bnOH6tpJHoqo/sKxuayw39Y9veloUoh15gpSg=; b=BJsYAo3BbVi921A0Rp2W+38qH
	4/IIYtCI8F/74q5wqY+y+vT8HfaFJfLZTE9fp3U5/SwcNEHnFGOHKrnznXdNnYkkv+5TZBcvDGS+p
	S8kYOa6aQeUH0cnbBSCk9SI8a3t17M7YI/rjrTR/jyAiSkxx4uNaeRmN2cciJKaTZZ/0NLttnFq14
	kkNgCHhlNypZXmXwNnQx1fc9dVIXDFt6WP7oDwx1jhkp/kX0eE1v2QMV03kvp+L4/yzxQF4gol0Os
	/pFxTtGNDWrCqJBpFPlsWg0s789lZIMKu8dYwqB/PEyQWs0IdykAydqv1l4WeNP4NibAQtappxL40
	lPc6x6/JQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgrw8-003N6W-Vw; Wed, 12 May 2021 16:42:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrw6-003N6F-Mx
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 16:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c0VLlOA4O95JRL4lKkh9nBVXdg9khLB5Tb87tWSnVRw=; b=qNu4DkVCZqT8AKR66AbgDNGEfR
 h5Ex01Xv1wWcK5bWS3T7yerBUCs1U1tQpflpoaOdkbypsApm4/F5yQ14voPsNdJkvW7sfcxISkgJX
 W4PJh9PhGIjWPDebDSS8PBoNxBEUzpWUwdibNZLlz87sSBKxty0q20b+YHbfkzb2YqptqD9XEr6DB
 8bpmKB8oqQ4axXmVPnuB9fP4w2N/FyT4RxeqnHbWZIPtXKmaQHo96ECMK/yohePLnUheFk+i1CmpF
 iEJrgERvdXb25GuvtXasPortjIaLLHXU24/2ouanVTaZV4c5zCgNWnKMQQK1H99BM1/mlMlJArIAm
 9nPNJ9bA==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgrw4-00AbuF-38
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 16:42:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id h127so18926421pfe.9
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c0VLlOA4O95JRL4lKkh9nBVXdg9khLB5Tb87tWSnVRw=;
 b=GLyllHtwAmx2LbR5f2ncGAhINUHQKpdLq0Va8A1jrEEH4iKxyi8yPxjQgDESkJIxI8
 sgoLTQVM7dgUoN+y2VlM6E/Bw5o4DjbV/YhVFPA0LnMq0wbCkCTecSfv6o4de75oC4YH
 Za+cMwPJonToYd5+eHdZv9MjkDrusuoKNZRgO+4txsra0GzgH0ZKK+r+2SQ4qhaKEsEy
 BZz4C1Wy5j+1iGlQWVlY368VZYQ8G82YQHoSKQMXhYNhcbuA08OH9xoUZ49vl/hWDUnc
 OlnJB/RukALauzfpxqTJekUSL0z1GfxqrbmZAZ8WATDNa0pCbh2J9jeF3PqUqvF2ZlQ/
 KcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0VLlOA4O95JRL4lKkh9nBVXdg9khLB5Tb87tWSnVRw=;
 b=Z2aNk4jRVpFbfkk5pLZSFPIGRqK4x8PrXkBBPO4EO1Pnf61Ckgfik8zrzczi7S9nZB
 duRz6oRMHb2ZwCc+wuIU2l4w/IXx4Y+ZB1OadZXENIFJrTu/NaxbaIzKLfDhdnhFcgfx
 xwqqIePv/wRtBMQmyDJ7XPvvlFD3sDMhczak6y1urUFRbHxa8rKXEuOo4s5C1krXw6F1
 PL+4Dnst+zjAIav4pSYvf42lEOzuZSW4HINaCDLzPjzRJWVNXtUmzoAdxpZZchzZxNju
 jAQwmLIFpahaY3nsOvvE6gU03PxlPujyfOmNYcSx341h6tnvvJqJBazf7mkSmEOqIALM
 k67w==
X-Gm-Message-State: AOAM533MjhxjfXIqThA8UhtjeSEy1h23nhwtjkoP0Z4rjUY9ijBatMBH
 AmiGsT56/HNXl3fZPN4W9moamw==
X-Google-Smtp-Source: ABdhPJzgnbgnzOYlNJGD1LlShrIF+jXPWbxIzI+AR97Zitg5NpGAK4/drZctKAFXCgiOqJMxGrmBPA==
X-Received: by 2002:a63:6387:: with SMTP id x129mr36767474pgb.58.1620837730005; 
 Wed, 12 May 2021 09:42:10 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id n25sm299936pfo.92.2021.05.12.09.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 09:42:08 -0700 (PDT)
Date: Wed, 12 May 2021 10:42:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] remoteproc/mediatek: Remove redundant error printing
 in scp_probe()
Message-ID: <20210512164206.GA186911@xps15>
References: <20210511120426.5834-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511120426.5834-1-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_094212_166715_2601F7EC 
X-CRM114-Status: GOOD (  21.54  )
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

Hi Lei,

On Tue, May 11, 2021 at 08:04:26PM +0800, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e578..edb7f7842cb12ad 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -749,7 +749,6 @@ static int scp_probe(struct platform_device *pdev)
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR((__force void *)scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");

This kind of construct can be found several times in the remoteproc subsystem
and is also ubiquitous throughout the kernel.  Moveover removing the error
notification does not simplify the code and does little to reduce the binary
size.

As such I do not think this patch is warranted and will not move forward with
it.

Thanks,
Mathieu

>  		ret = PTR_ERR((__force void *)scp->sram_base);
>  		goto free_rproc;
>  	}
> -- 
> 2.26.0.106.g9fadedd
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
