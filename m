Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E178DC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rRQAYMFQzZ3Z7KU85vDtMZHZSEIGe7IfC6ZvEKTDDQ=; b=n5DyjhcOfR3tcG92rDGWiESzOz
	bkTwX0CBT2IxXQp/QrxlGYtbk7V9pubUlQghzxrnvxDMkVJ0gahJqngEj6WEz12cQqcIw9F4F7h3z
	vJBPFGvf7FVwtojElGvGTtUgccsVLA/+mjEwCCHX9Ti9sKonxz4gnPQPPZQU9GzJW2uuW5GmMoroG
	531ex9y+m63/1vh0sv6ECKoV/JFRn30xARG5f2rE7AzL8VvQLCQEMt2pNSA3W0tyepnXaqKsWHWHp
	nItGywJ93pwsWgq3czFsD7ky63AKc1lBnz1z80pjGC75mEHQJjYbNKqOvim8uU8mMJzyIKmrIZToc
	pglhygPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYS6-002lVs-2Q;
	Wed, 12 Apr 2023 11:15:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYS4-002lTN-1g;
	Wed, 12 Apr 2023 11:15:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id m8so20001147wmq.5;
        Wed, 12 Apr 2023 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681298145; x=1683890145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2rRQAYMFQzZ3Z7KU85vDtMZHZSEIGe7IfC6ZvEKTDDQ=;
        b=EQHdnlfwi6nu6QIdLm9Of177q7xeJMgzzi2XQTTToYNjRE61oBqIsDDc0f6ua4qPQ9
         d2gfkkj5fpvOCltBjgHMZzUqRzZJaisNpPyhrHizb7babWJ4LjkuDupe9ckgBaU1Lx1I
         viwMZlC4sTLSSspiNlV/9UiUEwR8lIrvk1YPGWC4XfHWFJXnAR+p4fvt4L8KdC61S3PQ
         CBtF8d8k9drEMxrupXil3qiRyBXXoeq7LJd3B9pXAz8rlxlryF/MNHcSmQyYVRXTYYkD
         0b64WM7qR5s5NleSvhi82dwa34INs+ZfUYsbMBdVGMnXW/LDEAEOiF7oHErYgTjOjnc8
         BXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681298145; x=1683890145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rRQAYMFQzZ3Z7KU85vDtMZHZSEIGe7IfC6ZvEKTDDQ=;
        b=DrJpZ9XIplqpTStmp7LWUXA8Z2QoDkRNE1DRftpw2XTU1WgbqkGwnV2aCLNuIrRY0Q
         lkSo0QBEHHFsMGxNUJL0V+SGwfEYX6bUoXYnMao/ONAUUaSaGZo8hstZJRhA5xN62r3Y
         KY8dSjRR0gIy82ChSc8KfUDMUcWZ+sceMm//56UW+rfS+ZmP/emSJQSeg8kjrNp6/5NN
         VMx1sxW9/q3115gWw8PCUupRLEoBs5HzUpWOrzmLwzQLyrsS9MF0+nyNh3IDj2zz/0Ud
         zbXoh6ckzzwCNieNP20JuS+rrYo9lINK2EoRlc9FNiojfcX+SvV2Aw/qNhgdSDrphs5H
         lIPQ==
X-Gm-Message-State: AAQBX9edRb5hyhwKDAy0CYL/XVR3cGaGQaCtYHb/njmw59Iq1QNjo9p5
	PNotNIDpC5kWkl6EWnUAV9E=
X-Google-Smtp-Source: AKy350Zm+JQ20RDs5iEIf8/taJMLA27MPvWDySrC8rMlHOZefSmm0Xk3pKeERGIKs4WI+rc0K+uqoA==
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id v22-20020a1cf716000000b003ef41389eefmr12903970wmh.36.1681298144771;
        Wed, 12 Apr 2023 04:15:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003ee74c25f12sm2046961wms.35.2023.04.12.04.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 04:15:43 -0700 (PDT)
Message-ID: <8d369520-bc2c-e269-aef8-61896adfcd4c@gmail.com>
Date: Wed, 12 Apr 2023 13:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 2/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-2-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_041548_562297_E8CBA2AB 
X-CRM114-Status: GOOD (  17.28  )
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



On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 434e8a9ce8ab..391fa0ece22c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -104,7 +104,6 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_disp_aal *priv;
> -	struct resource *res;
>   	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -117,8 +116,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->clk);
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->regs = devm_ioremap_resource(dev, res);
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->regs)) {
>   		dev_err(dev, "failed to ioremap aal\n");
>   		return PTR_ERR(priv->regs);

