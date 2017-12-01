From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/5] mtd: nand: provide several helpers to do common NAND
 operations
Date: Fri, 1 Dec 2017 11:38:36 +0900
Message-ID: <CAK7LNAT+_vjtjuLmBGaLYbOnN=oZ99tUogWCPgvbsy53aiboxA@mail.gmail.com>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-3-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171130170132.27522-3-miquel.raynal@free-electrons.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>, Nadav Haklai <nadavh@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, devel@driverdev.osuosl.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Maxim Levitsky <maximlevitsky@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Vladimir Zapolskiy <vz@mleia.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Ofer
List-Id: linux-mediatek@lists.infradead.org

2017-12-01 2:01 GMT+09:00 Miquel Raynal <miquel.raynal@free-electrons.com>:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> This is part of the process of removing direct calls to ->cmdfunc()
> outside of the core in order to introduce a better interface to execute
> NAND operations.
>
> Here we provide several helpers and make use of them to remove all
> direct calls to ->cmdfunc(). This way, we can easily modify those
> helpers to make use of the new ->exec_op() interface when available.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> [miquel.raynal@free-electrons.com: rebased and fixed some conflicts]
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c |    2 +-
>  drivers/mtd/nand/brcmnand/brcmnand.c     |    9 +-
>  drivers/mtd/nand/cafe_nand.c             |   14 +-
>  drivers/mtd/nand/denali.c                |   37 +-

For denali.c

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
