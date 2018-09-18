From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: mediatek: Fix unchecked return value
Date: Tue, 18 Sep 2018 11:46:29 +0100
Message-ID: <20180918104629.GC26886@e107981-ln.cambridge.arm.com>
References: <20180720150158.GA10922@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180720150158.GA10922@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jul 20, 2018 at 10:01:58AM -0500, Gustavo A. R. Silva wrote:
> Check return value of devm_pci_remap_iospace.
> 
> Notice that, currently, all instances of devm_pci_remap_iospace
> are being checked.
> 
> Addresses-Coverity-ID: 1471965 ("Unchecked return value")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to pci/mediatek for v4.20, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 861dda6..1477939 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -1109,7 +1109,9 @@ static int mtk_pcie_request_resources(struct mtk_pcie *pcie)
>  	if (err < 0)
>  		return err;
>  
> -	devm_pci_remap_iospace(dev, &pcie->pio, pcie->io.start);
> +	err = devm_pci_remap_iospace(dev, &pcie->pio, pcie->io.start);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 
