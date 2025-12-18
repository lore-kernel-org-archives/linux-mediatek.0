Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168DDD68BE2
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAWmBGTv9K5y2Fwt92+L05jbJb9V2jK/NtkjGu4YdL4=; b=zDcX9i6KsfNJP/QkR5FcHf2HLt
	ABEl5YfXiwd6lNJKX0+Kv3PHMrdxILdkb5ZnMgh+PmZc+2aQjzEQmp7koxmCwdanjGFvfmVYp/oWD
	LglmhE+Rj5GUkPgYr9CcLDp1oaOxRUdWYnx4qhcXiV2YSUBYMl59548mV/xu0aQJRDKW++qSGu5xY
	7vdZSBSNvoodosUt4GNX3eptX+U3jaSDUjg8QHmGS8RR1YrheJGJdG+ksNYvBUPr1zPyb3mpufhhY
	vb5o0EhxzXMr2SAvqwkHt99g5AhT9EypWo68YmrJf4nTKH+3SS1IQvFjEU6NXgyfHn8CS+QeCdist
	rB0hNDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Ev-00000007sZr-1bme;
	Thu, 18 Dec 2025 06:11:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Eu-00000007sZl-1V5S
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Dec 2025 06:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 051BA600AE;
	Thu, 18 Dec 2025 06:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D014C4CEFB;
	Thu, 18 Dec 2025 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766038310;
	bh=+PvlfhvDMhp2Jj+7Q9yanLYra9ZqM1vDrbOox/uf/Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQ6mIA/lVemKA3CTPpqoeSh+afLCtWzbsf9X45UTEVnee/klXIMxBMRp9MFtdctIK
	 tbQjodmuaGZBNfd3qb+51p3RgamHsFYiaHdkBh2xV4i66qkIWyefpe4y7y8Lch6h8K
	 kO/eosD7ZdQdGUYnwhn5Fb0PvQ9/5i37IWoZ/T7UhC8UdlnOWLo37uuX985SG/0I8u
	 GJmqAjThZP7n9L0UwxaWoBAYrtGibyApNHYEBE8oFHghgfXucgMAiazqExJ6PK6UXm
	 SXNPufEILQ2X09tOEJsNzqsW6dj4UjBxBwjLcGAYCx1UOsc1p48sYjTur68AflAGJh
	 TwrEJKiHhktdA==
Date: Thu, 18 Dec 2025 11:41:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
Message-ID: <2qojq77l7xeivmvt4mqjpdelj2ph2rht44qzkaf3ikq5qpq6gp@tj542kt77dkg>
References: <20251105062815.966716-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105062815.966716-1-wenst@chromium.org>
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

On Wed, Nov 05, 2025 at 02:28:14PM +0800, Chen-Yu Tsai wrote:
> As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
> common code") come up later" in the code, it is possible for link up to
> occur later:
> 
>   Let's standardize this to succeed as there are usecases where devices
>   (and the link) appear later even without hotplug. For example, a
>   reconfigured FPGA device.
> 
> Another case for this is the new PCIe power control stuff. The power
> control mechanism only gets triggered in the PCI core after the driver
> calls into pci_host_probe(). The power control framework then triggers
> a bus rescan. In most driver implementations, this sequence happens
> after link training. If the driver errors out when link training times
> out, it will never get to the point where the device gets turned on.
> 
> Ignore the link up timeout, and lower the error message down to a
> warning.
> 
> This makes PCIe devices that have not-always-on power rails work.
> However there may be some reversal of PCIe power sequencing, since now
> the PERST# and clocks are enabled in the driver, while the power is
> applied afterwards.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> The change works to get my PCIe WiFi device working, but I wonder if
> the driver should expose more fine grained controls for the link clock
> and PERST# (when it is owned by the controller and not just a GPIO) to
> the power control framework. This applies not just to this driver.
> 
> The PCI standard says that PERST# should hold the device in reset until
> the power rails are valid or stable, i.e. at their designated voltages.

I believe this patch is no longer necessary once you adopt to the new pwrctrl
APIs proposed here: https://lore.kernel.org/linux-pci/20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com/

I plan to get this series merged asap for v6.20 so that we can apply mtk changes
on top once you send them.

- Mani

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 75ddb8bee168..5bdb312c9f9b 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -504,10 +504,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>  		ltssm_index = PCIE_LTSSM_STATE(val);
>  		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
>  			      "Unknown state" : ltssm_str[ltssm_index];
> -		dev_err(pcie->dev,
> -			"PCIe link down, current LTSSM state: %s (%#x)\n",
> -			ltssm_state, val);
> -		return err;
> +		dev_warn(pcie->dev,
> +			 "PCIe link down, current LTSSM state: %s (%#x)\n",
> +			 ltssm_state, val);
> +
> +		/*
> +		 * Ignore the timeout, as the link may come up later,
> +		 * such as when the PCI power control enables power to the
> +		 * device, at which point it triggers a rescan.
> +		 */
>  	}
>  
>  	mtk_pcie_enable_msi(pcie);
> -- 
> 2.51.2.1026.g39e6a42477-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

