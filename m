Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93CC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLeL9jKfipa/VjS3zS2dWv9s5mmuFH1TcnG1jZ4V6xI=; b=5FKhCHZDQ28vY6tP2fG1W77RGX
	eVerb0CLPCykb3sW8rPPG8FoLP8sRE0ZjgJwZ0oI2SpPvfplJ+mljR8rmyzhgm+7ih0IJScASrM2u
	QCkpYCivCQNzqp39qk7Ifx9jleRJPCsyu1k68PpdICPONtKQOq8apJPlBPkOYTZnnKRekQY1P/ruh
	PfgSuturQ2jneU1MYKduIGDSu3VHNb6BNVMbWzUKPHAtBsP3PozCke4ryKZB9+1j/mhs80Pno6bFG
	Nr5maqcWi/kOFMA4o4UGJLm8INaijmsmdqiCRC23oFCpyJfSAUvJa7DJh+L4ozif5KU/5t/HJUb61
	ys2xxJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Kt-000000093L2-0Sou;
	Tue, 21 Jul 2026 10:04:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Kq-000000093Jz-32bW
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:04:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47640541585so5687019f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784628262; x=1785233062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLeL9jKfipa/VjS3zS2dWv9s5mmuFH1TcnG1jZ4V6xI=;
        b=KEkh4SD7nji6DTxvT4yEfahx9+ZNoJ0P9hL0E2jFlUf0lySdzlwi/45wSmYGr5Q2tD
         VPUXRJrTnQICLkrVM8IWItr8hQZLbM4TNjiJCtsULjKYGL1hqDPzk5kfehGOGwQj+2Z5
         IfIpcpUMfD+AXYHwMPpoA4eHsDRPmBT/f9bsFWRCXCwUpwFxa1QNBDlGMNkRmag2V5HU
         MitWhkMJZ2Pakef96JFcudnR9fhP61bsmAXxuH6+yYeTTcRfd9fE76wH5tGmWbn9z9cw
         JpraleVf/e99OYjZpNE5ftCSa1/54Og49d2s4YsSjchWUcHS6kLXp3M9x8TPYePEcTBI
         GgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628262; x=1785233062;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLeL9jKfipa/VjS3zS2dWv9s5mmuFH1TcnG1jZ4V6xI=;
        b=ddQYejarFikTFTTKS+OpY4PLvKupMUfiAqZVg1UbkO33GdPwJ1txfZSxype2ofcxlC
         rKDOPToEzCoVXcpsxSK2YnoGLlCCgvuIt6YhlaeuhqE6Sy9nzJAL8c4kG8dRNjGttaUj
         Mv9jeA9KjZYMUKAkX+ScHc4aPuShXxUNH3bQBXeS031rssdM4PXi4VXzq9417CwS1VGv
         UZjmhAxNJ1Hs2jBOhd+vdeFcJ78JJ2Tuh8G736CVh8U0p1YZDWzVOdBJSf6ct5DEOiFj
         hB6tBsWBYgo1y4nxQ+EbaUyPI2R/gSEdNoI16RRyQ99pZxi7M60DZBpofEo3MTNEaYev
         +xAw==
X-Forwarded-Encrypted: i=1; AHgh+RrRExIvm82Ykhr3C1KrkwfoKvu8aQV049a4uwmGe6ScFk2wZllXCleQaJfd1HU+aG/HWnFX9yGf9kv9bGY3nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqLUN7RqwiK3IhtpbGQzBcX4Z90n66UZ5l2/+imMA7I6jJe1Hg
	IP/AqKIYPT7t9rYjGp+qMyUBSTTKsXt+giJQDq5VvFqwyjmTnLWuMai8+y20TvbgR0A=
X-Gm-Gg: AR+sD12QDche9HOeYD7S687EdhFUzJKLsj5Jmv3OnuItK6yiRclKMagKHYhazQnmMAC
	gJZ/cWs/CG5J/VdjdOQpmlEGT1VWpGYnvtkFEuVe+yqWp44hz2My/LAXl+txrvQaxokPJkNEz8x
	QjcQqzhrGZo3gQhYf2Fy7QchK3uNJNpjWmIFOVj9roJQu+8ydE4fJA1pMxgrRk2sBFF8JiFXYEb
	vVnRbjiKBlbxazvyTwwo4dXaYAVNx2VpBmUaZYo8j1qm2bn1iByQB/Dx4BvGfLCWDs08XWXHvGr
	IiAcHIX8DXiagvOI/tmRH4amLnhoUxOqR5O0ZhnX86paizYQfWmu6WMKoX6gGhlpBkPRVCXtMLW
	9TuJmJrEndqN5AvBNgpMhJn+y3CpEyLCmv6S9XBIiWH/PtNHM8LpxAIc8oG7p2TIfoaukXh1P29
	2P2Oxy+gcalbizGsGVHeBgR3HVGtvTZK8j2QuFCqOP/DCcRXJC+g==
X-Received: by 2002:a05:6000:238a:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47f6230f633mr19834090f8f.18.1784628261969;
        Tue, 21 Jul 2026 03:04:21 -0700 (PDT)
Received: from [192.168.2.177] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee9281sm40830238f8f.36.2026.07.21.03.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:04:21 -0700 (PDT)
Message-ID: <d0ec1fd7-89b6-4bf1-8d63-a31554b46932@suse.com>
Date: Tue, 21 Jul 2026 12:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
 <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030424_819623_1D49C50C 
X-CRM114-Status: GOOD (  27.43  )
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



On 20/07/2026 22:46, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On recent MediaTek SoCs such as MT6858, the kernel is required to use
> a secure monitor call (SMC) to enable or disable the modem power domain.
> The power domain control register can be read, but firmware prevents it
> from being modified directly. Some other parts of the power sequence,
> such as setting the ext_buck_iso register, still need to be performed on
> the kernel side.
> 
> In preparation for modem support, add a flag to enable this new power
> sequence for SoCs that need it. Power domains using this flag are not
> expected to configure any bus protection registers, since these are
> handled internally by the SMC call.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 50 +++++++++++++++++++++++++++---
>   drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
>   include/linux/soc/mediatek/mtk_sip_svc.h   |  3 ++
>   3 files changed, 49 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 8309a4b46afb..5b4d860318a4 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -57,6 +57,10 @@
>   
>   #define MTK_SIP_KERNEL_HWCCF_CONTROL	MTK_SIP_SMC_CMD(0x540)
>   
> +/* Secure MTCMOS commands for modem subsystem */
> +#define MTK_MD_MTCMOS_ENABLE		18
> +#define MTK_MD_MTCMOS_DISABLE		19
> +
>   struct scpsys_domain {
>   	struct generic_pm_domain genpd;
>   	const struct scpsys_domain_data *data;
> @@ -668,6 +672,34 @@ static int scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
>   	return 0;
>   }
>   
> +static bool scpsys_modem_sec_poll(unsigned long cmd)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 1, 0, 0, 0, 0, 0, &res);
> +
> +	return res.a0 == 0;
> +}
> +
> +static int scpsys_modem_sec_power_on(bool on)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long cmd = on ? MTK_MD_MTCMOS_ENABLE : MTK_MD_MTCMOS_DISABLE;
> +	bool tmp;
> +	int ret;
> +
> +	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 == 0)
> +		return 0;
> +
> +	ret = readx_poll_timeout(scpsys_modem_sec_poll, cmd, tmp, tmp,
> +				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int scpsys_power_on(struct generic_pm_domain *genpd)
>   {
>   	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
> @@ -686,7 +718,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
>   				  pd->data->ext_buck_iso_mask);
>   
> -	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
> +		ret = scpsys_modem_sec_power_on(true);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		ret = scpsys_modem_pwrseq_on(pd);
>   	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
>   		ret = scpsys_simple_pwrseq_on(pd);
> @@ -717,7 +751,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   			goto err_pwr_ack;
>   	}
>   
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
> +	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
>   		ret = scpsys_sram_enable(pd);
>   		if (ret < 0)
>   			goto err_disable_subsys_clks;
> @@ -739,7 +774,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   err_enable_bus_protect:
>   	scpsys_bus_protect_enable(pd, 0);
>   err_disable_sram:
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
> +	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
>   		scpsys_sram_disable(pd);
>   err_disable_subsys_clks:
>   	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
> @@ -761,7 +797,11 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
> +		ret = scpsys_modem_sec_power_on(false);
> +		if (ret)
> +			return ret;
> +	} else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
>   		ret = scpsys_sram_disable(pd);
>   		if (ret < 0)
>   			return ret;
> @@ -781,7 +821,7 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
>   		ret = scpsys_modem_pwrseq_off(pd);
>   	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
>   		ret = scpsys_simple_pwrseq_off(pd);
> -	else
> +	else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
>   		ret = scpsys_ctl_pwrseq_off(pd);
>   
>   	if (ret < 0) {
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> index 092403de66fa..8690690335ad 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> @@ -18,6 +18,7 @@
>   #define MTK_SCPD_SKIP_RESET_B		BIT(11)
>   #define MTK_SCPD_INFRA_PWR_CTL		BIT(12)
>   #define MTK_SCPD_SIMPLE_PWRSEQ		BIT(13)
> +#define MTK_SCPD_MODEM_SECURE_PWRSEQ	BIT(14)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data ?		\
>   					 (_scpd)->data->caps & (_x) :	\
>   					 (_scpd)->hwv_data->caps & (_x))
> diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
> index abe24a73ee19..6c95a29b79fa 100644
> --- a/include/linux/soc/mediatek/mtk_sip_svc.h
> +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> @@ -22,6 +22,9 @@
>   	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
>   			   ARM_SMCCC_OWNER_SIP, fn_id)
>   
> +/* Modem related SMC call */
> +#define MTK_SIP_KERNEL_CCCI_CONTROL	MTK_SIP_SMC_CMD(0x505)
> +
>   /* DVFSRC SMC calls */
>   #define MTK_SIP_DVFSRC_VCOREFS_CONTROL	MTK_SIP_SMC_CMD(0x506)
>   
> 


