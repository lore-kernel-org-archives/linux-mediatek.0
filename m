From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 13/35] mtd: rawnand: marvell: convert driver to
 nand_scan()
Date: Sat, 21 Jul 2018 18:57:37 +0200
Message-ID: <20180721185537.01f01362@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-14-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720151527.16038-14-miquel.raynal@bootlin.com>
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

On Fri, 20 Jul 2018 17:15:05 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>  
> -	ret = nand_scan_tail(mtd);
> +	chip->controller->ops = &marvell_nand_controller_ops;

Assigning ->ops to &marvell_nand_controller_ops should be done only
once in the probe function (here [1]). With that fixed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> +	ret = nand_scan(mtd, marvell_nand->nsels);
>  	if (ret) {
> -		dev_err(dev, "nand_scan_tail failed: %d\n", ret);
> +		dev_err(dev, "could not scan the nand chip\n");
>  		return ret;
>  	}
>  
