Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B412C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxhhcNLD9sL5NmLXF8g0WapveH6yAh/sTiu1KtKU5hw=; b=YElyUhl9fjg1FSkKv8GWmE6pBM
	/XUE4O6I6MNNols0TsIBXVT55a81/tKmHbSJlyI97jX/Ks84WQrhoerEV0Z8gLfvP+jLcuMu+FoSk
	GMk6jvST+aKHxcIAltfUkBQYG4OcUdkj0tg9YW1cr2Lh6x6+JD5H5laWX/uUTRROk4rHlu+Ajrqr1
	2Zr0lASXkswR4m+XtHj2m1p9iAaX3iFmuidXCdQH0x1FfE+pKQ8D4/3h1A43jcNx3d9Y8aRxC6n+K
	pU8R+dA5KGXxDMfcP0uBCYQLlvloUztrPR6XUT5vX/1W/dCZ8zD5uGiHho4CmWVAYuoTuDb8VU77G
	BKLU1Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqdU-0085FX-8l; Tue, 31 Jan 2023 13:25:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqcm-0084q3-Lc; Tue, 31 Jan 2023 13:24:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so10608529wmq.0;
        Tue, 31 Jan 2023 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxhhcNLD9sL5NmLXF8g0WapveH6yAh/sTiu1KtKU5hw=;
        b=en3JHQMZLrTmM8qbHgMjJaXpvDU8yI8g7QuilWw5521Cam0BttosV4MMSnWLoHf5ws
         DnpcwE1BRzEHnwoAl5B7voNCTJst5DU98sNh9/NaUCQ+XeZnFBYKHS0L8U2ZK85v3QkK
         HFrH0aYdyG/Eq7dhcacKP272aJ+Dom75XIi9JCoDb+hJZYHEjgI7Yf5sGrzdPFFC9ybk
         zxvYnyx90ZZOvHTfXHVCAXlU/H6c2I3VXwzUriaqMrefs7ROYUflXMUcg/sNSoChFsa6
         62EEl/jWIabDEv+6emNcKdjzg92+oUSPlLT5Ce7OelY14JEM6z9YzmQUOkNaiX56R2zr
         5FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxhhcNLD9sL5NmLXF8g0WapveH6yAh/sTiu1KtKU5hw=;
        b=6ZPlIDRSj4/ibLo1uuP7BSUjnga96NC60E95HiVeUZvfkbLtxt3oKQWRjvV9UnnNYf
         sfZS7F15bcG7ehM6Ccs4CM1xpRp/1f4lvyU2eEdwAyGgf7tkiWBzQE0qhk/JGwzlfoof
         g0e05ldBAnNuAviJbX7Fu9ZmegbpJ1KgD718DruEF9xno2eCIdel2NhOBqr4DrEXL+QP
         /ryTehqqG6nXWHhdK5OIIMZwVMRXk7VHzzjuB469S2wR6tKhcKkVaas3JkFW9MpxOpsz
         fPUWMSDhGMm3B3iMnzQYAuAYhd05iMeplNF20UBVj/E/kFHVQoNCgNs0OiivR1q4hsLf
         gOSA==
X-Gm-Message-State: AO0yUKUP3ovUCUR1OpGwyqUZOgKEDi7b047KfK06XsKObc+PCvqza/Rt
	i8WNqNqJl2KCRkKyKqmSObU=
X-Google-Smtp-Source: AK7set+urS00mY19tuZGxh19k2nPNudaVX0PteOfgnQnWnR7Tf5PHTMazYdwKUobsbo6ou0QBDRGjw==
X-Received: by 2002:a05:600c:4f06:b0:3dc:5321:8457 with SMTP id l6-20020a05600c4f0600b003dc53218457mr3680464wmq.5.1675171470151;
        Tue, 31 Jan 2023 05:24:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d500a000000b002be0b1e556esm14549932wrt.59.2023.01.31.05.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:24:29 -0800 (PST)
Message-ID: <23de3e2e-81d9-5d23-748b-ee25cd5e39ba@gmail.com>
Date: Tue, 31 Jan 2023 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/14] soc: mediatek: mtk-svs: clean up platform
 probing
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
 <20230111074528.29354-9-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-9-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052436_770949_B49DCA46 
X-CRM114-Status: GOOD (  16.94  )
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
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> We only ever call the SoC specific probe function from
> svs_platform_probe. No need to carry that function in a global
> datastructure around.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 70ca9c9acae0..41c0ac5ed8d3 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -321,7 +321,6 @@ static const u32 svs_regs_v2[] = {
>    * @banks: svs banks that svs platform supports
>    * @rst: svs platform reset control
>    * @efuse_parsing: svs platform efuse parsing function pointer
> - * @probe: svs platform probe function pointer
>    * @efuse_max: total number of svs efuse
>    * @tefuse_max: total number of thermal efuse
>    * @regs: svs platform registers map
> @@ -339,7 +338,6 @@ struct svs_platform {
>   	struct svs_bank *banks;
>   	struct reset_control *rst;
>   	bool (*efuse_parsing)(struct svs_platform *svsp);
> -	int (*probe)(struct svs_platform *svsp);
>   	size_t efuse_max;
>   	size_t tefuse_max;
>   	const u32 *regs;
> @@ -2409,11 +2407,10 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   	svsp->name = svsp_data->name;
>   	svsp->banks = svsp_data->banks;
>   	svsp->efuse_parsing = svsp_data->efuse_parsing;
> -	svsp->probe = svsp_data->probe;
>   	svsp->regs = svsp_data->regs;
>   	svsp->bank_max = svsp_data->bank_max;
>   
> -	ret = svsp->probe(svsp);
> +	ret = svsp_data->probe(svsp);
>   	if (ret)
>   		return ERR_PTR(ret);
>   

