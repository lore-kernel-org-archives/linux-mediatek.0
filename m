From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Fix unchecked return value
Date: Wed, 5 Sep 2018 16:50:33 +0800
Message-ID: <1536137433.31406.17.camel@mhfsdcap03>
References: <20180720150158.GA10922@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720150158.GA10922@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-07-20 at 10:01 -0500, Gustavo A. R. Silva wrote:
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
> 

Hi, Gustavo, thanks for your help.

Acked-by: Honghui Zhang <honghui.zhang@mediatek.com>

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
