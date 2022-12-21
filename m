Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EADC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhEt3FU1GHlM/ELNmA6S6/tYz8B4nV7pC8aweoE4sI4=; b=kmsM2TA9V0BjheV8odgjAZq9P+
	XpN/vnsjElfMFC+43TFewT5lesAhsbxvpn21usRSwuv7FRhCWB4b5skejlzjp/H+aRJJJEk+xm1Eo
	h1xQxGOpifyL2ZknWjWbbMjMOww36zoYuwGfvUxPYXVfy8H2ZQP3XN2CESp6feMHBVtFuoUkvGTZn
	N7ZJbKX6bDOTCa0RSFcytKk/GBhgWw7ws64qTKG2tCEDWCvMidvVci1wP7flVY92cydU+Q+TeGD/8
	M7Ls1wNHxzM7OFWmIbESzkdO7CqYjihhgAsmwTwuqMMptbmFk/L8UCib9jECVjDfNhkAQ3DCdVnxv
	pKW882sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uuz-00CUB4-Ev; Wed, 21 Dec 2022 08:57:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uuJ-00CTZX-It; Wed, 21 Dec 2022 08:57:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id bg10so10684167wmb.1;
        Wed, 21 Dec 2022 00:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhEt3FU1GHlM/ELNmA6S6/tYz8B4nV7pC8aweoE4sI4=;
        b=QkBCOuS773Vho4G6Y/h9hFVEgOqCREmIMA77L/XA2hNLOcRayKfFbGD5tu9JFb4Tm9
         R7ObvenBoHYWwGa2pbrRmEiTDPko49ncKYPlxJ7B3d/u0DJnIaD9OoXCAmcRZeQG+PeJ
         yTu9fFbGv3SZ8+a+f3G7JXTGUPOo52F1fTy7FdVsjA7iuRENzkPT40MV7C2UsWrfkSCJ
         5YdZoGY+9eB3FYhvrDay0XtNn1hODmB1NYuvWqVh67eYZw2i+BJ2TGTf8FkrmQIUzAH8
         fEloK/x+gbLnGzYSsbYqgeD0tgbk96781tTl6sOKsQgPE+6nEWctF0BpD8St0pO18tmY
         b+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhEt3FU1GHlM/ELNmA6S6/tYz8B4nV7pC8aweoE4sI4=;
        b=ZapJXPShBy5PvgGCo+ulQHatTns87pjtES0rUDyfRkk22c9fMymPG/2iFJAbIqX57E
         tTSTmf1vVhvNaDrYWl/6wIJiotS0zbLD2DmS5qPMyxUUEYnoSZ+TJig5/XBlBwCEFF8K
         k7mHR6bzAsxYNEyCbVPKFL6gbifHuyyYBWBHzVeMOrGjQ32wc8jDMNME9DmpC1Yrw9b7
         QczbB2YZkOKY9DPLjIHjraadU/SXCHkoinbjVE1cca7+348PHFjESt44DL/4DWcsOIDn
         /VtJmi/tKT6cfs3ZHVsmyoxbj5GGpnSx/EAEQ63LmLMU+Dp4ZhLteq3dlnYTSYevQ9FH
         9fXw==
X-Gm-Message-State: AFqh2krWZcbphwJ2G8O+jcu+Nwss2TuCpIwwVsRteXM9VDpucCeFWePS
	haceCIWAExfWTYX27MFEkp4=
X-Google-Smtp-Source: AMrXdXuSZux4153Rq5GjklQKx8IiCPyFPaux/RA3OhYcIvAD2Z0//bD+FwmqwDQm9FjlKusFd9Z3kQ==
X-Received: by 2002:a05:600c:228b:b0:3d2:37a4:222a with SMTP id 11-20020a05600c228b00b003d237a4222amr3813954wmf.38.1671613014888;
        Wed, 21 Dec 2022 00:56:54 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i83-20020a1c3b56000000b003cf57329221sm1524349wma.14.2022.12.21.00.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 00:56:54 -0800 (PST)
Message-ID: <12f4d25e-fb2e-8f4d-1874-46f7404b05b6@gmail.com>
Date: Wed, 21 Dec 2022 09:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Roger Lu <Roger.Lu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221127-mtk-svs-v2-0-145b07663ea8@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221127-mtk-svs-v2-0-145b07663ea8@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_005659_715158_08F855C1 
X-CRM114-Status: GOOD (  21.28  )
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



On 20/12/2022 22:35, Ricardo Ribalda wrote:
> If the system does not come from reset (like when is booted via
> kexec()), the peripheral might triger an IRQ before the data structures
> are initialised.
> 
> Fixes:
> 
> [    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
> [    0.227913] Call trace:
> [    0.227918]  svs_isr+0x8c/0x538
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks Ricardo. Roger I'll wait for a Tested-by tag from you to make sure this 
time everything is fine.

Regards,
Matthias

> ---
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: Roger Lu <Roger.Lu@mediatek.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> Changes in v2:
> - Enable the irq before svs_start, to avoid MT8192 not starting.
> - Link to v1: https://lore.kernel.org/r/20221127-mtk-svs-v1-0-7a5819595838@chromium.org
> ---
>   drivers/soc/mediatek/mtk-svs.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 0469c9dfeb04..75b2f534aa9d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2385,14 +2385,6 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_free_resource;
>   	}
>   
> -	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> -					IRQF_ONESHOT, svsp->name, svsp);
> -	if (ret) {
> -		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
> -			svsp_irq, ret);
> -		goto svs_probe_free_resource;
> -	}
> -
>   	svsp->main_clk = devm_clk_get(svsp->dev, "main");
>   	if (IS_ERR(svsp->main_clk)) {
>   		dev_err(svsp->dev, "failed to get clock: %ld\n",
> @@ -2414,6 +2406,14 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_clk_disable;
>   	}
>   
> +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> +					IRQF_ONESHOT, svsp->name, svsp);
> +	if (ret) {
> +		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
> +			svsp_irq, ret);
> +		goto svs_probe_iounmap;
> +	}
> +
>   	ret = svs_start(svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "svs start fail: %d\n", ret);
> 
> ---
> base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> change-id: 20221127-mtk-svs-add137fbf187
> 
> Best regards,

