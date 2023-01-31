Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC5C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZP0P6BPjpTycjws87uMdBob8rEGrXXOXGVK5egAH/A=; b=sUOOyWiqACTBLI4DIEgAgoXObg
	w9LDm15FJjE+xb2gd6hait7MHbiePh3iZOCCdbGmCZ6Srfvm0s/s40Shs1wKjH4E/1LVwosEzXL/j
	JKWuhesYh/Ni+yyBmjmvMDfeyHTASER6uWs96lPePFj8+B8AKG9tAXEXzJo5Xn+FIaoJ/aXARRnE8
	QvkV3+I9w2+Pi+2Lh6fXjHktol3ZYk8cccp25T2ZIwHewG0YI+kP5affnGDShIf3FJAXm7geHVnv/
	tLGqKiVhUuZTFIeexLtH+sPCwbsKMjcrx2Zzrl3rHXG+Nxtpk9tKaBoMKV6a8DVbx+dqe35otLVKh
	ahFJMOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqt5-008A0q-9x; Tue, 31 Jan 2023 13:41:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqsu-0089xo-WF; Tue, 31 Jan 2023 13:41:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10617618wmq.5;
        Tue, 31 Jan 2023 05:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZP0P6BPjpTycjws87uMdBob8rEGrXXOXGVK5egAH/A=;
        b=Oivea9/Iy3KwEakTbBE/jJKb7XFNmSXBXIm0CdMEk5UYzzcmCnJlik4RS24QKOjjEX
         UQqsg/pp0PeI6SW2AYM9NXGWNYeVQxD1jy1Jyp6WOZX06+5j3l71suA95oS1QqHwft66
         nPEgN2EzNn3s3Dxuaf4q0AqpgMkh1Ykhug8IAW8BLEjiJJN4HTChgDqFicvxasy8nG7l
         5vBQo7J9lFU9/B+SPovlZuT8+crL1MGRLrqz0IfKXwOZTCm4TLWnkKxNAq47Em+Kh6K+
         X1gzqO9vvfq2ZVkcRMzn3SiyC+JCzgbrdj8xmqDEeIBHC4vWXbrI5lHrkCsEw/Hlk6iS
         ZbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZP0P6BPjpTycjws87uMdBob8rEGrXXOXGVK5egAH/A=;
        b=RNx+Qa6XUSJasML5IGEWMesf/v16rKXj4F9ggVwz79iAxfy/kUAWW4NUHeO7vCXb07
         zsTDLDLSE81QduRNyj4qULWukNeZxNEPQ4vSckoVnhjZH9BKkJcgjGL5mYHERz35NwaQ
         +cxHJf9jlCDnUcVaYq6DR515aivxuE7KAuMxmTIaSZ6wqjkYwnyHc1fx0zfh352Ja/Bz
         eg3GvxjBE5rrMMmTTGpW26fuOdAEA4XQ5a8OZ1a9b+Iq1ujorlaEL6WDfDlGvDP+NYSo
         HCw06o9BxRabUwtOLiwDC9VVboxSNw9vR47TWQRVvgf16vX+IWTOcdj2WDjnKJaaobPd
         JdAQ==
X-Gm-Message-State: AO0yUKU3O+lkSZYX+U6Fnay2qn76Qv0r9wLrQaA6notmf/wS//s7Z0fG
	EhVf+iNIR/P8TmdIzBlSMLE=
X-Google-Smtp-Source: AK7set8yxn3VlOGMhryXV9o5wgcPRLjDRGFzg6jcqOwrzlU/5pigFTF/ueOTr/AKj6XbvPKhQDiuuw==
X-Received: by 2002:a05:600c:3511:b0:3dc:58a2:38e3 with SMTP id h17-20020a05600c351100b003dc58a238e3mr8102103wmq.26.1675172475450;
        Tue, 31 Jan 2023 05:41:15 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c341500b003da28dfdedcsm10220004wmp.5.2023.01.31.05.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:41:14 -0800 (PST)
Message-ID: <4ef03681-4da9-b7d6-516c-19bd37b8dc6f@gmail.com>
Date: Tue, 31 Jan 2023 14:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 14/14] soc: mtk-svs: mt8183: refactor o_slope
 calculation
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
 <20230111074528.29354-15-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-15-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_054117_069434_BE754C71 
X-CRM114-Status: GOOD (  17.36  )
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
> The o_slope value is dependent of the o_slope_sign, refactor code to get
> rid of unnecessary if constructs.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 51 +++++++++++++++-------------------
>   1 file changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 89117807e85d..8cfbf8ffb138 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1944,26 +1944,27 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   	o_slope_sign = (svsp->tefuse[0] >> 7) & BIT(0);
>   
>   	ts_id = (svsp->tefuse[1] >> 9) & BIT(0);
> -	o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
> -
> -	if (adc_cali_en_t == 1) {
> -		if (!ts_id)
> -			o_slope = 0;
> -
> -		if (adc_ge_t < 265 || adc_ge_t > 758 ||
> -		    adc_oe_t < 265 || adc_oe_t > 758 ||
> -		    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
> -		    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
> -		    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
> -		    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
> -		    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
> -		    o_vtsabb < -8 || o_vtsabb > 484 ||
> -		    degc_cali < 1 || degc_cali > 63) {
> -			dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
> -			goto remove_mt8183_svsb_mon_mode;
> -		}
> +	if (!ts_id) {
> +		o_slope = 1534;
>   	} else {
> -		dev_err(svsp->dev, "no thermal efuse, no mon mode\n");
> +		o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
> +		if (!o_slope_sign)
> +			o_slope = 1534 + o_slope * 10;
> +		else
> +			o_slope = 1534 - o_slope * 10;
> +	}
> +
> +	if (adc_cali_en_t == 0 ||
> +	    adc_ge_t < 265 || adc_ge_t > 758 ||
> +	    adc_oe_t < 265 || adc_oe_t > 758 ||
> +	    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
> +	    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
> +	    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
> +	    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
> +	    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
> +	    o_vtsabb < -8 || o_vtsabb > 484 ||
> +	    degc_cali < 1 || degc_cali > 63) {
> +		dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
>   		goto remove_mt8183_svsb_mon_mode;
>   	}
>   
> @@ -1982,11 +1983,7 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		x_roomt[i] = (((format[i] * 10000) / 4096) * 10000) / gain;
>   
>   	temp0 = (10000 * 100000 / gain) * 15 / 18;
> -
> -	if (!o_slope_sign)
> -		mts = (temp0 * 10) / (1534 + o_slope * 10);
> -	else
> -		mts = (temp0 * 10) / (1534 - o_slope * 10);
> +	mts = (temp0 * 10) / o_slope;
>   
>   	for (idx = 0; idx < svsp->bank_max; idx++) {
>   		svsb = &svsp->banks[idx];
> @@ -2013,11 +2010,7 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		temp0 = (degc_cali * 10 / 2);
>   		temp1 = ((10000 * 100000 / 4096 / gain) *
>   			 oe + tb_roomt * 10) * 15 / 18;
> -
> -		if (!o_slope_sign)
> -			temp2 = temp1 * 100 / (1534 + o_slope * 10);
> -		else
> -			temp2 = temp1 * 100 / (1534 - o_slope * 10);
> +		temp2 = temp1 * 100 / o_slope;
>   
>   		svsb->bts = (temp0 + temp2 - 250) * 4 / 10;
>   	}

