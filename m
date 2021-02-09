Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBF5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 15:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F406864EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 15:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F406864EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/CYEWqw3+zRghnloMZ4LUZEapE6CGvOa6kFsXFBbkpU=; b=ATNDd4hyMy5Mc0zGgA1MSGcPu
	wJhqshCBFcqyj8gaQFVpxDxW39o3c0kZjkJCTLSg0AUHN8HZe22L532Psspv5o28MPJ6zc8VOsxuO
	zvBLy22sKVrZl2gB/krAzLmjps9bcNAqNlRT/U9LxpNXiB8cde/BEZmPGk6Bn7pC/d8VNTGuIU5nd
	1VkOBmQZ0fZ1ar++Q73LRT+Kd0JhPPirSiixGEWTCUW46jW6ZokCrjxMG1blQLIxlLPh9Buqgz0/Y
	/ZgwEmFzhQ8iIljoM4e9sn3a0Fq+9xGkFfb8QCpoOuZ2KBqA9HrQdOY3vKoco1s9X4ldGY57UyUZm
	XmlS1Boew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uzw-0000fm-Ds; Tue, 09 Feb 2021 15:32:16 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Uzt-0000fC-Km; Tue, 09 Feb 2021 15:32:14 +0000
Received: by mail-oi1-x22f.google.com with SMTP id v193so14364830oie.8;
 Tue, 09 Feb 2021 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FLCA6IO40snskjJZDTwax4cOB0Hc4fTsIea1GRHbYqw=;
 b=kvnEwEIFrahzPVo3mkc68ni3hvFkTJo4jgIwH+zPLtWKNynGXxGa8nZObbKLW2IDmI
 3a46th3LHZDoBQmxtnfcccl8FMuftmUNv9bRdyh7WTYluEcZfsBmJEuEXMZByHuH7Uo5
 yCnASweu6IkfTBZw0kjB7MfRDg7ldqtvk4B+7XER9bVogg7krsCSAt7pu5Qy5kU0ZNPH
 PDyNjk/b5YpSvphU+rSIQe2EpwlgjF4Wvo+qkxEgZWTFnAIgX+W0v7CtusZG63z3e8a0
 a6PbGRsH9E2xPpEPvANeKbRttFtVWU9J7Zrh51lH9SnVq6+St1kDZk5p1GoCI8Yt+yPm
 CemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FLCA6IO40snskjJZDTwax4cOB0Hc4fTsIea1GRHbYqw=;
 b=ArKWVNSprL3M42pfCHmVoMwwhT/4+7nl2TVI4/AOjN/BRHgOMOIWwsBaeiPI3pTMn+
 86J1S4YAD/AHxOR0yDmWtHZeBsIkgsZ7ge7Hwz4THnWgxItEWy/VsrwqiWnszR81K+lZ
 UaIvFCjPG2GXmaSeIGpqSLjzpVdV0phgxcxo9E+1GPrYYnKOZ0uTJCfcZ2dkqr5C0y5k
 +EpayiIJT5Jqy8rri5t/fWjOYeixMPZEBvvMoRjjS9yxX+6RbbZdDqpr7hUKcYQN/nWo
 n6ECFxEPN7OlxS5akbQrsGyd4CtYjHzuuWjmKJT7TO2QlcqJvNH6Lb42JS06IqLaP2hW
 on9Q==
X-Gm-Message-State: AOAM532U21ONOC0Ny/AVo+5bnPpj+CAiLdnibTRuXyc7oRzO2veoqkZt
 cFPHLCW6vx9mmfEAkIviROM=
X-Google-Smtp-Source: ABdhPJyiqVTRbNHqwEOslyBfXgEDo8uRefp2GZczvabIoa5IJcgps061q+D4OOvLoVupWlnLpGk2WQ==
X-Received: by 2002:aca:4a4c:: with SMTP id x73mr2753987oia.97.1612884729290; 
 Tue, 09 Feb 2021 07:32:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r6sm4327754oij.29.2021.02.09.07.32.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Feb 2021 07:32:08 -0800 (PST)
Date: Tue, 9 Feb 2021 07:32:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 2/8] drm/mediatek: add component POSTMASK
Message-ID: <20210209153206.GA19067@roeck-us.net>
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202081237.774442-3-hsinyi@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_103213_699934_C70E0C0C 
X-CRM114-Status: GOOD (  21.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 04:12:31PM +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add component POSTMASK.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
[ ... ]
>  
> +void mtk_postmask_config(struct device *dev, unsigned int w,

static

> +			unsigned int h, unsigned int vrefresh,
> +			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_POSTMASK_SIZE);
> +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> +		      priv->regs, DISP_POSTMASK_CFG);
> +}
> +
> +void mtk_postmask_start(struct device *dev)

static

> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +}
> +
> +void mtk_postmask_stop(struct device *dev)

static

> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +}
> +
>  static void mtk_aal_config(struct device *dev, unsigned int w,
>  			   unsigned int h, unsigned int vrefresh,
>  			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -413,6 +445,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
>  	.bgclr_in_off = mtk_ovl_bgclr_in_off,
>  };
>  
> +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> +	.clk_enable = mtk_ddp_clk_enable,
> +	.clk_disable = mtk_ddp_clk_disable,
> +	.config = mtk_postmask_config,
> +	.start = mtk_postmask_start,
> +	.stop = mtk_postmask_stop,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_rdma = {
>  	.clk_enable = mtk_rdma_clk_enable,
>  	.clk_disable = mtk_rdma_clk_disable,
> @@ -448,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_MUTEX] = "mutex",
>  	[MTK_DISP_OD] = "od",
>  	[MTK_DISP_BLS] = "bls",
> +	[MTK_DISP_POSTMASK] = "postmask",
>  };
>  
>  struct mtk_ddp_comp_match {
> @@ -457,36 +498,37 @@ struct mtk_ddp_comp_match {
>  };
>  
>  static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
> -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
> -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
> -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
> -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
> -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
> -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
> -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
> -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
> -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
> -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
> -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
> -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
> -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
> -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
> +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
> +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
> +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
> +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
> +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
> +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
> +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
> +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
> +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
> +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
> +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
> +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
> +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
> +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
> +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
> +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
> +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
> +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
> +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
>  };
>  
>  static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5d..cd1dec6b4cdf2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_UFOE,
>  	MTK_DSI,
>  	MTK_DPI,
> +	MTK_DISP_POSTMASK,
>  	MTK_DISP_PWM,
>  	MTK_DISP_MUTEX,
>  	MTK_DISP_OD,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
