Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Dec 2021 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH1N0PgE9IJKvelI/s4CsRRoUnQ8tQxlr62ETNFzDrQ=; b=coDLh1da0vPRWR
	tzF4at4BRfhM1kvg9Lo9sSiplGts1bmBXrQOUbyEJ5Od4xz65ouhpAE003bLlcSmAhRCsErnsE5pl
	XRMmG0jX8JC0ICE5/kKsPJBeIfNlTw1hBHciGyERO0xMO8fqaHdKMgA6fCrK3jB9yHF+6XgMqQPFM
	uyyHjsvzwlGcRVsJ3tmUqeN8/t/jfCbTMpCU3L8D/VuRxhTHvCKju5/44K7/u4CLFRxKz1/jnMfJD
	pcsavJpAtKYggYfzLv7tNuf6NDCEUbOQv4JfloZvMgNr9Yp8lRcHcYRGdNSsh4/X8SN3wDW/KMbG4
	NIPhg/fHavHhVNJrB7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtTXG-000IlP-Gh; Sat, 04 Dec 2021 11:48:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtTX3-000IjE-Pc
 for linux-mediatek@lists.infradead.org; Sat, 04 Dec 2021 11:48:47 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 71DF840043
 for <linux-mediatek@lists.infradead.org>; Sat,  4 Dec 2021 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638618524;
 bh=1lFAfFri95NobHHfuhDqwKUl/WgnOhHBeDas/mq7lKQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jeMDyAlAQdwBl4jRdI0lhWG0PVK7ngCbRZ2w+4W/ovx5hTgnAYlGwRAZIsD9EdOW6
 dCt+XPn1RiDFjdjdXOnb7tyd830TdMDL144yLJZZb40reI9cfowLT4Tn4jQNmgVjxu
 kKObBSKV/hDboOp7P4tj0wtqjcWi+z7/OBQG9G4fIwEzHOg16wd/wkVGvPqFvSNadn
 F+2XsP8mi7EcSSVc8li6cDIQkQjkD03et8SOFXIfmbRGS/4TvFSdOZQZzI6OUbkl/U
 OypULsYfcH6LpgwNaN7Fnw37dHPTLX2/sg3h3s4LiJJPnfL8b0kSjkXPky2IMBPdm0
 SXY5fGqID3vBw==
Received: by mail-lf1-f69.google.com with SMTP id
 bi30-20020a0565120e9e00b00415d0e471e0so1846174lfb.19
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Dec 2021 03:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1lFAfFri95NobHHfuhDqwKUl/WgnOhHBeDas/mq7lKQ=;
 b=CDdeyoKgK31jHTc73AaLsws8C7qoRf8GE/BrTWBFblT9OroDpP6B1zlEZx8+1wEcYq
 +l//lxhVqfDpdcpLVS1PPjRMN21TgxXgMkgIdUOiXBztgVm2KQ9mloJiw8K7FPvoQjZm
 /hKogB7HA0wkmu1yEal6p0LIy6czKXTxdHxouHdgR3um46iUICX33JGQm+GDjeXbmFqc
 AREm/R8lZqlJ9wJ0vmz8IunolVqk25mNnBgB4fCMTAbGp+ZgPuQXwi8+aE8SuKcKSrWu
 bCMIIym3NJy92pzRwi1F+BeG6FRXHeMDmzfDQhTQmZMf5fNzyw/s9DHOD/W+i83F4Yai
 1UqQ==
X-Gm-Message-State: AOAM533vT7wL1hjIXAkSXdn8wIiW0Fcx4KQVWqfRsqmc1wYglAY8Gd66
 e7N6Nkc2ZsFtJWR1I7/qwOygypU8R3zPPcuiNm/YmcEFKGJAftzsW2sTOMUNig9YhPEWvZBRSzZ
 bfUndP7QQxz0hk3P5RLhbzDCzRuwnSPpp1QjW67QCCSeZJleHgg==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr22500759lfg.63.1638618523698; 
 Sat, 04 Dec 2021 03:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8VY1xCGJelFHJMdlqnOnN6muluQiZeh4zdF+O15Whdka1EH+b6V5t0L4S8RYhNAMtWAAoJw==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr22500750lfg.63.1638618523478; 
 Sat, 04 Dec 2021 03:48:43 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 p26sm798181ljj.70.2021.12.04.03.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 03:48:42 -0800 (PST)
Message-ID: <9631fe7c-b878-79b0-1680-80b0be089429@canonical.com>
Date: Sat, 4 Dec 2021 12:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211203064027.14993-4-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_034846_104811_9CAF7173 
X-CRM114-Status: GOOD (  28.89  )
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

On 03/12/2021 07:40, Yong Wu wrote:
> sleep control means that when the larb go to sleep, we should wait a bit

s/go/goes/

> until all the current commands are finished. thus, when the larb runtime

Please start every sentence with a capital letter.

> suspend, we need enable this function to wait until all the existed

s/suspend/suspends/
s/we need enable/we need to enable/

> command are finished. when the larb resume, just disable this function.

s/command/commands/
s/resume/resumes/

> This function only improve the safe of bus. Add a new flag for this

s/improve/improves/
s/the safe/the safety/

> function. Prepare for mt8186.

In total it is hard to parse, really.

> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..4b59b28e4d73 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -32,6 +33,10 @@
>  #define SMI_DUMMY			0x444
>  
>  /* SMI LARB */
> +#define SMI_LARB_SLP_CON                0x00c
> +#define SLP_PROT_EN                     BIT(0)
> +#define SLP_PROT_RDY                    BIT(16)
> +
>  #define SMI_LARB_CMD_THRT_CON		0x24
>  #define SMI_LARB_THRT_RD_NU_LMT_MSK	GENMASK(7, 4)
>  #define SMI_LARB_THRT_RD_NU_LMT		(5 << 4)
> @@ -81,6 +86,7 @@
>  
>  #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
>  #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
> +#define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
>  #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
>  
>  struct mtk_smi_reg_pair {
> @@ -371,6 +377,24 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>  	{}
>  };
>  
> +static int mtk_smi_larb_sleep_ctrl(struct device *dev, bool to_sleep)
> +{

Make two functions instead. There is no single code reuse (shared)
between sleep and resume. In the same time bool arguments are confusing
when looking at caller and one never knows whether true means to resume
or to sleep. Having two functions is obvious. Obvious code is easier to
read and maintain.

> +	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> +	int ret = 0;
> +	u32 tmp;
> +
> +	if (to_sleep) {
> +		writel_relaxed(SLP_PROT_EN, larb->base + SMI_LARB_SLP_CON);
> +		ret = readl_poll_timeout_atomic(larb->base + SMI_LARB_SLP_CON,
> +						tmp, !!(tmp & SLP_PROT_RDY), 10, 1000);
> +		if (ret)
> +			dev_warn(dev, "sleep ctrl is not ready(0x%x).\n", tmp);
> +	} else {
> +		writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
> +	}
> +	return ret;
> +}
> +
>  static int mtk_smi_device_link_common(struct device *dev, struct device **com_dev)
>  {
>  	struct platform_device *smi_com_pdev;
> @@ -477,24 +501,31 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
> -	int ret;
> +	int ret = 0;

This line does not have a sense.

>  
>  	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> -	if (ret < 0)
> +	if (ret)

Why changing this?



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
