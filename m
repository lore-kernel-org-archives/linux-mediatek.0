From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 32/35] mtd: rawnand: tegra: convert driver to
 nand_scan()
Date: Sun, 22 Jul 2018 11:31:06 +0200
Message-ID: <20180722113106.45c11ecb@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
        <20180720151527.16038-33-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720151527.16038-33-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.o>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 20 Jul 2018 17:15:24 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> +	chip = &nand->chip;
> +	chip->controller = &ctrl->controller;
> +	chip->controller->ops = &tegra_nand_controller_ops;

Should be moved next to the controller initialization.
