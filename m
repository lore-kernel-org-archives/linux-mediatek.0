Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4FFEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAqGktah/O0GFdZ50GvGMkJOQPo1Bdaik/QUjfLnP24=; b=xKySc0O+yup6y7BcxfiJ5pdbHc
	+M3/w8RJubACcmiyovXM8Eswr0nsKozzB86+XFZxW/VBXYi7VlRxL0OuV5aKXrv1s/E7xNYQ0/Niu
	FsZSji0h8qOD4pmwZjP/z+vqJOfFDzLoccxLYj5+WwTmkVQYWETDV9jYA5LWQSUwmLoqbIAZ+AR6F
	zYfkojyxLQ48ZjAki/bqRTRrPB+Ardq/Wewnlr9WOOtMi10nytZOZ01w0FPZabxDWq3G3qpq0pV/V
	kHG2kbYY8sOs/y1nFqrj9yKjYfQ8OqeRkWeIsjCgsCGn0CpiiesykA3gF3cXvEKC3y3y6iBS/SF5j
	SX/+F6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJffN-0010f0-0S;
	Wed, 12 Jul 2023 19:38:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJffJ-0010d2-35
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 19:38:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6687466137bso5156208b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 12:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689190695; x=1691782695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAqGktah/O0GFdZ50GvGMkJOQPo1Bdaik/QUjfLnP24=;
        b=WJeDPc4KW7qUMZDwMdPPhOaka2bROkoS7mx53G29NSbD7Ho7yYmc5DWWptBlgYfTxt
         zfnMq/SKO0HNNKGCdxkL8LGfDh8GBN4fT+3wlM5EicocAxeHR2tEZAF2/cm0pfSJy9FT
         wV8sXOdOas0qgOoZS4s634XJxtQ+bfVqhwB9hqn2W5sYFiOWciiKaBqgS0W1rs634cwy
         08zTJVZyeXy5/rzp7F3HUNoTICYiFnQQettEA/0tjHc11Tjn9tHJlE9VF7TvACuuc108
         qj57ut4ZCiACpGnOJ6DiE2jA2keRXkY9lDe2lxK8yeSwDdhAUENDv6WxlBOOIrcUKfrJ
         PAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689190695; x=1691782695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAqGktah/O0GFdZ50GvGMkJOQPo1Bdaik/QUjfLnP24=;
        b=cj0kAIY6yh4CYLEzg+Zc8jvFl7tFbMzg3UUUYpLRScJRVw3ukEBFSeI7e9Tx+lx/yw
         PueXPB0k6nP90G+duh44qzY0ECwUHqOZ3fRHKj2E/GFXwOmYOsHhJdgVquRq92be/btL
         ndWOJXypmKi5h/uCt2NbUIPAEP53M7OA02kxACNXFBNAjIgqxN98mBVUymUgkPv+wn+D
         LHD5LF5pmVtzDjYLvmVKFARgJtbuy9Be2WbyS/HyvlDmTfwkMNG35sOZ1c77AKIXhPrv
         t893Ok6GF4ISutXr/C1E78b58VhfrMBHcqbFpC25MN87T//tWR1D+4RQ15LBUqaZDtKF
         BF2w==
X-Gm-Message-State: ABy/qLaioz4nOrGXFoQjRmdGeqfuxMmZSu+AbNYGkDyeDDbr3ApcvvF0
	5vdkqEnn7R8jpXHT+1NXKuEpdQ==
X-Google-Smtp-Source: APBJJlGMOcbAwwVpsCYEnmiXNjwnmO20wsWdfSSDUrRNsz5IVZWYyjz+0agcO2l6LoBeRiJr0STtHg==
X-Received: by 2002:a05:6a00:148b:b0:681:6169:e403 with SMTP id v11-20020a056a00148b00b006816169e403mr19538672pfu.8.1689190695254;
        Wed, 12 Jul 2023 12:38:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:70ea:7145:ddf8:7208])
        by smtp.gmail.com with ESMTPSA id v11-20020aa7808b000000b00669c99d05fasm3907344pff.150.2023.07.12.12.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 12:38:14 -0700 (PDT)
Date: Wed, 12 Jul 2023 13:38:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v14 10/12] remoteproc: mediatek: Report watchdog crash to
 all cores
Message-ID: <ZK8BJOXcBjjLXUlu@p14s>
References: <20230707052612.27521-1-tinghan.shen@mediatek.com>
 <20230707052612.27521-11-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707052612.27521-11-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_123821_999000_B17B5190 
X-CRM114-Status: GOOD (  17.55  )
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

On Fri, Jul 07, 2023 at 01:26:10PM +0800, Tinghan Shen wrote:
> Once the SCP watchdog timeout happened, trigger the rproc recovery flow on
> all cores.
> 

You are missing the most important part... "Why" is this needed?  Without it I
don't know what is going on and can't review your work.

> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9fed5161f094..7e786aaf04e1 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -80,8 +80,14 @@ EXPORT_SYMBOL_GPL(scp_put);
>  
>  static void scp_wdt_handler(struct mtk_scp *scp, u32 scp_to_host)
>  {
> +	struct mtk_scp_of_cluster *scp_cluster = platform_get_drvdata(scp->cluster_pdev);
> +	struct mtk_scp *scp_node;
> +
>  	dev_err(scp->dev, "SCP watchdog timeout! 0x%x", scp_to_host);
> -	rproc_report_crash(scp->rproc, RPROC_WATCHDOG);
> +
> +	/* report watchdog timeout to all cores */
> +	list_for_each_entry(scp_node, &scp_cluster->mtk_scp_list, elem)
> +		rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
>  }
>  
>  static void scp_init_ipi_handler(void *data, unsigned int len, void *priv)
> -- 
> 2.18.0
> 

