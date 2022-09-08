Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C90CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqElwfgdSmRAbe1TxOgEvl0rGlU2m9x2RTPe61zpA7Y=; b=nQO7PLvZJXZ0sd8qQKFZNhQHP3
	9LY0mVCVRzSM9DHzJ8iXf+EfJibWLDBFuWioodbXx5TPQUsCSg58yJV6GZCD7Pc7yv2Xmt1AmkZiF
	g8kSzXlx0SyRB7GW6qoc7zwK22rooF0MJWjTK2YBqplqKtHlFUfWtdv8182umH1mLXex98shaOipn
	MQtoqCDRd6V66NsND46gf5FyVAfHAr96vEaCOoqBrQfbogzQvvc2Ukqr85b2oSvZixSYHa/HEG0cy
	AW1tZD0OWms3LNKhujOgApBjuP5IGihE/WPze1FaX24ZJKPuMevAO8NqpTXnOzUiGiCWwJkQ+s+wN
	KW5QB2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIMr-004Xvs-IQ; Thu, 08 Sep 2022 14:18:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIMf-004XoT-Lx; Thu, 08 Sep 2022 14:18:47 +0000
Received: by mail-ej1-x635.google.com with SMTP id fy31so38430149ejc.6;
        Thu, 08 Sep 2022 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uqElwfgdSmRAbe1TxOgEvl0rGlU2m9x2RTPe61zpA7Y=;
        b=GQ1YLhDR+Js6JeGa+dmtWxbwMjFRcXEcSDp2cUdAhNThPTEy0/xPN4uWvWuT4U+HDL
         Tv/q/CyaTZntmCMLEjqeNnv97WYrHr6rxOR/yVg3PGUl0rmaOeAdti3Ur0fxekkTJ8/8
         yjmx/Xed42Qt7b7V+1XsVyb/fH4sw3dDcAeuQ2eR2Xo/U0pnKs7I5w+2cTEVZmnXn7sM
         joSGkZf1lGage7BsJOd33pUf7ELB9v/tN0Acic+U4CQ2c5xI19FuOc0I+CXFzY6UpQ6U
         YdFkg0igv0w5Af7PuCgf+/utcCDq22gHGdhZrfPbJ3fUjHK7s1mzPXXeytOQxH6RKi2f
         cynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uqElwfgdSmRAbe1TxOgEvl0rGlU2m9x2RTPe61zpA7Y=;
        b=BsHqXNUhDJsRTy98sWtLBtQBix2JDp6h5RQsb0on6sLq/OaFo0l/+rqW5zxsh/c07Z
         dH888ZqzzdpElIAFlKHFd4CfmYdHHgj2yiSbK0J3PVETaEY2Rdk9GfZ9ww13q4u09gLg
         +GezFlaVr6Ul8/akSxoBQ4nLidFy1YvTXCq6CTYAa113t4oLG+ttSag85NtL2X+/tl7p
         gU5/JCHkgECLnsL/NVLnAm9SXqlLMVj/YeD1T4zZgbgO7l+qzjY5lfmQMlaNkjal/Din
         D8ekyUOEDeOBQ2ApjslCubhi5HK53GI06nb3j0+x4h3UW+xBxsxOwS5vCz0zGyTy8ZpI
         aHNA==
X-Gm-Message-State: ACgBeo3HRffWe4Vw5MA5mYLixQQzhanDPjc99VkHcZ9kQbu+N8CtTgyb
	7AGsbFERRdHeuCRXPDhNirQ=
X-Google-Smtp-Source: AA6agR7qDdqjQwHSmkOGWVFjGIbsnQAb7euDyigcbVZwCBgLje0vwmAqMisXPFAW+X+k+wUu7pa+1w==
X-Received: by 2002:a17:907:2c41:b0:741:4906:482b with SMTP id hf1-20020a1709072c4100b007414906482bmr6062420ejc.239.1662646721196;
        Thu, 08 Sep 2022 07:18:41 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b00764a76d5888sm1290016ejh.27.2022.09.08.07.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:18:39 -0700 (PDT)
Message-ID: <10a9c90d-aacf-5283-526d-b3ae42b86ea3@gmail.com>
Date: Thu, 8 Sep 2022 16:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/mediatek: Fix wrong dither settings
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
References: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_071845_748490_225FFC63 
X-CRM114-Status: GOOD (  16.45  )
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



On 08/09/2022 16:12, Allen-KH Cheng wrote:
> The width and height arguments in the cmdq packet for mtk_dither_config()
> are inverted. We fix the incorrect width and height for dither settings
> in mtk_dither_config().
> 
> Fixes: 73d3724745db ("drm/mediatek: Adjust to the alphabetic order for mediatek-drm")
> Co-developed-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 2d72cc5ddaba..6b6d5335c834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -157,7 +157,7 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
>   {
>   	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
>   
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
>   	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
>   		      DISP_REG_DITHER_CFG);
>   	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,

