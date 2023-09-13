Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D16EDEC55
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qv91gXrc1AcPe+LcXrRw/xHfcEP2e6to/+ADc1Zwb1Q=; b=b5OsZ71Y9MW1jcf1fVEEVhmdx0
	MDXsLq8Mp1yaRBA6GqFKEx0g45rIOOtoG1qsyiMqBYXYESNsEAG4Jdrv3hfCMSvh6cQ9rnXR5JN7A
	BSg2lp29hzb8VOaK9zU+oeKjcz0Lcdk8Gy+nfe+Gsj1wEpR7/xzO+40e6r7S5rOtMpeSFCZP1hh9X
	y8+fLV0cjv+VioiLm25ssR/Zcpm7ermRrgFYPUV9Yd3zZBlBvWM7CfPPRx5PcCdumPx+fG12/rnM1
	1pK4lO2naKVO96iqx6ezQZZSLC06mEmEU399aOULFIf9Mhd7+0ANprXMIAJ5KOZGOoSTURPhguTcu
	Woxc5Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQQX-0064zl-0K;
	Wed, 13 Sep 2023 14:01:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQQO-0064wS-2x;
	Wed, 13 Sep 2023 14:01:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9F4F66072F4;
	Wed, 13 Sep 2023 15:00:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694613656;
	bh=zNzJow6Gn0s5lcUUXuQqO24RP3fvno10hjXXk/5ytb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FPqf764XjDlDRzXc/WCOeWXB4U20gfHRMvI6TON8Gs4r+ajqG8jZEPliH+tqp739t
	 AmUQcmBxv0PLHPufVTN4dMA2v7XewK5vkxZVCr+ix7x4+i5ZncJUawBsS7tn/HGers
	 vVY49DopN+HNZMAaFKAcCdOtkPE4V4fdDZeqHvich/1Im7yGbJDvqk+iMEcYfIsReA
	 YN194QBwHPoVvBOly6accH+GGNaVgqYuulaEguwqNbzZ8vZXOZSJcPLOH7wioscrfg
	 1A7iIE6WkdTHaztNlDDHj6XMCkRKzgqIaycBaVaEENST/L0swdLSW5Qn24x2a2JB62
	 Op5YCsPMelVAA==
Message-ID: <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
Date: Wed, 13 Sep 2023 16:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: =?UTF-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_070101_123560_FB279543 
X-CRM114-Status: GOOD (  25.35  )
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

Il 27/08/23 04:13, Daniel Golle ha scritto:
> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> be enabled. One of them, the pmic clk, is only enabled in case
> 'mediatek,have-pmic' is also set which has other consequences which
> are not desired in this case.
> 
> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> is not present and the bus is not used to connect to a pmic, but may
> still require to enable the pmic clock.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 1a9b5a068ef1b..a8b5719c33729 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
>   		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
>   
> +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> +		dev_err(&pdev->dev, "cannot get pmic clock\n");
> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> +	}
> +
>   	if (i2c->have_pmic) {

...but you're not changing speed_clk if !i2c->have_pmic, I'm not sure that
this will work correctly. Perhaps you wanted to also set speed_clk if the
clock is present?

if (IS_ERR...) {
	error handling
} else if (clk is present)
	speed_clk = I2C_MT65XX_CLK_PMIC;

if (have_pmic && !clk_is_present)
	error

Regards,
Angelo

> -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get(&pdev->dev, "pmic");
> -		if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> +		if (!i2c->clocks[I2C_MT65XX_CLK_PMIC].clk) {
>   			dev_err(&pdev->dev, "cannot get pmic clock\n");
> -			return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);
> +			return -ENODEV;
>   		}
>   		speed_clk = I2C_MT65XX_CLK_PMIC;
>   	} else {
> -		i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = NULL;
>   		speed_clk = I2C_MT65XX_CLK_MAIN;
>   	}
>   



