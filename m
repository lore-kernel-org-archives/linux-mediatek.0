Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CFACD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oatbIoqJeiz1r5S9oalVSgxEcEqEqUpERpHFaw/Rf+I=; b=njIGc9dFt2tGFazzhDzk6dM3mP
	SqMqjHjtLCdSXpyhWEY33Zrbp7IyckAJXWGlhiRlsIFGfNY/puLjjXg99I7W/U7ynlZQ2AZ1gDkzU
	d6MypHifWXALI3xTSLVrtmkAaFgNIJ0nKnX+RlLBaWkNNiD/HB4SiSRyhlEVbHU4Oi0mzLJEzD9Ra
	VIHuV+i6aa/Nt6I2dvMUoxp5G6YjFxnMCPmFZwgn17G5TLTkvh3rjg4nFUDdZgv/jcx/A/OlnIO4t
	tVKjRJA/hXp97pNNszfAvsws0aWQNxblhjysCPZBME1/tRTfEMO4zJFZT8COJ3n63K4rHydngWS5E
	SYejErTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl983-0000000Esa7-22yR;
	Mon, 02 Sep 2024 15:38:07 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl95t-0000000EsB0-304H;
	Mon, 02 Sep 2024 15:35:55 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-39f54ab8e69so5285735ab.1;
        Mon, 02 Sep 2024 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725291352; x=1725896152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oatbIoqJeiz1r5S9oalVSgxEcEqEqUpERpHFaw/Rf+I=;
        b=D2Kc+tCBm6rJh0YQIuKWrImGJgPrwP9pWG1aDWGN580N2hEtSh7E7PL0pLpPJ9bANk
         sGjddi4piuTGz3iH6brD36Iy1a0xsZm8hMcC0sEVxivH61lXgUJ4MXDw4luUg9oRqtTw
         KBwIdujgQ7mOT4hegAJ05wyx8/dl1+QyWjCdR/PzubDwGye/3hVz9SdJkTD2AexXv2EY
         qOiNgfGX7vFywwLANBrjV4L2imxsgga5xFbGs/zkbFKZ+Af4zQS5jNmym+2z5RVM5jbA
         0D6nnh105/whymed901/8BmVZcvNWNKn8ktJm5EdtIc3aShDNXZ6KYatEyQWslTFmRNU
         oLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291352; x=1725896152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oatbIoqJeiz1r5S9oalVSgxEcEqEqUpERpHFaw/Rf+I=;
        b=qYl+xEMUqhMSALea+uihVPSZx27/Gg5Ni4RpG/7qC3kWqWsuSha4bexsoUeR0yhNl3
         uEVd5yH8YjsSO3lEhE2k7HAHKULveuwmuePB8hBP/Zh/Tf9Tc4zf2u/Hr6lFD+qZXCRd
         SZDhYiGRZ8x3Yuf/hPXcvG38IJZ14YXLheCg8TV6AAiGovnxUPRFw0VFxW313AVmn08b
         YC8rhrO2TLjrSKgAUtK+5k4lAbZSKrkRzUkm5brbpf6BPRbb30y4dtO+w/joVJMptVUu
         z6qFWFAByzk4rkpeh6SKbMX/UD6d+XCB7Py+dPg8aXLwFkIBDZ5+fXZ9ALUSWsSGcnTV
         BwYA==
X-Forwarded-Encrypted: i=1; AJvYcCVMRz4iiN03AAIYf+QTQ5+tVklGxCMY7gK5sTfRVfqHaYqyC88/K0+cbLt902v9GfsJnZWZuCdjK9uGJehd99o=@lists.infradead.org, AJvYcCVrA3NQw+thfo4GjENa9Fw+c7PUg9COPz3RSl3uVzqdtrr2nsooSCGwVZhGNhyorawU2wOijWX5aqhOS3RRCROb@lists.infradead.org
X-Gm-Message-State: AOJu0YxbvytiIVxR3ZXPrJfoavbWuJzDLUhZKmag+hLp8X55wPN0yCbZ
	cQ3QzBaVrCC0ncXqdW2wbStD8FagxA9AjBtZ+e8hrphc0ZWA+Ih6
X-Google-Smtp-Source: AGHT+IGYxXRE9ElJTBYT03Z4rxLGq3EvcKdSNQ9rIPxYV0YnvW8G3doE+O8CiwFNbCLGCtAIAComvw==
X-Received: by 2002:a05:6e02:1ca8:b0:39b:35d8:dc37 with SMTP id e9e14a558f8ab-39f413ff0fcmr64430575ab.13.1725291352363;
        Mon, 02 Sep 2024 08:35:52 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39f51aa0a6fsm14393165ab.54.2024.09.02.08.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:35:51 -0700 (PDT)
Message-ID: <0cd84a80-589c-4706-b798-0d7808488ee2@gmail.com>
Date: Mon, 2 Sep 2024 17:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: mediatek: mtk-mmsys: Simplify with
 dev_err_probe()
To: Yan Zhen <yanzhen@vivo.com>, angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, opensource.kernel@vivo.com
References: <20240902053001.930379-1-yanzhen@vivo.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240902053001.930379-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_083553_805851_B3A089E7 
X-CRM114-Status: GOOD (  20.68  )
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



On 02/09/2024 07:30, Yan Zhen wrote:
> Use dev_err_probe() to simplify the error path and unify a
> message template.
> 
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
> 
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
> 
> Changes in v3:
> - Modify the message.
> - Add the '\n' at the end of the string.
> 
>   drivers/soc/mediatek/mtk-mmsys.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 938240714e54..170319163c28 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -397,11 +397,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	mmsys->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mmsys->regs)) {
> -		ret = PTR_ERR(mmsys->regs);
> -		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(mmsys->regs))
> +		return dev_err_probe(dev, PTR_ERR(mmsys->regs),
> +				     "Failed to ioremap mmsys registers\n");
>   
>   	mmsys->data = of_device_get_match_data(&pdev->dev);
>   
> @@ -413,10 +411,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>   		mmsys->rcdev.of_node = pdev->dev.of_node;
>   		ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> -			return ret;
> -		}
> +		if (ret)
> +			dev_err_probe(&pdev->dev, ret,
> +				      "Couldn't register mmsys reset controller\n");

Your missing return of the error value.

>   	}
>   
>   	/* CMDQ is optional */

