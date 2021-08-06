Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02B5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBB860BD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 15:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DBB860BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8dJpMe7vflMLnMineoL5Km68ktsq4qOmZVradS+xliQ=; b=JgXc+W3xiVsshanRGxIB/ha6Vi
	TlmFaPClBZ+5UieLkKddYAl6HAMUsYaFPF7VhH//RPA7WDVKHuAvoFrLHRv2oYSUIJmawQ81+eNjO
	UpVdsBpXfK+JODntMZsAUpeV+C8gZASiDvuq2XxQuiGQfaflnTWdGeAGEesJKGPV/ImUzx1cCqL5e
	mY/kItqyF4ULf91P/wS0mhBZqUkNlz7HJnSK6RoAQgqd5ohZ5o7U+NcAGIRsstU6Ij/QN2VdA7vTP
	v2y3mShs+Ymdwtudprf9vbtzgGZa7ki8oh83NxqNToIKtTSQ4Oacq4J0FvQl5O97h48/PKfAB2efG
	3m6BGI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC1oI-00CrrO-5m; Fri, 06 Aug 2021 15:30:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC1ny-00Crlh-Ua; Fri, 06 Aug 2021 15:30:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id h13so11603213wrp.1;
 Fri, 06 Aug 2021 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RyRhnvurwPn12/G7TVlrpydgS2xDB57swul7r4N4us=;
 b=lNFhSXP1DL5pMmE/6JDZ4nW0iioaoPdxGe0D3R5+51EjjoXr5TR1DSFfPnhR63aFtw
 F1J7HegEtnyoj4GdgzB2/cB8PW6BrLfWnV7Jf+cjO4T/L7ZJk2J3PCrjpSOvrstn1MbU
 vi4rdU/I773lqclN/rfogvNOpthL0O8FZYlwjI/6AaZdfiOftbp9wMtdIerh8te8Y72d
 K/HzeGsy/Ksw+lWI/t5+Z2nDCgFrdHkAw2JRwaPvCFpkrJCCL7I8NfDKNFQYTlr8J1qP
 t2K0RwRwuspoMKK7tozW5EPQJHzUUzHzaqTLzGGIR8u/d+b3Ost5H3Z25R9EGyHadwNH
 jXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RyRhnvurwPn12/G7TVlrpydgS2xDB57swul7r4N4us=;
 b=FVYAUph/wuqkTpI8fcT/4+Hpayp+ahHWNVKjBa09DwR3lmViHB8Df9U8Uf2LQRkGui
 GH7OVWg2dGpE21accRSPL9d4he0/H9n+zlM8nQJd2STlYRe5dytXW/WleVu2zlasw8/h
 I87uPG4dXq5QzBWQbfsMApFayIG/C23IdqczSgmfu/nkkn8VFKm3BFgH7RXOUEyl23Qy
 gbGJvd0jhfZw2+f1ZIvvG7PxXDBy8JDLraCmSBnHVAQ4n/o0tfpQujN3eRxB+jgxwOB5
 cb0ufhqfUSb99VnnWy9l226ZqRF3PtUxoDnuemLZkiQ2g/OxdWnHLEY1XqILMLGrLB6a
 vwbA==
X-Gm-Message-State: AOAM532WHuiYIExnIo7+S9ChB6pdM3wai0gPfJz41Bcgoi0PShwxzQVR
 uqieoUlau07ZCfm4+myVzxI=
X-Google-Smtp-Source: ABdhPJzM9mEM5XNEkNLxnwrQyxZXp2ZOGpb6+olfLob75HIm+kN3ofFHnjYhqR4B6GmE5FuIJyDvrQ==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr11763414wrw.268.1628263837071; 
 Fri, 06 Aug 2021 08:30:37 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id o34sm12286763wms.10.2021.08.06.08.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 08:30:36 -0700 (PDT)
Subject: Re: [PATCH v2 08/14] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-9-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b71be855-b1a5-af6c-3000-59e6e42c0a79@gmail.com>
Date: Fri, 6 Aug 2021 17:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722094551.15255-9-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_083039_080548_561EFDF4 
X-CRM114-Status: GOOD (  28.82  )
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



On 22/07/2021 11:45, Nancy.Lin wrote:
> Add mmsys config API.

This patch is doing a lot of things, it adds a "config" and it adds cmdq
support. Please explain better in the commit message what the config is for.
Please add comments to the different values of struct mtk_mmsys_config.

I understand that cmdq is optional, so please make addition to cmdq a separate
patch.
I'm a bit puzzled about that fact, can you please explain who you get the HW to
behave the same way when you write the same value and offset to mmsys-regs and
via cmdq.

Thanks,
Matthias

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 38 ++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 50 ++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h       | 10 ++++++
>  include/linux/soc/mediatek/mtk-mmsys.h | 18 ++++++++++
>  4 files changed, 116 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 104ba575f765..4bdb2087250c 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -154,6 +154,18 @@
>  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_MERGE_DL_ASYNC_MOUT	(1 << 0)
>  #define DISP_DP_INTF0_SEL_IN_FROM_VDO0_DSC_DL_ASYNC_MOUT	(2 << 0)
>  
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
> +#define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
> +#define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
> +#define MT8195_VDO1_MERGE3_ASYNC_CFG_WD	0xe60
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG		0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
> +#define MT8195_VDO1_MIXER_IN2_ALPHA	0xd34
> +#define MT8195_VDO1_MIXER_IN3_ALPHA	0xd38
> +#define MT8195_VDO1_MIXER_IN4_ALPHA	0xd3c
> +#define MT8195_VDO1_MIXER_IN4_PAD	0xd4c
> +
>  static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>  	{
>  		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> @@ -261,4 +273,30 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>  	}
>  };
>  
> +static const struct mtk_mmsys_config mmsys_mt8195_config_table[] = {
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 0, MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 0, MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 1, MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 1, MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 2, MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 2, MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 3, MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 3, MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(13, 0), 0},
> +	{ MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(29, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 1, MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 1, MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 2, MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 2, MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 3, MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 3, MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 4, MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(8, 0), 0},
> +	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 4, MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(24, 16), 16},
> +	{ MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, MT8195_VDO1_MIXER_IN4_PAD, GENMASK(4, 4), 4},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 1, MT8195_VDO1_HDR_TOP_CFG, GENMASK(20, 20), 20},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 2, MT8195_VDO1_HDR_TOP_CFG, GENMASK(21, 21), 21},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 3, MT8195_VDO1_HDR_TOP_CFG, GENMASK(22, 22), 22},
> +	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 4, MT8195_VDO1_HDR_TOP_CFG, GENMASK(23, 23), 23},
> +};
> +
>  #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 9e31aad6c5c8..d0f4a407f8f8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -63,10 +63,13 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>  	.clk_driver = "clk-mt8195-vdo1",
>  	.routes = mmsys_mt8195_routing_table,
>  	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.config = mmsys_mt8195_config_table,
> +	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
>  };
>  
>  struct mtk_mmsys {
>  	void __iomem *regs;
> +	struct cmdq_client_reg cmdq_base;
>  	const struct mtk_mmsys_driver_data *data;
>  };
>  
> @@ -104,6 +107,47 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
> +			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_config *mmsys_config = mmsys->data->config;
> +	u32 reg_val;
> +	u32 mask;
> +	u32 offset;
> +	int i;
> +
> +	if (!mmsys->data->num_configs)
> +		return;
> +
> +	for (i = 0; i < mmsys->data->num_configs; i++)
> +		if (config == mmsys_config[i].config && id == mmsys_config[i].id)
> +			break;
> +
> +	if (i == mmsys->data->num_configs)
> +		return;
> +
> +	offset = mmsys_config[i].addr;
> +	mask = mmsys_config[i].mask;
> +	reg_val = val << mmsys_config[i].shift;
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> +				    mmsys->cmdq_base.offset + offset, reg_val,
> +				    mask);
> +	} else {
> +#endif
> +		u32 tmp = readl(mmsys->regs + offset);
> +
> +		tmp = (tmp & ~mask) | reg_val;
> +		writel(tmp, mmsys->regs + offset);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -124,6 +168,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  	}
>  
>  	mmsys->data = of_device_get_match_data(&pdev->dev);
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> +	if (ret)
> +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> +#endif
>  	platform_set_drvdata(pdev, mmsys);
>  
>  	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index a760a34e6eca..084b1f5f3c88 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -73,10 +73,20 @@ struct mtk_mmsys_routes {
>  	u32 val;
>  };
>  
> +struct mtk_mmsys_config {
> +	enum mtk_mmsys_config_type config;
> +	u32 id;
> +	u32 addr;
> +	u32 mask;
> +	u32 shift;
> +};
> +
>  struct mtk_mmsys_driver_data {
>  	const char *clk_driver;
>  	const struct mtk_mmsys_routes *routes;
>  	const unsigned int num_routes;
> +	const struct mtk_mmsys_config *config;
> +	const unsigned int num_configs;
>  };
>  
>  /*
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 338c71570aeb..ba3925661cc9 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -6,6 +6,10 @@
>  #ifndef __MTK_MMSYS_H
>  #define __MTK_MMSYS_H
>  
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
>  enum mtk_ddp_comp_id;
>  struct device;
>  
> @@ -54,6 +58,17 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_ID_MAX,
>  };
>  
> +enum mtk_mmsys_config_type {
> +	MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH,
> +	MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT,
> +	MMSYS_CONFIG_HDR_ALPHA_SEL,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_ODD,
> +	MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN,
> +	MMSYS_CONFIG_MIXER_IN_CH_SWAP,
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id cur,
>  			   enum mtk_ddp_comp_id next);
> @@ -62,4 +77,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> +void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
> +			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt);
> +
>  #endif /* __MTK_MMSYS_H */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
