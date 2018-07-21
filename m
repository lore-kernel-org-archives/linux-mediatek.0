From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 19/35] mtd: rawnand: sh_flctl: move all NAND chip
 related setup in one function
Date: Sat, 21 Jul 2018 19:48:29 +0200
Message-ID: <20180721194829.44e9b29f@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-20-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-20-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> @@ -1007,6 +1007,16 @@ static int flctl_chip_init_tail(struct mtd_info *mtd)
>  	struct sh_flctl *flctl = mtd_to_flctl(mtd);
>  	struct nand_chip *chip = &flctl->chip;
>  
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		/*
> +		 * NAND_BUSWIDTH_16 may have been set by nand_scan_ident().
> +		 * Add the SEL_16BIT flag in pdata->flcmncr_val and re-assign
> +		 * flctl->flcmncr_base to pdata->flcmncr_val.
> +		 */
> +		flctl->pdata->flcmncr_val |= SEL_16BIT;
> +		flctl->flcmncr_base = flctl->pdata->flcmncr_val;

pdata->flcmncr_val is not used after this point. I think you can just do

		flctl->flcmncr_base |= SEL_16BIT;

and get rid of the ftcl->pdata field you add in this patch.

> +	}
> +
