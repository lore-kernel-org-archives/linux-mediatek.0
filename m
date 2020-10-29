Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F232C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 16:51:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9279220FC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 16:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xaVU/KQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9279220FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7VIS3N7kdGnZEXhrKPQUEKS+ALuRjyda2mlf8XzRNfk=; b=xaVU/KQTPLnZgw53a/wpJv9AQ
	DwpWdBR6hDT+FNpKqgn9KLZWpIfc/9/S8KcsoEQRZTQwHEJkXvcUfiRyF1ooPojfMW/0rW9qsCb6p
	6JVkXbyTahiWexl0jfBBuR2ctRlDL6GXrp2jpejwSdo3t5gmAZU9Eba2cB0ZdUISS9Y+r6WBMbe2B
	cG1+z0ouBXFl3MT5KsaVcp9fuIqzjVpLXD3S4JghvO46nXObEP/XE6QHBHwXKhgU9QW+RvaTgCirb
	K0h1UOX5Sa5K/s50RXd1Ae5rf80gxtDLlISeDXvmgDrucHFJmZ5/4bIKkfCyhqbomOoRA8yRzO1wq
	FCIb8wOMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYB8e-00018p-3K; Thu, 29 Oct 2020 16:51:00 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYB8E-0000yH-TJ; Thu, 29 Oct 2020 16:50:36 +0000
Received: by mail-ej1-f68.google.com with SMTP id za3so4760951ejb.5;
 Thu, 29 Oct 2020 09:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uBrxBRxxTarAjthI/6yYbLkWUG8wKNojoQzE7DEDDlo=;
 b=gjEVL+bU4ILXBTPHGzwnH43AW80nJ7zRoANVI141SY2d/MrnvuEgzG/oKLo++rNQal
 gmblLC/7jzFd+BsbS8PMtaAlLFC8C8UmHh8X+gBOocZgBAEugZlQUGSc/ioRu6rIn2aN
 AmPASqlzNUJD9+RS0X1qeXkybjxDb9ctQHcGyn05iUg3fzp1psbCDk8GwO0Ih0/0qWO4
 grpxoOjHnotMGf7eIdaTJcCUwLByMMlRvnLAzXX0+GrCwY550dig+u1lmvdN4PbWykAx
 rG4YepZAZDVlaKwbuBiu01xTDap7V4FCYc6pvAIoN0TILIF1lKT5RVAY85Q5Y3wtj5kV
 NW+w==
X-Gm-Message-State: AOAM531TyTL9f7hkskQ1paPKgKNtx7lBnEc1E2RAWzesc/aMwIxec2H8
 G4xX1zigOhGKnSHv7nhnNdE=
X-Google-Smtp-Source: ABdhPJyzrn9eK+i1/M24SroHeDBR18Gy84aE59n8TsOlqmQWsOXPr7AJa0EMWD1bhAmWao4JQaAnkA==
X-Received: by 2002:a17:907:40c2:: with SMTP id
 nv2mr4711715ejb.337.1603990233349; 
 Thu, 29 Oct 2020 09:50:33 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id dm8sm1845090edb.57.2020.10.29.09.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 09:50:32 -0700 (PDT)
Date: Thu, 29 Oct 2020 17:50:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 14/17] phy: samsung: convert to
 devm_platform_ioremap_resource
Message-ID: <20201029165029.GA84818@kozik-lap>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-14-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603940079-8131-14-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_125035_046607_05650DEB 
X-CRM114-Status: GOOD (  17.20  )
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
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Icenowy Zheng <icenowy@aosc.io>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
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

On Thu, Oct 29, 2020 at 10:54:36AM +0800, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource to simplify code
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

>  drivers/phy/samsung/phy-exynos-pcie.c     | 7 ++-----
>  drivers/phy/samsung/phy-exynos5-usbdrd.c  | 4 +---
>  drivers/phy/samsung/phy-exynos5250-sata.c | 5 +----
>  drivers/phy/samsung/phy-samsung-usb2.c    | 4 +---
>  4 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
> index 7e28b1aea0d1..c98fff5c1ac8 100644
> --- a/drivers/phy/samsung/phy-exynos-pcie.c
> +++ b/drivers/phy/samsung/phy-exynos-pcie.c
> @@ -232,7 +232,6 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
>  	struct exynos_pcie_phy *exynos_phy;
>  	struct phy *generic_phy;
>  	struct phy_provider *phy_provider;
> -	struct resource *res;
>  	const struct exynos_pcie_phy_data *drv_data;
>  
>  	drv_data = of_device_get_match_data(dev);
> @@ -243,13 +242,11 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
>  	if (!exynos_phy)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	exynos_phy->phy_base = devm_ioremap_resource(dev, res);
> +	exynos_phy->phy_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(exynos_phy->phy_base))
>  		return PTR_ERR(exynos_phy->phy_base);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	exynos_phy->blk_base = devm_ioremap_resource(dev, res);
> +	exynos_phy->blk_base = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(exynos_phy->blk_base))
>  		return PTR_ERR(exynos_phy->blk_base);
>  
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index cfa9b8b7e5ac..ee0848fe8432 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -829,7 +829,6 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>  	struct device_node *node = dev->of_node;
>  	struct exynos5_usbdrd_phy *phy_drd;
>  	struct phy_provider *phy_provider;
> -	struct resource *res;
>  	const struct exynos5_usbdrd_phy_drvdata *drv_data;
>  	struct regmap *reg_pmu;
>  	u32 pmu_offset;
> @@ -843,8 +842,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, phy_drd);
>  	phy_drd->dev = dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	phy_drd->reg_phy = devm_ioremap_resource(dev, res);
> +	phy_drd->reg_phy = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(phy_drd->reg_phy))
>  		return PTR_ERR(phy_drd->reg_phy);
>  
> diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
> index 4dd7324d91b2..9ec234243f7c 100644
> --- a/drivers/phy/samsung/phy-exynos5250-sata.c
> +++ b/drivers/phy/samsung/phy-exynos5250-sata.c
> @@ -162,7 +162,6 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
>  {
>  	struct exynos_sata_phy *sata_phy;
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct phy_provider *phy_provider;
>  	struct device_node *node;
>  	int ret = 0;
> @@ -171,9 +170,7 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
>  	if (!sata_phy)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	sata_phy->regs = devm_ioremap_resource(dev, res);
> +	sata_phy->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sata_phy->regs))
>  		return PTR_ERR(sata_phy->regs);
>  
> diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
> index a3ed3ff04690..f79f605cff79 100644
> --- a/drivers/phy/samsung/phy-samsung-usb2.c
> +++ b/drivers/phy/samsung/phy-samsung-usb2.c
> @@ -143,7 +143,6 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
>  	const struct samsung_usb2_phy_config *cfg;
>  	struct device *dev = &pdev->dev;
>  	struct phy_provider *phy_provider;
> -	struct resource *mem;
>  	struct samsung_usb2_phy_driver *drv;
>  	int i, ret;
>  
> @@ -167,8 +166,7 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
>  	drv->cfg = cfg;
>  	drv->dev = dev;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	drv->reg_phy = devm_ioremap_resource(dev, mem);
> +	drv->reg_phy = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(drv->reg_phy)) {
>  		dev_err(dev, "Failed to map register memory (phy)\n");
>  		return PTR_ERR(drv->reg_phy);
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
