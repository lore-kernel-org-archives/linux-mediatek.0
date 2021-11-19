Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F91BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506AE60F14
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 506AE60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjE+Ke6qEHCnhFBusx81pmcL0t6F2UodhZ8EQXKoWm0=; b=gAoDcAz3WONXLWFsHmxdfP9ICT
	IuTzubKw6BGwrJie3Tw8yDQhn6wY7Mmz/RD3Ev8zF4nNrlLM4iL8e9wWH2WYf3ZX3HAt/PqMzMHGC
	QRObWguhjE50Iiii3GND++Ol+lUPBLyNYHroUr51ENo+klwCe3gjVbt0uSKtFHJ77cg1kEEteAeCf
	hvsXsrWmLwkdstomJXHgX3AIw9XBLG4W1lc94mPBlznnlJ0S6WZiugENxzLyV17+VCdQbvEIQSDa4
	FowkPHr/4mi/QjCiWSCPX57vySJ32FNIwrJr9mRiLOwIPVgwpmWgv0A3gcN4S/lqqHIsXS5VzzSG3
	m0oVeZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo7X4-00BBSt-Kz; Fri, 19 Nov 2021 17:18:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo7Wq-00BBOa-3A
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 17:18:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s13so19358599wrb.3
 for <linux-mediatek@lists.infradead.org>; Fri, 19 Nov 2021 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FP9hwialv6yAEl5OHXjo4xWuTQn68GpOH2rXlR/66qQ=;
 b=MuVMdJD3i6iM7EYol8YYUwOgrVkgeoYnCxECTuxTp1DkJEPyBXogLbS+0BLm/BesNc
 5C1njJ+iZK4CmF+o4JS1nsHTp1HZauczmWlX9uTKS47QN/tRrq1CCb6BcUFNaDB6TUJd
 Oplxn2eTRvF08OVt0TVxP0wg9173tQ3QZyrhcYsqM/7idBy/8QtQbAjZ9gGdnBY3DnU6
 S+2syCl7sL16NDP2EWzts51NPHYI78qdJHomqglMxIrN2yEJt/KWxyCunP/tR8j8zlJ+
 YmYEBCu9deEMXB4AojU7nrPhLxPZQS2M1JPc09XLNrpu1l2Vw0IbtJzZQyCoA1ZYaAcm
 YvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FP9hwialv6yAEl5OHXjo4xWuTQn68GpOH2rXlR/66qQ=;
 b=PFUF8wUUBvqa0usfU9RhXMN4hPgP/CCExMV9/sv+BQQz5KJKGjLGXqtyLamh11CUXv
 t0zv1N9jjdyTgnQtQQdFMk7yiF2L7bXco5FMCNDebhMM5sV04UqjcBhb2pAZXtRCZdKp
 juQaDdAa7apaJtBhwSKpOudQu5M7bYeuG3yz8qf3cyHwzVFd3CCGIpLznRHmBqsJvj2R
 BfvG9FdxPT86a9TJfc4+fmneu8QNqr2nTZ7ISseMln7HziTUcnbbBFvpzDHxAFnHdP2O
 tmeErS2BU4GCJSjPGQf/KuA6xljNmIbb/GPeNtweRE4/MVgToybQSch6g/PYzAQbQLXH
 mvkA==
X-Gm-Message-State: AOAM530O5OkTLjwTy7SX6oA4K+33xbVI6/BFymjQAC7xe771m2SalaSi
 wVaIfrF/Vz0EcbocH1QaehpRkw==
X-Google-Smtp-Source: ABdhPJz7rGeQ3uY7+i432blgA51XM/NysPQuKduVTwISoTtJKsk/0HgDfWQCa+KDLzxoI19YoqhHKg==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr9083862wri.381.1637342301747; 
 Fri, 19 Nov 2021 09:18:21 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t1sm400914wre.32.2021.11.19.09.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 09:18:21 -0800 (PST)
Subject: Re: [PATCH 3/6] nvmem: mtk-efuse: support minimum one byte access
 stride and granularity
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-3-chunfeng.yun@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2ba27f8a-6d10-3a7a-45b2-dbe503c79d47@linaro.org>
Date: Fri, 19 Nov 2021 17:18:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211107075646.4366-3-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_091824_186540_A853D882 
X-CRM114-Status: GOOD (  20.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/11/2021 07:56, Chunfeng Yun wrote:
> In order to support nvmem bits property, should support minimum 1 byte
> read stride and minimum 1 byte read granularity at the same time.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Applied thanks,

--srini

> ---
>   drivers/nvmem/mtk-efuse.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 6a537d959f14..e9a375dd84af 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -19,11 +19,12 @@ static int mtk_reg_read(void *context,
>   			unsigned int reg, void *_val, size_t bytes)
>   {
>   	struct mtk_efuse_priv *priv = context;
> -	u32 *val = _val;
> -	int i = 0, words = bytes / 4;
> +	void __iomem *addr = priv->base + reg;
> +	u8 *val = _val;
> +	int i;
>   
> -	while (words--)
> -		*val++ = readl(priv->base + reg + (i++ * 4));
> +	for (i = 0; i < bytes; i++, val++)
> +		*val = readb(addr + i);
>   
>   	return 0;
>   }
> @@ -45,8 +46,8 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->base))
>   		return PTR_ERR(priv->base);
>   
> -	econfig.stride = 4;
> -	econfig.word_size = 4;
> +	econfig.stride = 1;
> +	econfig.word_size = 1;
>   	econfig.reg_read = mtk_reg_read;
>   	econfig.size = resource_size(res);
>   	econfig.priv = priv;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
