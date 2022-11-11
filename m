Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAF3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 11:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiZPd5oULqd/tLgR6S0NEVvIvyE2JnjYEORmvK53qK4=; b=Wje2gB51/pdp5alwH7w0uEgy4k
	56ivbFH3S+n9V3a+FNdZCtb2nKCYiX6zdCWb0oiFxcpzExcOsPYtbE0R1bSYnHqHKKelRJgdOvxU3
	K8Q9jr2S38Yk5c2+VvvJI3PPwwx1ZoQ+FxnhQIngd+Sa68Wfy6X5Ff6bPZrxb/EMB2/YbOS9qlDTF
	pLVpwscNfrvHWXV8DSFHEMfySEaWle66TOzFGDA+/duPXSBEnjKLSnqOZaPLN0tig8bJDaYQ+rOsV
	kCjm5Bi7UqJR8mNvX8/EouXvUC5RwedxRiN3DX+zb6Ab77g0U42bpvjhmwI3vXaM4EbFjroyVCTy9
	zo2Ovflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSQF-00FLUm-Em; Fri, 11 Nov 2022 11:42:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSQC-00FLRe-H3; Fri, 11 Nov 2022 11:42:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r203-20020a1c44d4000000b003cfa97c05cdso3686752wma.4;
        Fri, 11 Nov 2022 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiZPd5oULqd/tLgR6S0NEVvIvyE2JnjYEORmvK53qK4=;
        b=GL+mJx3NYkYn7I7HcehCjjKhqePjdtGJlqcr7ZgBtejSn55iOB5ypZBvJF/JTqfdo7
         bc+e9eaefSDEmtdRDf2lrVm0Ojz/G5n/fE36CsrdBoKSstWOnNtJxkmXowvLe8EFo3cT
         U60GvjpGA1NcE0/Z00FozBdV/VSflcs30mMscT0pWC+egWSCmq9vxJyxbNghCGEjTqlX
         zKUSdm4/AnQBAKvn1H6vtIeNvwpBtB6CAswrdkR6EC4ajmoF2JGNaBMDls5i/nhm7btN
         sfJJx07OYwA2GSHqXPZZxCeKti/sQaApeWIu3sUwnGNekA2Hhk4lZafAMPaJ3hMUzHFV
         nWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiZPd5oULqd/tLgR6S0NEVvIvyE2JnjYEORmvK53qK4=;
        b=ljIW3gK7u3LT7ule48xAX9ArRnaiB3SYadAy5DfDtyNGlD2GGEdDu6eE2TPKGxmiKt
         fESwIMmgf4V5dWdFsVc8j5WuC33fvUNPFZZNqXUxVvxgPWZ68vcWyAMlt3mds4PPkd7y
         /EbQYSjSQvTZ7YuoLD0QuoYJjIhuJMlkiqaK91MhsyDcXxfmj0QGj8h27I8/RfzqSPJ1
         t0NT/rQD9R9Xj3HwEzhCqKwUFHF5HPa1VsuxzgAPMZLDwYAVnWo/6NPRlLA6e0hpLppE
         42SnknyJ/2HfYwNTpAHaalpRcxgB66Fnf0XEFf/GVmT/ze7CKhUKu11CO4eQ3EHCXJIR
         g4Wg==
X-Gm-Message-State: ANoB5pkSEDRKC7mS6D52EPB52ugPCKaCn8uhtH3J45Bzfi7zKyQfhohe
	BErfhLx79NtPybtb5ZYVFBs7qZXK/Wu1bw==
X-Google-Smtp-Source: AA0mqf6IgJ8vpxxZ6Jw7iq2LCaNjOG4CLjxbRyEOr2ygr+qxAFn1apb5f3P5YIELTnZyVYnu18S3+w==
X-Received: by 2002:a05:600c:1614:b0:3cf:615f:54fb with SMTP id m20-20020a05600c161400b003cf615f54fbmr945615wmn.76.1668166925622;
        Fri, 11 Nov 2022 03:42:05 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003c83465ccbfsm9569651wmp.35.2022.11.11.03.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 03:42:04 -0800 (PST)
Message-ID: <c3c7396c-de5b-1853-e914-9d8eabd31099@gmail.com>
Date: Fri, 11 Nov 2022 12:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 5/6] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8195
Content-Language: en-US
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
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-6-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220927152704.12018-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_034208_612687_09F5A4B1 
X-CRM114-Status: GOOD (  17.28  )
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



On 27/09/2022 17:27, Jason-JH.Lin wrote:
> Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 28 ++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 2cb90466798c..66cdd0bc1311 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -374,6 +374,10 @@ static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
>   	.fifo_size = 5 * SZ_1K,
>   };
>   
> +static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
> +	.fifo_size = 1920,
> +};
> +
>   static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-rdma",
>   	  .data = &mt2701_rdma_driver_data},
> @@ -383,6 +387,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
>   	  .data = &mt8183_rdma_driver_data},
>   	{ .compatible = "mediatek,mt8192-disp-rdma",
>   	  .data = &mt8192_rdma_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-rdma",
> +	  .data = &mt8195_rdma_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index adc9a4f4085b..9b5a7a7ddde0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -195,6 +195,19 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
>   	DDP_COMPONENT_DPI0,
>   };
>   
> +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COLOR0,
> +	DDP_COMPONENT_CCORR,
> +	DDP_COMPONENT_AAL0,
> +	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_DITHER0,
> +	DDP_COMPONENT_DSC0,
> +	DDP_COMPONENT_MERGE0,
> +	DDP_COMPONENT_DP_INTF0,
> +};
> +
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.main_path = mt2701_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -253,6 +266,11 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.main_path = mt8195_mtk_ddp_main,
> +	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +};
> +
>   static int mtk_drm_kms_init(struct drm_device *drm)
>   {
>   	struct mtk_drm_private *private = drm->dev_private;
> @@ -470,12 +488,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_DITHER },
>   	{ .compatible = "mediatek,mt8183-disp-dither",
>   	  .data = (void *)MTK_DISP_DITHER },
> +	{ .compatible = "mediatek,mt8195-disp-dsc",
> +	  .data = (void *)MTK_DISP_DSC },
>   	{ .compatible = "mediatek,mt8167-disp-gamma",
>   	  .data = (void *)MTK_DISP_GAMMA, },
>   	{ .compatible = "mediatek,mt8173-disp-gamma",
>   	  .data = (void *)MTK_DISP_GAMMA, },
>   	{ .compatible = "mediatek,mt8183-disp-gamma",
>   	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8195-disp-merge",
> +	  .data = (void *)MTK_DISP_MERGE },
>   	{ .compatible = "mediatek,mt2701-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt2712-disp-mutex",
> @@ -490,6 +512,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>   	{ .compatible = "mediatek,mt8173-disp-od",
>   	  .data = (void *)MTK_DISP_OD },
>   	{ .compatible = "mediatek,mt2701-disp-ovl",
> @@ -524,6 +548,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DISP_RDMA },
>   	{ .compatible = "mediatek,mt8192-disp-rdma",
>   	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8195-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
>   	{ .compatible = "mediatek,mt8173-disp-ufoe",
>   	  .data = (void *)MTK_DISP_UFOE },
>   	{ .compatible = "mediatek,mt8173-disp-wdma",
> @@ -568,6 +594,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
>   	  .data = &mt8186_mmsys_driver_data},
>   	{ .compatible = "mediatek,mt8192-mmsys",
>   	  .data = &mt8192_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8195-vdosys0",
> +	  .data = &mt8195_vdosys0_driver_data},

To make this work with older device tree, we will need to provide the same 
driver data to the old compatible:

+	{ .compatible = "mediatek,,mt8195-mmsys",
+	  .data = &mt8195_vdosys0_driver_data},
+       }

Regards,
Matthias

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

