Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iKDGc2cXXIODKc/5/oQxn29ATJNZs1cXL4Nd7ZWS7s=; b=DybIHQ2L6sqqTVsm3KWRsm1N/N
	9y3qvfahpD4e7Yhym24e1ZIWjl877L7Iq9IwAicLxWPDts+GGuEOrTaeJ5TcaHweh/5CLTS6h2ia6
	JRq8cQdQJ5nUFhNofYEDPOv9syr3pwSU1BWjRDonfDT+7cDglKScrYXo2GboRR1qgL4ah80bpd/ag
	7cLB9cXiJwSM2hWi01JuwCebeJUk/WiVgVLPQIpWLd+Af8Bs7ZjqEFJriQC8l70Hd+/RQxNhKmJMO
	TKYs2032xc6WBNWhEyRbZ6cZq4KDMPAvbxN6o3mR4K+lOySgC/XqdoSjy8EZZobVM9yGEpSzMRF9w
	DuoCKo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4tUT-004Cpb-Cg; Sat, 25 Jun 2022 00:17:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4tUQ-004Cn4-8K; Sat, 25 Jun 2022 00:17:32 +0000
X-UUID: b298af789bd341e0b7bbc173616d42e6-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0f2ed634-c70a-4d21-8034-0845bec713e2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:d5a084d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b298af789bd341e0b7bbc173616d42e6-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1433817064; Fri, 24 Jun 2022 17:17:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 17:07:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 25 Jun 2022 08:07:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jun 2022 08:07:47 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <bgolaszewski@baylibre.com>, <chun-jie.chen@mediatek.com>,
	<ck.hu@mediatek.com>, <devicetree@vger.kernel.org>, <fparent@baylibre.com>,
	<ikjn@chromium.org>, <jason-jh.lin@mediatek.com>, <kernel@collabora.com>,
	<konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<mturquette@baylibre.com>, <p.zabel@pengutronix.de>,
	<paul.bouchara@somainline.org>, <phone-devel@vger.kernel.org>,
	<rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <sam.shih@mediatek.com>,
	<sboyd@kernel.org>, <tinghan.shen@mediatek.com>, <weiyi.lu@mediatek.com>,
	<wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v3 7/7] clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers
Date: Sat, 25 Jun 2022 08:07:47 +0800
Message-ID: <20220625000747.12582-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220624093525.243077-8-angelogioacchino.delregno@collabora.com>
References: <20220624093525.243077-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_171730_338889_244D65D6 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Angelo,

> Add the clock drivers for the entire clock tree of MediaTek Helio X10
> MT6795, including system clocks (apmixedsys, infracfg, pericfg, topckgen)
> and multimedia clocks (mmsys, mfg, vdecsys, vencsys).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  37 ++
>  drivers/clk/mediatek/Makefile                |   6 +
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 157 +++++
>  drivers/clk/mediatek/clk-mt6795-infracfg.c   | 148 +++++
>  drivers/clk/mediatek/clk-mt6795-mfg.c        |  50 ++
>  drivers/clk/mediatek/clk-mt6795-mm.c         | 106 ++++
>  drivers/clk/mediatek/clk-mt6795-pericfg.c    | 160 +++++
>  drivers/clk/mediatek/clk-mt6795-topckgen.c   | 610 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt6795-vdecsys.c    |  55 ++
>  drivers/clk/mediatek/clk-mt6795-vencsys.c    |  50 ++
>  10 files changed, 1379 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-apmixedsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-infracfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-mfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-mm.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-pericfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-topckgen.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-vdecsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt6795-vencsys.c
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index d5936cfb3bee..da8142dff3c3 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -259,6 +259,43 @@ config COMMON_CLK_MT6779_AUDSYS
>  	help
>  	  This driver supports Mediatek MT6779 audsys clocks.
>  
> +config COMMON_CLK_MT6795
> +	tristate "Clock driver for MediaTek MT6795"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	default ARCH_MEDIATEK
> +	help
> +	  This driver supports MediaTek MT6795 basic clocks and clocks
> +	  required for various peripherals found on MediaTek.
> +
> +config COMMON_CLK_MT6795_MFGCFG
> +	tristate "Clock driver for MediaTek MT6795 mfgcfg"
> +	depends on COMMON_CLK_MT6795
> +	default COMMON_CLK_MT6795
> +	help
> +	  This driver supports MediaTek MT6795 mfgcfg clocks.
> +
> +config COMMON_CLK_MT6795_MMSYS
> +       tristate "Clock driver for MediaTek MT6795 mmsys"

snip...

> +	{ /* sentinel */ }
> +};
> +
> +static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
> +	if (ret)
> +		goto free_clk_data;
> +
> +	ret = mtk_clk_register_gates(node, infra_gates, ARRAY_SIZE(infra_gates), clk_data);
> +	if (ret)
> +		goto free_clk_data;

While checking the error path, I learned that
mtk_register_reset_controller_with_dev uses devm_reset_controller_register and it will
be unregister the reset automatically if probe failed.

Thanks for this patch!

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 


thanks,
Miles

> +
> +	ret = mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
> +	if (ret)
> +		goto unregister_gates;
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		goto unregister_cpumuxes;
> +
> +	return 0;
> +
> +unregister_cpumuxes:
> +	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
> +unregister_gates:
> +	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
> +free_clk_data:
> +	mtk_free_clk_data(clk_data);
> +	return ret;
> +}
> +
> +static int clk_mt6795_infracfg_remove(struct platform_device *pdev)
> +{

