Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558FEC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhWkgDAubzeYLtSoVK0x0eTXhBy9EG1XVZ1TobFXJ3k=; b=VQioRcsol0puaODAA65EUVhjsB
	oAOMIoEpocYaORwdkqSLv8+qMrPDkeXyTFjmQof1s+6r+zJLjg+k5vBVItm+E5TR0w3U2wanUvCjU
	dRflgppO7Ygmnp9kEWLRMkubxrbBc5HkWSjeJgzH35pDsK7tZoFvwB+JpoOV6N+cq1pklO11JTUdl
	+dSOoxAn3gd+n+pB36NnomNDlLXVlXgEc7m3kZMlmiFOIcexroFKWlGF1B2+xZa6xVIR4utnTh8lh
	SXr1Vlo6OMmRDf4xI1DneP74qBxdcrlYv0sbgF1sqKdVabghT6OKZVtzqPEnSuR8nLhhjRuRVbLdT
	XxThcBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZDm-009Ruc-FJ; Wed, 14 Sep 2022 20:42:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYZDj-009Rqw-B0; Wed, 14 Sep 2022 20:42:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id cc5so17710189wrb.6;
        Wed, 14 Sep 2022 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yhWkgDAubzeYLtSoVK0x0eTXhBy9EG1XVZ1TobFXJ3k=;
        b=IpqjD5H4MfRbmuqW0wkFH6fa/q5NezXEAKUJKYi0gVbFiZkcU3BytSeKc9BpyQj2H+
         rUmcpPCEbmxENtDIQwS2FMQ1iM77/SUPfQAChQc+qjyRXKg8YRHnh9e/NRoil0hMXRou
         r1TtJhavxOHqE7Ilwtmjvdyoz3TGFucZ87p+jQikXxbEEjclhFM8z79JdYO5k+KgGQok
         Tn1VngADG2ly73nOKaHzLMwNHIqLtdoIVI1zaL3ZgANsOzQcw4ztYxc6hswFnH9g2Z7l
         /Q9rdDjMlgqvB9rwyQqN4TgMIqRvmm/cG+eaj4JzVfb8ICS884Gd5L4lbzL4NSIs25Qa
         inkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yhWkgDAubzeYLtSoVK0x0eTXhBy9EG1XVZ1TobFXJ3k=;
        b=Ra0gNOFp9gXbi+AHLT2Xh/i5f9DkoDtV456VIy8haNKS58Wh+UldLbZF5BdbtX+vel
         KxMoPjyO40foSw80ozZSxGo3sTznMNWj7NupN1xImw/VrHvjr6BgS5WrmH4p+JtjEWtq
         vEt4fWNoZHUheHnSHddsyYG9ih72z+OXdk6DqU108MTG8eVagn4nyYTZS2sEq6Fvht8s
         eHYjV95PMyfvI/89zG+Na3qgpMceHHrSqROyfZfWnX86J33+Vu9gnO7HPBdxYQ01zVzg
         UwzroCJz7X8mi9U2HmK+rz4aRR+Cw1XeOqWtzdcoRa2Kq1GDYWipY1ZHbh8Cp3PEHKj6
         wRdw==
X-Gm-Message-State: ACgBeo0UDtixP63NhAXPNR28Ib+BFt0q+CQb/uMn8mkkjBVH0I7nxA/3
	pCh5L3DyLyHXMLaCfO3sMQY=
X-Google-Smtp-Source: AA6agR4S+Aw06TKYfQzs3ai63zoXpWsQKZapcFLCmq1jt4cvK2Wu4iMNrryAK3Fom+Uck50WNihwrw==
X-Received: by 2002:a05:6000:1548:b0:22a:c113:c9d0 with SMTP id 8-20020a056000154800b0022ac113c9d0mr6098971wry.653.1663188169012;
        Wed, 14 Sep 2022 13:42:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm222740wmq.23.2022.09.14.13.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 13:42:47 -0700 (PDT)
Message-ID: <f748b0a8-2e6c-b690-19f2-13f3a695f2cb@gmail.com>
Date: Wed, 14 Sep 2022 22:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/5] soc: mediatek: change compatible name for mt8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
 <20220914182331.20515-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220914182331.20515-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_134255_422408_24ADF4B2 
X-CRM114-Status: GOOD (  25.92  )
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



On 14/09/2022 20:23, Jason-JH.Lin wrote:
> In mt8195, vdosys0 and vdosys1 are 2 different function blocks
> for mediatek-drm, so using 2 compatible instead of identifying
> multiple mmsys by io_start.
> 
> Fixes: b804923b7ccb ("soc: mediatek: add mtk-mmsys support for mt8195 vdosys0")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

 From what I have seen we can just revert the commit. No fixes tag needed, it 
does not fix any (runtime) bug.

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 141 +++++--------------------------
>   drivers/soc/mediatek/mtk-mmsys.h |   6 --
>   2 files changed, 21 insertions(+), 126 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 06d8e83a2cb5..e1c653f3abc0 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -26,61 +26,26 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   };
>   
> -static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt2701_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>   	.clk_driver = "clk-mt2712-mm",
>   	.routes = mmsys_default_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   };
>   
> -static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt2712_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>   	.clk_driver = "clk-mt6779-mm",
>   };
>   
> -static const struct mtk_mmsys_match_data mt6779_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt6779_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>   	.clk_driver = "clk-mt6797-mm",
>   };
>   
> -static const struct mtk_mmsys_match_data mt6797_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt6797_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8167-mm",
>   	.routes = mt8167_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
>   };
>   
> -static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8167_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8173-mm",
>   	.routes = mmsys_default_routing_table,
> @@ -88,13 +53,6 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
> -static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8173_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
> @@ -102,13 +60,6 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
> -static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8183_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8186-mm",
>   	.routes = mmsys_mt8186_routing_table,
> @@ -116,13 +67,6 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>   };
>   
> -static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8186_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
> @@ -130,66 +74,29 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>   };
>   
> -static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8192_mmsys_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> -	.io_start = 0x1c01a000,
>   	.clk_driver = "clk-mt8195-vdo0",
>   	.routes = mmsys_mt8195_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> -	.io_start = 0x1c100000,
>   	.clk_driver = "clk-mt8195-vdo1",
>   };
>   
> -static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> -	.num_drv_data = 2,
> -	.drv_data = {
> -		&mt8195_vdosys0_driver_data,
> -		&mt8195_vdosys1_driver_data,
> -	},
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>   };
>   
> -static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
> -	.num_drv_data = 1,
> -	.drv_data = {
> -		&mt8365_mmsys_driver_data,
> -	},
> -};
> -
>   struct mtk_mmsys {
>   	void __iomem *regs;
>   	const struct mtk_mmsys_driver_data *data;
>   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>   	struct reset_controller_dev rcdev;
> -	phys_addr_t io_start;
>   };
>   
> -static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> -					const struct mtk_mmsys_match_data *match)
> -{
> -	int i;
> -
> -	for (i = 0; i < match->num_drv_data; i++)
> -		if (mmsys->io_start == match->drv_data[i]->io_start)
> -			return i;
> -
> -	return -EINVAL;
> -}
> -
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
> @@ -284,7 +191,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct platform_device *clks;
>   	struct platform_device *drm;
> -	const struct mtk_mmsys_match_data *match_data;
>   	struct mtk_mmsys *mmsys;
>   	struct resource *res;
>   	int ret;
> @@ -317,20 +223,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		dev_err(dev, "Couldn't get mmsys resource\n");
>   		return -EINVAL;
>   	}
> -	mmsys->io_start = res->start;
> -
> -	match_data = of_device_get_match_data(dev);
> -	if (match_data->num_drv_data > 1) {
> -		/* This SoC has multiple mmsys channels */
> -		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
> -		if (ret < 0) {
> -			dev_err(dev, "Couldn't get match driver data\n");
> -			return ret;
> -		}
> -		mmsys->data = match_data->drv_data[ret];
> -	} else {
> -		dev_dbg(dev, "Using single mmsys channel\n");
> -		mmsys->data = match_data->drv_data[0];
> +
> +	mmsys->data = of_device_get_match_data(&pdev->dev);
> +	if (!mmsys->data) {
> +		dev_err(dev, "Couldn't get match driver data\n");
> +		return -EINVAL;
>   	}
>   
>   	platform_set_drvdata(pdev, mmsys);
> @@ -353,47 +250,51 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   static const struct of_device_id of_match_mtk_mmsys[] = {
>   	{
>   		.compatible = "mediatek,mt2701-mmsys",
> -		.data = &mt2701_mmsys_match_data,
> +		.data = &mt2701_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt2712-mmsys",
> -		.data = &mt2712_mmsys_match_data,
> +		.data = &mt2712_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt6779-mmsys",
> -		.data = &mt6779_mmsys_match_data,
> +		.data = &mt6779_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt6797-mmsys",
> -		.data = &mt6797_mmsys_match_data,
> +		.data = &mt6797_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8167-mmsys",
> -		.data = &mt8167_mmsys_match_data,
> +		.data = &mt8167_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8173-mmsys",
> -		.data = &mt8173_mmsys_match_data,
> +		.data = &mt8173_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8183-mmsys",
> -		.data = &mt8183_mmsys_match_data,
> +		.data = &mt8183_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8186-mmsys",
> -		.data = &mt8186_mmsys_match_data,
> +		.data = &mt8186_mmsys_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8192-mmsys",
> -		.data = &mt8192_mmsys_match_data,
> +		.data = &mt8192_mmsys_driver_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-vdosys0",
> +		.data = &mt8195_vdosys0_driver_data,
>   	},
>   	{
> -		.compatible = "mediatek,mt8195-mmsys",
> -		.data = &mt8195_mmsys_match_data,
> +		.compatible = "mediatek,mt8195-vdosys1",
> +		.data = &mt8195_vdosys1_driver_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8365-mmsys",
> -		.data = &mt8365_mmsys_match_data,
> +		.data = &mt8365_mmsys_driver_data,
>   	},
>   	{ }
>   };
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index f01ba206481d..77f37f8c715b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -87,18 +87,12 @@ struct mtk_mmsys_routes {
>   };
>   
>   struct mtk_mmsys_driver_data {
> -	const resource_size_t io_start;
>   	const char *clk_driver;
>   	const struct mtk_mmsys_routes *routes;
>   	const unsigned int num_routes;
>   	const u16 sw0_rst_offset;
>   };
>   
> -struct mtk_mmsys_match_data {
> -	unsigned short num_drv_data;
> -	const struct mtk_mmsys_driver_data *drv_data[];
> -};
> -
>   /*
>    * Routes in mt8173, mt2701, mt2712 are different. That means
>    * in the same register address, it controls different input/output

