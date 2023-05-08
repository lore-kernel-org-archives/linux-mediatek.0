Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756ECC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzHUT4dMhUomj9pYklJ/WypYxlz27FOOjWTbVoGXtz0=; b=4x9U1FnUq1MKGCjtcSJGER15mQ
	wCIAePtDE/bMjp6NLyQ5yGe40DMHlIAqSElya5O8Nw24IZkZafHPwgphmnLe44vMmcW1NAYAsABmD
	wvXg7GOn4yPSR0oHXYMWN3/elM0PL2jZ0RBKIpt0noVBDuQGh4h2r0fE44ZracPkDSgQ3YkeCq2up
	zzONa/dR686dcDEYePTe7Ij3xXwa0XCopmIYepxKOZsrupPjsiEl6ZihmsM6fPgTjRGY9osDj9non
	Wc5dpDKCHc4xGmn8KXMbonCA+vq8qp1ElPd+3Os4yThJviUI3dg52brQ6QB4m+qwJrcbuMZiKgvIB
	OMS7oJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwgz-0001yB-2l;
	Mon, 08 May 2023 08:58:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwgx-0001wg-2P;
	Mon, 08 May 2023 08:58:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so26510455e9.2;
        Mon, 08 May 2023 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683536277; x=1686128277;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzHUT4dMhUomj9pYklJ/WypYxlz27FOOjWTbVoGXtz0=;
        b=fej1Xepp9nHCOCYnfpfdA05bfp/+104VWtVbbSMcv2+ouIaA9GRx3O72HvkWURJv3g
         xlThRar7lBA2+15Ij1TwfCkz0Jpcw6TJsm3QqkBYhBqQ+jMwo6r9A2SWN7zqbDD9/GQj
         nJz3PNGoDHbSyF0mbnbsQtUvNaL1Qyok0R/13VRt1U2EHfeP9B+AsY59mv28udMT611D
         L59OZOkuwZWolFuLXI1aIjzq6vwzWuDCMGVAe1ca6f28rwZ86/+p0sTIGHroVATk0nQy
         NhNgrjLLmbyVmRHQc/7vF8glvnpSvl4BXUlnEq2a9auUs7d362eQqj1qsaV24ppCDiqe
         GWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536277; x=1686128277;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzHUT4dMhUomj9pYklJ/WypYxlz27FOOjWTbVoGXtz0=;
        b=DpsHTZBqTDzvQIQvQ1k2BiOY5q06eshOR+xXwvmf5mLsgh6fxlh7tow9/t9mziBhT3
         ir1QRJynPGx2VDmLdnyRiDuANbI1+ry+AccMvvBnJJZpLRrwVtpUwGw6cnTmh5zUe3Rv
         2g5qp2O3uClNDXVgLhp1HuoPxK2XYw5IlKeILDHtYYm+IthCvrykaB1rBr/DnW4qdlpa
         2UZwrxEivTHCsSEzusJYOKvnLLfW8UJficL6icrLodBZyxdjt+mC9BNmvSZg+7GyH0Wh
         2yIxQJEu7PM8Jw+1HYCy/00GwQLaRK2jTwe5AIUJl3UIAZy7NCbTIfQdoDPvGmMd3PIc
         GO/Q==
X-Gm-Message-State: AC+VfDxg1j822v6MVj3D6qSFmnhap2YWezbMAh4IbNb/QupfyguQpM3V
	v9+ZtYW/NTL14i362zENcOM=
X-Google-Smtp-Source: ACHHUZ7Yy2EGyep+kRBOOMf4Z5d4p6mnHevZ3uzj+i4tMljsaPea7VybNsMEu+P5XamexGlD/yma4w==
X-Received: by 2002:a7b:cd15:0:b0:3f1:94fe:65e2 with SMTP id f21-20020a7bcd15000000b003f194fe65e2mr6555964wmj.33.1683536277594;
        Mon, 08 May 2023 01:57:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003f42314832fsm4186303wml.18.2023.05.08.01.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:57:56 -0700 (PDT)
Message-ID: <0cdd2d49-a2a0-4968-a978-3c3caa5741f8@gmail.com>
Date: Mon, 8 May 2023 10:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, ca-ES, es-ES
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230502145005.2927101-1-trix@redhat.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
In-Reply-To: <20230502145005.2927101-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_015759_781680_BD6143C7 
X-CRM114-Status: GOOD (  16.19  )
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



On 02/05/2023 16:50, Tom Rix wrote:
> gcc on aarch64 reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
>    is incompatible with the use of floating-point types
>    240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> 
> Floating point should not be used, so rework the floating point comparisons
> to fixed point.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

I think this is worth a fixes tag.

Regards,
Matthias

> ---
> v2: silence robot by casting types to u64
> 
> ---
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..093c4d1da557 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -237,11 +237,11 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>   	 */
>   	if (tmds_clk < 54 * MEGA)
>   		txposdiv = 8;
> -	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> +	else if (tmds_clk >= 54 * MEGA && (tmds_clk * 100) < 14835 * MEGA)
>   		txposdiv = 4;
> -	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
> +	else if ((tmds_clk * 100) >= 14835 * MEGA && (tmds_clk * 10) < 2967 * MEGA)
>   		txposdiv = 2;
> -	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
> +	else if ((tmds_clk * 10) >= 2967 * MEGA && tmds_clk <= 594 * MEGA)
>   		txposdiv = 1;
>   	else
>   		return -EINVAL;
> @@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
>   		clk_channel_bias = 0x34; /* 20mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> +	} else if (((u64)pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
>   		data_channel_bias = 0x34; /* 20mA */
>   		clk_channel_bias = 0x2c; /* 16mA */
>   		impedance_en = 0xf;
>   		impedance = 0x36; /* 100ohm */
> -	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
> +	} else if (pixel_clk >= 27 * MEGA && ((u64)pixel_clk * 1000) < 74175 * MEGA) {
>   		data_channel_bias = 0x14; /* 10mA */
>   		clk_channel_bias = 0x14; /* 10mA */
>   		impedance_en = 0x0;

