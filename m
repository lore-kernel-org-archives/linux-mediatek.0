Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E45C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL/cfALd0PZSgh89AoD8+y6yt1zaVriNRx9a37eh1M8=; b=ywCsTsL7zU5/pl9/SRzzEjTpXO
	pCFKcu0L9RGEC+6Wj+OoWBIZLh9QXbtts3d3bQn8mINkUzKYANdeU44Cb9lgv1yizr75Wl8lcaQG4
	87JIwe/VSszGS3U8Lkfmrna88kcDWcQCDfng0BaOoQKeTimSJH+VFU/uJRG1K4R43aVM8W6kZF8A3
	F4Zp97IUjZicPxEV9aeAut5m75XLU66zw/tZmm1PCQIZK2F0c8tBsoo3e5TYfOz3xNMWqRYmX+yfF
	wtnFEOvPoFsrzL5hy2lnGiuI+Xhw4fSRbcGtjPdGDXZflayAFj5/YUTsJfSTu5+QHyoHbdGkRMDb0
	l22Ewu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwtF-00BcCa-GY; Thu, 13 Oct 2022 12:00:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwsp-00Bc5Y-LW; Thu, 13 Oct 2022 12:00:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C7B256602367;
	Thu, 13 Oct 2022 13:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665662410;
	bh=VNVQipGNrbjuBtIH2RudWcorn7bEswqp62N/Tc0FIFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCO6LKtKGVYvpS7M0VYa3gC8WdkUuFuDbJImUaqCGK+OYlQsP4LSUsZQCYlv6xTxg
	 IlAnmgsHkOskbIRX4NTq9Dc64xLi+L5eY5WnIw4NahpBt2VEGJ6hAnlpPcuaaxP2Jj
	 6fqYf7Z8KoX5RMOWaK9UUzkP5ivb1Hv4QpHX9KlpXShikV23YhWUCYuAfPYJdHK0Xv
	 OHYtckEZbt5p3GdoOeTYEy8sFWW5gImeCYlumhlS3DTJGte6ZRxhTt1JmxbGcdFIeT
	 KdXyNHX/h04fkYrMn5R1MEYDOtlZfcPQx45W35pncUfaYEzmMvI3JG0Akq8nr9DyTx
	 FQRTurq9X7zYQ==
Message-ID: <2e35a219-22a5-00bb-cc82-0cfdc523094d@collabora.com>
Date: Thu, 13 Oct 2022 14:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 3/4] clk: mediatek: Add new clock driver to handle
 FHCTL hardware
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20221013112336.15438-1-johnson.wang@mediatek.com>
 <20221013112336.15438-4-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013112336.15438-4-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_050015_871746_8A577C22 
X-CRM114-Status: GOOD (  20.69  )
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

Il 13/10/22 13:23, Johnson Wang ha scritto:
> To implement frequency hopping and spread spectrum clocking
> function, we introduce new clock type and APIs to handle
> FHCTL hardware.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   drivers/clk/mediatek/Kconfig     |   7 +
>   drivers/clk/mediatek/Makefile    |   1 +
>   drivers/clk/mediatek/clk-fhctl.c | 244 ++++++++++++++++++++++++++++
>   drivers/clk/mediatek/clk-fhctl.h |  26 +++
>   drivers/clk/mediatek/clk-pllfh.c | 268 +++++++++++++++++++++++++++++++
>   drivers/clk/mediatek/clk-pllfh.h |  82 ++++++++++
>   6 files changed, 628 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-fhctl.c
>   create mode 100644 drivers/clk/mediatek/clk-fhctl.h
>   create mode 100644 drivers/clk/mediatek/clk-pllfh.c
>   create mode 100644 drivers/clk/mediatek/clk-pllfh.h
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> new file mode 100644
> index 000000000000..a728ff749db1
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -0,0 +1,268 @@

..snip..

> +
> +int mtk_clk_register_pllfhs(struct device_node *node,
> +			    const struct mtk_pll_data *plls, int num_plls,
> +			    struct mtk_pllfh_data *pllfhs, int num_fhs,
> +			    struct clk_hw_onecell_data *clk_data)
> +{
> +	void __iomem *base;
> +	int i;
> +	struct clk_hw *hw;
> +
> +	base = of_iomap(node, 0);
> +	if (!base) {
> +		pr_err("%s(): ioremap failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < num_plls; i++) {
> +		const struct mtk_pll_data *pll = &plls[i];
> +		struct mtk_pllfh_data *pllfh;

		bool use_fhctl;

		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
		use_fhctl = fhctl_is_supported_and_enabled(pllfh);

		if (use_fhctl)
			hw = mtk_clk_register_pllfh(pll, pllfh, base);
		else
			hw = mtk_clk_register_pll(pll, base);

		if (IS_ERR(hw) {
			pr_err("Failed to register %s clk %s: %d\n",
			       use_fhctl ? "fhpll" : "pll", pll->name,
			       PTR_ERR(hw));
			goto err;
		}

.... that's better.
			
> +
> +		clk_data->hws[pll->id] = hw;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_pll_data *pll = &plls[i];
> +		struct mtk_pllfh_data *pllfh;
> +
> +		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> +
> +		if (fhctl_is_supported_and_enabled(pllfh))
> +			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> +		else
> +			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> +
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	iounmap(base);
> +
> +	return PTR_ERR(hw);
> +}
> +

..snip..

> diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
> new file mode 100644
> index 000000000000..effc7976c496
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-pllfh.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Edward-JW Yang <edward-jw.yang@mediatek.com>
> + */
> +
> +#ifndef __DRV_CLKFH_H
> +#define __DRV_CLKFH_H

This should be __CLK_PLLFH_H.

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

