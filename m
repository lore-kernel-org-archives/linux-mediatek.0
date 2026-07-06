Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D45EC43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jA188Me9AgAO7O1Is8f9n+gtNtSnCCBgUgpsHEqHR9Q=; b=hS1Tu3yAV0aOCZsQR8w9cmKOh8
	3W6g5EjHeFXOepGpVX7NgH1hqSYIBO8lwXO7CPygdQ0nEygQXt7Ec/JfYGtJ50lQEXgLpohmz6vQH
	OhetdeitRfUs7uz82eZA//2+no3q8XikAbpmBUkX2R8x6VMj2DlVnlqWBbRUWE7neNXu78bOOTodC
	Wb9Q0icDj1c0DDUVpltFqaoYbT+vgKLUaLbNmk9F2RNyJz23frcs8RokH1kdc98WqQzq50ZpcVYm0
	qfQZ+jTD7m8Wkf1AoRnyxP8O85h91u+Up6cG5sPo8DVouGcnqFLbb4wkhaz2D5yW+DsFdfcSlN7PF
	8ozb0uUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl7u-0000000CrvS-1dt8;
	Mon, 06 Jul 2026 15:20:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl7r-0000000Cru0-1mB2
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:20:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so14869275e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783351250; x=1783956050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jA188Me9AgAO7O1Is8f9n+gtNtSnCCBgUgpsHEqHR9Q=;
        b=QD6uJ36cOVFS9t4d4oHmzuLKYuAG/cCplJ+1ZXR4fMb8eHoYFTypn02tmMik82UEP9
         gxtD7zu6OFy2PuRlUh4dPMyl4F53ndZ3iFmgh1E7cQiIWiWSCIRdWFmZO78Nmz9G5Jvz
         U4ZWzCAryMtjoNTvcmLNcku04qlrgtWVGNYzG9inSSWY4uu8QDcyS3n9q7ij+d+41yl/
         LnLzdVgbhtUrm1eQB0xFQempEHVdQ4DOqPootrKME9dklHub/u9y4qduenpdlb9WtE5S
         3cxRFr2j7LOFMyuwao/GKhiLV8Xuqgiu8XIjVO/lbAEHKlIBxC+oU9OxIioDqu4HVuk/
         MTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351250; x=1783956050;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jA188Me9AgAO7O1Is8f9n+gtNtSnCCBgUgpsHEqHR9Q=;
        b=BcoT/SUqOYXJ0dNNq/iDnjjIxrzh+yBKSdyKmeuVzUujH8wLE+PGbbowh/LezXOTiB
         DotssSJGUykIxL7Fd5NfkvGMHB/DZGfs5jmOJGFC/jXyAk0NMSvbZmDZ6daEd2EjLnd1
         MwGSk+4PjCKvMkpKVZleCHgF8+6FI3mlejCk1YKgmBN06yHCf+NtciNaT/ZMsltj+7TG
         CS3UQoR5bX35p2jcI/Ec+kOFEMKPSJi9bYiv2D00LjPOKqlTwItjvJ3xcETsDcE3fc5L
         oAhpv2Ao2ge//g6O3EkXbjoqlmuHey/rr+0Gf6jbe5G2r5efDkUdoZfE/R7c/pxnbQUz
         VkNA==
X-Forwarded-Encrypted: i=1; AHgh+RrHikKGSzYXWzmLz2E1nsC3oT2kvV+/6xGhXkGbhmkilGW1EClbSDI9NrviXO0rAZAWP88fmBGovpWWWpqS2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUPDqhHKISPeYzz8kFj8gHMAA/2V4qwEqZuNVRq2oUmnuaJNnr
	0eSCE7SJvwUXpo1RsA+yEI2COSvh1OWnWpXQqfNW6JFPHcpst0wkJWPj66DTtsSbWgo=
X-Gm-Gg: AfdE7cmgUgS5Qqgbhvf/T21yLJenOUb/myQCthAbPfp1upPGDDyXYQ02CTEVahjHjgN
	+WpKZeretkGWBYg1+z4Kok6un7gYj4HnuGH2NjiHqBVlleDKrZnw/zWg8qD5W4lBt9ahkSCupBH
	YWAfbNzpnKsSNEvaEea/nVZcTSd6qCiljAACKvwZMx+5f64ssEm3eyBU47dqMM3Re8kYbdcI7/G
	93ZFKMWrE6f+w+pV5t1mnHWs8UeqgCxRTl6Jf5mgB7HzHp9AGRzZUNZWYMstHhogHaw8U85x8DE
	c0eG86u0t5kMpW9gjIQ3u+3tpeJX7ksX+9rli7e0pxtpP4qymPT40rV9dxAv2xjQlrusZcQr8dj
	5wpv2Z6vNgMDT9B0MM7eiAV2ciSH5wXaL6AWKWul7S4G+c5/AfM1pXm2HTqu5sMP9M6k3HLCIhO
	6rFKy1oTTd8IPXykvAgThv4b/Q46o6cSCrvozQteE6DQNk/+A+SA1l8yz+ElUM
X-Received: by 2002:a05:600c:19cc:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493df0930a6mr12030995e9.26.1783351249504;
        Mon, 06 Jul 2026 08:20:49 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm27008175f8f.26.2026.07.06.08.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:20:48 -0700 (PDT)
Message-ID: <42e9c942-5b96-4cd4-a25b-51d1a7e8eff7@suse.com>
Date: Mon, 6 Jul 2026 17:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pmdomain: mediatek: Add support for Direct CTL simple
 power sequence
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_082051_529689_D0E4E3D9 
X-CRM114-Status: GOOD (  29.95  )
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



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> Some new SoCs like MT8196, MT6991, and others, have got one
> additional power controller (usually in the HFRP Multimedia
> block) which needs a simplified power on/off sequence while
> using Direct Control strategy.
> 
> Domains using the "simple power sequence" are not backed by
> the RTFF hardware, have no Bus Protection mechanism, lacks
> the ISO, PWR_ON, PWR_ON_2ND bits, and therefore get enabled
> automatically after getting out of reset.
> 
> This simple power sequence is then a subset of the full one
> as only needs the enablement of the specific power domain's
> clock input and reset (where, again, after getting out of
> reset, the ISO and PWR_ON bits are automatically internally
> getting flipped) to enable or disable (power on or off).
> 
> Moreover, the simple power sequence power domains guarantee
> that they always get enabled/disabled after executing the
> relevant power sequence (on/off) so, differently from the
> others, there is also no need to poll for a PWR_ACK.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 87 ++++++++++++++++++----
>   drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
>   2 files changed, 72 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index db543d4b1813..5276adea1d04 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -549,9 +549,11 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
>   	return 0;
>   }
>   
> -static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
> +static int scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
>   {
>   	struct scpsys *scpsys = pd->scpsys;
> +	bool tmp;
> +	int ret;
>   
>   	switch (pd->data->rtff_type) {
>   	case SCPSYS_RTFF_TYPE_GENERIC:
> @@ -583,6 +585,41 @@ static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
> +
> +	/* wait until PWR_ACK = 0 */
> +	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
> +				 MTK_POLL_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int scpsys_simple_pwrseq_on(struct scpsys_domain *pd)
> +{
> +	struct scpsys *scpsys = pd->scpsys;
> +
> +	/* Enable subsys clock input and trigger power domain reset state */
> +	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
> +	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> +
> +	/* Wait for the hardware to stabilize */
> +	udelay(1);
> +
> +	/* Get out of reset: set power on */
> +	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> +
> +	return 0;
> +}
> +
> +static int scpsys_simple_pwrseq_off(struct scpsys_domain *pd)
> +{
> +	struct scpsys *scpsys = pd->scpsys;
> +
> +	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> +	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
> +
> +	return 0;
>   }
>   
>   static int scpsys_modem_pwrseq_on(struct scpsys_domain *pd)
> @@ -605,14 +642,24 @@ static int scpsys_modem_pwrseq_on(struct scpsys_domain *pd)
>   	return 0;
>   }
>   
> -static void scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
> +static int scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
>   {
>   	struct scpsys *scpsys = pd->scpsys;
> +	bool tmp;
> +	int ret;
>   
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
>   
>   	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SKIP_RESET_B))
>   		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> +
> +	/* wait until PWR_ACK = 0 */
> +	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
> +				 MTK_POLL_TIMEOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>   }
>   
>   static int scpsys_power_on(struct generic_pm_domain *genpd)
> @@ -635,6 +682,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   
>   	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		ret = scpsys_modem_pwrseq_on(pd);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		ret = scpsys_simple_pwrseq_on(pd);
>   	else
>   		ret = scpsys_ctl_pwrseq_on(pd);
>   
> @@ -662,9 +711,11 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   			goto err_pwr_ack;
>   	}
>   
> -	ret = scpsys_sram_enable(pd);
> -	if (ret < 0)
> -		goto err_disable_subsys_clks;
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +		ret = scpsys_sram_enable(pd);
> +		if (ret < 0)
> +			goto err_disable_subsys_clks;
> +	}
>   
>   	ret = scpsys_bus_protect_disable(pd, 0);
>   	if (ret < 0)
> @@ -682,7 +733,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   err_enable_bus_protect:
>   	scpsys_bus_protect_enable(pd, 0);
>   err_disable_sram:
> -	scpsys_sram_disable(pd);
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		scpsys_sram_disable(pd);
>   err_disable_subsys_clks:
>   	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
>   		clk_bulk_disable_unprepare(pd->num_subsys_clks,
> @@ -698,16 +750,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   {
>   	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
>   	struct scpsys *scpsys = pd->scpsys;
> -	bool tmp;
>   	int ret;
>   
>   	ret = scpsys_bus_protect_enable(pd, 0);
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = scpsys_sram_disable(pd);
> -	if (ret < 0)
> -		return ret;
> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
> +		ret = scpsys_sram_disable(pd);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
>   		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
> @@ -721,15 +774,11 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   
>   	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
>   		scpsys_modem_pwrseq_off(pd);
> +	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
> +		ret = scpsys_simple_pwrseq_off(pd);
>   	else
>   		scpsys_ctl_pwrseq_off(pd);
>   
> -	/* wait until PWR_ACK = 0 */
> -	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
> -				 MTK_POLL_TIMEOUT);
> -	if (ret < 0)
> -		return ret;
> -
>   	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>   
>   	scpsys_regulator_disable(pd->supply);
> @@ -1083,6 +1132,12 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>   		regmap[2] = NULL;
>   	}
>   
> +	/* If no access controllers are needed, don't allocate and don't fail */
> +	if (num_regmaps == 0) {
> +		scpsys->bus_prot = NULL;
> +		return 0;
> +	}
> +
>   	scpsys->bus_prot = devm_kmalloc_array(dev, num_regmaps,
>   					      sizeof(*scpsys->bus_prot), GFP_KERNEL);
>   	if (!scpsys->bus_prot)
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> index a5dca24cbc2f..092403de66fa 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> @@ -17,6 +17,7 @@
>   #define MTK_SCPD_MODEM_PWRSEQ		BIT(10)
>   #define MTK_SCPD_SKIP_RESET_B		BIT(11)
>   #define MTK_SCPD_INFRA_PWR_CTL		BIT(12)
> +#define MTK_SCPD_SIMPLE_PWRSEQ		BIT(13)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data ?		\
>   					 (_scpd)->data->caps & (_x) :	\
>   					 (_scpd)->hwv_data->caps & (_x))


