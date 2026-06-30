Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9287C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=S3iXaxGaxT2dySeFVOF2DWE5gKOSoGbd0S/9p13lfiE=; b=yW3tVxZmNY4pOO
	Jqo1ojV5mfFXbmMY/8j1H70M8WPNnEWQuKPRjrWyPkS0adS6EOweCUb4KC0K0ue25HJ422KX5abDP
	mH6qtMAe0Ob1BUCMDxqI6aPItUqZU3XSXtPduVWPVhLC1l+60G4c5z9jqCIdPXB6iSuGUj2fYR0UG
	XNebtjsnKDAMJKbVmMK6bCpYym3yTMqPXBOm5dju/Td31f6ZC4P0gJyXPTF/MQzFBiuMi+t8bFWuo
	5+31IwnGOzhODDHNcXBSpUV4YcLgMgH9QFw3zsNSikGArZnClaSuQ2El8jgZ8vWtuc1w170Z87mYv
	4hDU9Z8gKYn7Ypo6+ECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecUR-0000000Hahh-0UcR;
	Tue, 30 Jun 2026 17:43:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecUP-0000000HahO-446Y;
	Tue, 30 Jun 2026 17:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66E2A43937;
	Tue, 30 Jun 2026 17:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9321F00A3A;
	Tue, 30 Jun 2026 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841397;
	bh=S3iXaxGaxT2dySeFVOF2DWE5gKOSoGbd0S/9p13lfiE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=gOFLfW1DzKuL4/zlQfn4onCyUuXVpktPNdtadshp8G1pFpnQMG7D3o7ViZK8+lScO
	 TEs6YfC6jM77MewJww0XCCw9syRBHs0zH3bcbPY8zi9DYXBouWKG7HWQ3IYnOu4F+K
	 jIGFUUttvihSV6RugIDs9aPsvH3Nw+2UWEYf6L4JJzMDeHuMK7d4WwnIT3DXKjZVtq
	 8k0LFdMAUmWDR26QPCafsRnlERdpPsm4rcrt84rVMYwLWgck/Mryz679ch8r/b29H2
	 BwAzXwbJr5AmLAgqoF9XW65nmWg+68WmguWP8KX7zf9OQCnzCiQHW1ZzJRiANn8hXZ
	 Mh5d1kelM4GtA==
Date: Tue, 30 Jun 2026 12:43:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com, marcel@holtmann.org,
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	sherry.sun@nxp.com, Ryder Lee <ryder.lee@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V4 2/8] PCI: imx6: Add skip_pwrctrl_off flag support
Message-ID: <20260630174316.GA162203@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630103139.3823329-3-sherry.sun@oss.nxp.com>
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

[+cc Mediatek folks]

On Tue, Jun 30, 2026 at 06:31:33PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices during
> suspend to preserve wakeup capability of the devices and also not to power
> on the devices in the init path.

Only pci-imx6.c, pcie-qcom.c, and pcie-mediatek-gen3.c use
pci-pwrctrl.  pcie-qcom.c already has similar skip_pwrctrl_off checks,
but pcie-mediatek-gen3.c does not.  Does it need them?

> This allows controller power-off to be skipped when some devices(e.g. M.2
> cards key E without auxiliary power) required to support PCIe L2 link state
> and wake-up mechanisms.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 1b535bb6fd31..0685573fee71 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1382,10 +1382,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		}
>  	}
>  
> -	ret = pci_pwrctrl_power_on_devices(dev);
> -	if (ret) {
> -		dev_err(dev, "failed to power on pwrctrl devices\n");
> -		goto err_reg_disable;
> +	if (!pp->skip_pwrctrl_off) {
> +		ret = pci_pwrctrl_power_on_devices(dev);
> +		if (ret) {
> +			dev_err(dev, "failed to power on pwrctrl devices\n");
> +			goto err_reg_disable;
> +		}
>  	}
>  
>  	ret = imx_pcie_clk_enable(imx_pcie);
> @@ -1454,7 +1456,8 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  err_clk_disable:
>  	imx_pcie_clk_disable(imx_pcie);
>  err_pwrctrl_power_off:
> -	pci_pwrctrl_power_off_devices(dev);
> +	if (!pp->skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(dev);
>  err_reg_disable:
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
> @@ -1473,7 +1476,8 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  	}
>  	imx_pcie_clk_disable(imx_pcie);
>  
> -	pci_pwrctrl_power_off_devices(pci->dev);
> +	if (!pci->pp.skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(pci->dev);
>  	if (imx_pcie->vpcie)
>  		regulator_disable(imx_pcie->vpcie);
>  }
> @@ -1990,11 +1994,14 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  static void imx_pcie_shutdown(struct platform_device *pdev)
>  {
>  	struct imx_pcie *imx_pcie = platform_get_drvdata(pdev);
> +	struct dw_pcie *pci = imx_pcie->pci;
> +	struct dw_pcie_rp *pp = &pci->pp;
>  
>  	/* bring down link, so bootloader gets clean state in case of reboot */
>  	imx_pcie_assert_core_reset(imx_pcie);
>  	imx_pcie_assert_perst(imx_pcie, true);
> -	pci_pwrctrl_power_off_devices(&pdev->dev);
> +	if (!pp->skip_pwrctrl_off)
> +		pci_pwrctrl_power_off_devices(&pdev->dev);
>  	pci_pwrctrl_destroy_devices(&pdev->dev);
>  }
>  
> -- 
> 2.50.1
> 

