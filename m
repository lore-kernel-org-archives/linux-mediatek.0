Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaQNzpUAjABy/UuXZLlOvvbqix9SotqgoJqkxFf1bDI=; b=e7hcbESTGiOTIaADAZnleASszN
	StQ482mSuQjZUXyowN+kZtdiR8qohCQ8wQkMewjpVZMeNSBSMOPSMtwtI0DvzRyChb+1pGIq/sShs
	C8wrv4VDBsP82dnNrQoZUcWulOthM1/PJAP+Bnm8ICZbp4fDFaby8EEIwETefeYhfsiCuxdVMTKgQ
	hJiEcqDmCWV387gEhnW29a65C1Lt2dC+Gg7S4+KV3zPCePe29em3qy8ITp5WLCRVI24086+Kb0/eO
	NMy3XBGdQAJVpRhYMylPl99b7N3K9l/C1fbba+vydui+t0s5ncXRgQkUrGnTi0tf8Sf0XBEDP5gL/
	Kd+IuXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYzU-00FrZh-JF; Thu, 02 Feb 2023 12:47:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYz4-00FrPE-TR; Thu, 02 Feb 2023 12:46:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso3662514wms.0;
        Thu, 02 Feb 2023 04:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaQNzpUAjABy/UuXZLlOvvbqix9SotqgoJqkxFf1bDI=;
        b=Dofe0UtJYuhFHBDhvyTjPY051/tbsKRICVxIYfMj5JzEAyp2XhCRekp3ml+P4V+LS9
         Z+LnmX3TS4gVgdva0YjNRrc46M5xVZGMEjqsy0kFVia2NTHodf4IpZfgn45bITRnCSSQ
         OoLQtyJr74R3iS7eaJNIbYaIn9jgZVaog4j7J4yWGR6PuuYbA92juuLjRQNQlFDqqd3V
         xHyjLlVs1lfaxINC1fy5PtatZqNQdCwCqes92EQ6v+nLOADICuBXGM2JLuglOUbdB+oD
         OmDkJX0nOY/VOH9Xory0LJQiyYbRxqmoS5LYcqfFQGV9U9gdxD0oXFvo1OhkT6k/JDFB
         nwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaQNzpUAjABy/UuXZLlOvvbqix9SotqgoJqkxFf1bDI=;
        b=u2MmGc32sswEG1uGEAmT9SGxRYp09c/ZvMpuKkzJbCojLXLZjJlI961B5W5jWfDl6l
         0wO7jvfBMtG0fzV7vW/fre/opNPyPKIcIKZdPaW3FfXvTlYEWVdwtXElsn+YwlfeMTd8
         TzErUg5RXOk97yRgnVkyiFZmINZFI8P2L9JpZYyhXP6yQcVNSEcjNiAsj/MeNl7LyR4Y
         peLrCOHj6SbIJgxi6iTazhLKCiIWq3MC4YyW79OnsvLXQVyQLu8XfdS6RJlFx2FxZjBF
         Fc0rRWjRLtEXg9lHBuQhd6VyDdu8n1sLUBJyj4iPlRhJwcek4+TBDd++YSuqxHfnkkvG
         45MQ==
X-Gm-Message-State: AO0yUKWtnoBSu3NBSgApLbM1Iebdy1/MoXNSIu7kINzdAxdPe8MCGJeX
	yAVeOdwa3jaE75nh8QtoHb0=
X-Google-Smtp-Source: AK7set+x2AmWIDXdhFrfTy/bx8g3UJH2OP9HnUmuyCSGvsnxLo89d5Ks7yWreZh1w0d4SEIBf2+OWw==
X-Received: by 2002:a05:600c:3513:b0:3df:b5ae:5289 with SMTP id h19-20020a05600c351300b003dfb5ae5289mr2730154wmq.8.1675341990082;
        Thu, 02 Feb 2023 04:46:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003dafbd859a6sm5105962wmq.43.2023.02.02.04.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:46:29 -0800 (PST)
Message-ID: <2e616aea-0a38-b33e-20d5-0c6254cdd616@gmail.com>
Date: Thu, 2 Feb 2023 13:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/3] soc: mediatek: mtk-svs: use common function to
 disable restore voltages
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230202124104.16504-1-roger.lu@mediatek.com>
 <20230202124104.16504-3-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230202124104.16504-3-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_044634_994469_8E2EEB68 
X-CRM114-Status: GOOD (  20.82  )
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



On 02/02/2023 13:41, Roger Lu wrote:
> The timing of disabling SVS bank and restore default voltage is more
> than one place. Therefore, add a common function to use for removing
> the superfluous codes.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Queued for the next merge window.

Thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 54 ++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index c9899f5df60a..299f580847bd 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -624,6 +624,25 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>   	return ret;
>   }
>   
> +static void svs_bank_disable_and_restore_default_volts(struct svs_platform *svsp,
> +						       struct svs_bank *svsb)
> +{
> +	unsigned long flags;
> +
> +	if (svsb->mode_support == SVSB_MODE_ALL_DISABLE)
> +		return;
> +
> +	spin_lock_irqsave(&svs_lock, flags);
> +	svsp->pbank = svsb;
> +	svs_switch_bank(svsp);
> +	svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
> +	svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
> +	spin_unlock_irqrestore(&svs_lock, flags);
> +
> +	svsb->phase = SVSB_PHASE_ERROR;
> +	svs_adjust_pm_opp_volts(svsb);
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int svs_dump_debug_show(struct seq_file *m, void *p)
>   {
> @@ -700,7 +719,6 @@ static ssize_t svs_enable_debug_write(struct file *filp,
>   {
>   	struct svs_bank *svsb = file_inode(filp)->i_private;
>   	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
> -	unsigned long flags;
>   	int enabled, ret;
>   	char *buf = NULL;
>   
> @@ -716,16 +734,8 @@ static ssize_t svs_enable_debug_write(struct file *filp,
>   		return ret;
>   
>   	if (!enabled) {
> -		spin_lock_irqsave(&svs_lock, flags);
> -		svsp->pbank = svsb;
> +		svs_bank_disable_and_restore_default_volts(svsp, svsb);
>   		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
> -		svs_switch_bank(svsp);
> -		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
> -		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
> -		spin_unlock_irqrestore(&svs_lock, flags);
> -
> -		svsb->phase = SVSB_PHASE_ERROR;
> -		svs_adjust_pm_opp_volts(svsb);
>   	}
>   
>   	kfree(buf);
> @@ -1508,16 +1518,7 @@ static int svs_init02(struct svs_platform *svsp)
>   out_of_init02:
>   	for (idx = 0; idx < svsp->bank_max; idx++) {
>   		svsb = &svsp->banks[idx];
> -
> -		spin_lock_irqsave(&svs_lock, flags);
> -		svsp->pbank = svsb;
> -		svs_switch_bank(svsp);
> -		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
> -		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
> -		spin_unlock_irqrestore(&svs_lock, flags);
> -
> -		svsb->phase = SVSB_PHASE_ERROR;
> -		svs_adjust_pm_opp_volts(svsb);
> +		svs_bank_disable_and_restore_default_volts(svsp, svsb);
>   	}
>   
>   	return ret;
> @@ -1563,23 +1564,12 @@ static int svs_suspend(struct device *dev)
>   {
>   	struct svs_platform *svsp = dev_get_drvdata(dev);
>   	struct svs_bank *svsb;
> -	unsigned long flags;
>   	int ret;
>   	u32 idx;
>   
>   	for (idx = 0; idx < svsp->bank_max; idx++) {
>   		svsb = &svsp->banks[idx];
> -
> -		/* This might wait for svs_isr() process */
> -		spin_lock_irqsave(&svs_lock, flags);
> -		svsp->pbank = svsb;
> -		svs_switch_bank(svsp);
> -		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
> -		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
> -		spin_unlock_irqrestore(&svs_lock, flags);
> -
> -		svsb->phase = SVSB_PHASE_ERROR;
> -		svs_adjust_pm_opp_volts(svsb);
> +		svs_bank_disable_and_restore_default_volts(svsp, svsb);
>   	}
>   
>   	ret = reset_control_assert(svsp->rst);

