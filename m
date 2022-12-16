Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3352C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lao9rYbp3jaFrYZTl4u8VT5iiT2JXYCWdbPZpYAQt0U=; b=ZQFQz0JyWtO15YbJtjCXCTQFsp
	Xdx7oaoXJmQcn6qZkD5VSmJqo2nCEBnl8jhZU8/IjSmO4oCE8Cize5C197o/+SX7gdGiCC7sUzG4a
	kli4RSRTDvUq2EJRzzkpOdOeEIcM47ja5vpuQwJNShSBUI9romtbRTCJaQGCRnP7QvVUhlbevWA70
	lnGVoKwqLygPaVi8ePVSWGqsSbfm9XHH5pdYoOG+NNz33WavHxhwV7uFLiAIF537fmtDNPKwbypFm
	IWPMIgC4Gqhzer7NRdekg349LJGMYWPkVVbxtp8Kv0t93xqhDvRKgTyvs2mASYPelGfwthwIOCS1g
	PPROlZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yx-00ExQL-NG; Fri, 16 Dec 2022 12:38:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69yu-00ExMh-VZ; Fri, 16 Dec 2022 12:38:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso1338416wmb.1;
        Fri, 16 Dec 2022 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lao9rYbp3jaFrYZTl4u8VT5iiT2JXYCWdbPZpYAQt0U=;
        b=BMepz24nDZZivPME5G/0rC1h5CJlQGZ54ruWBy6dX64Uk4SGIMuaySv/EHqCMmDFlm
         Yt9nWGzwjDylHxA/fIa2fvjPi6RXfFyVUAIQolxl5XVaWYg1gM+KXekgc8Neuxg7UImG
         Q1/TALmidY2sa0We5LCCnwckFy8EU3QcGgZ77y2K4z44V9M8HzAvZ56MfbmVIWN86HOr
         ZfQGtdlBVm0Mb1IhxMtSuqxX3apL13OZa167PAtE2JL2UdUXPcVrcjtTMTz8z1sHDyrV
         dsnyRfEDInrgB2XauxVK2QY8R9RSBu26Y3CKnrjUhLrJPqvcU7Yhr6de6bMR0FDNlfrP
         ezLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lao9rYbp3jaFrYZTl4u8VT5iiT2JXYCWdbPZpYAQt0U=;
        b=zSCk9c0UR3QobhMt4LbL89VDHDLrEXeIuyKf/ayAwKBKU+jQRr3JfM+ThH4I6EyXDZ
         9flqCdG6CNuPAB4exE9tUOtzuW+PeoxHbk6yvVMObDy84x9zYphCsc8nBxJGG6DFh67a
         3bF1Yvoyh9g7XdGKqQ3tc0cvUiIjewSkzzA9FTz55KkLQJL1dUOiXavMaNK/2QxX/jPe
         dFnbYNPV0EYBAUnmkybNIkxW8u+scFbnVl1b8DDMjMr/iJHGeC+AWjO+7LAMKRSUPMuc
         PGeotOXvNHM6mF19Lq3K8wSsC5oB9Zx7jJtBBPQPFmsgVln/wWjTIKfQK7iJfWdbI/2+
         KsSw==
X-Gm-Message-State: ANoB5pn6o4oAvwqXGLIH9VDNyS1x5JK2eFpoDJj6NMIQT3stWj9JW5fw
	roLQOlQJmyhoGNp43ZpQMpY=
X-Google-Smtp-Source: AA0mqf4IPAGnw9/UVoqBz48bhA1Ot5/RTaWfHDozeIuCkpkpk9odgAvJId8q9jxV10vVOZPzlZhGJw==
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id d11-20020a05600c34cb00b003d1f16d5848mr24918840wmq.26.1671194307387;
        Fri, 16 Dec 2022 04:38:27 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id cl4-20020a5d5f04000000b00242209dd1ffsm2259107wrb.41.2022.12.16.04.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:38:26 -0800 (PST)
Message-ID: <9a839b69-d798-0957-bb94-7d009fdcceec@gmail.com>
Date: Fri, 16 Dec 2022 13:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 6/6] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-7-nathan.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221206020046.11333-7-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_043829_052871_5905ABED 
X-CRM114-Status: GOOD (  16.22  )
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



On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b12e5b977c50..8058a5ec2f1d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -176,6 +176,18 @@ static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] = {
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8188_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_POSTMASK0,
> +	DDP_COMPONENT_DITHER0,
> +	DDP_COMPONENT_DP_INTF0,
> +};
> +
>   static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
>   	DDP_COMPONENT_OVL0,
>   	DDP_COMPONENT_OVL_2L0,
> @@ -259,6 +271,11 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
> +	.main_path = mt8188_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.main_path = mt8192_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -516,6 +533,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8186-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8188-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8195-disp-mutex",
> @@ -600,6 +619,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>   	  .data = &mt8183_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8186-mmsys",
>   	  .data = &mt8186_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8188-vdosys0",
> +	  .data = &mt8188_vdosys0_driver_data},
>   	{ .compatible = "mediatek,mt8192-mmsys",
>   	  .data = &mt8192_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8195-mmsys",

