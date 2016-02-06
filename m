From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH] MIPS: pci-mt7620: Fix return value check in
 mt7620_pci_probe()
Date: Sat, 6 Feb 2016 16:40:03 +0100
Message-ID: <56B613D3.2070709@openwrt.org>
References: <1454768659-32720-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1454768659-32720-1-git-send-email-weiyj_lk@163.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: weiyj_lk@163.com, Ralf Baechle <ralf@linux-mips.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@linux-mips.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


On 06/02/2016 15:24, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, the function devm_ioremap_resource() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Hi,

thanks for the fix.

Acked-by: John Crispin <blogic@openwrt.org>

@Ralf: can you merge this via LMO with the next PR please ?

@mbgg: ignore the patch please it is for the legacy MIPS SoCs

	John

> ---
>  arch/mips/pci/pci-mt7620.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
> index a009ee4..044c1cd 100644
> --- a/arch/mips/pci/pci-mt7620.c
> +++ b/arch/mips/pci/pci-mt7620.c
> @@ -297,12 +297,12 @@ static int mt7620_pci_probe(struct platform_device *pdev)
>  		return PTR_ERR(rstpcie0);
>  
>  	bridge_base = devm_ioremap_resource(&pdev->dev, bridge_res);
> -	if (!bridge_base)
> -		return -ENOMEM;
> +	if (IS_ERR(bridge_base))
> +		return PTR_ERR(bridge_base);
>  
>  	pcie_base = devm_ioremap_resource(&pdev->dev, pcie_res);
> -	if (!pcie_base)
> -		return -ENOMEM;
> +	if (IS_ERR(pcie_base))
> +		return PTR_ERR(pcie_base);
>  
>  	iomem_resource.start = 0;
>  	iomem_resource.end = ~0;
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
