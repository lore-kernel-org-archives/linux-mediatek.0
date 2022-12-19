Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhpuRs15Dkd7RSjm8roBGpRn5wYfY2Q6OrR3reT4HY4=; b=YaqT+vA0z/l0JKCzkDXBR9r77b
	pY677Zzf9sW6vGs4YDIz9S4glZgnk+2Ol8lI3pX+5O/8pQ/XcLem4YOu/5J0r4PjEBo4TyIYqBkiE
	IKTcgTleGWffNlvXuz6L0ts3UOtI6nE1yDxuHzVz71qgh/1U/SaQ0P/iN3rEJVS5gkoSKv2YBf/0g
	f/IN9eF9QF9pIyS39qD9Xn9Z9B1fCdwC5bRm3JccO0mSKXD/XdtfUWgj2LEjwEFMTMvYag5x2j2Cg
	aBCRC45O6lyLpD0Tth//S0kOV39AJpjmvdwuXpB436oq62vQbkEJgJR9P//8nqEptEPZ9OM3WEyLl
	qKCJyBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Ltn-0014bu-2g; Mon, 19 Dec 2022 19:34:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7KhF-00HJI0-UF; Mon, 19 Dec 2022 18:17:08 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso7152644wmb.0;
        Mon, 19 Dec 2022 10:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhpuRs15Dkd7RSjm8roBGpRn5wYfY2Q6OrR3reT4HY4=;
        b=Q1s5akx7wwCpP5YF8xryCFNBrkOCDE2qI/EAA+0JkX09BgsP/K4m1uoT1xiGq4HpBG
         SGJrjdT7drzhdDLYX59ZYT8qdAdcoUf3M3xhmXq3rtAKExt6NGKq7E4WWTz5QdgxbIOI
         rOlin1X6fQ9/e5J7XD2JARPzhT1hxnHfa04/1zHeULrZ3C10M8KHlJAUsxRWUSstkWKN
         YljHIAdNa+xNLetOeuCq/z5pCcnEL4l5bC3WagQ2ZEwDySqrqMR0yv/EFyKdy7VKCQeU
         dVbTa4plFSqKtfiMQslYxgshY/Z3fZyLHAGhZtXxeU5wDj5ApwdIEZ/j1+UXF5Vr91OW
         V1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhpuRs15Dkd7RSjm8roBGpRn5wYfY2Q6OrR3reT4HY4=;
        b=BKPSYPp7FF9BgYHvlhrYJZ45NW68l3nAEaUAFUGtYQxaxgfnNA4zMj9lwSnGJEj/3J
         diEO7AvRzKLLOsMzKSmYwAKCgEbZRc8VcZYCux/KK75lzZuUQWnKCf+Tp7CMLepX8Acq
         oMN0CbIXiVImntWkIF7NI9ofsLDs3txeP/ofkgp1EnbEnYfpO4Qzp6wvKRus5l+QnEYb
         mbCg6PtNKaudZq9ufAN/uIsGM+3SaiJPgnhsymL4Ak7AFDdx1O/Ort0fU6VE60cAn6yr
         IfhnldaO7ZscES2FW1zb09zTHONSXmCpphStT2b5qGaMIUs/CGmyuHLz/BrvrkZJG8M2
         LbIA==
X-Gm-Message-State: AFqh2krt6Taw9300PPVUcMXeephH99V3hOmbgo8SAUGBhRHFwAzXNh1J
	b0xshHI3gAhEM+ZzBoEkLgQtXmYuA44=
X-Google-Smtp-Source: AMrXdXuwfXPWamzj0OMhY3RED/t3K84KWkfMcm7/g7c6+1V2k4IGfSku0LqR16CC8TfahLl3ojnahw==
X-Received: by 2002:a05:600c:35d3:b0:3d3:5ccc:4442 with SMTP id r19-20020a05600c35d300b003d35ccc4442mr1636409wmq.26.1671473821394;
        Mon, 19 Dec 2022 10:17:01 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y21-20020a1c4b15000000b003d1b4d957aasm13120406wma.36.2022.12.19.10.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:17:00 -0800 (PST)
Message-ID: <f1c79a8b-837c-eff7-c5e6-2c3a9658ec3c@gmail.com>
Date: Mon, 19 Dec 2022 19:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] iommu/mediatek-v1: Fix an error handling path in
 mtk_iommu_v1_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Honghui Zhang <honghui.zhang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <593e7b7d97c6e064b29716b091a9d4fd122241fb.1671473163.git.christophe.jaillet@wanadoo.fr>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <593e7b7d97c6e064b29716b091a9d4fd122241fb.1671473163.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_101706_442095_582DC8AA 
X-CRM114-Status: GOOD (  21.90  )
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


On 19/12/2022 19:06, Christophe JAILLET wrote:
> A clk, prepared and enabled in mtk_iommu_v1_hw_init(), is not released in
> the error handling path of mtk_iommu_v1_probe().
> 
> Add the corresponding clk_disable_unprepare(), as already done in the
> remove function.
> 
> Fixes: b17336c55d89 ("iommu/mediatek: add support for mtk iommu generation one HW")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Another option would be to use devm_clk_get_enabled(). This would save a
> few LoC in mtk_iommu_v1_hw_init() and in the remove function.
> However, it would change the order of function calls in the remove function
> so I leave it as-is.
> Let me know if it is fine and if you prefer this alternative.
> ---
>   drivers/iommu/mtk_iommu_v1.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 69682ee068d2..ca581ff1c769 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -683,7 +683,7 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
>   	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
>   				     dev_name(&pdev->dev));
>   	if (ret)
> -		return ret;
> +		goto out_clk_unprepare;
>   
>   	ret = iommu_device_register(&data->iommu, &mtk_iommu_v1_ops, dev);
>   	if (ret)
> @@ -698,6 +698,8 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
>   	iommu_device_unregister(&data->iommu);
>   out_sysfs_remove:
>   	iommu_device_sysfs_remove(&data->iommu);
> +out_clk_unprepare:
> +	clk_disable_unprepare(data->bclk);
>   	return ret;
>   }
>   

