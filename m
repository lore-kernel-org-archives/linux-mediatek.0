Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E1C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sv32adziPLxIoRZTY96I94YoF4xj1PzJO/hpnPi7aSI=; b=vOXxQnVZGAzNDDQzOGYxr4UawQ
	+mKECUMSrC47FN87VwzzeTcfFXbTu3GV3L6pHI4BfiEpTgOpI8woMrsco6XuQyQoYBS1V+GKGDmSB
	6zWKj9sez6Q6stblyZHBMn8yiSnjRAwZDShGOYPbHSGQaZB8qUNzRJcslhWnpE4UQDwSvzJK8c9ok
	olj1CpIpvEp+mcbEugYSVdZwx86KtkvkZxQbo6dpH3YBZGpYlZpG5bkBo7PUHJDLWrQP8b75EeQWm
	Q3ppQDCwa05hvy2fkW1CFMp7WOUUdZWB3g2mLUJZLWPtFijIIjY8F0gji1sRmZZ4AcDvuvekCJOlD
	YvuzkGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0L6o-00FkKF-FF; Wed, 30 Nov 2022 11:18:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0L6Q-00Fk8z-AN; Wed, 30 Nov 2022 11:18:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C2A646602B30;
	Wed, 30 Nov 2022 11:18:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669807088;
	bh=9JEnVvXe2AQJQov5NPbbhdvIIlOh1SEvzItB2gAZFRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ktQ4RZvTH0cBoti3WzmZNxvL8tQ+tAlFo9sE+bCLBS0wS1ObWNaeDxhXkmN0Dj+ru
	 rYQxEoESupCn+BsTroZW2kn9jB18up9s2SFnGF68a8vNf5vpr2tXush7xknPUPtPaO
	 Jk8WIJS2y55a/HADTPm/ceZYek2Qa1myeWBPE+LKnUqFsiGNcbstZm28e8L/aC9+kN
	 6qHXXvnX9N4mbazRJs1VLTPnhLBgZ8KxI++m7qOTTyO6FvJRW3QkJdeJ6G53MlH3sk
	 BERczJSRIkMVz+8tpAprDkbJDITSih4/lfsx9Lh8eFNftyx5KvnFluvP3SIrsWFkct
	 KrFqHlnBOxHUQ==
Message-ID: <d63e9f81-abe7-9017-d62a-6beb3f39fbd0@collabora.com>
Date: Wed, 30 Nov 2022 12:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] mailbox: mtk-cmdq: Do not request irq until we are ready
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221125-mtk-mailbox-v1-0-2e3ee120850c@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221125-mtk-mailbox-v1-0-2e3ee120850c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_031810_555634_6771EE91 
X-CRM114-Status: GOOD (  20.86  )
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

Il 25/11/22 17:19, Ricardo Ribalda ha scritto:
> If the system comes from kexec() the peripheral might trigger an IRQ
> befoe we are ready for it. Triggering a crash due to an access to
> invalid memory.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I agree on this change, but I've already sent a patch that's been reviewed
by multiple people (hence ready to be picked), on top of which this patch
will not apply.

Can you please rebase this patch on top of [1]?

Thanks,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20221102100736.37815-1-angelogioacchino.delregno@collabora.com/

> ---
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> 
> ---
> base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> change-id: 20221125-mtk-mailbox-ba6cbd1d91b6
> 
> Best regards,
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9465f9081515..829f1ef3309f 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -545,12 +545,6 @@ static int cmdq_probe(struct platform_device *pdev)
>   	cmdq->control_by_sw = plat_data->control_by_sw;
>   	cmdq->gce_num = plat_data->gce_num;
>   	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
> -	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
> -			       "mtk_cmdq", cmdq);
> -	if (err < 0) {
> -		dev_err(dev, "failed to register ISR (%d)\n", err);
> -		return err;
> -	}
>   
>   	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
>   		dev, cmdq->base, cmdq->irq);
> @@ -613,6 +607,13 @@ static int cmdq_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, cmdq);
>   
> +	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
> +			       "mtk_cmdq", cmdq);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register ISR (%d)\n", err);
> +		return err;
> +	}
> +
>   	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
>   
>   	cmdq_init(cmdq);
> 


