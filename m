Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDEC7EE43
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K03c0vmt+tHdZiMkXzFSKmttXO1Uj7Y+VV4NtWbmgRE=; b=VS7nmee6FCPwTNVPw/RW9qFxIJ
	dYl+hfiJNU54gXoakaNXPpSwjyCN2eokz+D5AUe30rcC5sULbe6ikhltz/ic0J9NIgieeLsW1U4oP
	IovE77mvQ3WCPIJ3h+wTiC4IFMCuQzE+DSnMBK+m/SINuQGbufXphYcNzKAnf+BiJ7Z+SxrOVCMO6
	Lkl7fHLfRq29aeuBPSH7Q7RxO4/xpB0rxOvgrWOghIut/NsiUppo0zNFbC6bx/75BXp782faBDnVT
	9RQPyNC6cGQ6wlcVDsXcM9aI44cmIC6+UTDmw4hDH8S7qEzPwALY8CAW/fxbR+xu3J4AwxN6dkE4P
	+5NJsJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nj4-004lPZ-1s;
	Wed, 07 Jun 2023 07:37:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nj0-004lMz-2t;
	Wed, 07 Jun 2023 07:37:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DA416606EE3;
	Wed,  7 Jun 2023 08:36:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686123417;
	bh=RxB3L+WytLJTsx91PNCAL5EezalHZwML0g095iiYS/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PbyeZICVV5YKB0e2Rpfsbot+ZunT9VYJoTOM2Bkpm2nTHl1vKCUgEaDajfehltH9g
	 p6xWmTtrVpuseIStv+nCqkLu71OiubuTDGaI+hJ5v3m7u3lvRAofbWg59LaHmRLHE+
	 QywBXzlbU/sxR3Z21V+kVCVye574WXqDplmlbZriFVaL+TpbD10vK0iwOs1HPxn/DL
	 VnjmE4jL3ceL/xBP2pZYhm/+vUzJ0THueIOSACN85Nu+wYJe5omqsQX8U6x7DTMEtH
	 CmNRXSIfgcb5A1GhXfoOaWtlDGUznb4hQkRCPA/6mNO7ose9DNvYtqvdTpCTbNIhIM
	 5qz8HJoKUIktg==
Message-ID: <1420fdda-07cf-734a-c29a-ff09a45e58d3@collabora.com>
Date: Wed, 7 Jun 2023 09:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 6/6] drm/mediatek: mt8188: Add VDOSYS1 PADDING driver
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Fei Shao <fshao@google.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-7-shawn.sung@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607061121.6732-7-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_003659_234034_3918DC60 
X-CRM114-Status: GOOD (  33.08  )
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

Il 07/06/23 08:11, Hsiao Chien Sung ha scritto:
> Add VDOSYS1 PADDING driver.

Please expand on the commit description, say what PADDING does, what is it for.

> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/Makefile             |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  43 +++++-
>   drivers/gpu/drm/mediatek/mtk_disp_padding.c   | 134 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>   7 files changed, 181 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_padding.c
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index d4d193f60271..753b7cb264d6 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -7,6 +7,7 @@ mediatek-drm-y := mtk_disp_aal.o \
>   		  mtk_disp_merge.o \
>   		  mtk_disp_ovl.o \
>   		  mtk_disp_ovl_adaptor.o \
> +		  mtk_disp_padding.o \
>   		  mtk_disp_rdma.o \
>   		  mtk_drm_crtc.o \
>   		  mtk_drm_ddp_comp.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 2254038519e1..7200519a2670 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -157,4 +157,7 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
>   const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
>   size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> 
> +int mtk_disp_padding_clk_enable(struct device *dev);
> +void mtk_disp_padding_clk_disable(struct device *dev);
> +void mtk_disp_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>   #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index e1d8d4765af8..5f775144e8c1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -27,6 +27,7 @@
> 
>   enum mtk_ovl_adaptor_comp_type {
>   	OVL_ADAPTOR_TYPE_RDMA = 0,
> +	OVL_ADAPTOR_TYPE_PADDING,
>   	OVL_ADAPTOR_TYPE_MERGE,
>   	OVL_ADAPTOR_TYPE_ETHDR,
>   	OVL_ADAPTOR_TYPE_NUM,
> @@ -41,6 +42,14 @@ enum mtk_ovl_adaptor_comp_id {
>   	OVL_ADAPTOR_MDP_RDMA5,
>   	OVL_ADAPTOR_MDP_RDMA6,
>   	OVL_ADAPTOR_MDP_RDMA7,
> +	OVL_ADAPTOR_DISP_PADDING0,
> +	OVL_ADAPTOR_DISP_PADDING1,
> +	OVL_ADAPTOR_DISP_PADDING2,
> +	OVL_ADAPTOR_DISP_PADDING3,
> +	OVL_ADAPTOR_DISP_PADDING4,
> +	OVL_ADAPTOR_DISP_PADDING5,
> +	OVL_ADAPTOR_DISP_PADDING6,
> +	OVL_ADAPTOR_DISP_PADDING7,
>   	OVL_ADAPTOR_MERGE0,
>   	OVL_ADAPTOR_MERGE1,
>   	OVL_ADAPTOR_MERGE2,
> @@ -63,6 +72,7 @@ struct mtk_disp_ovl_adaptor {
> 
>   static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>   	[OVL_ADAPTOR_TYPE_RDMA]		= "vdo1-rdma",
> +	[OVL_ADAPTOR_TYPE_PADDING]	= "vdo1-padding",
>   	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>   	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
>   };
> @@ -76,6 +86,14 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
>   	[OVL_ADAPTOR_MDP_RDMA5] = { OVL_ADAPTOR_TYPE_RDMA, DDP_COMPONENT_MDP_RDMA5, 5 },
>   	[OVL_ADAPTOR_MDP_RDMA6] = { OVL_ADAPTOR_TYPE_RDMA, DDP_COMPONENT_MDP_RDMA6, 6 },
>   	[OVL_ADAPTOR_MDP_RDMA7] = { OVL_ADAPTOR_TYPE_RDMA, DDP_COMPONENT_MDP_RDMA7, 7 },
> +	[OVL_ADAPTOR_DISP_PADDING0] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING0, 0 },
> +	[OVL_ADAPTOR_DISP_PADDING1] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING1, 1 },
> +	[OVL_ADAPTOR_DISP_PADDING2] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING2, 2 },
> +	[OVL_ADAPTOR_DISP_PADDING3] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING3, 3 },
> +	[OVL_ADAPTOR_DISP_PADDING4] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING4, 4 },
> +	[OVL_ADAPTOR_DISP_PADDING5] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING5, 5 },
> +	[OVL_ADAPTOR_DISP_PADDING6] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING6, 6 },
> +	[OVL_ADAPTOR_DISP_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_DISP_PADDING7, 7 },
>   	[OVL_ADAPTOR_MERGE0] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE1, 1 },
>   	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2 },
>   	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3 },
> @@ -92,6 +110,8 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	struct mtk_mdp_rdma_cfg rdma_config = {0};
>   	struct device *rdma_l;
>   	struct device *rdma_r;
> +	struct device *padding_l;
> +	struct device *padding_r;
>   	struct device *merge;
>   	struct device *ethdr;
>   	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> @@ -108,6 +128,8 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> 
>   	rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
>   	rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
> +	padding_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_DISP_PADDING0 + 2 * idx];
> +	padding_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_DISP_PADDING0 + 2 * idx + 1];
>   	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>   	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
> 
> @@ -143,10 +165,15 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	rdma_config.color_encoding = pending->color_encoding;
>   	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
> 
> +	if (padding_l)
> +		mtk_disp_padding_config(padding_l, cmdq_pkt);
> +
>   	if (use_dual_pipe) {
>   		rdma_config.x_left = l_w;
>   		rdma_config.width = r_w;
>   		mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
> +		if (padding_r)
> +			mtk_disp_padding_config(padding_r, cmdq_pkt);
>   	}
> 
>   	mtk_merge_start_cmdq(merge, cmdq_pkt);
> @@ -206,8 +233,10 @@ int mtk_ovl_adaptor_clk_enable(struct device *dev)
>   		comp = ovl_adaptor->ovl_adaptor_comp[i];
>   		if (!comp)
>   			continue;
> -		if (i < OVL_ADAPTOR_MERGE0)
> +		if (i < OVL_ADAPTOR_DISP_PADDING0)
>   			ret = mtk_mdp_rdma_clk_enable(comp);
> +		else if (i < OVL_ADAPTOR_MERGE0)
> +			ret = mtk_disp_padding_clk_enable(comp);
>   		else if (i < OVL_ADAPTOR_ETHDR0)
>   			ret = mtk_merge_clk_enable(comp);
>   		else
> @@ -225,8 +254,10 @@ int mtk_ovl_adaptor_clk_enable(struct device *dev)
>   		comp = ovl_adaptor->ovl_adaptor_comp[i];
>   		if (!comp)
>   			continue;
> -		if (i < OVL_ADAPTOR_MERGE0)
> +		if (i < OVL_ADAPTOR_DISP_PADDING0)
>   			mtk_mdp_rdma_clk_disable(comp);
> +		else if (i < OVL_ADAPTOR_MERGE0)
> +			mtk_disp_padding_clk_disable(comp);
>   		else if (i < OVL_ADAPTOR_ETHDR0)
>   			mtk_merge_clk_disable(comp);
>   		else
> @@ -255,9 +286,12 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev)
>   		comp = ovl_adaptor->ovl_adaptor_comp[i];
>   		if (!comp)
>   			continue;
> -		if (i < OVL_ADAPTOR_MERGE0) {
> +		if (i < OVL_ADAPTOR_DISP_PADDING0) {

Now we're counting three branches. I'd say that a switch() would be a better
fit at this point.

>   			mtk_mdp_rdma_clk_disable(comp);
>   			pm_runtime_put(comp);
> +		} else if (i < OVL_ADAPTOR_MERGE0) {
> +			mtk_disp_padding_clk_disable(comp);
> +			pm_runtime_put(comp);
>   		} else if (i < OVL_ADAPTOR_ETHDR0) {
>   			mtk_merge_clk_disable(comp);
>   		} else {
> @@ -389,6 +423,9 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
>   	{
>   		.compatible = "mediatek,mt8188-vdo1-rdma",
>   		.data = (void *)OVL_ADAPTOR_TYPE_RDMA,
> +	}, {
> +		.compatible = "mediatek,mt8188-vdo1-padding",
> +		.data = (void *)OVL_ADAPTOR_TYPE_PADDING,
>   	}, {
>   		.compatible = "mediatek,mt8188-disp-merge",
>   		.data = (void *)OVL_ADAPTOR_TYPE_MERGE,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_padding.c b/drivers/gpu/drm/mediatek/mtk_disp_padding.c
> new file mode 100644
> index 000000000000..5722aa57d628
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_padding.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>

I don't see any interrupt parsing action here, why are you including of_irq.h?

> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +/*

For kerneldoc, this should be:

/**

> + * struct mtk_disp_padding - DISP_RDMA driver structure

Also, this is not the DISP_RDMA driver structure

> + * @data: local driver data

...and there's no @data member, plus, you're not documenting other members.

> + */
> +struct mtk_disp_padding {
> +	struct clk		*clk;
> +	void __iomem		*regs;
> +	struct cmdq_client_reg	cmdq_reg;
> +};
> +
> +static int mtk_disp_padding_bind(struct device *dev, struct device *master,
> +				 void *data)
> +{
> +	return 0;
> +}
> +
> +static void mtk_disp_padding_unbind(struct device *dev, struct device *master,
> +				    void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_padding_component_ops = {
> +	.bind	= mtk_disp_padding_bind,
> +	.unbind = mtk_disp_padding_unbind,
> +};
> +
> +static int mtk_disp_padding_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_disp_padding *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to get clk\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(dev, res);

priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, res);

> +	if (IS_ERR(priv->regs)) {
> +		dev_err(dev, "failed to do ioremap\n");
> +		return PTR_ERR(priv->regs);
> +	}
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to get gce client reg\n");
> +		return ret;
> +	}
> +#endif
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	pm_runtime_enable(dev);

	ret = devm_pm_runtime_enable(dev);
	if (ret)
		return ret;

> +
> +	ret = component_add(dev, &mtk_disp_padding_component_ops);
> +	if (ret) {
> +		pm_runtime_disable(dev);
> +		dev_err(dev, "failed to add component: %d\n", ret);

	return dev_err_probe( .... )

> +	}
> +
> +	return ret;

return 0;

> +}
> +
> +static int mtk_disp_padding_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &mtk_disp_padding_component_ops);
> +	pm_runtime_disable(&pdev->dev);

If you use devm_pm_runtime_enable, you don't have to call pm_runtime_disable here.

> +	return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_padding_driver_dt_match[] = {
> +	{ .compatible = "mediatek,mt8188-vdo1-padding" },
> +	{},

	{ /* sentinel */ }
}

> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_padding_driver_dt_match);
> +
> +struct platform_driver mtk_disp_padding_driver = {
> +	.probe		= mtk_disp_padding_probe,
> +	.remove		= mtk_disp_padding_remove,
> +	.driver		= {
> +		.name	= "mediatek-disp-padding",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = mtk_disp_padding_driver_dt_match,
> +	},
> +};
> +
> +int mtk_disp_padding_clk_enable(struct device *dev)
> +{
> +	struct mtk_disp_padding *padding = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(padding->clk);
> +}
> +
> +void mtk_disp_padding_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_padding *padding = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(padding->clk);
> +}
> +
> +void mtk_disp_padding_config(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_disp_padding *padding = dev_get_drvdata(dev);
> +
> +	// bypass padding

C-style comments please.

> +	mtk_ddp_write_mask(cmdq_pkt,
> +			   0b11, &padding->cmdq_reg, padding->regs, 0, 0b11);

Please add definitions and use GENMASK().

> +}

Move those functions before the probe function please.

Regards,
Angelo



