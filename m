Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D42C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQZR41yrW5hifouCNZEVZPyRGNsodM8y6hSfE7iNvTo=; b=XFVakUmeBvcGKF/k+ngOt0MtZQ
	3a0eU5CySh12dXBzA21XhkNwGmy7FqH8xvfn7Z+B0JBFaTIuj59dBE/MlSynJAsauzAG3QPQyc1TE
	5nCa1NYPZElDXTOyj6OUA7I/lOG3qrwtBlKAtxrygGHswGgeosjMxoqEfOiAVGVlglW0flbwZEvHs
	fD3FvORWthkrNYMrKG7lk1I3KXvGfPnKUYUWYwqtuq1Z6C4YE5vTWauZ68fLA2jiGVSPeQevwmM68
	DQFTGGHxiO2fAckOq4ffdpdJsGeOtAil/nuNjzpd3dh9VvjdZACfn/v9WVU2m81KUQblW5ucDGSPF
	4vzXB9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZBI-00Futu-9o; Thu, 02 Feb 2023 12:59:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZB5-00FunC-NH; Thu, 02 Feb 2023 12:59:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q8so1313698wmo.5;
        Thu, 02 Feb 2023 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQZR41yrW5hifouCNZEVZPyRGNsodM8y6hSfE7iNvTo=;
        b=fF3JCMiX8mkvTkT5ZNo23U6odnQTH86X2nhVU3HUY3oWQqr86PhE/TlYbaW6P9ri56
         K6HjUDAm9+Ei0geO39jUw6PgUjFUCYuvPb4hXwBQIKrQFGp3bJzK+lbuHnkA+W/k/WP7
         pNlcOEanFkGyuoMRgnh83tMu49orcHOcSZJNcIwYLkzOmu9ch71tn4ajXq28Ac39hiA7
         dl6oSyae5PuEig5OIzwmAOWt8REPFMGol4C5AVjfalkY3Y7hRx5TJMmwa/LCAFdR+RF4
         0Rb6GMSDijlPu3par9bQf7/xAnDXCTkBia5ee87Ctyp+xhttcaBU4kh7nI/bAqPnWLig
         wC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQZR41yrW5hifouCNZEVZPyRGNsodM8y6hSfE7iNvTo=;
        b=yrsBc4V9D2NNMQFxAii8O8l8vdEP2GJX2OfwlBqRRDLA+jwsuukhVkHQqT9JXUm7ZW
         XhGOWcrz+aBAN3zqCCv9XMK0pnoQqBWqEvTW3zHWbQ2AWykO07yjvIb/Jn7Er/i2ifoW
         EE1NlhhEPeRQcW3WNbsumJYr7HXeUkkV5ImzQlHaXj0st9XOl3adWjSGO0DHnw67tdC4
         Uk++icuJqHwFSi2ngk8c1Lq1X5eBhakcoMxpNyPO+5PTTeexlVh8+a9qzAnsi8fExeAc
         5nnuiO2gYXSC9JD0FHf3/1PN3fcQixgYHzWwudw//DhbOoFAyERYcjR4Mkpru9PgXSuJ
         7dXw==
X-Gm-Message-State: AO0yUKUhMCrNPPStlAWn4T8e7qUtdIKNh3xvpiZhr453xGBTFZKtuPxS
	t+vzvsKot0iX0CVxB9QCKRQ=
X-Google-Smtp-Source: AK7set9pYAcqCnIIQvL4N/6JISt2d16d/ib/NhPMpMkq2zH6UbXwe2ClBsTBzQ24W0EeUPf4C0sHkg==
X-Received: by 2002:a05:600c:1da2:b0:3dc:4313:fd1e with SMTP id p34-20020a05600c1da200b003dc4313fd1emr5743709wms.34.1675342738188;
        Thu, 02 Feb 2023 04:58:58 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c2e0600b003dcc82ce53fsm4530755wmf.38.2023.02.02.04.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:58:57 -0800 (PST)
Message-ID: <26837308-4837-f252-d162-f8af4859b63e@gmail.com>
Date: Thu, 2 Feb 2023 13:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
 <20230202124104.16504-4-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 3/3] soc: mediatek: mtk-svs: add thermal voltage
 compensation if needed
In-Reply-To: <20230202124104.16504-4-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_045859_819779_3F1E9589 
X-CRM114-Status: GOOD (  22.53  )
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

Hi Roger,

I have some doubts, please see below.

On 02/02/2023 13:41, Roger Lu wrote:
> Some extreme test environment may keep IC temperature very low or very high
> during system boot stage. For stability concern, we add thermal voltage
> compenstation if needed no matter svs bank phase is in init02 or mon mode.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 299f580847bd..e104866d1ab5 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -558,7 +558,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>   	}
>   
>   	/* Get thermal effect */
> -	if (svsb->phase == SVSB_PHASE_MON) {
> +	if (!IS_ERR_OR_NULL(svsb->tzd)) {
>   		ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
>   		if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
>   			    svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
> @@ -573,7 +573,8 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>   			temp_voffset += svsb->tzone_ltemp_voffset;
>   
>   		/* 2-line bank update all opp volts when running mon mode */
> -		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
> +		if (svsb->phase == SVSB_PHASE_MON && (svsb->type == SVSB_HIGH ||
> +						      svsb->type == SVSB_LOW)) {
>   			opp_start = 0;
>   			opp_stop = svsb->opp_count;
>   		}
> @@ -589,11 +590,6 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>   			/* do nothing */
>   			goto unlock_mutex;
>   		case SVSB_PHASE_INIT02:
> -			svsb_volt = max(svsb->volt[i], svsb->vmin);
> -			opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
> -							     svsb->volt_step,
> -							     svsb->volt_base);
> -			break;
>   		case SVSB_PHASE_MON:
>   			svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);
>   			opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
> @@ -1683,7 +1679,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
>   			}
>   		}
>   
> -		if (svsb->mode_support & SVSB_MODE_MON) {
> +		if (!IS_ERR_OR_NULL(svsb->tzone_name)) {
>   			svsb->tzd = thermal_zone_get_zone_by_name(svsb->tzone_name);
>   			if (IS_ERR(svsb->tzd)) {
>   				dev_err(svsb->dev, "cannot get \"%s\" thermal zone\n",
> @@ -2127,6 +2123,7 @@ static struct svs_bank svs_mt8192_banks[] = {
>   		.type			= SVSB_LOW,
>   		.set_freq_pct		= svs_set_bank_freq_pct_v3,
>   		.get_volts		= svs_get_bank_volts_v3,
> +		.tzone_name		= "gpu1",
>   		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
>   		.mode_support		= SVSB_MODE_INIT02,
>   		.opp_count		= MAX_OPP_ENTRIES,
> @@ -2144,6 +2141,10 @@ static struct svs_bank svs_mt8192_banks[] = {
>   		.core_sel		= 0x0fff0100,
>   		.int_st			= BIT(0),
>   		.ctl0			= 0x00540003,
> +		.tzone_htemp		= 85000,
> +		.tzone_htemp_voffset	= 0,
> +		.tzone_ltemp		= 25000,
> +		.tzone_ltemp_voffset	= 7,

Which is the exact same tzone then in the other bank. Which brings me to a good 
point:
Is the tzone bank specific or the same for all banks?
At least for mt8192 they are not. I suppose with this change to the code mt8183 
could take advantage of this on all it's banks as well. In that case, can we 
start to restructure the struct svs_bank to only have the tzone values declared 
once?

Background is that I'm very unhappy with the svs_bank data strucutre. It seems 
like a "throw it all in here". It should be structured for functional parts of 
the banks. Maybe using structs, maybe unions where possible. In any case having 
a flat struct of over 50 members isn't really what we want.

Regards,
Matthias

>   	},
>   	{
>   		.sw_id			= SVSB_GPU,

