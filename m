Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC0C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFfnKzW9khIrRw3lbxbS734cPxF5yNl0uJsJQazws/8=; b=vA7UnUEOW5K/0Wg+6KddI9J9AO
	gJDwegFivE2ymQni1hlydPjc6vGBcMn/xXgJbP2b3uaORBifHDJ4P7eYw6hN6KgYXYHWQnnedTx4F
	5c47NFlFKjWeyzEAO9B1MnolkSYl4NKM7jxA4quYigkrel6MkB/yZfgPWLlqDGVBp9mzcXU6B8k4S
	kV2jkEsJENDZIX2skd1v0hJALxPVr9N4dp2xDmYFhrPnYmn1/IsqxNfpgnqJtQnezQFDE8myJ3c8F
	URFWh0T2xC0GIEFwMoKIVV4GX3wRWOEj21vuhKd0zpNaehhonPyJphgSUYYk7Qncg453di6QOKNNN
	nM5DxmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqsD-0089nS-Uo; Tue, 31 Jan 2023 13:40:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqs3-0089l9-QL; Tue, 31 Jan 2023 13:40:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10615473wmq.5;
        Tue, 31 Jan 2023 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFfnKzW9khIrRw3lbxbS734cPxF5yNl0uJsJQazws/8=;
        b=T9+RLizSsnKshbSBWeeW9niEYTMA4aK8QJGntvDs58DAs2bQE5DmB4KM2UrFxz47yv
         9xgskCl2Vu+Nb69q9FZp2QbJCBe6M8AB9KpwlJJ3Z/5Z7/kQaTiNioV37W9XH+G0IxTJ
         QDelaSU9HpVExuchwQ2L/HoUDh/NC5KnSAbim6YHbYE1wrNWw8LzmC8tyT/37jMGFoq0
         UtLjzEs91A/9qgC7ZmHAMRMZJKdlEjxHy8lcIxY2tOMNhb6ZBwii8EOCJOPFJeSMDSUV
         JjBeqqCLDxKKg1C/51MXUSgN8qCPJp/LqaK8xADKrMUWiIgDcZVPGZf7wqIenJeOwEWP
         bH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFfnKzW9khIrRw3lbxbS734cPxF5yNl0uJsJQazws/8=;
        b=Kr6vuSSn295kM7JbA0juO/Gq1s/SyLYP0gooNH1uaEx4Y3brptf+YFCENddJw42L79
         NLLcCSRguS1GTBL85JNwo5ENmNw+em0JIHyyjEv/8ACIbE+O8STXxwpLZnRhVeMFj8Lq
         vitQF926yV1vGvospHAHBvZINEY5MnOYG70uAvrW61iuv/MHbI/LB/P5S1G2iScJ7Rx+
         MpEjm434u5NF8DdVhanSXNlQrqxbWFP/J8nVXIKCi4HG7hlpjr+Bu0UEGyGEt67nvGRD
         DZhzR2zmao1EboZI6rbVVZkopTQ0zgIDsKciokj50gEY6X5VsdwZl6xEBkD0w9I8872N
         rQow==
X-Gm-Message-State: AO0yUKVgRlpQumcTpDDXLpP58VbLFRXC6W7VwVoNY5vtmtzfqD6c24Kh
	YOekE2Jn81hjbDRLTAwMS/A=
X-Google-Smtp-Source: AK7set88Xp9NVoXxldr7uLaJ0otyv5du9npLziyeCkNyEz4Sim7shGX6WN1XMa+HkK5cSNS3PfTbjA==
X-Received: by 2002:a1c:7312:0:b0:3dd:62fe:9914 with SMTP id d18-20020a1c7312000000b003dd62fe9914mr2100438wmb.18.1675172421680;
        Tue, 31 Jan 2023 05:40:21 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c5447000000b003dc433355aasm12513740wmi.18.2023.01.31.05.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:40:21 -0800 (PST)
Message-ID: <64702a9b-6c78-3065-8335-28d31c6fc1ab@gmail.com>
Date: Tue, 31 Jan 2023 14:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/14] soc: mediatek: mtk-svs: use common function to
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
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-14-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-14-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_054023_882325_16E0F981 
X-CRM114-Status: GOOD (  20.93  )
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
> The timing of disabling SVS bank and restore default voltage is more
> than one place. Therefore, add a common function to use for removing
> the superfluous codes.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Same here, change looks good. Could you please rebase and resend:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/soc/mediatek/mtk-svs.c | 54 ++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index a7f0a6f02d52..89117807e85d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -648,6 +648,25 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
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
> @@ -724,7 +743,6 @@ static ssize_t svs_enable_debug_write(struct file *filp,
>   {
>   	struct svs_bank *svsb = file_inode(filp)->i_private;
>   	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
> -	unsigned long flags;
>   	int enabled, ret;
>   	char *buf = NULL;
>   
> @@ -740,16 +758,8 @@ static ssize_t svs_enable_debug_write(struct file *filp,
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
> @@ -1532,16 +1542,7 @@ static int svs_init02(struct svs_platform *svsp)
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
> @@ -1587,7 +1588,6 @@ static int svs_suspend(struct device *dev)
>   {
>   	struct svs_platform *svsp = dev_get_drvdata(dev);
>   	struct svs_bank *svsb;
> -	unsigned long flags;
>   	int ret;
>   	u32 idx;
>   
> @@ -1599,17 +1599,7 @@ static int svs_suspend(struct device *dev)
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

