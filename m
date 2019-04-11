From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [v3 PATCH] PCI: mediatek: get optional clock by
 devm_clk_get_optional()
Date: Thu, 11 Apr 2019 10:08:56 +0100
Message-ID: <20190411090856.GA6227@red-moon>
References: <c4579e5a72f169808a9ad4aefdd7bf7b75d10d61.1554879079.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <c4579e5a72f169808a9ad4aefdd7bf7b75d10d61.1554879079.git.chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org, Honghui Zhang <honghui.zhang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Apr 10, 2019 at 02:54:16PM +0800, Chunfeng Yun wrote:
> Use devm_clk_get_optional() to get optional clock
> 
> Cc: Ryder Lee <ryder.lee@mediatek.com>
> Cc: Honghui Zhang <honghui.zhang@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> Acked-by: Honghui Zhang <honghui.zhang@mediatek.com>
> ---
> v3: add Acked-by Ryder and Honghui
> ---
>  drivers/pci/controller/pcie-mediatek.c | 50 ++++++++------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)

Applied to pci/mediatek for v5.2, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 0b6c72804e03..adb6cb15daa2 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -915,49 +915,29 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  
>  	/* sys_ck might be divided into the following parts in some chips */
>  	snprintf(name, sizeof(name), "ahb_ck%d", slot);
> -	port->ahb_ck = devm_clk_get(dev, name);
> -	if (IS_ERR(port->ahb_ck)) {
> -		if (PTR_ERR(port->ahb_ck) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		port->ahb_ck = NULL;
> -	}
> +	port->ahb_ck = devm_clk_get_optional(dev, name);
> +	if (IS_ERR(port->ahb_ck))
> +		return PTR_ERR(port->ahb_ck);
>  
>  	snprintf(name, sizeof(name), "axi_ck%d", slot);
> -	port->axi_ck = devm_clk_get(dev, name);
> -	if (IS_ERR(port->axi_ck)) {
> -		if (PTR_ERR(port->axi_ck) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		port->axi_ck = NULL;
> -	}
> +	port->axi_ck = devm_clk_get_optional(dev, name);
> +	if (IS_ERR(port->axi_ck))
> +		return PTR_ERR(port->axi_ck);
>  
>  	snprintf(name, sizeof(name), "aux_ck%d", slot);
> -	port->aux_ck = devm_clk_get(dev, name);
> -	if (IS_ERR(port->aux_ck)) {
> -		if (PTR_ERR(port->aux_ck) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		port->aux_ck = NULL;
> -	}
> +	port->aux_ck = devm_clk_get_optional(dev, name);
> +	if (IS_ERR(port->aux_ck))
> +		return PTR_ERR(port->aux_ck);
>  
>  	snprintf(name, sizeof(name), "obff_ck%d", slot);
> -	port->obff_ck = devm_clk_get(dev, name);
> -	if (IS_ERR(port->obff_ck)) {
> -		if (PTR_ERR(port->obff_ck) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		port->obff_ck = NULL;
> -	}
> +	port->obff_ck = devm_clk_get_optional(dev, name);
> +	if (IS_ERR(port->obff_ck))
> +		return PTR_ERR(port->obff_ck);
>  
>  	snprintf(name, sizeof(name), "pipe_ck%d", slot);
> -	port->pipe_ck = devm_clk_get(dev, name);
> -	if (IS_ERR(port->pipe_ck)) {
> -		if (PTR_ERR(port->pipe_ck) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		port->pipe_ck = NULL;
> -	}
> +	port->pipe_ck = devm_clk_get_optional(dev, name);
> +	if (IS_ERR(port->pipe_ck))
> +		return PTR_ERR(port->pipe_ck);
>  
>  	snprintf(name, sizeof(name), "pcie-rst%d", slot);
>  	port->reset = devm_reset_control_get_optional_exclusive(dev, name);
> -- 
> 2.21.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
