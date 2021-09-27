Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DD4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:05:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F55A611C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F55A611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IHK+7XTXKtTq0Y1uyZPTikLJE3Rp3l+xB4WRP1M+d4=; b=eZQoO2xe7M/xuO
	aKu67Qw+PhSZ2LS3bBWJs4r8pllAePNlJ9L4Q9A+C3N3/ezLiVZtKoNZ/NdWTGz85TDnRoEXSCnmH
	BZpOm5VJOMxrzrhMtsUBDwIExJTmVaVVdZCDeYaNhUGsG+YcJfV1MtQVyGf694or5kbOQa+MKi1br
	Lf4dVHa8XF9d0FEL97Yk0/OaBJW6Ap2zwejJexfyqPlxxj+5NY73sRHoqyzrgTu495z20EnDtxdD9
	sAPQZXsp7z4zbw+Aa9nj2PWp3w6+t54FrMIivUrg5y6WOu0XripNOELFwuJG7+ozuR7vO1+955uB1
	ThgjsfIsNuqPCKcyrtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUu40-003UyJ-KC; Mon, 27 Sep 2021 17:05:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUu3x-003Uvp-BD
 for linux-mediatek@lists.infradead.org; Mon, 27 Sep 2021 17:05:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id k26so11845828pfi.5
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Sep 2021 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cQyqtr+L+VXU+jp3z8c/s+IojY3vui6TA42W1Hb48DM=;
 b=vv/iQ9yBgKL6nJ3mRDybqrPBvIRybfNL0ZgBsP7UudN27zhewYTQ5I4FSL/1TRG1xN
 dXVMeYLLM+ryTcaGix5Kw9VIxi60ENhhLCswv9HaMuuDedmgKu9GfQI+nCJGA6g5IFpa
 O6E55IBK0A+b6o/3hx78DENhOuGE7NKbE2zCVo/BlXgx0yqktSkIgGyf7LlW7TsDgWvv
 jQMenFDIsRsXr79/iFq3pH2iQEunv+hK4lpVvcHQhHtRstMFsZg0NB3zshWI4qcZQBk+
 JMxd8pmsbKfqLYQf8XY3m5N5zPymMrDrMesiw0TalivnK2HpBw6Umtk0fMpanUzHjPxn
 aHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cQyqtr+L+VXU+jp3z8c/s+IojY3vui6TA42W1Hb48DM=;
 b=YAnf5bQdpeOgZ/tAXqCAnpXMZfFXaCI7ssg2FrvXwh5/aiF9LB+DMdNxs8YMJV4g6l
 LTSv26XHItP93sahG3IBO/TLWqiidZu295oM0Z9R9U7xGAZUrkNw+FCjucdLExWIzR3U
 Ghz/INrhyY6+fJw2Uw9X9VU+rEu5Nzt+lmRBKHccGC/8Yif0p4ttttUSlU4hqLjWZ4ur
 h1x3C7CerUfJoF9Wjm9yM9NOwFt2vrjfEdgVB/2G94kucYVzr5I7pIWVHmFL8OOvFU9c
 ffnEL34Kf0sTup928TIQZnXMtvqnDzhuLzYYx7N75H+G7HfgT1Ss4MPNJZ+tFdYLVwou
 PvqA==
X-Gm-Message-State: AOAM53103nQcy5A6SW/ML+6bw6ssnw9tnotl8f4h7Y0TFxr4oI5KLhe1
 kf5dbVFc++eyiA4SzfDTW/Xiqw==
X-Google-Smtp-Source: ABdhPJxNJaRILZu6Oyl6tl/p/ynig5QHQ07oMUSxC74y48fSfYjhGixdkQPdstFvf2a+xg+1/WpiUg==
X-Received: by 2002:a05:6a00:2d0:b0:446:d18c:9aac with SMTP id
 b16-20020a056a0002d000b00446d18c9aacmr1098291pft.16.1632762308084; 
 Mon, 27 Sep 2021 10:05:08 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g24sm17803770pfk.52.2021.09.27.10.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:05:07 -0700 (PDT)
Date: Mon, 27 Sep 2021 11:05:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] rpmsg: change naming of mediatek rpmsg property
Message-ID: <20210927170505.GB2837840@p14s>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924033935.2127-6-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_100509_468628_F9F94F16 
X-CRM114-Status: GOOD (  15.67  )
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

Hi Tinghan,

On Fri, Sep 24, 2021 at 11:39:34AM +0800, Tinghan Shen wrote:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 96a17ec29140..5b4404b8be4c 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -183,7 +183,7 @@ mtk_rpmsg_match_device_subnode(struct device_node *node, const char *channel)
>  	int ret;
>  
>  	for_each_available_child_of_node(node, child) {
> -		ret = of_property_read_string(child, "mtk,rpmsg-name", &name);
> +		ret = of_property_read_string(child, "mediatek,rpmsg-name", &name);

I have applied patches 1 to 5.  I assume Matthias will pick up patch 6.

Thanks,
Mathieu

>  		if (ret)
>  			continue;
>  
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
