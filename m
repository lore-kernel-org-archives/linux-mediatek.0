From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 28/35] mtd: rawnand: allow exiting immediately
 nand_scan_ident()
Date: Sun, 22 Jul 2018 10:49:12 +0200
Message-ID: <20180722104912.77e81f8d@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-29-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-29-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei Li <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.org, Richard
List-Id: linux-mediatek@lists.infradead.org

On Fri, 20 Jul 2018 17:15:20 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Some driver (eg. docg4) will need to handle themselves the
> identification phase. As part of the migration to use nand_scan()
> everywhere (which will unconditionnaly call nand_scan_ident()), we add
> a condition at the start of nand_scan_ident() to just "do nothing" if
> the maxchips parameters is zero, meaning that the driver does not want
> the core to handle this phase.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index dea41fa25be1..e7f135c100c2 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5926,7 +5926,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  /**
>   * nand_scan_ident - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> - * @maxchips: number of chips to scan for
> + * @maxchips: number of chips to scan for, returns immediately if 0
>   * @table: alternative NAND ID table
>   *
>   * This is the first phase of the normal nand_scan() function. It reads the
> @@ -5940,6 +5940,14 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	int ret;
>  
> +	/*
> +	 * If the number of chips to scan for is null, just return silently.

						 ^ zero


> +	 * This is for specific drivers that must handle this part of the
> +	 * probe process themselves (e.g docg4).
> +	 */

I think that description of the special case maxchips == 0 should be
placed in the kernel doc header.

> +	if (!maxchips)
> +		return 0;

Can we move this check in nand_scan_with_ids()?

> +
>  	/* Enforce the right timings for reset/detection */
>  	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
>  
