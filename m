From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v4 04/35] mtd: rawnand: denali: convert to nand_scan()
Date: Wed, 25 Jul 2018 23:16:40 +0900
Message-ID: <CAK7LNASmSOi9mygxD2PLmYJ=br2qdK_UtECYZXFNavmUc4OA1Q@mail.gmail.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-5-miquel.raynal@bootlin.com> <CAK7LNASmJRWM7Gj9qqqZqwenPkoRFeA8tupx+3PKPXC6OxD_eA@mail.gmail.com>
 <20180725115116.1fb38fe3@bbrezillon> <20180725144717.604d3197@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725144717.604d3197@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-mtd <linux-mtd@lists.infradead.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

2018-07-25 21:47 GMT+09:00 Miquel Raynal <miquel.raynal@bootlin.com>:
> Hi Boris,
>
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 25 Jul 2018
> 11:51:16 +0200:
>
>> On Wed, 25 Jul 2018 18:42:44 +0900
>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>> >
>> > You need to remove kfree(denali->buf)
>> > from denali_remove(), right?
>>
>> Absolutely.
>>
>> >
>> > void denali_remove(struct denali_nand_info *denali)
>> > {
>> >         struct mtd_info *mtd =3D nand_to_mtd(&denali->nand);
>> >
>> >         nand_release(mtd);
>> >         kfree(denali->buf);       <---- REMOVE !!
>> >         denali_disable_irq(denali);
>> > }
>> >
>> >
>> > Otherwise, denali_remove() will free denali->buf twice
>> > because kfree(denali->buf) is called from denali_detach_chip().
>>
>
> Absolutely, thanks for reviewing!
>
> I'll apply with this changed.
>
> Miqu=C3=A8l


Assuming you will fix this,

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


--=20
Best Regards
Masahiro Yamada
