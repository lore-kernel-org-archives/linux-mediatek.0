From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 04/35] mtd: rawnand: denali: convert to nand_scan()
Date: Wed, 25 Jul 2018 14:47:17 +0200
Message-ID: <20180725144717.604d3197@xps13>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
        <20180720151527.16038-5-miquel.raynal@bootlin.com>
        <CAK7LNASmJRWM7Gj9qqqZqwenPkoRFeA8tupx+3PKPXC6OxD_eA@mail.gmail.com>
        <20180725115116.1fb38fe3@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725115116.1fb38fe3@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@>
List-Id: linux-mediatek@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 25 Jul 2018
11:51:16 +0200:

> On Wed, 25 Jul 2018 18:42:44 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> > 
> > You need to remove kfree(denali->buf)
> > from denali_remove(), right?  
> 
> Absolutely.
> 
> > 
> > void denali_remove(struct denali_nand_info *denali)
> > {
> >         struct mtd_info *mtd = nand_to_mtd(&denali->nand);
> > 
> >         nand_release(mtd);
> >         kfree(denali->buf);       <---- REMOVE !!
> >         denali_disable_irq(denali);
> > }
> > 
> > 
> > Otherwise, denali_remove() will free denali->buf twice
> > because kfree(denali->buf) is called from denali_detach_chip().  
> 

Absolutely, thanks for reviewing!

I'll apply with this changed.

Miquèl
