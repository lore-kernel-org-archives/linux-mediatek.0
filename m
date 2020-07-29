Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EAFF207F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9zUS7lT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfyQpnB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EAFF207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3eORcIHnyxOv5ZKbgL1BNi9tU5pkcVp8+TKWAAhjf5k=; b=p9zUS7lTWwQY/iLJFl5UaU2S4
	/Bmmthsc7+CJeMHR3HOVwYDS6UVExenX1K6xfVGwj+WXjLhpPkdys/KWrt0wEj/6mESCrZa+sNh8t
	/GbS8Yqa4jZYp4ELSDQDMtKkHiiLYsoHgEqHs1qAWSWU+l7ukkA1kgfU9V73FeisIf2nSoPn1ZsS1
	8KWVZuXyir26+tsJQhAijjWziXxRcEbLb+OQ4S5KrVBmJR6vAkbawEOitu1zV+M5In6bPs2EWh6Q3
	XqC/GMXi9tyH/Mk8RQ7pWqudAfs/9UBxL5GVUl1irIrs6MEU7K2eItYDOKAiWLFV/kCmisHXXCflx
	JFn4gi4NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0h0C-0006FX-7U; Wed, 29 Jul 2020 07:59:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0h08-0006EP-Eb; Wed, 29 Jul 2020 07:59:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id r2so15584569wrs.8;
 Wed, 29 Jul 2020 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z5da3dx2SAn+bVOvyHxQOVatBrN8Ykye0kzHE6DAqV0=;
 b=NfyQpnB9G7M/mRumGDa4PyxncFONzIQPe4J7blxFyH+Ryj3ihh197KaeLo2Y13CHai
 II013x6AH4Qcod8ylw9wYU3Ni/7ZX1nLS9McnJX5VSkDwait471nEyHD0MmjTw7XM57/
 pgPzc6Ir7A/rYPtPEkJANVVCB2hxCVX6fU9GpaRGuTU0ycD+9iO6ufFJ7JBSU0iJH5ip
 en4ZpzG5Pt5bRmW95dZklfUg4vQpjHPnrIWVT1vebuCcYv7+l6WkWbL/sBH+GZH7X+7C
 WujIRwi1JrAyz4IpHL5SP56lNX9sZDzuQgS/hAlaYmUACjMrguj/HOy+3SxMUdDZfwY4
 sl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z5da3dx2SAn+bVOvyHxQOVatBrN8Ykye0kzHE6DAqV0=;
 b=qZlHuy9E37LH3Ytzu8kBLJ+hXBcLkdfFtQbnZHc1hMUxKGYFbUi3+pyfdlXin+qWyJ
 jz7xST9rjVTCCmYDsCYAqkeEIIk2ayOy8YYroHLC9Scz1tb7dQKz2Qgphgr6AJTeCHms
 Pnvsrq3+XQi2gHpGY386DyzcHiGoPvMcPzfqD3w8DMdm1D5SNjKGuun+lKC9GVPOb/tl
 YoD7S986DL5TEAxFrAI2RENO+MOZqE2LZNUJ+Z0CDW+Oe4GgzDkTL/aUdjFRT3/KgZnG
 5KOQQTSPEMI++IvTQDtrlt+cYE59lzQ4Zn/7fGQhdAlOgp5d/WTZSVpATYHulxxn76iO
 qDQw==
X-Gm-Message-State: AOAM530tEODNq10hMAVpJg8chuGNIjhrzXAV/mIJN9nJkt9LpIEJJSYt
 qcTM2kCzWkpnlCjmyteFWmAmjaP359E=
X-Google-Smtp-Source: ABdhPJwGStf0UKkkT0IHuZkO3DIghNUfUWpgTVBI4oN+HOrXJy1ffPv96tWb7B+ddXIu3I6Ov4OccQ==
X-Received: by 2002:a5d:526d:: with SMTP id l13mr26968687wrc.279.1596009587006; 
 Wed, 29 Jul 2020 00:59:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id w14sm3418220wrt.55.2020.07.29.00.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 00:59:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram in
 i2c driver
To: Qii Wang <qii.wang@mediatek.com>, wsa@the-dreams.de
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
 <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <25ff4899-5e7d-f6e5-599c-4bf368a731e1@gmail.com>
Date: Wed, 29 Jul 2020 09:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_035948_553674_75015FD9 
X-CRM114-Status: GOOD (  22.08  )
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



On 28/07/2020 14:30, Qii Wang wrote:
> Newer MTK chip support more than 8GB of dram. Replace support_33bits
> with more general dma_max_support and remove mtk_i2c_set_4g_mode.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 38 +++++++++++++++++---------------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e6b984a..49777a6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -204,11 +204,11 @@ struct mtk_i2c_compatible {
>   	unsigned char dcm: 1;
>   	unsigned char auto_restart: 1;
>   	unsigned char aux_len_reg: 1;
> -	unsigned char support_33bits: 1;
>   	unsigned char timing_adjust: 1;
>   	unsigned char dma_sync: 1;
>   	unsigned char ltiming_adjust: 1;
>   	unsigned char apdma_sync: 1;
> +	unsigned char max_dma_support;
>   };
>   
>   struct mtk_i2c_ac_timing {
> @@ -311,11 +311,11 @@ struct i2c_spec_values {
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
> @@ -325,11 +325,11 @@ struct i2c_spec_values {
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
> @@ -339,11 +339,11 @@ struct i2c_spec_values {
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
> @@ -353,11 +353,11 @@ struct i2c_spec_values {
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
> @@ -366,11 +366,11 @@ struct i2c_spec_values {
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
> @@ -380,11 +380,11 @@ struct i2c_spec_values {
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
> @@ -796,11 +796,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>   	return 0;
>   }
>   
> -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> -{
> -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;

I think you missed my comment in the last version:
I2C_DMA_4G_MODE is no longer needed, you can delete it.

Regards,
Matthias

> -}
> -
>   static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>   			       int num, int left_num)
>   {
> @@ -885,8 +880,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -908,8 +903,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -954,11 +949,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
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
> @@ -1232,8 +1227,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
