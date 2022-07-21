Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3620C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbWPuroY0tXk21jYiTLbmLYCbbtNtYshWiWN4vFsmHI=; b=DD+VexXV6kgzO+uH5c+vc1cxqF
	QC9zeTDCFlfW6LymibtkbwohzDCNmdzvxDsTYHWPksPSM4zR31tcbOb0FflbCtRyHgAjCw7RGWZUx
	pKLIM6p2tadEotWvQyhgYLxxAK5QW5oqIGfi0ZxjcBhSnWFXeQzqtb5kJxp11s5bI/XlmXTRVnvje
	Z60AcGQuzcWSgjG6Duga2FGOordioDly1x0OH//IXFKzKmwWgS7WHdos0Iv1oMv6km5TLLia/pDDu
	eBCtABu4lCJ9mn/ofyv7jwf3QbnTlIpGBW7EgtV1zwrnWEYQylvmzfXSLioM+uQVzi1EZJuVbo1Ym
	9sP1bVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZXz-00AP1r-5D; Thu, 21 Jul 2022 17:01:11 +0000
Received: from smtp01.smtpout.orange.fr ([80.12.242.123] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZXv-00AOzv-GH
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 17:01:10 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id EZXhoxRl0LFqbEZXhozq3f; Thu, 21 Jul 2022 19:01:02 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 21 Jul 2022 19:01:02 +0200
X-ME-IP: 90.11.190.129
Message-ID: <4feebd9e-d1c3-aeea-8294-e7ae182f7918@wanadoo.fr>
Date: Thu, 21 Jul 2022 19:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 7/7] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
Content-Language: fr
References: <20220629110254.184213-1-angelogioacchino.delregno@collabora.com>
 <20220629110254.184213-8-angelogioacchino.delregno@collabora.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: angelogioacchino.delregno@collabora.com
Cc: bgolaszewski@baylibre.com, chun-jie.chen@mediatek.com,
 ck.hu@mediatek.com, devicetree@vger.kernel.org, fparent@baylibre.com,
 ikjn@chromium.org, jason-jh.lin@mediatek.com, kernel@collabora.com,
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 matthias.bgg@gmail.com, miles.chen@mediatek.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, paul.bouchara@somainline.org,
 phone-devel@vger.kernel.org, rex-bc.chen@mediatek.com, robh+dt@kernel.org,
 sam.shih@mediatek.com, sboyd@kernel.org, tinghan.shen@mediatek.com,
 weiyi.lu@mediatek.com, wenst@chromium.org, y.oudjana@protonmail.com,
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20220629110254.184213-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_100107_704629_FB09A3B2 
X-CRM114-Status: GOOD (  21.47  )
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

Le 29/06/2022 à 13:02, AngeloGioacchino Del Regno a écrit :
> Add the clock drivers for the entire clock tree of MediaTek Helio X10
> MT6795, including system clocks (apmixedsys, infracfg, pericfg, topckgen)
> and multimedia clocks (mmsys, mfg, vdecsys, vencsys).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/clk/mediatek/Kconfig                 |  37 ++
>   drivers/clk/mediatek/Makefile                |   6 +
>   drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 157 +++++
>   drivers/clk/mediatek/clk-mt6795-infracfg.c   | 148 +++++
>   drivers/clk/mediatek/clk-mt6795-mfg.c        |  50 ++
>   drivers/clk/mediatek/clk-mt6795-mm.c         | 106 ++++
>   drivers/clk/mediatek/clk-mt6795-pericfg.c    | 160 +++++
>   drivers/clk/mediatek/clk-mt6795-topckgen.c   | 610 +++++++++++++++++++
>   drivers/clk/mediatek/clk-mt6795-vdecsys.c    |  55 ++
>   drivers/clk/mediatek/clk-mt6795-vencsys.c    |  50 ++
>   10 files changed, 1379 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-apmixedsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-infracfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-mfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-mm.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-pericfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-topckgen.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-vdecsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6795-vencsys.c
> 


[...]

> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> new file mode 100644
> index 000000000000..e87db76799af
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c

[...]

> +static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +	if (ret)
> +		goto free_clk_data;
> +
> +	hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REG_REF2USB);

This calls kzalloc() and clk_hw_register() but...

> +	if (IS_ERR(hw)) {
> +		ret = PTR_ERR(hw);
> +		dev_err(dev, "Failed to register ref2usb_tx: %d\n", ret);
> +		goto unregister_plls;
> +	}
> +	clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (ret) {
> +		dev_err(dev, "Cannot register clock provider: %d\n", ret);
> +		goto unregister_ref2usb;
> +	}
> +
> +	/* Setup MD1 to avoid random crashes */
> +	dev_dbg(dev, "Performing initial setup for MD1\n");
> +	clk_mt6795_apmixed_setup_md1(base);
> +
> +	return 0;
> +
> +unregister_ref2usb:
> +	clk_hw_unregister(clk_data->hws[CLK_APMIXED_REF2USB_TX]);

... only clk_hw_register() is undone here. Should a 
mtk_clk_unregister_ref2usb_tx() be useful?

Or is it already handled somewhere else?

> +unregister_plls:
> +	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +free_clk_data:
> +	mtk_free_clk_data(clk_data);
> +	return ret;
> +}
> +
> +static int clk_mt6795_apmixed_remove(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	clk_hw_unregister(clk_data->hws[CLK_APMIXED_REF2USB_TX]);

Same here.

> +	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver clk_mt6795_apmixed_drv = {
> +	.probe = clk_mt6795_apmixed_probe,
> +	.remove = clk_mt6795_apmixed_remove,
> +	.driver = {
> +		.name = "clk-mt6795-apmixed",
> +		.of_match_table = of_match_clk_mt6795_apmixed,
> +	},
> +};
> +module_platform_driver(clk_mt6795_apmixed_drv);
> +
> +MODULE_DESCRIPTION("MediaTek MT6795 apmixed clocks driver");
> +MODULE_LICENSE("GPL v2");

[...]

> diff --git a/drivers/clk/mediatek/clk-mt6795-mm.c b/drivers/clk/mediatek/clk-mt6795-mm.c
> new file mode 100644
> index 000000000000..27a8859ff5b5
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6795-mm.c

[...]

> +static int clk_mt6795_mm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_hw_onecell_data *clk_data;
> +	int ret;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ret = mtk_clk_register_gates(node, mm_gates, ARRAY_SIZE(mm_gates), clk_data);
> +	if (ret)

Add an error handling path and call mtk_free_clk_data(clk_data); if this 
fails?

> +		return ret;
> +
> +	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);

Same here, + mtk_clk_unregister_gates()?

> +}
> +
> +static struct platform_driver clk_mt6795_mm_drv = {
> +	.driver = {
> +		.name = "clk-mt6795-mm",
> +	},
> +	.probe = clk_mt6795_mm_probe,

.remove function that mimics the (non existent) error handling path of 
the probe?

> +};
> +module_platform_driver(clk_mt6795_mm_drv);
> +
> +MODULE_DESCRIPTION("MediaTek MT6795 multimedia clocks driver");
> +MODULE_LICENSE("GPL v2");

[...]


