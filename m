Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B457C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378E62063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3gA6wbQD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh/kxXRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378E62063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n3Fxpi/G+ew+k+LBprF3Q83xVr4cqfQwRI1p5wc5l5s=; b=3gA6wbQDKtEDcU8eqE6MSntwi
	LxHuWncDP+49DDYaR0eGRgnVCpPM1GqYU+j6mIj9LM+t/dn4QGdLmg4TVgo3vKe4eoAEiiBLRfBHo
	6lo66OXyXlSh/3p7PvE2gUU6MOGiQUE3ecBjNrkpFknqfbqegmWftcjT7l07SY6Wr/OiDInBiRWKD
	dmwUwAXV0eJOxj2AkEtDnMcT3OPg6qGcRhbKV2wWNs3wX5ZVCo5jSUDUdez570wHhi1GCpnDxtWNo
	MYsu715sDbCgL+29zAgcRKFq1+RXK9J6zeUWE+0qw/6fiMRqwFZVEOMKzFvGDoECm1j1TtjXSJddH
	E/1wzF/GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttxw-0002BE-KZ; Fri, 10 Jul 2020 14:25:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttxu-0002AI-6e; Fri, 10 Jul 2020 14:25:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id z2so6162450wrp.2;
 Fri, 10 Jul 2020 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J2TSVXXxCrTLY4NrTstCcWcFdBTWUGySy01vayP2bug=;
 b=Kh/kxXRH/GEtgV9DtbuSQvl6bi8+nr5NoUiKjZvT2mwAx0kw7PUBc+dKtaDXIpMj9u
 +0LeqXHZEx0f3DAhy/N/wlZx6RLlOBZLsopWYGpUMb61BWTtg1WeMC+h9e1VQTPc8454
 Laaw2eMrQ+SuMcZf+zrBZpakhXkNnqwsi6jFZi8uTaRGQge9jFMUuQzP8fIA7CCamag6
 KA0iZOFxg9JWGVneGDaX3CJ4mlyYh6AEP8KOypKCU0iPVO/U2Y7gXbIWdYs/9YN2GSeb
 eEfaMqxU0FMe4yINqY4dUNf5aPsMdR2cSgRd80NV4jtMBzgWp0JfT4Kf/YY4MpBIZQXq
 1O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J2TSVXXxCrTLY4NrTstCcWcFdBTWUGySy01vayP2bug=;
 b=BY33WBmIDMnVprRGVZ15FPovz+rXSF1Z8phyLurBLFA6k54hhUVi10aKA/qsXyhdAx
 iCmUQI/0K+Ub+j2NIKveuL0amnP0LzIExqZShTqINJa8/Pk4RSvfudoOAUtNFVuSNcOD
 Yhip4yTh9cAyQdjCKjXngxCb9S4WP88vWQVFCbdT2rdf+Uf3ZIPTVAGs45UO/RRIewk1
 Dpe7JzRGEEWcPpXpAB+x6vrFMEmVC6joSQLmbhfTaHkvuLdzmohI2Fr7QxTI+q1Cheoh
 UAq7TTl3NPRbdyrY49Pif02KVrRUKmCLKq4p9KV4gvkcfwb4UGJ1NetI0Sxw95Vlalps
 DLRg==
X-Gm-Message-State: AOAM531JzI3FdoXWTQ/MtH2xX8ZPlNonlJdGMhD+Wz2iSmlQmd2/7eFd
 ezbrbgqgPrBsvpe4psK9OLIVD1YE6XM=
X-Google-Smtp-Source: ABdhPJzpZ+aplToWnYe5A8tOusuTfhg+dlCf/JDDNEaD96yPyy2zwuPkJBHGPTp5yt6O2xlLKPTiJA==
X-Received: by 2002:adf:dc90:: with SMTP id r16mr68810902wrj.264.1594391125277; 
 Fri, 10 Jul 2020 07:25:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id g13sm10429136wro.84.2020.07.10.07.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 07:25:24 -0700 (PDT)
Subject: Re: [PATCH 3/4] mfd: mt6360: Fix flow which is used to check ic exist
To: Gene Chen <gene.chen.richtek@gmail.com>, lee.jones@linaro.org
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-4-git-send-email-gene.chen.richtek@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3205bb9b-c7b4-c99a-2673-f3a56cc0addf@gmail.com>
Date: Fri, 10 Jul 2020 16:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594117856-14343-4-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_102526_264760_58ADA993 
X-CRM114-Status: GOOD (  24.31  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 12:30, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix flow which is used to check ic exist
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/mfd/mt6360-core.c  | 28 +++++++++++++++++++---------
>   include/linux/mfd/mt6360.h |  8 ++++----
>   2 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 2dd5918..4bb2949 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -293,6 +293,23 @@ static const struct mfd_cell mt6360_devs[] = {
>   		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
>   };
>   
> +static int mt6360_check_vendor_info(struct mt6360_data *data)
> +{
> +	u32 info;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MT6360_REG_PMU_DEVINFO, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((info & MT6360_CHIPVEN_MASK) != MT6360_CHIPVEN_VAL)
> +		return -ENODEV;
> +
> +	data->chip_rev = info & MT6360_CHIPREV_MASK;
> +
> +	return 0;
> +}
> +
>   static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
>   	MT6360_PMU_SLAVEID,
>   	MT6360_PMIC_SLAVEID,
> @@ -303,7 +320,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
>   static int mt6360_probe(struct i2c_client *client)
>   {
>   	struct mt6360_data *data;
> -	unsigned int reg_data;
>   	int i, ret;
>   
>   	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> @@ -319,16 +335,10 @@ static int mt6360_probe(struct i2c_client *client)
>   		return PTR_ERR(data->regmap);
>   	}
>   
> -	ret = regmap_read(data->regmap, MT6360_PMU_DEV_INFO, &reg_data);
> +	ret = mt6360_check_vendor_info(data);
>   	if (ret) {
> -		dev_err(&client->dev, "Device not found\n");
> -		return ret;
> -	}
> -
> -	data->chip_rev = reg_data & CHIP_REV_MASK;
> -	if (data->chip_rev != CHIP_VEN_MT6360) {

Why not only applying the MASK here instead of put this all in a new function?

>   		dev_err(&client->dev, "Device not supported\n");
> -		return -ENODEV;
> +		return ret;
>   	}
>   
>   	ret = devm_regmap_add_irq_chip(&client->dev, data->regmap, client->irq,
> diff --git a/include/linux/mfd/mt6360.h b/include/linux/mfd/mt6360.h
> index 9fc6718..5ec0f5d 100644
> --- a/include/linux/mfd/mt6360.h
> +++ b/include/linux/mfd/mt6360.h
> @@ -30,7 +30,7 @@ struct mt6360_data {
>   };
>   
>   /* PMU register defininition */
> -#define MT6360_PMU_DEV_INFO			(0x00)
> +#define MT6360_REG_PMU_DEVINFO			(0x00)
>   #define MT6360_PMU_CORE_CTRL1			(0x01)
>   #define MT6360_PMU_RST1				(0x02)
>   #define MT6360_PMU_CRCEN			(0x03)
> @@ -233,8 +233,8 @@ struct mt6360_data {
>   #define MT6360_IRQ_REGNUM	16
>   #define MT6360_IRQ_RETRIG	BIT(2)
>   
> -#define CHIP_VEN_MASK				(0xF0)
> -#define CHIP_VEN_MT6360				(0x50)
> -#define CHIP_REV_MASK				(0x0F)
> +#define MT6360_CHIPVEN_MASK			(0xF0)
> +#define MT6360_CHIPVEN_VAL			(0x50)
> +#define MT6360_CHIPREV_MASK			(0x0F)

Same here as in the other patches. Don't just rename defines if there is no good 
reason.

Regards,
Matthias

>   
>   #endif /* __MT6360_H__ */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
