Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2A2C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:31:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E1064F10
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E1064F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20JIxD+AKC59Y1u66ApyZ5gsZMF9YRNDmbG1WMyTjqI=; b=YrWS7pFsC4Y1u+RaOfMPrKHDq
	UWMr5t3dqpmWOeHoAvVOUICzDfEav+FNf+bG+u8edtk7jIA/uxP2qAhIDgLquyWvhGQuRraVp7+0b
	FmPwnSZuj7MKAm5tae2YQmP1ZVo50eGysetonJ3y4ITAhmDgd2qruATciKN3EkJV7w6JQYCYSwP15
	S/oeYuL7TgFGkaaRZdstzPcYdGH2W/j5jRWTAG/mcAr87pWnqhHscutGnaKILnGn/td+JbYUx4ljE
	cjPMYnXrsVGjaJEhIJg/+Qwf28gMiciNfB1OHwYyAlfOb2qLbk4ugN7epPR+YLFLI11OSertRb6em
	t+UOQ0HPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMZ4t-003Z4F-JQ; Wed, 17 Mar 2021 16:31:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMZ4p-003Z39-Tr; Wed, 17 Mar 2021 16:31:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id o16so2491881wrn.0;
 Wed, 17 Mar 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QE6T5rkzVXyVG4b9FRno1df2BtGxnFCnOZE4VoMr7VE=;
 b=CrX+5ZPcNrwcCneoIbXKNRHVF0R2KhRrGqiTGlT2zqw4tQ+jT6WbsSbuOdfR4wO6IH
 6/wlQ1qfe3c4PpUGfku6eJmwxc331NOpDMy0ijZ/r2GBQbxNDp944E3yKgW0UKFZ181T
 Jn8Ku/iFETMIfR6PM703248kcyaKGf0m2xkVBGmflaesG0yCmr+iF6S/TT/4WbbBzxJo
 jn7ZfMxbfBD1xleKkQ6U60lHxttSM3bJ/0X/FGlihrVs1LDPLW38jRNEjeyfv/xQ78Cn
 mJQ0oG0zMUnanuY/vLX8Uh0e/jSgqivRIkNA6vmSEnsgab8E6sA8n4zZwkDiTwkuD7WY
 2Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QE6T5rkzVXyVG4b9FRno1df2BtGxnFCnOZE4VoMr7VE=;
 b=niL0VBVDFaz732nruHBLoVntCWEmhKELTuNQF8Y2j4XOXv/QvZDxaVJ0Bql8LrNmyt
 yv7oL/NHBMV64TOWoP/yvZ2VCP1b/xz6pq4HIBa6QWc05fGJ+4WyLRBzqkIbKpYfuueI
 mfIqGtIOZJVzgb9y5RItNy+uhcLQadrZdsWXwX0BZxiiJHI1exNe+w8dNcJbkZfmSGRT
 Tw8O8xr2cyaQ72/CaCigU5on7o/pm4yU9sEmP3Qg+f+CMDjpahysRa4KzO4Za3F7Kqq8
 7aI9tn7IVofnAOXwH3xzv+WrHDgCYHvA+nLh9X/Hco6SdGbHgL/3jKOXhEoiduVBZaQr
 Qseg==
X-Gm-Message-State: AOAM533RHxF+kpJafQtMR9WotOjl6wmmRYRBMgzIKq6fDMPVg58LXS8K
 74r92hTllZi+bMI7lWyQiSc=
X-Google-Smtp-Source: ABdhPJznMr0BQQsfVJMF7zQOUfeloplh7n6YhrqhslkID7n4r23aVU3uY5EU06FVhUO8bs2rFB4/lQ==
X-Received: by 2002:adf:828e:: with SMTP id 14mr5331283wrc.123.1615998678851; 
 Wed, 17 Mar 2021 09:31:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id s8sm27059845wrn.97.2021.03.17.09.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:31:17 -0700 (PDT)
Subject: Re: [PATCH v13 7/8] soc: mediatek: add mtk mutex support for MT8183
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-8-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <8452df75-c9ae-ed1f-3f0a-b449f35bd173@gmail.com>
Date: Wed, 17 Mar 2021 17:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210129092209.2584718-8-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_163120_046752_8F9E5035 
X-CRM114-Status: GOOD (  19.31  )
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



On 29/01/2021 10:22, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mtk mutex support for MT8183 SoC.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Applied to v5.12-next/soc

Thanks

> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index f531b119da7a9..718a41beb6afb 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -14,6 +14,8 @@
>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> +#define MT8183_MUTEX0_MOD0			0x30
> +#define MT8183_MUTEX0_SOF0			0x2c
>  
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> @@ -37,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER		15
>  #define MT8167_MUTEX_MOD_DISP_UFOE		16
>  
> +#define MT8183_MUTEX_MOD_DISP_RDMA0		0
> +#define MT8183_MUTEX_MOD_DISP_RDMA1		1
> +#define MT8183_MUTEX_MOD_DISP_OVL0		9
> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
> +#define MT8183_MUTEX_MOD_DISP_WDMA0		12
> +#define MT8183_MUTEX_MOD_DISP_COLOR0		13
> +#define MT8183_MUTEX_MOD_DISP_CCORR0		14
> +#define MT8183_MUTEX_MOD_DISP_AAL0		15
> +#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
> +#define MT8183_MUTEX_MOD_DISP_DITHER0		17
> +
>  #define MT8173_MUTEX_MOD_DISP_OVL0		11
>  #define MT8173_MUTEX_MOD_DISP_OVL1		12
>  #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -87,6 +101,11 @@
>  #define MT2712_MUTEX_SOF_DSI3			6
>  #define MT8167_MUTEX_SOF_DPI0			2
>  #define MT8167_MUTEX_SOF_DPI1			3
> +#define MT8183_MUTEX_SOF_DSI0			1
> +#define MT8183_MUTEX_SOF_DPI0			2
> +
> +#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
>  
>  struct mtk_mutex {
>  	int id;
> @@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>  };
>  
> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
>  };
>  
> +/* Add EOF setting so overlay hardware can receive frame done irq */
> +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
>  	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> +	.mutex_mod = mt8183_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8167_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = &mt8173_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = &mt8183_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
