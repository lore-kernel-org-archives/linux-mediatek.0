Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B13C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGao7bFNvayRLXYx+1NJAmEJ9xV7NpkTyTJLNdomiEY=; b=EByOv+28+rV4xvN7NkfJ8ac/R4
	6UvptSC/KqMH+zu8HVP6fx1FhmM8Nwj2Jkh2IdSCn0ZoYLCwx/h58+5UD8Id73JYBdE1KMpnwtFH2
	cxeMkZFbwhuSfwlBOXRf/gNuGSt4SuUnhKzSZFa1IGPiL9cx1PLnbOmh3Q9pNAOMHnWP3N3gZJflQ
	ihpq6C9iWyQwxypSInGI6hY23XZBQGoXxUebv7K6tSmdCZRC+OrNSiDkgo8UfpaHUhNdKzJdwxPQT
	qY/biYnt5VU5uDJdhfDbfDIXxTT+QwZEiw7gZo4Vh291PBLQb/pfI2Mu33s0Bnv//N4itgVYU/KIV
	pLyb7oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSMw-003IMf-6h; Mon, 30 Jan 2023 11:30:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSKo-003ICe-63; Mon, 30 Jan 2023 11:28:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso7899649wms.3;
        Mon, 30 Jan 2023 03:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGao7bFNvayRLXYx+1NJAmEJ9xV7NpkTyTJLNdomiEY=;
        b=awYjgw8Ey+gXsNO+2+7zD6fJ9bbqNMH/gNO548BB9Kz1+2anZVVtWbhdudmAF55fy0
         OHZcn3DUgKKkwGtQbs+Z1xYWf+I+/u8IdMhzQOgbNm4dyxpG8AQJ4Z9qFCYPCUFFtf4F
         onQv92SJnk4i5Os1qTRN9Jg+b+kxTe029QuoQyCfG5Nh8PDkMhrDw6HVyjsyhKThxT32
         i3tm+BGCFlE2BTQWuk9dHXjdKAaiKTq/5lWPS0Y1S64XlOIoXBgDjiyRV1ot4X3QqWqA
         mLjX3M9ai0pLX0Sy0l4TFV4+l5VYvGzT2u2t/vwFfosrjic6XUazi2qN6HGyrDO+gl5/
         4rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGao7bFNvayRLXYx+1NJAmEJ9xV7NpkTyTJLNdomiEY=;
        b=1atyKBIosZLroRvuwf/x+tcpaZZYrZMPkSXsCxoWxwRi1u/G5eOhDxLugG7EBzmqKc
         5GWGwPdE2/GRbt6JitYkO/huMzrqNlQmnec5N2psJ64sB8R66q5jW9cD2p+XHFtclfiw
         7A4q66XexDRgRHcIMSHh8X4x/x7937Dklao39UHIlOS3s7POpySI8hqwT/TxvzFVU81q
         0+EA4uJF/xHDWpDbx2J/DjUjzvvZ0obD7JFuhSpTJ2JFYufOke6Wata/2RESd8QGCMfL
         sE2iDfSEosvycJlaQzxbEVAExjFetmN29qd+jpqdpF56KR5lduWJ2LJK73nutX2rIXlL
         SVqw==
X-Gm-Message-State: AFqh2kpD+OvvBEik03wmrWi6ouOSAPtpUFswZinJ0pL8JinkoB+aBJfu
	wPGSJsLwBXTB1yl8HOYcmHM=
X-Google-Smtp-Source: AMrXdXuqwouNavCIzGS+zCP5ZhZ28lH6UR0DubxAWdWEi0qJwi71JGL+LChymyRIdN59GMOrNnlUrg==
X-Received: by 2002:a05:600c:4e4b:b0:3db:2e6d:9f79 with SMTP id e11-20020a05600c4e4b00b003db2e6d9f79mr37379881wmq.39.1675078100854;
        Mon, 30 Jan 2023 03:28:20 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id hg6-20020a05600c538600b003dafbd859a6sm15943157wmb.43.2023.01.30.03.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:28:20 -0800 (PST)
Message-ID: <3e88c585-5d45-7183-db50-030415bac9da@gmail.com>
Date: Mon, 30 Jan 2023 12:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/4] soc: mediatek: mmsys: add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-5-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118031509.29834-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_032826_254766_E1C8F79F 
X-CRM114-Status: GOOD (  19.83  )
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



On 18/01/2023 04:15, Moudy Ho wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add MT8195 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 22 ++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 38f1dd92e7c6..176fdc866e22 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -88,6 +88,16 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
> +	.clk_driver = "clk-mt8195-vpp0",
> +	.is_vppsys = true,
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
> +	.clk_driver = "clk-mt8195-vpp1",
> +	.is_vppsys = true,
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
> @@ -264,6 +274,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	if (IS_ERR(clks))
>   		return PTR_ERR(clks);
>   
> +	if (mmsys->data->is_vppsys)
> +		goto out_probe_done;
> +
>   	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>   					    PLATFORM_DEVID_AUTO, NULL, 0);
>   	if (IS_ERR(drm)) {
> @@ -271,6 +284,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return PTR_ERR(drm);
>   	}
>   
> +out_probe_done:
>   	return 0;
>   }
>   
> @@ -323,6 +337,14 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8195-vdosys0",
>   		.data = &mt8195_vdosys0_driver_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8195-vppsys0",
> +		.data = &mt8195_vppsys0_driver_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-vppsys1",
> +		.data = &mt8195_vppsys1_driver_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8365-mmsys",
>   		.data = &mt8365_mmsys_driver_data,
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..54a96b83afb4 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -91,6 +91,7 @@ struct mtk_mmsys_driver_data {
>   	const struct mtk_mmsys_routes *routes;
>   	const unsigned int num_routes;
>   	const u16 sw0_rst_offset;
> +	const bool is_vppsys;
>   };
>   
>   /*

