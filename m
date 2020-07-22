Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96A7C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:38:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16B220771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZFrvjLq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnaVdBB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16B220771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6nFAaEU5M+qiUPUwoaz75Y+fiprNWRrKpjbx71pUgYU=; b=jZFrvjLqw7jYibriGHI0RaSw3
	NX5gqJ0qo8VbhIBZ16t1YF9zLGi6U27pqIf2hGDToWEb+emGd8Olrp/oNrmKXx4FPbI561ugbHUmE
	xaNOyyOzqTHCK+gLu4bI8oJNe1Z11RCKPRS2L5wzvIWhgLUv75GSVNVq3CQkp9qSXZjtyYJXw+9Xc
	unUjtLy8zW0E87fgWGDNq1Lg7aESLRCm+xCXiyKMm2uQon0KxyvXhMU96oUUU74tyRKmNos+peBvk
	k4ibXTy7xCK+swtMFtLlaB5qsOKEwmz2p4vD/7p/p6rohm7zSwF9QM6rQb8tbPkSnJmEgirYqpDHS
	cW0iAyATg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGpH-00010L-3m; Wed, 22 Jul 2020 15:38:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGpC-0000zD-29; Wed, 22 Jul 2020 15:38:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id w3so2423869wmi.4;
 Wed, 22 Jul 2020 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ylc7qLRRrMH6H2UFevhm+/uCNfEKRkKzQpNEzJ1tCQw=;
 b=lnaVdBB8azpaFkq8qD2+4PQY7y2msO0gCqVtuxkicRYn+wezhs6Z5pLmDo5qVlhtKS
 B+PtaD2n+k3jqKCD5dT8VulgF1Bdk2wj6MOf3mfmc2U8PcJGn2wH6M614xeavZygetUX
 QeLcoRZqoqgz6x+3oZpfpL3/p3sFPH7OhN7eGGVqYEkdqQGD5tqdC0/Q5RYayc1sHmds
 yty8lrM3BYtSScRMg7E5Wa+UixO3iFOzeuGAPumqjCaUgohZ6ZGg6bZg+0ROvC+MdUgB
 Z18wbhgZoGjbUN5IcYIFeNPeG+S62zsqsPO9wJpMJmCOAFF2CORPYgi8oNzG7ZuSbrUU
 c02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ylc7qLRRrMH6H2UFevhm+/uCNfEKRkKzQpNEzJ1tCQw=;
 b=XcnoH+0GOwgDLX2YZWVJyKezzT1XnFPZtJlGIqF3AZE3hTQQu6UlTihKVZqrl61EC1
 uK2Arouu2HV/D9BDsUgnwg8gOlRjsnBTl9IrZlC50fB1BVw3IBtXsdxHMFXdzDoDsDvS
 mt8MgHg3PZmkH+bE5VLGnsQcp0kfhhyVtitFjsJK6rgVkaaEO5pwmOA8Qa0VhjXNX/4X
 O+JWxh8/1zeSlRyOJhmtS9JDJ6S36TfILKNFtn24MLvzMK744nI5TdqS4CrEmBc6NeUu
 m44LQfq5yLsgINwGBPwUdDcLJd/V20ViIUxs+P6/Mdzh4bdZ461w452U79SrxoY1zbv5
 qNAw==
X-Gm-Message-State: AOAM532KH/HrMlriAsW18laEM+eCcpY02LQbBJ728lcrxxPNoo1CFWJg
 HCbmTfuItQQGKNarG7esYibIcsuZ
X-Google-Smtp-Source: ABdhPJx6Px97Z7ADx5ieGw6VhWBsc9D7294PT05rKbXSTT+BglTgblzgGqfr7YpFyWbPg5nQY8MYZQ==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr214085wmg.93.1595432308443;
 Wed, 22 Jul 2020 08:38:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id a123sm101145wmd.28.2020.07.22.08.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:38:27 -0700 (PDT)
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
To: Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <87429327-5d2e-e3f3-db22-04e225a31055@gmail.com>
Date: Wed, 22 Jul 2020 17:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_113830_154690_285229BE 
X-CRM114-Status: GOOD (  19.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 14:31, Qii Wang wrote:
> Replace 'support_33bits with 'dma_max_support' for DMA mask
> operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.

Please explain more in detail what you are doing and how this fits to the way 
the HW works.

> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e6b984a..e475877 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
>   	unsigned char apdma_sync: 1;
> +	unsigned char max_dma_support;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,11 +312,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 1,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct mtk_i2c_compatible mt6577_compat = {
> @@ -325,11 +326,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 0,
>   	.aux_len_reg = 0,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt6589_compat = {
> @@ -339,11 +340,11 @@ struct i2c_spec_values {
>   	.dcm = 0,
>   	.auto_restart = 0,
>   	.aux_len_reg = 0,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt7622_compat = {
> @@ -353,11 +354,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 0,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 32,
>   };
>   
>   static const struct mtk_i2c_compatible mt8173_compat = {
> @@ -366,11 +367,11 @@ struct i2c_spec_values {
>   	.dcm = 1,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 0,
>   	.dma_sync = 0,
>   	.ltiming_adjust = 0,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct mtk_i2c_compatible mt8183_compat = {
> @@ -380,11 +381,11 @@ struct i2c_spec_values {
>   	.dcm = 0,
>   	.auto_restart = 1,
>   	.aux_len_reg = 1,
> -	.support_33bits = 1,
>   	.timing_adjust = 1,
>   	.dma_sync = 1,
>   	.ltiming_adjust = 1,
>   	.apdma_sync = 0,
> +	.max_dma_support = 33,
>   };
>   
>   static const struct of_device_id mtk_i2c_of_match[] = {
> @@ -796,11 +797,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   	return 0;
>   }
>   
> -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> -{
> -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;

I2C_DMA_4G_MODE define could now be deleted as well.

Regards,
Matthias

> -}
> -
>   static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			       int num, int left_num)
>   {
> @@ -885,8 +881,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(rpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
>   		}
>   
> @@ -908,8 +904,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(wpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
>   		}
>   
> @@ -954,11 +950,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			return -ENOMEM;
>   		}
>   
> -		if (i2c->dev_comp->support_33bits) {
> -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> +		if (i2c->dev_comp->max_dma_support > 32) {
> +			reg_4g_mode = upper_32_bits(wpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
>   
> -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> +			reg_4g_mode = upper_32_bits(rpaddr);
>   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
>   		}
>   
> @@ -1232,8 +1228,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	if (i2c->dev_comp->support_33bits) {
> -		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(33));
> +	if (i2c->dev_comp->max_dma_support > 32) {
> +		ret = dma_set_mask(&pdev->dev,
> +				DMA_BIT_MASK(i2c->dev_comp->max_dma_support));
>   		if (ret) {
>   			dev_err(&pdev->dev, "dma_set_mask return error.\n");
>   			return ret;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
