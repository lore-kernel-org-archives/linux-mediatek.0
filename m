Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6275C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syQ+VpJJB2LIQAUZnYA/zT0AD9MDsCzAI/fzicls730=; b=y24/3zl1e7/23O5kJnZ5cCQcH+
	qD9Ft1lyuTJisPnvSVWKuLHfbFJvAT365IE+d542W3Kctee1PJ4J/UT/7eyjvI++U18OF4GTwSV1W
	LyAvUMUGgbzAk95VH6B3I83FXIZH68hmX/3KT+JHWz6Qk4vmxIUVan78iqaGDtOKifb+jgJHWVMLG
	AInKRJKGVNQJSZwqLS4TBQD+eRDlV+VAoTdjgVctg33XJpAenEX6P++TciyR3TVsQpOJQNpl2gVWT
	yMVxywoYxiyLBPVSR1J+AHuK+1Tzbbh1mgtO1ccClG9dmQBXcGnzRuRm/L2+28VVOfwJiE4ajP5EQ
	7EFArsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES1G-002svX-Nb; Thu, 21 Jul 2022 08:58:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oES11-002siT-Vh; Thu, 21 Jul 2022 08:58:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b26so1300359wrc.2;
        Thu, 21 Jul 2022 01:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=syQ+VpJJB2LIQAUZnYA/zT0AD9MDsCzAI/fzicls730=;
        b=Z2qfSOhdmzD1A8erF2JN5h5MRBchlMjqkznwx2R2kmbyZTKzy68/SBv1VIU55Fq13A
         7pwyP6jI86y7bWlaNTInynXOr6icU/W6sWdD9ZdXSSlBEFiIY6LAdVNqEYNAPiB8wIts
         a66/b/tgTMCk5O1mX4b9o6Y5BYuKADxMpKp2wS44fQVtmOmMcculT4DvgUUt3XeaWQHM
         sr33WKKRdFe/Dh2bz48Xlk/NSIog827Zncr6fWgT3Z9MHwz4z9Y4aiPlJYZYgkEJc2vf
         5V2nxOCtOf1vQqLjgZ78Ey8rFXK8UokfAxj5FcMX2bRZQdac1OE+ycD9ZFiGLBf1K57j
         HTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=syQ+VpJJB2LIQAUZnYA/zT0AD9MDsCzAI/fzicls730=;
        b=wUmsCdFuLdCjIX8J7sMwnqvhsaFRxn7pRZ+9U8Js7hI5Sht4Eek0e5CSISaKBMEHgs
         EJ5YuwrMIYEoEo4dnaqaK63De0fjZ2t8HZ/nd2vJd8fjb08OPWPXTy/zT+Lepf61mxfe
         hOfI7QiG+atjinLn0u1SdwfPa9U6SwPQmrJqZkTQOF2xQfkoH0398SN/B4segY3OnMlk
         0LDPvz1rzo730fVaWvJOot/VpDjVb+2U/AgZ6iD6HMSbV2YSDarn9Y0d2UXm3q+5ggwj
         h1qbI7EYrk8M+E44GYukJJZokjua1WBw4ns1QWiDxgcW0/z8QdFeBsN2Gn9JpyXnENo5
         SrAw==
X-Gm-Message-State: AJIora9EBVjQ8H4AWU5P8Dky3P1GzcC2y9r9+sVQwKeVXxYQSisPaVgI
	181zJgjDw9l3aN5iDsYAa8k=
X-Google-Smtp-Source: AGRyM1tOOvMJab+4e1PYs08SdqeCBd+Bl9zzhquyW+88isndfbUjZAJT+iZUKX6XSMHa42tjYZoOSg==
X-Received: by 2002:a5d:5a9d:0:b0:21b:8247:7ec4 with SMTP id bp29-20020a5d5a9d000000b0021b82477ec4mr33511036wrb.561.1658393916178;
        Thu, 21 Jul 2022 01:58:36 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x5-20020adfdcc5000000b0021d887f9468sm1258931wrm.25.2022.07.21.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:58:34 -0700 (PDT)
Message-ID: <f8cb0af1-96e2-36e8-474f-421d152117fb@gmail.com>
Date: Thu, 21 Jul 2022 10:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-4-aouledameur@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220720181854.547881-4-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_015840_082715_09758F5A 
X-CRM114-Status: GOOD (  21.59  )
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



On 20/07/2022 20:18, Amjad Ouled-Ameur wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Add logic in order to be able to turn on the control buffer on MT8365.
> This change now allows to have control buffer support for MTK_THERMAL_V1,
> and it allows to define the register offset, and mask used to enable it.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>

Here we will need your Signed-off-by as you are sending the patch :)

Regards,
Matthias

> ---
>   drivers/thermal/mtk_thermal.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 216eb0d61c5b..1dc276f8c4f1 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -283,6 +283,9 @@ struct mtk_thermal_data {
>   	bool need_switch_bank;
>   	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
>   	enum mtk_thermal_version version;
> +	u32 apmixed_buffer_ctl_reg;
> +	u32 apmixed_buffer_ctl_mask;
> +	u32 apmixed_buffer_ctl_set;
>   };
>   
>   struct mtk_thermal {
> @@ -578,6 +581,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>   	.adcpnp = mt7622_adcpnp,
>   	.sensor_mux_values = mt7622_mux_values,
>   	.version = MTK_THERMAL_V2,
> +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> +	.apmixed_buffer_ctl_mask = ~0x37,
> +	.apmixed_buffer_ctl_set = 0x1,
>   };
>   
>   /*
> @@ -1031,14 +1037,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>   
> -static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
> +static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
> +				       void __iomem *apmixed_base)
>   {
>   	int tmp;
>   
> -	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
> -	tmp &= ~(0x37);
> -	tmp |= 0x1;
> -	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
> +	if (!mt->conf->apmixed_buffer_ctl_reg)
> +		return;
> +
> +	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
> +	tmp &= mt->conf->apmixed_buffer_ctl_mask;
> +	tmp |= mt->conf->apmixed_buffer_ctl_set;
> +	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>   	udelay(200);
>   }
>   
> @@ -1138,8 +1148,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		goto err_disable_clk_auxadc;
>   	}
>   
> +	mtk_thermal_turn_on_buffer(mt, apmixed_base);
> +
>   	if (mt->conf->version == MTK_THERMAL_V2) {
> -		mtk_thermal_turn_on_buffer(apmixed_base);
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}
>   

