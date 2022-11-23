Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD252C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evmqZal6P0Gh2KtjmqsYtpngHK9nsZsmphCRedKA3xE=; b=hSFX9BsfV737Gxv3gZufDuzC9F
	6rlhfWO3qch/kbvrC3xIVHvaLxAXfEJNk8UnSHt2tBe1pYEjdULTz8N1m0indf5iRBjollORZPEYb
	OwdI+znTiUN9V3uytPa7mxDjTogGxB+ZrnlHG/UYg+Biro6l9E67nVMkVanNf9d/RblLhORtn+360
	Q9hRhhl4js6pBfbWutKcGa3Qy5n6Y3n+h9fjIRILpri0NhPVH+BChs6d1M3ySBUIh3SEDMZ4fOKAr
	21tMZ0te9/Chb+Fn7XoCP++itbVc+VYoFIjsap10zAs+FLZCuuPmCJQlYAFnnivn2ZIJw7z3OMntl
	lgZiyCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmrb-00GJTc-4p; Wed, 23 Nov 2022 10:20:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmrQ-00GJPy-96; Wed, 23 Nov 2022 10:20:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id bs21so28676293wrb.4;
        Wed, 23 Nov 2022 02:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evmqZal6P0Gh2KtjmqsYtpngHK9nsZsmphCRedKA3xE=;
        b=lkh9GncI+CNngHOJwLpl5TTT0pzTnHj78uPilgOF9t71J+w51UpkVUSfzl0VkzLb4s
         CTHaQcIifgKEM+P8bw9mPpIT9jIwxu6DcVxVfp7bLcT4YCLo4azv516Cz6/82DsaKDy+
         dXimePNiTsxoOLOfTkelN6SaS9fxtyIbB4D3gDJGtwbnGDaPLjKPieoW3+ynnVXErG6I
         QjLW6PQ1+gUrnjUnVU96UbftOBk4QVupMII4tnGGl42yZ3be69RhlVAoVlmHMd0CFOxA
         6DcOvWMUHgVF+5OY7dYnQ4d6OowIf29f2RTVH7kImDDS/5n3tJQPGU/1+sZbaXP4GDgE
         5Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evmqZal6P0Gh2KtjmqsYtpngHK9nsZsmphCRedKA3xE=;
        b=qjIOzAFSUJYi9zYKwDvRiU3r2kM1IznNJhSATlgYMU2U2lWKOC7OcKcJHTmM9Ik134
         Tt98d1uyha0Q2uTzR07GIek2LIbSTiQ8YPANToIJjfPEpHkhYis5kAUoPpaCU/fyN5LP
         lgodujmQomILzWGceaOE8rpaW9GlmUO3faFNHaUnVRgSFpxkG5FeWCPbrkdkxKEk2Srn
         NbW501pefZAUroiYuk4N4SEfPy6qRo62Cu4lAGWUHgJY/hPng4iqrQaAMmxpXQaqiCRk
         A05GHBRO1zmLzZoRPs2EZT2gjCFx4pB/TMqupoRzvI+7fDJlnVGyMbPsX0T4CUBUiYvx
         WjyA==
X-Gm-Message-State: ANoB5plxkKh2+XuVg5DcVG1W0WuvRFqSeudwmdiGJIFLvEr5Fxwzdm5Y
	vJD12nQcz9m9nNb/skQbVjU=
X-Google-Smtp-Source: AA0mqf4VoZcQFHNMjX7NzjbJPyyRNRq8XZnr59GZjTGNVCKozWfAGWsr4g0ZjkqCfYy/YSJJLcWrIQ==
X-Received: by 2002:adf:f805:0:b0:236:ef0b:68c5 with SMTP id s5-20020adff805000000b00236ef0b68c5mr17363638wrp.373.1669198804459;
        Wed, 23 Nov 2022 02:20:04 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003c6f3e5ba42sm1898268wmg.46.2022.11.23.02.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:20:03 -0800 (PST)
Message-ID: <ce1c6a1a-9183-e56d-6757-947f5fc8133d@gmail.com>
Date: Wed, 23 Nov 2022 11:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1] soc: mediatek: mtk-pm-domains: Allow mt8186 ADSP
 default power on
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: allen-kh.cheng@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221012075434.30009-1-tinghan.shen@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221012075434.30009-1-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_022008_380509_31E4CC91 
X-CRM114-Status: GOOD (  17.08  )
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



On 12/10/2022 09:54, Tinghan Shen wrote:
> In the use case of configuring the access permissions of the ADSP core,
> the mt8186 SoC ADSP power will be switched on in the bootloader because
> the permission control registers are located in the ADSP subsys.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Do we need a fixes tag here?
My bet is:
Fixes: 88590cbc1703 ("soc: mediatek: pm-domains: Add support for mt8186")

Or is this not yet a problem but needed to be able to implement access 
permission configuration in the ADSP driver?

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mt8186-pm-domains.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/soc/mediatek/mt8186-pm-domains.h
> index 108af61854a3..fce86f79c505 100644
> --- a/drivers/soc/mediatek/mt8186-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8186-pm-domains.h
> @@ -304,7 +304,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
>   		.ctl_offs = 0x9FC,
>   		.pwr_sta_offs = 0x16C,
>   		.pwr_sta2nd_offs = 0x170,
> -		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>   	},
>   	[MT8186_POWER_DOMAIN_ADSP_INFRA] = {
>   		.name = "adsp_infra",
> @@ -312,7 +311,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
>   		.ctl_offs = 0x9F8,
>   		.pwr_sta_offs = 0x16C,
>   		.pwr_sta2nd_offs = 0x170,
> -		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>   	},
>   	[MT8186_POWER_DOMAIN_ADSP_TOP] = {
>   		.name = "adsp_top",
> @@ -332,7 +330,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
>   				MT8186_TOP_AXI_PROT_EN_3_CLR,
>   				MT8186_TOP_AXI_PROT_EN_3_STA),
>   		},
> -		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
> +		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP,
>   	},
>   };
>   

