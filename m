From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Remove unused variable
Date: Thu, 06 Jun 2019 10:55:15 -0700
Message-ID: <20190606175516.A5AB22083E@mail.kernel.org>
References: <VI1PR07MB44324648C54773C24E4B186AFD070@VI1PR07MB4432.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR07MB44324648C54773C24E4B186AFD070@VI1PR07MB4432.eurprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Philippe Mazenauer <philippe.mazenauer@outlook.de>, Michael Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Quoting Philippe Mazenauer (2019-05-21 05:16:14)
> Variable 'ddrphycfg_parents' is defined static and initialized, but not
> used in the file.
>=20
> ../drivers/clk/mediatek/clk-mt8516.c:234:27: warning: =E2=80=98ddrphycfg_=
parents=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  static const char * const ddrphycfg_parents[] __initconst =3D {
>                            ^~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Philippe Mazenauer <philippe.mazenauer@outlook.de>
> ---

Applied to clk-next
