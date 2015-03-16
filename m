From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/5] clk: mediatek: Add basic clocks for Mediatek MT8135.
Date: Mon, 16 Mar 2015 08:03:39 +0100
Message-ID: <20150316070339.GA25487@pengutronix.de>
References: <1426485311-31428-1-git-send-email-s.hauer@pengutronix.de>
 <1426485311-31428-4-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426485311-31428-4-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mike Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hello Sascha,

On Mon, Mar 16, 2015 at 06:55:09AM +0100, Sascha Hauer wrote:
> +static const char *axi_parents[] __initconst =3D {
> +	"clk26m",
> +	"syspll_d3",
> +	"syspll_d4",
> +	"syspll_d6",
> +	"univpll_d5",
> +	"univpll2_d2",
> +	"syspll_d3p5"
> +};
__initconst should only be used for const data, but this array isn't
const. Only the strings the pointer in this array point to are constant=
=2E

So you have to use either

	static const char *axi_parents[] __initdata =3D {

or

	static const char * const axi_parents[] __initconst =3D {

=2E

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
