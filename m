Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EA3C38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCueC+kG6+G8iq3m73OLmpsWjfxU0yEo1uLN/H9w3xc=; b=FgRtO3Zk++gQ17Dm1/iV5k2joM
	jTgZvExsMQQ3GRNcUKqoKEXl+heoFaoRaHZfwc2ihmdetP1sbGHTQmuiXwuMJJGF6xmvhoGb9Qn/U
	/xeNldgGm66eOS+WBsBpofoCgDaQJ1KfJfrRUQg5EwnjTWNYaYyKC3vqM4ZH18wJSqeePr/AE2PH9
	Q2LmMS4ppz97rWyFyywi0qU9yraYRAOXl84KB0W8IWxSyz2aOcwSTL5UK+4Vobjt+m8y4Ny3ZZBao
	KRQno4AhY5uRkltOl6lVsxvcKfJWbvv+SwHhaaaDRtecWrHiWH3NB1Jc//SV8OwiwAWAXjMSoul7H
	fw29zUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYyv-006MeK-0K; Thu, 19 Jan 2023 17:45:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYyg-006MZa-6M; Thu, 19 Jan 2023 17:45:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id x36so3767044ede.13;
        Thu, 19 Jan 2023 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCueC+kG6+G8iq3m73OLmpsWjfxU0yEo1uLN/H9w3xc=;
        b=Po8NK4Esq7bg3ZGf7dFDhO1x/2AzxLym3eT3SdebR/lqBPt/6rm1dyOGbOtbtCZQ9C
         nH78jIH/1/EQhKEGA7YJ4lqU5xgPvbu36kxO+51OHKbd0y9UR2dgIACedEWIUpfAOGjm
         uGNJLyvocpn8ut5V/TygukFbgXCzPWvxjNkvrgZ+/7UZWaPeL6ycyqUQCqyh1Mx0anwh
         2fG6M84W0RKLMMba51agXis+J8Ul7+BIkqZnv2RWd/p6dzA+bj3h3z2MV/WJTqPo6NXo
         6uK7nc9/AL25wIdAWFisQJXGwi6+EOWd7z5mEW12XCHMR7kk6Zkp/wUzJ7SYQTEnHxxp
         JdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCueC+kG6+G8iq3m73OLmpsWjfxU0yEo1uLN/H9w3xc=;
        b=ZSAogWJP2Ji5PDQrxkH1UBlCOWTONvkXJW7A1f38/GEbxVFkzJUSLW/qu+iuFF8hoO
         fr5PYlPVp/bC3tlUmjowH2lIhGNwHunPYfyXI+SPvz+c7RDreA1QLHsKJF2cxehimF55
         IuTBE2gqzfqQ1/3e/1zvdRsVtyKsUdDCa65UckUkU9iypOSQFJIkkizrUvVzs6Nkd5sZ
         C1F1gSM0soEvEEsV2Pn9rPtPgp9GOPTT9tWGv0lO5DSzXFWMLaWc8qwszdHwq4IaOdl3
         1XLdrAB1tu3PghIiEYRxSSdAyhyLi3TpFoudaUYAze5Ze70i0c1qrfj4AF9kkqP9BEQO
         fb8Q==
X-Gm-Message-State: AFqh2kpcQCEhsWC1P1xagg4IKuUUVgzFqUbbi4jlpU54c/L8A8bJo+S3
	1fqzZr1pS1tSUs/XAEEhuzbQ9/3NDaSAwg==
X-Google-Smtp-Source: AMrXdXvIE5RyU6AO9ZuhqpGaXSnAy81/ruty02LgQqV5TocZY4F1CDUxuJiu1LLCH/rK4JK/d2wUtA==
X-Received: by 2002:a05:6402:10d4:b0:48f:fcc9:665e with SMTP id p20-20020a05640210d400b0048ffcc9665emr21369738edu.0.1674150326317;
        Thu, 19 Jan 2023 09:45:26 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k26-20020a508ada000000b00487fc51c532sm16354456edk.33.2023.01.19.09.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:45:25 -0800 (PST)
Message-ID: <e20e80fd-cb10-2f41-b5d8-8d6673e2b506@gmail.com>
Date: Thu, 19 Jan 2023 18:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] soc: mediatek: pm-domains: Add buck isolation offset
 and mask to power domain data
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
 <20230117032640.13504-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230117032640.13504-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_094530_304570_4EC9284B 
X-CRM114-Status: GOOD (  13.64  )
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



On 17/01/2023 04:26, Allen-KH Cheng wrote:
> Add buck isolation offset and mask to power domain data.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-pm-domains.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 7d3c0c36316c..a5f24c58e35a 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -81,6 +81,8 @@ struct scpsys_bus_prot_data {
>    * @ctl_offs: The offset for main power control register.
>    * @sram_pdn_bits: The mask for sram power control bits.
>    * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> + * @ext_buck_iso_offs: The offset for external buck isolation
> + * @ext_buck_iso_mask: The mask for external buck isolation
>    * @caps: The flag for active wake-up action.
>    * @bp_infracfg: bus protection for infracfg subsystem
>    * @bp_smi: bus protection for smi subsystem
> @@ -91,6 +93,8 @@ struct scpsys_domain_data {
>   	int ctl_offs;
>   	u32 sram_pdn_bits;
>   	u32 sram_pdn_ack_bits;
> +	int ext_buck_iso_offs;
> +	u32 ext_buck_iso_mask;
>   	u8 caps;
>   	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
>   	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];

