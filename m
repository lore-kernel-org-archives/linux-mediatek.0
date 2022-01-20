Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPj5EihvSpGgVp9AfI3zo/qB1omU13dGPn610Oqhd9Y=; b=Fd2BJNahuytSA4
	Vrzf6wo8dufJLUDcRW0glU7Eh+I0uuygorsqehWv1df8X8Xn3CbuND83eBzRj7QtMa1/vxxHjwbEs
	uPNUcZDowxsKjhcMPIWHGjZ+Sc7lmnp6G2pe+jC/YGhqJkx+3fBykiwWd5MWmT5YJTYBMMQH7RWOi
	qyNc/aIkPNYXbe4MnntMbsNkgj/6+t7fFn0V/e7Ga2SVatFkODyhIc+ZZROimpRZzZ9qBDwY4va8J
	VUf3IHtVEB93v0KDP+PXCATQvbQeiPUSrxx5ZHRxGZx3lZ0oAnrcCJmK7j2RIDZwY7cnrZEWOkN1K
	RvH1JZp4pDHAfXKADVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARLP-0097Yw-23; Thu, 20 Jan 2022 06:54:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARLB-0097V9-Py; Thu, 20 Jan 2022 06:54:39 +0000
X-UUID: f09edab6c3ba4722b69c1c67a27fab73-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DqieNHmZBozhtLjzlLqV9RFheQQ2Zf2Qtz8V3drGg1c=; 
 b=j9wCA1gqInDfi+mqz8x+EVQnoKgfa0hPIOOwho3/slsLeS4PLme/LutyJRFOCR9zmDu80Ibs+52CxTrEAKaS4j55KUcV1R9DIb1AfohlpSMSegYn/m4e8uCZH/sU2z1urgByfPmKe9CiW1jTFhxIHvjVOPotwX+ydGBuBQ68fco=;
X-UUID: f09edab6c3ba4722b69c1c67a27fab73-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 512455656; Wed, 19 Jan 2022 23:54:32 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 22:50:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Jan 2022 14:50:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 14:50:57 +0800
Message-ID: <91bb8078e2d0824c325eb3819e59cdcb65b68a4e.camel@mediatek.com>
Subject: Re: [PATCH] usb: host: xhci-mtk: Simplify supplies handling with
 regulator_bulk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Thu, 20 Jan 2022 14:50:57 +0800
In-Reply-To: <20220118133348.111860-1-angelogioacchino.delregno@collabora.com>
References: <20220118133348.111860-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_225437_882852_AA693D19 
X-CRM114-Status: GOOD (  22.51  )
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

On Tue, 2022-01-18 at 14:33 +0100, AngeloGioacchino Del Regno wrote:
> Remove the custom functions xhci_mtk_ldos_{enable,disable}() by
> switching to using regulator_bulk to perform the very same thing,
> as the regulators are always either both enabled or both disabled.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/usb/host/xhci-mtk.c | 56 ++++++++++++-----------------------
> --
>  drivers/usb/host/xhci-mtk.h |  4 +--
>  2 files changed, 20 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> mtk.c
> index 62c835d446be..3b81931e5b77 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -395,31 +395,6 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk
> *mtk)
>  	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM,
> clks);
>  }
>  
> -static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
> -{
> -	int ret;
> -
> -	ret = regulator_enable(mtk->vbus);
> -	if (ret) {
> -		dev_err(mtk->dev, "failed to enable vbus\n");
> -		return ret;
> -	}
> -
> -	ret = regulator_enable(mtk->vusb33);
> -	if (ret) {
> -		dev_err(mtk->dev, "failed to enable vusb33\n");
> -		regulator_disable(mtk->vbus);
> -		return ret;
> -	}
> -	return 0;
> -}
> -
> -static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
> -{
> -	regulator_disable(mtk->vbus);
> -	regulator_disable(mtk->vusb33);
> -}
> -
>  static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd
> *xhci)
>  {
>  	struct usb_hcd *hcd = xhci_to_hcd(xhci);
> @@ -475,6 +450,10 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
>  	return ret;
>  }
>  
> +static const char * const xhci_mtk_supply_names[] = {
> +	"vusb33", "vbus",
> +};
> +
>  static const struct xhci_driver_overrides xhci_mtk_overrides
> __initconst = {
>  	.reset = xhci_mtk_setup,
>  	.add_endpoint = xhci_mtk_add_ep,
> @@ -507,17 +486,18 @@ static int xhci_mtk_probe(struct
> platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mtk->dev = dev;
> -	mtk->vbus = devm_regulator_get(dev, "vbus");
> -	if (IS_ERR(mtk->vbus)) {
> -		dev_err(dev, "fail to get vbus\n");
> -		return PTR_ERR(mtk->vbus);
> -	}
> +	mtk->num_supplies = ARRAY_SIZE(xhci_mtk_supply_names);
> +	mtk->supplies = devm_kcalloc(dev, mtk->num_supplies,
> +				     sizeof(*mtk->supplies),
> GFP_KERNEL);
> +	if (!mtk->supplies)
> +		return -ENOMEM;
>  
> -	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
> -	if (IS_ERR(mtk->vusb33)) {
> -		dev_err(dev, "fail to get vusb33\n");
> -		return PTR_ERR(mtk->vusb33);
> -	}
> +	regulator_bulk_set_supply_names(mtk->supplies,
> xhci_mtk_supply_names,
> +					mtk->num_supplies);
> +
> +	ret = devm_regulator_bulk_get(dev, mtk->num_supplies, mtk-
> >supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get
> regulators\n");
>  
>  	ret = xhci_mtk_clks_get(mtk);
>  	if (ret)
> @@ -558,7 +538,7 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	ret = xhci_mtk_ldos_enable(mtk);
> +	ret = regulator_bulk_enable(mtk->num_supplies, mtk->supplies);
>  	if (ret)
>  		goto disable_pm;
>  
> @@ -667,7 +647,7 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
>  
>  disable_ldos:
> -	xhci_mtk_ldos_disable(mtk);
> +	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
>  
>  disable_pm:
>  	pm_runtime_put_noidle(dev);
> @@ -695,7 +675,7 @@ static int xhci_mtk_remove(struct platform_device
> *pdev)
>  	usb_put_hcd(hcd);
>  	xhci_mtk_sch_exit(mtk);
>  	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
> -	xhci_mtk_ldos_disable(mtk);
> +	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
>  
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-
> mtk.h
> index 4b1ea89f959a..9b78cd2ba0ac 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -150,9 +150,9 @@ struct xhci_hcd_mtk {
>  	int num_u3_ports;
>  	int u2p_dis_msk;
>  	int u3p_dis_msk;
> -	struct regulator *vusb33;
> -	struct regulator *vbus;
>  	struct clk_bulk_data clks[BULK_CLKS_NUM];
> +	struct regulator_bulk_data *supplies;
> +	u8 num_supplies;
Could you please help to change it like as clock bulk?

1. #define BULK_REGULATORS_NUM 2; then define @supplies array,

        struct regulator_bulk_data supplies[BULK_REGULATORS_NUM];

2. also add a helper to get regulator bulk; e.g.

static int xhci_mtk_regulators_get(struct xhci_hcd_mtk *mtk)
{
    struct regulator_bulk_data *supplies = mtk->supplies;

    supplies[0].supply = "vusb33";
    supplies[1].supply = "vbus";

    return devm_regulator_bulk_get(mtk->dev, BUL
K_REGULATORS_NUM, supplies);
}

Thanks a lot


>  	unsigned int has_ippc:1;
>  	unsigned int lpm_support:1;
>  	unsigned int u2_lpm_disable:1;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
