From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 01/33] mtd: rawnand: brcmnand: convert driver to
 nand_scan()
Date: Fri, 20 Jul 2018 01:17:19 +0200
Message-ID: <20180720011719.7545fbb9@bbrezillon>
References: <20180719230026.8741-1-miquel.raynal@bootlin.com>
        <20180719230026.8741-2-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719230026.8741-2-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.o>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 20 Jul 2018 00:59:54 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> +
> +static struct nand_controller_ops brcmnand_controller_ops = {

static const ...

The same comment applies to all patches of this series.

> +	.attach_chip = brcmnand_attach_chip,
> +};
