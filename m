Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D4C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldTjgbcAixArTLp8Y3OwHiWDDm8sGdVLf5wYTEAfqeg=; b=tM/ljvA8b02uCuF/BsLjxRdioI
	e11otAmV6s6tSiqaRxYUBB1udaKOXWHX757nnb3RBR3GO7H5/fmMqlMuJ2DY5xixe9JtjKk6FC0Oi
	gyVd0IrzZJZT+zHvhJTYp2xE/ejrsZXKXGF9lHlQQRFDxO4gb5SaQztXuYyCHdqWlvqkrnw3iAy1V
	Pwd2eyFfuq4rqoRcdCYHkMMnBOYwQTk9FoRNBZbZHRA9CYoyW+HZkADLwqcFPbWpuNIOUxk0TEzoH
	gdNYyNui/jttKHrD8Urnngz+RMb6hu5hxEuHK/hyVb8oUyi7bm0v7OsSLJ9veWzaY96rmMLH8iJh/
	o3tQ8H8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqi-005VDN-02;
	Thu, 13 Apr 2023 09:02:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqe-005VA4-2O;
	Thu, 13 Apr 2023 09:02:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id w24so3867157wra.10;
        Thu, 13 Apr 2023 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376548; x=1683968548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldTjgbcAixArTLp8Y3OwHiWDDm8sGdVLf5wYTEAfqeg=;
        b=Sq5siWuukFu2ZV2SC5RtzEOr90Zr3KADENV26Bcj0bkBKMEDDDiM4JLiedIbsGmM6/
         BpcIyDVkAfqs0T5sp4+dhaJ/a8fvtOtLU/dVNXQtVb6muPxOUfylQpCtAPUnf9ZDnD1N
         OUsXuUxo4AcxJGPKCiv29bMPXUeeKmzTa5jzzYG9xelseWYh7pI/mtRJw26RhA9rqU+6
         PQMoTZ4VJX8y2aAEA4TQrdn8lu4dKPxyjcspBIKNTkRnc21PjvOPW2Z8ABijJgHRH18k
         VV9O2EQfumjBnwcdMIxGuo+bLSkMnncdkcRHP6m4jYcMjXXD2cjI1EktepxPYL6li4Nc
         I5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376548; x=1683968548;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldTjgbcAixArTLp8Y3OwHiWDDm8sGdVLf5wYTEAfqeg=;
        b=I3f2tEkIxlifCgZz4j4UDqUc13lGiHQSeVGxkkty1Q9YXna4+G7gM0QH/ut203f1N3
         DPNGUc9Gz8rjlOj6zDB4L4FhnWQNwppRzRi8++dvsgWpdsv7tbtELxzpeE8JWx9gRJUX
         O+U1GEnFsqrU2Gyj6NS/KDUtQCF45ndLJ+rjmSWCkjm41ZsXIe+x99kCVaHQzmNEyKzK
         0+tpJkkhgZvkKqbLzluoRiLYXkq9+xHfycK0etU/UAmsN/WWlxraJqx4ekF9YwmUk1TI
         iZkuHketyMSPzkEDqFEDm2Fpc8GNII+bvmN2JPwyAXlkF0K8q8XAcrh1rzxRAhToctqp
         tr/A==
X-Gm-Message-State: AAQBX9egfd2dQfK/8RdveXMerhOPvEDlgSE9/i7hv2tUAsuNw9w4G25s
	u8exlRQg/0JPbw3/C1YlXuw=
X-Google-Smtp-Source: AKy350asP4+G83mAEIf1p9IarcfPfSoPgb5XVETZON+sPwEmFsRqvaVHYjROuiy2L1CPru9rX5YgVQ==
X-Received: by 2002:a5d:4d0c:0:b0:2ce:fd37:938c with SMTP id z12-20020a5d4d0c000000b002cefd37938cmr907993wrt.50.1681376548080;
        Thu, 13 Apr 2023 02:02:28 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id r16-20020a056000015000b002f21a96c161sm820964wrx.70.2023.04.13.02.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 02:02:27 -0700 (PDT)
Message-ID: <b986d097-6cb4-cbde-3cd1-b8d68d222d9d@gmail.com>
Date: Thu, 13 Apr 2023 11:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com,
 shuijing.li@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020232_791948_C28052FD 
X-CRM114-Status: GOOD (  15.97  )
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



On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because there are different definitions for cmdq
> register bit control in mt8188.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>   drivers/gpu/drm/mediatek/mtk_dsi.c     | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a13b36ac03a1..9ba05961479d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -654,6 +654,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8186-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8188-dsi",
> +	  .data = (void *)MTK_DSI },
>   	{ }
>   };
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..500a3054282d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1208,6 +1208,12 @@ static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>   	.has_size_ctl = true,
>   };
>   
> +static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
> +	.reg_cmdq_off = 0xd00,
> +	.has_shadow_ctl = true,
> +	.has_size_ctl = true,
> +};
> +
>   static const struct of_device_id mtk_dsi_of_match[] = {
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = &mt2701_dsi_driver_data },
> @@ -1217,6 +1223,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
>   	  .data = &mt8183_dsi_driver_data },
>   	{ .compatible = "mediatek,mt8186-dsi",
>   	  .data = &mt8186_dsi_driver_data },
> +	{ .compatible = "mediatek,mt8188-dsi",
> +	  .data = &mt8188_dsi_driver_data },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);

