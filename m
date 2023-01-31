Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000E7C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqCcxNM0oQ47CTFQk6ypa9uV7hhok/zL4Fnr5q3moYk=; b=jM56IUcmluBrYzMJl4HD/tBqXb
	SLU7ct8cFCpaafrTEYAgtwJsEIcTM2V2SH4LrU7k2qGDwvSlAd0/0DqFKuH7D+PJwqmla9l6d6iDP
	mEOK/2GWZmT4+s/2sIcvzFyW1FRsz5UnTfLuno3FITm1cwBLpcmleiZrPUO8XNbziD9J4qEtAg5un
	Ur0LsiLJKHn+4hPeB9MLjeW9mzjh2fppOxq3182AC/udobjPvJYCwWbX8RxOpONHghiIAJJI6jAe8
	8HTHXG0lYTOiCLjejTs3qEBz5196ANUDa34wmNjclx2TMuSLxS0eS0WXrDyo6dWaLiHTSQd65MKcG
	TbhtPsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqbA-0084AL-Hi; Tue, 31 Jan 2023 13:22:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqaw-00843o-Oj; Tue, 31 Jan 2023 13:22:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso586597wms.3;
        Tue, 31 Jan 2023 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqCcxNM0oQ47CTFQk6ypa9uV7hhok/zL4Fnr5q3moYk=;
        b=Eb5Fa0y2PKje90ynik0qDiPK88YhdfznviATz7/qM/4FIz3xdlMVVEtd992UzgLXlJ
         eWcHQG5o3DcWbVPUU4kQ3xiWQ5NfQwvPOore1j1lJ43bckFv7y+NPAFWJaj5Zt7NaFq+
         dxWOgpTw+xYAijDfamE/4nvRI5khcW55ctYWqLhA2Vr7NVgIXnOtPvJH/CN0DxJ/3yse
         wlTivATD30zwugRCrUiHvR/+x9iyXjKpQbDIAKasXiVvMv+O/gd/odXJ0lELg2Bj+EQY
         mC5rIkLghhqpDaubEtmL96JwT1i0autyAEvmPq1TjmOncsLh1cV/yUz1gsUUCuYgqvU2
         s3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqCcxNM0oQ47CTFQk6ypa9uV7hhok/zL4Fnr5q3moYk=;
        b=pbAUEbWKdJO/7ypnFac09mUPXZxmc3GG2V6KdrDYUlJHTktK+NBvcCrwWIu+yToBgJ
         8QvIwC9qI2D5FfKBPt4Do1EHnNFjEebGmgsCg6c2M22ID7prQY4dhJHv9jC2XA6dp+2c
         m2TPNPPOM0jNTPwrVDdSXT3FtqtBRbBSQ5ZCn+wvgh1LsGSRweg2BZeYLOrrwaZN45hw
         fXSY/5cbofCmXzotATw6JFG7tvMMRLiLbmn/9/aQLElQPIHPus9lP7rXWxZvSB6OfUJy
         YRQlBRKMB6pGuvd9C2v3dOyPnWupryE4p5l/A70T4chLBNXFGR0QydHAeWT6P/FjzGoY
         lUww==
X-Gm-Message-State: AFqh2krFQjKL/OHLgdMh71xOsn/3v28sVsfITPqMnfFv62oCDPNJoxer
	Lf3lzvUHYhcyAyu958qGB1s=
X-Google-Smtp-Source: AMrXdXtixiVnQKlwB4dKIZTeavrQqJ0wcmz9Mhqv3aD7AfQaRe21JMjwNwp+cs2JCFFXcClem4ZelA==
X-Received: by 2002:a05:600c:1d8e:b0:3d9:efe8:a42d with SMTP id p14-20020a05600c1d8e00b003d9efe8a42dmr54310562wms.21.1675171359958;
        Tue, 31 Jan 2023 05:22:39 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003cffd3c3d6csm15455120wmo.12.2023.01.31.05.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:22:39 -0800 (PST)
Message-ID: <618fb1ea-4f26-a8e3-21b6-b6a2017aa73b@gmail.com>
Date: Tue, 31 Jan 2023 14:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/14] soc: mediatek: mtk-svs: reset svs when
 svs_resume() fail
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-3-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-3-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052242_832171_6FBC53E6 
X-CRM114-Status: GOOD (  14.58  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> Add svs reset when svs_resume() fail.
> 
> Fixes: a825d72f74a3 ("soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()")
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 2df30a6bca28..a803b92afc3d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1614,12 +1614,16 @@ static int svs_resume(struct device *dev)
>   
>   	ret = svs_init02(svsp);
>   	if (ret)
> -		goto out_of_resume;
> +		goto svs_resume_reset_assert;
>   
>   	svs_mon_mode(svsp);
>   
>   	return 0;
>   
> +svs_resume_reset_assert:
> +	dev_err(svsp->dev, "assert reset: %d\n",
> +		reset_control_assert(svsp->rst));
> +
>   out_of_resume:
>   	clk_disable_unprepare(svsp->main_clk);
>   	return ret;

