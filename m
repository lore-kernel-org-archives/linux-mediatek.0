Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E93C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Bb13kUBjWSHn3S9McKrC3ODDxXqosm62oq4lCZBfkc=; b=Tz0Omne2P8inEG
	/BghGvrmZCzZtjNpjXbQtFA6h8Kdof3roRSzV4/XrMrds0dl4kf8amsLwQsayvz6M88dBBVx3w03A
	4yVgipupNVtiigAuaEsLTKDh1kqJZIyrj9Bk7BFntCCzAL3w78FKMPR52/w+55q0UvaU90LVxeIlB
	+g68tSppuB3nfIp0wqL+2c79NoeyAkDyiWJP43fdyuB7L1c4uT682f45OaKRMPr3IPdP7IRfUIACK
	C5nJSriRckjV68CCFYWvcq2MV5lPkOtjIWYN3aR3UBUer2tZ3SSkA0T4+qjDNyFiLIpAFvZ8Kamd4
	v2OzLCSVXdTqFOqNmcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nObFb-00B6Yq-Nn; Mon, 28 Feb 2022 08:19:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nObFN-00B6T7-Kt; Mon, 28 Feb 2022 08:19:11 +0000
X-UUID: a47cf863e9af4eb9ae396949b484c888-20220228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dvPiIkxN6c/d7PMqIyiVU4aXrv15HmHT/skcW3Bilgs=; 
 b=RbwgbPyWAp4N9XpbaEnnp0xUaA0akWSMo7Itv+MWAkAvH8TTaZ2VgbrR5Iol3wjepqmGY6XMlj5iWQZbcsCMVXycMSvRcdgFhYjCoX3CXWzAWXwzEjLipCDfKQCLLpxL6ggoDnSlHT3EQwyaz4tvR++T0VFW85qhjK1azJuksFs=;
X-UUID: a47cf863e9af4eb9ae396949b484c888-20220228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2135868082; Mon, 28 Feb 2022 01:19:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 00:19:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 28 Feb 2022 16:19:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Feb 2022 16:19:00 +0800
Message-ID: <d072b376ef5eb5d14cbcf35e342dd359d532bd23.camel@mediatek.com>
Subject: Re: [PATCH v2] usb: host: xhci-mtk: Simplify supplies handling with
 regulator_bulk
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Date: Mon, 28 Feb 2022 16:19:00 +0800
In-Reply-To: <20220214111905.77903-1-angelogioacchino.delregno@collabora.com>
References: <20220214111905.77903-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_001909_716627_D286DA52 
X-CRM114-Status: GOOD (  20.28  )
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

On Mon, 2022-02-14 at 12:19 +0100, AngeloGioacchino Del Regno wrote:
> Remove the custom functions xhci_mtk_ldos_{enable,disable}() by
> switching to using regulator_bulk to perform the very same thing,
> as the regulators are always either both enabled or both disabled.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
> 
> v2: Change dynamic vregs array to static definition with new
> xhci_mtk_vregs_get()
>     helper as requested by Chunfeng
> 
>  drivers/usb/host/xhci-mtk.c | 44 ++++++++++-------------------------
> --
>  drivers/usb/host/xhci-mtk.h |  5 +++--
>  2 files changed, 14 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> mtk.c
> index e25bad0894cf..b89b4f159a4d 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -401,29 +401,14 @@ static int xhci_mtk_clks_get(struct
> xhci_hcd_mtk *mtk)
>  	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM,
> clks);
>  }
>  
> -static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
> +static int xhci_mtk_vregs_get(struct xhci_hcd_mtk *mtk)
>  {
> -	int ret;
> +	struct regulator_bulk_data *supplies = mtk->supplies;
>  
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
> +	supplies[0].supply = "vbus";
> +	supplies[1].supply = "vusb33";
>  
> -static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
> -{
> -	regulator_disable(mtk->vbus);
> -	regulator_disable(mtk->vusb33);
> +	return devm_regulator_bulk_get(mtk->dev, BULK_VREGS_NUM,
> supplies);
>  }
>  
>  static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd
> *xhci)
> @@ -513,17 +498,10 @@ static int xhci_mtk_probe(struct
> platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mtk->dev = dev;
> -	mtk->vbus = devm_regulator_get(dev, "vbus");
> -	if (IS_ERR(mtk->vbus)) {
> -		dev_err(dev, "fail to get vbus\n");
> -		return PTR_ERR(mtk->vbus);
> -	}
>  
> -	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
> -	if (IS_ERR(mtk->vusb33)) {
> -		dev_err(dev, "fail to get vusb33\n");
> -		return PTR_ERR(mtk->vusb33);
> -	}
> +	ret = xhci_mtk_vregs_get(mtk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get
> regulators\n");
>  
>  	ret = xhci_mtk_clks_get(mtk);
>  	if (ret)
> @@ -564,7 +542,7 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> -	ret = xhci_mtk_ldos_enable(mtk);
> +	ret = regulator_bulk_enable(BULK_VREGS_NUM, mtk->supplies);
>  	if (ret)
>  		goto disable_pm;
>  
> @@ -673,7 +651,7 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
>  
>  disable_ldos:
> -	xhci_mtk_ldos_disable(mtk);
> +	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
>  
>  disable_pm:
>  	pm_runtime_put_noidle(dev);
> @@ -701,7 +679,7 @@ static int xhci_mtk_remove(struct platform_device
> *pdev)
>  	usb_put_hcd(hcd);
>  	xhci_mtk_sch_exit(mtk);
>  	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
> -	xhci_mtk_ldos_disable(mtk);
> +	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
>  
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-
> mtk.h
> index 4b1ea89f959a..ffd4b493b4ba 100644
> --- a/drivers/usb/host/xhci-mtk.h
> +++ b/drivers/usb/host/xhci-mtk.h
> @@ -11,10 +11,12 @@
>  
>  #include <linux/clk.h>
>  #include <linux/hashtable.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "xhci.h"
>  
>  #define BULK_CLKS_NUM	5
> +#define BULK_VREGS_NUM	2
>  
>  /* support at most 64 ep, use 32 size hash table */
>  #define SCH_EP_HASH_BITS	5
> @@ -150,9 +152,8 @@ struct xhci_hcd_mtk {
>  	int num_u3_ports;
>  	int u2p_dis_msk;
>  	int u3p_dis_msk;
> -	struct regulator *vusb33;
> -	struct regulator *vbus;
>  	struct clk_bulk_data clks[BULK_CLKS_NUM];
> +	struct regulator_bulk_data supplies[BULK_VREGS_NUM];
>  	unsigned int has_ippc:1;
>  	unsigned int lpm_support:1;
>  	unsigned int u2_lpm_disable:1;

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
