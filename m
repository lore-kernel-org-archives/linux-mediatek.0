Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7EBC38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5RJqblptK4/I1QKvuqzaQWihSAsPbhuGtEAuJnE228=; b=ywQfogCrwjbSZtr/GnruvhZeKH
	oS7iqvTGA+UEkRsXb6EG/AV24wxpIL7Q6Z9t7Kmc7vdRwEzzbp4U4PfsnAS3dwm7eDt8m8/8TTRK7
	5tpGq+iVtxpclvCXMdrkN5y1K6Fa24+rW+E3d3XNalUg0ZJvpsY0CJKNwyKgoeJtBOCCfSNZUzE56
	u2/JtwQG89pv5+Zy6FOcnbuJg9gkNkdp1AL2T5xa3COx2npRHtreP1Hga74hfkVgt5ecFfj2YviET
	/C5NDvA2LPKuovfdM6+mF0mzWIN93ke1UJVwALuBAT7s4L61dbq/ohWINmQcoR/dXwlu9JBOkZNja
	ciscKwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZ00-006N4X-LP; Thu, 19 Jan 2023 17:46:52 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYzh-006Mw2-Pu; Thu, 19 Jan 2023 17:46:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id mg12so7687907ejc.5;
        Thu, 19 Jan 2023 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5RJqblptK4/I1QKvuqzaQWihSAsPbhuGtEAuJnE228=;
        b=Y77KxKdd5+LbM3Jqo2daeLmZkrJEtmVGbVkERc+m3ZABiuK08Ggfh5tYOl5yrHIAY0
         q8h0Rbd9bnC4/j4epCuS9/EKfMUTYsHGmETd/hYNT84AaRTqRA7fKQRirwVelv4jSNX3
         D0U0wNKq98ejFHrPpzEwVWn9uYrt+VlhPLwCNqGH+3/xjAxYzPWcpBY+L4RhKSFNKwc3
         G6JOtiiycsBSWYxl8Oo87WnISdzCFI1qAic02InCukak2BLgrcwxiy0+/iFiNO5T3nKr
         +Ye08LjXgaDtOlw1NrlnJ2R6CSfR9h5aD76iEvdK7HxpKNexEOb8C4kGk32KXkROA3hC
         Optg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5RJqblptK4/I1QKvuqzaQWihSAsPbhuGtEAuJnE228=;
        b=3nE7a0X1f1FLHhy/MhdYtbolIEK75E3ULbtTsK3517Pt9DUDs1yiAKOr+9voGla6xX
         rOgz+1vBKJdz28NYcm4FnZILuT8uxJCoAPMfyPciDoVCjb56eEW1TscqbEFJ1Vey8BLn
         e2yzSF5BU7/17Cj4y1HP/32heyEixDRHUr1GMBqmL62bb9XW3MuxxRM/efnZrNPJ1KI6
         b45GZQSg/tyjTrkcS06DnMuFBgZhV93vmxl50OB8TlMYLZpN9HPxYQgYgrwNRkNA1Au7
         SemPUMGQalvKFUYBS24QKjaU7wyvNSrgAG83XzNY9CV6wVTNh+l26wCmQ5KWZS42mwBU
         ChFw==
X-Gm-Message-State: AFqh2kpFsPqJjdDSW5QwsSrceCar7Gn/KORz0+e5gwYW2eLC/s30R8zH
	FJqegu2KAbgUeSal6TNITGg=
X-Google-Smtp-Source: AMrXdXsFka3LYJbePLZ9HkMmo1a+eUIgpgXI6HfcAEJAezkdgpKTPPfnMDNKcuy+udAxYwE3LwokhA==
X-Received: by 2002:a17:906:f49:b0:864:8c78:e7ff with SMTP id h9-20020a1709060f4900b008648c78e7ffmr7861249ejj.23.1674150391578;
        Thu, 19 Jan 2023 09:46:31 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709063d2200b0087276f66c6asm4487651ejf.115.2023.01.19.09.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:46:31 -0800 (PST)
Message-ID: <60759e5f-4760-1b0c-2848-06ec5a07b40a@gmail.com>
Date: Thu, 19 Jan 2023 18:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] soc: mediatek: pm-domains: Add buck isolation setting
 in power domain
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
 <20230117032640.13504-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230117032640.13504-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_094633_929108_29D4D9D0 
X-CRM114-Status: GOOD (  20.45  )
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
> In some chipsets, we need to disable EXT_BUCK_ISO before turning on the
> specific power pm-domains (mtcmos), such as ADSP in MT8192 and CAM_VCORE
> in MT8188.
> 
> Add the MTK_SCPD_EXT_BUCK_ISO flag to control the buck isolation setting
> in the mediatek power domain driver.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")

 From my understanding this patch does not fix anything. It's a feature needed 
for new HW not supported by the mentioned commit. I applied the patch but 
droppend the Fixes tag. If you do not agree, please explain why we need it.

Regards,
Matthias

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 8 ++++++++
>   drivers/soc/mediatek/mtk-pm-domains.h | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 474b272f9b02..be972e35b26e 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -218,6 +218,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	if (ret)
>   		goto err_reg;
>   
> +	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
> +		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
> +				  pd->data->ext_buck_iso_mask);
> +
>   	/* subsys power on */
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
> @@ -272,6 +276,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
> +		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
> +				pd->data->ext_buck_iso_mask);
> +
>   	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>   
>   	/* subsys power off */
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index a5f24c58e35a..5ec53ee073c4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -10,6 +10,7 @@
>   #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
>   /* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
>   #define MTK_SCPD_ALWAYS_ON		BIT(5)
> +#define MTK_SCPD_EXT_BUCK_ISO		BIT(6)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210

