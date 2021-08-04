Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE53C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B5460F38
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37B5460F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5yqbNfsJf32oPOf7v3zzb097745M5BPKwu3TLRdjYM=; b=UKnKIY0oQiPeRG
	iZQ6t/hPNy8JvS/OqikAajyL+1E7Bpu95E0bxznwypkVAxGLgk8I07hVjkspmNiMZmd7N2m99B38l
	9ROlH8nkB27BpCNcxcCBvHrewG+rRJ5okzUzTUBhuD5nV8N4L2xKQxKkCL1BUOTz4CNS3U8X9cNMq
	dxqt2ws0lVf+Erxzlo7MgXDd/W5NjhNhBlhk2/BOb/bFk7ol/aetv2mJKegBx/8uHPNOmdbB5LpKX
	ZtBz77VnH7FTe78MjQvY8ioRlwiKIgZvHOPwMf/B8Vwmn5/8VRjzVXkO+bU6cP4eOGmdqp9lruBbd
	2RBUYrJhV/mLEShINTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBIp5-006awq-Br; Wed, 04 Aug 2021 15:28:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBIp1-006auW-Nf
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 15:28:45 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so9307232pjs.0
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Aug 2021 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ABQinGThgXjQH4ldJXoDYT9bEE6sztnsLgaWTHXyf1I=;
 b=bTMb9Bwz65pSpUsI5Q5vTUk7YbFv5GItIndqJOyf0xn3pF382FMPog7rjUbM62Rec6
 yxadZgJOJUZ2MOJAInGMwhm7qIhq3GnAkVsCaOcJun+Jdhk/kxrEnUMz6AcsoyuSHcSv
 BvYpMblyFOL56LS9pYJlNWuDNY2MRae3MDJnEzrIuYYIO5mBaj5zRo0Z38gYiwLXp+VD
 JJ2HHAsSllFYf4VY3v3lQG+VSP36E4VFQE2rt8L+sOu3ONLQM2MiQGmw6CCgJAD8XSsY
 g0McvEvZ2Q2JN+qzD2YWk95GRXurSRqVAtLaCsvp7e9v7RwndcgcsJJbdg74haRfVZtS
 IoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ABQinGThgXjQH4ldJXoDYT9bEE6sztnsLgaWTHXyf1I=;
 b=mU21BUj/drcRtjvKbrvCKoUZBbnzXCex+N4T9+9s1WmwRzqNX9KKGLTr4RFu2P/IrK
 h6wAT3ShFb0UE+5uaE5neZD5kW9+JjzPxCDF3h8tN5x4CN/zawgxfMZH+uXcpjBpQvid
 Cu6wLkQKLV7/N8NPqjfmWHnhuzmtDLPBHJ3gufv1UGJd9XfEE7j1sY35hU+mQO/giFRH
 skY7VkF1ZatYe7+114WYzHKM1IPc3J5RnYE6spJrQ1/pPZbCtmuJ2R5y4RfskqVxwIek
 p3TN/o8rfDMZd2GHOyh+lXNUlV3A83Qmd327w8iXYYBsJshGbaPufJOx3n2//j/cg9RW
 bfAA==
X-Gm-Message-State: AOAM531yRQPa9XbhZ8uPyKF2/TW83S9d0fPHtNLH7M1iMEKN62QrtKOg
 tQ3PWFYXYSuFyq24w0IY7rUbow==
X-Google-Smtp-Source: ABdhPJxCRBnR8iM8jyZmuXvcXU3+BVIWG9EG+G5PUdy9yAdeHQClC+LOnBgdO+YhqTmLZLajqAQhzg==
X-Received: by 2002:a63:5815:: with SMTP id m21mr488033pgb.363.1628090918593; 
 Wed, 04 Aug 2021 08:28:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id k4sm4025561pgh.9.2021.08.04.08.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:28:37 -0700 (PDT)
Date: Wed, 4 Aug 2021 09:28:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, krzysztof.kozlowski@canonical.com,
 shawnguo@kernel.org, sam@ravnborg.org, linux@rempel-privat.de,
 daniel@0x0f.com, Max.Merchel@tq-group.com, geert+renesas@glider.be,
 fanghao11@huawei.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] remoteproc: mediatek: Support mt8195 scp
Message-ID: <20210804152835.GA3145709@p14s>
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
 <20210803075922.11611-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803075922.11611-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_082843_827190_26892F98 
X-CRM114-Status: GOOD (  23.53  )
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

On Tue, Aug 03, 2021 at 03:59:22PM +0800, Tinghan Shen wrote:
> The SCP clock design is changed on mt8195 that doesn't need to control
> SCP clock on kernel side.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  1 +
>  drivers/remoteproc/mtk_scp.c    | 48 +++++++++++++++++++++++++++++----
>  2 files changed, 44 insertions(+), 5 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 61901f5efa05..5ff3867c72f3 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -72,6 +72,7 @@ struct scp_ipi_desc {
>  struct mtk_scp;
>  
>  struct mtk_scp_of_data {
> +	int (*scp_clk_get)(struct mtk_scp *scp);
>  	int (*scp_before_load)(struct mtk_scp *scp);
>  	void (*scp_irq_handler)(struct mtk_scp *scp);
>  	void (*scp_reset_assert)(struct mtk_scp *scp);
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9679cc26895e..36e48cf58ed6 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -312,6 +312,32 @@ static int scp_elf_read_ipi_buf_addr(struct mtk_scp *scp,
>  	return -ENOENT;
>  }
>  
> +static int mt8183_scp_clk_get(struct mtk_scp *scp)
> +{
> +	struct device *dev = scp->dev;
> +	int ret = 0;
> +
> +	scp->clk = devm_clk_get(dev, "main");
> +	if (IS_ERR(scp->clk)) {
> +		dev_err(dev, "Failed to get clock\n");
> +		ret = PTR_ERR(scp->clk);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mt8192_scp_clk_get(struct mtk_scp *scp)
> +{
> +	return mt8183_scp_clk_get(scp);
> +}
> +
> +static int mt8195_scp_clk_get(struct mtk_scp *scp)
> +{
> +	scp->clk = NULL;
> +
> +	return 0;
> +}
> +
>  static int mt8183_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* Clear SCP to host interrupt */
> @@ -785,12 +811,9 @@ static int scp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto destroy_mutex;
>  
> -	scp->clk = devm_clk_get(dev, "main");
> -	if (IS_ERR(scp->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		ret = PTR_ERR(scp->clk);
> +	ret = scp->data->scp_clk_get(scp);
> +	if (ret)
>  		goto release_dev_mem;
> -	}
>  
>  	/* register SCP initialization IPI */
>  	ret = scp_ipi_register(scp, SCP_IPI_INIT, scp_init_ipi_handler, scp);
> @@ -852,6 +875,7 @@ static int scp_remove(struct platform_device *pdev)
>  }
>  
>  static const struct mtk_scp_of_data mt8183_of_data = {
> +	.scp_clk_get = mt8183_scp_clk_get,
>  	.scp_before_load = mt8183_scp_before_load,
>  	.scp_irq_handler = mt8183_scp_irq_handler,
>  	.scp_reset_assert = mt8183_scp_reset_assert,
> @@ -864,6 +888,19 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  };
>  
>  static const struct mtk_scp_of_data mt8192_of_data = {
> +	.scp_clk_get = mt8192_scp_clk_get,
> +	.scp_before_load = mt8192_scp_before_load,
> +	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_reset_assert = mt8192_scp_reset_assert,
> +	.scp_reset_deassert = mt8192_scp_reset_deassert,
> +	.scp_stop = mt8192_scp_stop,
> +	.scp_da_to_va = mt8192_scp_da_to_va,
> +	.host_to_scp_reg = MT8192_GIPC_IN_SET,
> +	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> +};
> +
> +static const struct mtk_scp_of_data mt8195_of_data = {
> +	.scp_clk_get = mt8195_scp_clk_get,
>  	.scp_before_load = mt8192_scp_before_load,
>  	.scp_irq_handler = mt8192_scp_irq_handler,
>  	.scp_reset_assert = mt8192_scp_reset_assert,
> @@ -877,6 +914,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
> +	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
