Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F06C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56ABB21556
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwwKkxJz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jze759ES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56ABB21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm7Xjc+GLQdvslkEFZjej0bO2h8yC9JH0ozCycOP7is=; b=YwwKkxJzXIPqeJ
	J17r48pXwhakY6XJbg4lK4FxPpn+NQem0MO3NqgsdTPXrF/WYtNtvklJs9lTMjMFWpwkhILpzertU
	Kc/9C0pwz6SeQJmkojUgKt+p5DVWQHRnJInzhWorInLhobWdmq6vASnDwrDvwGl0v3YOnSnroAO4v
	Ifg8d3EJeU3mkGwoafEfuQLX+uNQkGEltOD7tmG+/x4g8U+tnISTaPyAX3ty85TXMVpu+I0RQkLXo
	+bG9sNzIOLRN8X9vAKhMHbutf2tbgsBaMM9hQc3J9vXrAx6oMySuBJwdMkReSNk8Vr+3E03x8ODqD
	e/ZA8dbmQO0FCCK7O49A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6UiZ-0006Ol-2t; Tue, 25 Feb 2020 07:33:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6UiN-0006F3-HG; Tue, 25 Feb 2020 07:33:13 +0000
X-UUID: 1a9304b6e53d43d0906655b35d25e120-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4OrWqlhl7RH1jTafRKkei2XCv7K6NE50cBlz8tG0/s4=; 
 b=jze759ES5qDcyIlf7ARvdZ8A/RattSLmIsAoPvkXYm7l8Vkrernly5dpqXspmbMGc7Uh8QqpLgGrTOYlCndG9psZHll64+zxt3yClfEJocZwy0Yk0Aqzh+UAh1lrjWR6cdXig92tsD2XIoWJtby1AtcU+KGFQlYn90zil/Uj9+w=;
X-UUID: 1a9304b6e53d43d0906655b35d25e120-20200224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 32067020; Mon, 24 Feb 2020 23:33:08 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 23:33:06 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:32:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 15:33:18 +0800
Message-ID: <1582615985.30857.5.camel@mtksdaap41>
Subject: Re: [PATCH v7 4/4] drm/mediatek: set dpi pin mode to gpio low to
 avoid leakage current
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Tue, 25 Feb 2020 15:33:05 +0800
In-Reply-To: <20200225064638.112282-5-jitao.shi@mediatek.com>
References: <20200225064638.112282-1-jitao.shi@mediatek.com>
 <20200225064638.112282-5-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_233311_582911_93DE2670 
X-CRM114-Status: GOOD (  15.39  )
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
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Tue, 2020-02-25 at 14:46 +0800, Jitao Shi wrote:
> Config dpi pins mode to output and pull low when dpi is disabled.
> Aovid leakage current from some dpi pins (Hsync Vsync DE ... ).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 33 ++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index c3e631b93c2e..ca570040ffdf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -10,7 +10,9 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
>  
> @@ -74,6 +76,9 @@ struct mtk_dpi {
>  	enum mtk_dpi_out_yc_map yc_map;
>  	enum mtk_dpi_out_bit_num bit_num;
>  	enum mtk_dpi_out_channel_swap channel_swap;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pins_gpio;
> +	struct pinctrl_state *pins_dpi;
>  	int refcount;
>  	u32 pclk_sample;
>  };
> @@ -387,6 +392,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>  	if (--dpi->refcount != 0)
>  		return;
>  
> +	if (dpi->pinctrl && dpi->pins_gpio)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> @@ -411,6 +419,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  		goto err_pixel;
>  	}
>  
> +	if (dpi->pinctrl && dpi->pins_dpi)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>  	mtk_dpi_enable(dpi);
>  	return 0;
>  
> @@ -716,8 +727,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  
>  	dpi->dev = dev;
>  	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
> -	dpi->pclk_sample = of_property_read_u32_index(dev->of_node,
> -						      "pclk-sample");
> +	of_property_read_u32_index(dev->of_node, "pclk-sample", 1,
> +				   &dpi->pclk_sample);

Why this exists in this patch?

> +
> +	dpi->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(dpi->pinctrl))
> +		dev_dbg(&pdev->dev, "Cannot find pinctrl!\n");

I think you should set dpi->pinctrl to NULL when error, and check
dpi->pinctrl before you use it, such as pinctrl_lookup_state().

Regards,
CK

> +
> +	dpi->pins_gpio = pinctrl_lookup_state(dpi->pinctrl, "gpiomode");
> +	if (IS_ERR(dpi->pins_gpio)) {
> +		dpi->pins_gpio = NULL;
> +		dev_dbg(&pdev->dev, "Cannot find pinctrl gpiomode!\n");
> +	}
> +	if (dpi->pinctrl && dpi->pins_gpio)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
> +	dpi->pins_dpi = pinctrl_lookup_state(dpi->pinctrl, "dpimode");
> +	if (IS_ERR(dpi->pins_dpi)) {
> +		dpi->pins_dpi = NULL;
> +		dev_dbg(&pdev->dev, "Cannot find pinctrl dpimode!\n");
> +	}
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dpi->regs = devm_ioremap_resource(dev, mem);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
