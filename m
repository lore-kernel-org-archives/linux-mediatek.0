From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 01/32] mtd: rawnand: add hooks that may be called
 during nand_scan()
Date: Wed, 4 Jul 2018 09:09:42 +0200
Message-ID: <20180704090942.24a17db1@bbrezillon>
References: <20180703220029.19565-1-miquel.raynal@bootlin.com>
 <20180703220029.19565-2-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703220029.19565-2-miquel.raynal@bootlin.com>
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

Hi Miquel,

On Tue,  3 Jul 2018 23:59:58 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In order to remove the limitation that forbids dynamic allocation in
> nand_scan_ident(), we must create a path that will be the same for all
> controller drivers. The idea is to use nand_scan() instead of the widely
> implemented nand_scan_ident()/nand_scan_tail() couple. In order to
> achieve this, controller drivers will need to adjust some parameters
> between these two functions depending on the NAND chip wired on them.
> 
> For that, a hook called ->attach_chip() is created in the
> nand_hw_control structure. This structure may be referenced by two ways:
> 1/ if the driver does not implement its own controller, the
>    chip->controller hook is not populated before nand_scan() so it
>    cannot be dereferenced: use chip->hwcontrol instead (which is
>    statically allocated and will be referenced later by chip->controller
>    anyway).
> 2/ through chip->controller if the driver implements its own controller.
> 
> Another hook, ->detach_chip() is also introduced in order to clean the
> controller driver's potential allocations in case of failure of
> nand_scan_tail(). There is no need for the controller driver to call the
> ->detach_chip() hook directly upon error after a successful nand_scan().  
> In this situation, calling nand_release() as before is enough.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 21 +++++++++++++++++++--
>  include/linux/mtd/rawnand.h      |  6 ++++++
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index faac82b1e058..97a74d48b0cf 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6712,11 +6712,23 @@ EXPORT_SYMBOL(nand_scan_tail);
>  int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
>  		       struct nand_flash_dev *ids)
>  {
> +	struct nand_chip *chip = mtd_to_nand(mtd);
>  	int ret;
>  
>  	ret = nand_scan_ident(mtd, maxchips, ids);
> -	if (!ret)
> -		ret = nand_scan_tail(mtd);
> +	if (ret)
> +		return ret;
> +
> +	if (chip->controller->attach_chip) {
> +		ret = chip->controller->attach_chip(chip);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret && chip->controller->detach_chip)
> +		chip->controller->detach_chip(chip);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_with_ids);
> @@ -6744,7 +6756,12 @@ void nand_cleanup(struct nand_chip *chip)
>  
>  	/* Free manufacturer priv data. */
>  	nand_manufacturer_cleanup(chip);
> +
> +	/* Free controller specific allocations after chip identification */
> +	if (chip->controller->detach_chip)
> +		chip->controller->detach_chip(chip);
>  }
> +
>  EXPORT_SYMBOL_GPL(nand_cleanup);
>  
>  /**
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 0c6fb316b409..81654211e520 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -517,11 +517,17 @@ struct nand_id {
>   * @wq:			wait queue to sleep on if a NAND operation is in
>   *			progress used instead of the per chip wait queue
>   *			when a hw controller is available.
> + * @attach_chip:	Callback that may be called between nand_detect() and
> + *			nand_scan_tail() during nand_scan() (optional).
> + * @detach_chip:	Callback that may be called if nand_scan_tail() fails
> + *			(optional).
>   */
>  struct nand_hw_control {
>  	spinlock_t lock;
>  	struct nand_chip *active;
>  	wait_queue_head_t wq;
> +	int (*attach_chip)(struct nand_chip *chip);
> +	void (*detach_chip)(struct nand_chip *chip);
>  };

Can we instead declare a nand_controller_ops struct and then have
nand_hw_control point to it. Something like:

struct nand_controller_ops {
	int (*attach_chip)(struct nand_chip *chip);
	void (*detach_chip)(struct nand_chip *chip);
};

struct nand_hw_control {
	...
	const struct nand_controller_ops *ops;
};

>  
>  static inline void nand_hw_control_init(struct nand_hw_control *nfc)

Regards,

Boris
