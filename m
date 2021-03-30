Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994E2C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:16:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3BF6195D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A3BF6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eOJyZNfUMJ1crR5yd+hnvF6da199BF1nB9B8DwFK/PI=; b=NXDf8ttsje8MGkZLKExlyDg7s
	r/1Eu8EEwldAqpX/bvYs5bztbUKsandxGw+RMu8U7KI+qSb668lBkXNmn71F8l8WHsYU9CyCJsYqe
	A6w+hYPp4VeyJ1yOw/bTwCJp8Wl/AWcNbWGbb5gdbonEfpAoAgTT5nQDlE1JFo3auYcG16QgTrJR1
	sC8mPGW40BjCr4wgzd0Ic85lm3HMtN26vDm/nl4PGgaeb5kacbcNJwlnut7d4speL2s6QiygdU06M
	ciqF9DXlj7yfe/wBhH3Ls4fFwoXodBnmc9hFpHnOZqaqHyxOIkJjxUXD2ZSNv6/gq2IwEmjYIw/i4
	cVFNPJwBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRATb-003AYo-W8; Tue, 30 Mar 2021 09:15:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRATV-003AWJ-Nb; Tue, 30 Mar 2021 09:15:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so9876584wmd.4; 
 Tue, 30 Mar 2021 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hIgRZy+uhzo2sm3mfgG8b97EVLTEtVQu0/b6m7/PEy0=;
 b=nfJNyYMEpiF5OLVr1kgEXrnL92SfohV6IFzRb+r0IGLC/GfO5cxWFBxU2QhGb4ZR38
 pIDJ2ouKyWDdIwJbwnUYBitt/25W8hKphRFP0MH9utQGaBDLPNkxfoKo55rDgrj0Ki1N
 Uy5uOAKHvQ8ZFTUyd7yqknni57TUFeCaqIVDFjs4zESgG53i8qXgKCjPiPLDm+trMudW
 KG92+MgmPNvtz7PulLYg9khQeeK+gwPl5OJt81CdO96BXO6Zmwmj41A959P0kRD7otyg
 54jwGZpvV2MmZtiYZOwn2JD+ZlTCpM9wRlALH6JAzlRRY4UCZf7yl1BZGgxEl6CM2Jdv
 SZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hIgRZy+uhzo2sm3mfgG8b97EVLTEtVQu0/b6m7/PEy0=;
 b=a92s3HHpkXFBrXiMyjJuokDWpHZsYcJZQGt2cbqhfA4QDNbmNcP83QWNiFsm7vjgG4
 EngbuQ7Brf+dt8BLXS8mujdk3WwqldrBiFJ1WGQMFb/EqMgewuwqogrhJbQIdfcY00uz
 QLK5ctdYSyJsYNYai1HaIUTH6gR7nuRVVsTWSjQV3ZjptNlzMlDBcB1g+9wMOKKS01FB
 F6RWvdyIZSCOZZFC/Ly9uYAg/VC94wlgc+HJ/vmlIem0aQ6WZgNM+zsrH9rSLXwtxV8E
 CXqSqcTXHgWdYcmPhaMhNhx9QPrt3Z09PCF32ZxBeeHaXoJhKBV/kNQk/cUjhWiljYT2
 SI2w==
X-Gm-Message-State: AOAM5323T03cZ4RR+BmxImSbVJ5ftob4pBKsVpdvtahKNhG4qjb8rWCg
 5gpWfUFeQNuU6h0dbzaADgcjzpr5IieUDTTx
X-Google-Smtp-Source: ABdhPJzlMzoisYqiE27vtPAOQuSEopagM/LZtkENxUaO7gh2wflYciSxqGQSVHCo+T37hqWbiqZe5A==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr3010285wml.44.1617095749128; 
 Tue, 30 Mar 2021 02:15:49 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id p17sm2328492wmd.42.2021.03.30.02.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:15:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] soc: mediatek: mmsys: Add support for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
References: <20201027160631.608503-1-fparent@baylibre.com>
 <20201027160631.608503-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <052990a7-673f-31f4-2453-a84b007cdbcf@gmail.com>
Date: Tue, 30 Mar 2021 11:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20201027160631.608503-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_101549_913229_2743EBD6 
X-CRM114-Status: GOOD (  24.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fabien,

Sorry for taking so long on that patch.
Generally the patch looks good, but I just merged a small change how we add new
SoC to the driver.
Please see comments below.

On 27/10/2020 17:06, Fabien Parent wrote:
> Add routing table for DSI on MT8167 SoC. The registers are mostly
> incompatible with the current defines, so new one for MT8167 are added.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> This patch depends on the patch series
> "soc: mediatek: Prepare MMSYS for DDP routing using tables"
> 
> [0] https://lore.kernel.org/patchwork/cover/1317813/
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index f00d6d08c9c5..9890990a74a9 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -85,6 +85,22 @@
>  #define DSI_SEL_IN_RDMA				0x1
>  #define DSI_SEL_IN_MASK				0x1
>  
> +/* MT8167 */
> +#define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
> +#define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
> +#define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
> +#define MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0x064
> +#define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
> +
> +#define MT8167_DITHER_MOUT_EN_RDMA0			BIT(0)
> +#define MT8167_DITHER_MOUT_EN_MASK			0x7
> +
> +#define MT8167_RDMA0_SOUT_DSI0				0x2
> +#define MT8167_RDMA0_SOUT_MASK				0x3
> +
> +#define MT8167_DSI0_SEL_IN_RDMA0			0x1
> +#define MT8167_DSI0_SEL_IN_MASK				0x3
> +
>  struct mtk_mmsys_routes {
>  	u32 from_comp;
>  	u32 to_comp;
> @@ -124,6 +140,30 @@ struct mtk_mmsys {
>  	const struct mtk_mmsys_driver_data *data;
>  };
>  
> +static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {

Please put the defines and the routing table in a separate header file
mt8167-mmsys.h

Thanks and once again sorry for the inconvenience.
Matthias

> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> +		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
> +		OVL0_MOUT_EN_COLOR0, OVL0_MOUT_EN_COLOR0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
> +		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN,
> +		MT8167_DITHER_MOUT_EN_MASK, MT8167_DITHER_MOUT_EN_RDMA0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> +		MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
> +		COLOR0_SEL_IN_OVL0, COLOR0_SEL_IN_OVL0
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
> +		MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
> +		MT8167_DSI0_SEL_IN_MASK, MT8167_DSI0_SEL_IN_RDMA0
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI0,
> +		MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN,
> +		MT8167_RDMA0_SOUT_MASK, MT8167_RDMA0_SOUT_DSI0
> +	},
> +};
> +
>  static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
>  	{
>  		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
> @@ -288,6 +328,12 @@ static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
>  	}
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
> +	.clk_driver = "clk-mt8167-mm",
> +	.routes = mt8167_mmsys_routing_table,
> +	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>  	.clk_driver = "clk-mt8173-mm",
>  	.routes = mt8173_mmsys_routing_table,
> @@ -385,6 +431,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt6797-mmsys",
>  		.data = &mt6797_mmsys_driver_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8167-mmsys",
> +		.data = &mt8167_mmsys_driver_data,
> +	},
>  	{
>  		.compatible = "mediatek,mt8173-mmsys",
>  		.data = &mt8173_mmsys_driver_data,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
