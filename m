Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8249C5517A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:18:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567C820732
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0ZRPtLXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567C820732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nJZRK04V42QKRazZ4Kx6QwkulAtuYfTOGuy7Xb+EA+U=; b=0ZRPtLXnyQMXhp9q2XP93rJRf
	vKBsu2eECkpks+YaY85k0gVmqd3ibjKssEstGnyPX9TN3bbVo7ugHukowcu8hGwW4HtUP8ZlhD72Z
	nBojXaVqJW9G5ExQ0TLQ421Swnst8VLgnehaW9sIC8EHO7K6H3f3inP2HnzdvuczcJNHdKuFLoZ9s
	uwfRGprVkHBmHToeHUgAvJ9vB/TDCv3SBtUzPLf7t52u5JOgY3tME5fkgmRN747N17amFud9FRzQX
	eo+Elym5B2uLC22vFOm+J8yC9tFE9FiAIFPwa9pcnWEHVWbdydAaEQDC6NlAGC6iX88VPSo/ZkSrW
	5hDEXFIyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY38W-0006wg-GQ; Thu, 29 Oct 2020 08:18:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY38P-0006uO-Po; Thu, 29 Oct 2020 08:18:15 +0000
X-Originating-IP: 82.66.179.123
Received: from localhost (unknown [82.66.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3D55FFF817;
 Thu, 29 Oct 2020 08:17:56 +0000 (UTC)
Date: Thu, 29 Oct 2020 09:24:15 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 02/17] phy: amlogic: convert to
 devm_platform_ioremap_resource
Message-ID: <20201029082415.GB15700@pilgrim>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603940079-8131-2-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_041814_022265_3719CAC1 
X-CRM114-Status: GOOD (  18.42  )
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
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Icenowy Zheng <icenowy@aosc.io>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Ma Feng <mafeng.ma@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Oct 29, 2020 at 10:54:24AM +0800, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 4 +---
>  drivers/phy/amlogic/phy-meson-axg-pcie.c             | 4 +---
>  drivers/phy/amlogic/phy-meson-g12a-usb2.c            | 4 +---
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c       | 4 +---
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c             | 4 +---
>  5 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> index 1431cbf885e1..7d06cda329fb 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> @@ -126,7 +126,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>  	struct phy_axg_mipi_pcie_analog_priv *priv;
>  	struct device_node *np = dev->of_node;
>  	struct regmap *map;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  
> @@ -134,8 +133,7 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "failed to get regmap base\n");
>  		return PTR_ERR(base);

This patch will conflict with [0] that uses syscon to map those shared
resources instead and that is hopefully going to be merged soon.

So I think you can skip this file.

> diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> index 377ed0dcd0d9..58a7507a8422 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
> @@ -129,7 +129,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct phy_axg_pcie_priv *priv;
>  	struct device_node *np = dev->of_node;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  
> @@ -145,8 +144,7 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index b26e30e1afaf..9d1efa0d9394 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -292,7 +292,6 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
> -	struct resource *res;
>  	struct phy_meson_g12a_usb2_priv *priv;
>  	struct phy *phy;
>  	void __iomem *base;
> @@ -305,8 +304,7 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
>  	priv->dev = dev;
>  	platform_set_drvdata(pdev, priv);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> index 08e322789e59..ebe3d0ddd304 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> @@ -386,7 +386,6 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct phy_g12a_usb3_pcie_priv *priv;
> -	struct resource *res;
>  	struct phy_provider *phy_provider;
>  	void __iomem *base;
>  	int ret;
> @@ -395,8 +394,7 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 43ec9bf24abf..875afb2672c7 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -230,7 +230,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
> -	struct resource *res;
>  	struct phy_meson_gxl_usb2_priv *priv;
>  	struct phy *phy;
>  	void __iomem *base;
> @@ -242,8 +241,7 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, priv);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  

So without the modification on phy-meson-axg-mipi-pcie-analog.c and
FWIW,

Reviewed-by: Remi Pommarel <repk@triplefau.lt>

Thanks,

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20200915130339.11079-4-narmstrong@baylibre.com/

-- 
Remi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
