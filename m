From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 33/35] mtd: rawnand: do not export
 nand_scan_[ident|tail]() anymore
Date: Sun, 22 Jul 2018 12:30:13 +0200
Message-ID: <20180722123013.500d8883@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-34-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-34-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:25 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Both nand_scan_ident() and nand_scan_tail() helpers used to be called
> directly from controller drivers that needed to tweak some ECC-related
> parameters before nand_scan_tail(). This separation prevented dynamic
> allocations during the phase of NAND identification, which was
> inconvenient.
> 
> All controller drivers have been moved to use nand_scan(), in
> conjunction with the chip->ecc.[attach|detach]_chip() hooks that
> actually do the required tweaking sequence between both ident/tail
> calls, allowing programmers to use dynamic allocation as they need all
> across the scanning sequence.
> 
> Declare nand_scan_[ident|tail]() statically now.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 16 +++++++++-------
>  include/linux/mtd/rawnand.h      |  9 ++-------
>  2 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index e7f135c100c2..da99232702a4 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5924,7 +5924,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  }
>  
>  /**
> - * nand_scan_ident - [NAND Interface] Scan for the NAND device
> + * nand_scan_ident - Scan for the NAND device
>   * @mtd: MTD device structure
>   * @maxchips: number of chips to scan for, returns immediately if 0
>   * @table: alternative NAND ID table
> @@ -5932,9 +5932,13 @@ static int nand_dt_init(struct nand_chip *chip)
>   * This is the first phase of the normal nand_scan() function. It reads the
>   * flash ID and sets up MTD fields accordingly.
>   *
> + * This helper used to be called directly from controller drivers that needed
> + * to tweak some ECC-related parameters before nand_scan_tail(). This separation
> + * prevented dynamic allocations during this phase which was unconvenient and
> + * as been banned for the benefit of the ->init_ecc()/cleanup_ecc() hooks.
>   */
> -int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> -		    struct nand_flash_dev *table)
> +static int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> +			   struct nand_flash_dev *table)
>  {
>  	int i, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> @@ -6016,7 +6020,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(nand_scan_ident);
>  
>  static int nand_set_ecc_soft_ops(struct mtd_info *mtd)
>  {
> @@ -6393,14 +6396,14 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  }
>  
>  /**
> - * nand_scan_tail - [NAND Interface] Scan for the NAND device
> + * nand_scan_tail - Scan for the NAND device
>   * @mtd: MTD device structure
>   *
>   * This is the second phase of the normal nand_scan() function. It fills out
>   * all the uninitialized function pointers with the defaults and scans for a
>   * bad block table if appropriate.
>   */
> -int nand_scan_tail(struct mtd_info *mtd)
> +static int nand_scan_tail(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
> @@ -6724,7 +6727,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(nand_scan_tail);
>  
>  static int nand_attach(struct nand_chip *chip)
>  {
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index a20c78e25878..a928771a7ae4 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -36,14 +36,9 @@ static inline int nand_scan(struct mtd_info *mtd, int max_chips)
>  }
>  
>  /*
> - * Separate phases of nand_scan(), allowing board driver to intervene
> - * and override command or ECC setup according to flash type.
> + * Unregister the MTD device and free resources held by the NAND device, must be
> + * called on error after a successful nand_scan().

Nope. You're mixing nand_cleanup() and nand_release(). nand_release()
should not be used because it ignores mtd_device_unregister() and might
call nand_cleanup() on an object that is still being exposed to the MTD
layer. Your comment applies to nand_cleanup() though ;-).

>   */
> -int nand_scan_ident(struct mtd_info *mtd, int max_chips,
> -			   struct nand_flash_dev *table);
> -int nand_scan_tail(struct mtd_info *mtd);
> -
> -/* Unregister the MTD device and free resources held by the NAND device */
>  void nand_release(struct mtd_info *mtd);
>  
>  /* Internal helper for board drivers which need to override command function */
