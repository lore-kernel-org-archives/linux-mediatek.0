From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: mtk: fix object reference leaks in
 mtk_ecc_get
Date: Tue, 5 Feb 2019 14:31:06 +0100
Message-ID: <20190205143106.751554e0@xps13>
References: <HK0PR02MB36345BDC344D1A6FE77B4576B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <HK0PR02MB36345BDC344D1A6FE77B4576B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wen yang <yellowriver2010@hotmail.com>
Cc: "xiaolei.li@mediatek.com" <xiaolei.li@mediatek.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi wen,

wen yang <yellowriver2010@hotmail.com> wrote on Tue, 5 Feb 2019
10:05:46 +0000:

> of_find_device_by_node() takes a reference to the struct device
> when it finds a match via get_device, there is no need to call
> get_device() twice.
> We also should make sure to drop the reference to the device
> taken by of_find_device_by_node() on driver unbind.
> 
> Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
> Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Xiaolei Li <xiaolei.li@mediatek.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/nand/raw/mtk_ecc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
> index 6432bd7..25bdc15 100644
> --- a/drivers/mtd/nand/raw/mtk_ecc.c
> +++ b/drivers/mtd/nand/raw/mtk_ecc.c
> @@ -265,17 +265,25 @@ static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
>  {
>  	struct platform_device *pdev;
>  	struct mtk_ecc *ecc;
> +	int ret;
>  
>  	pdev = of_find_device_by_node(np);
> -	if (!pdev || !platform_get_drvdata(pdev))
> +	if (!pdev)
>  		return ERR_PTR(-EPROBE_DEFER);
> +	if (!platform_get_drvdata(pdev)) {
> +		ret = -EPROBE_DEFER;
> +		goto err_put_device;
> +	}
>  
> -	get_device(&pdev->dev);
>  	ecc = platform_get_drvdata(pdev);
>  	clk_prepare_enable(ecc->clk);
>  	mtk_ecc_hw_init(ecc);
>  
>  	return ecc;
> +
> +err_put_device:
> +	put_device(&pdev->dev);
> +	return ERR_PTR(ret);

Same as before, I don't think a label is useful in this situation.


Thanks,
Miquèl
