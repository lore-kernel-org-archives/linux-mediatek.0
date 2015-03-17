From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/5] clk: mediatek: Add basic clocks for Mediatek MT8135.
Date: Tue, 17 Mar 2015 14:54:31 +0100
Message-ID: <20150317135431.GH10068@pengutronix.de>
References: <1426485311-31428-1-git-send-email-s.hauer@pengutronix.de>
 <1426485311-31428-4-git-send-email-s.hauer@pengutronix.de>
 <20150316070339.GA25487@pengutronix.de>
 <20150317094738.GF4927@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150317094738.GF4927@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: James Liao <jamesjj.liao@mediatek.com>, Mike Turquette <mturquette@linaro.org>, YH Chen <yh.chen@mediatek.com>, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hello Sascha,

On Tue, Mar 17, 2015 at 10:47:38AM +0100, Sascha Hauer wrote:
> On Mon, Mar 16, 2015 at 08:03:39AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Mar 16, 2015 at 06:55:09AM +0100, Sascha Hauer wrote:
> > > +static const char *axi_parents[] __initconst =3D {
> > > +	"clk26m",
> > > +	"syspll_d3",
> > > +	"syspll_d4",
> > > +	"syspll_d6",
> > > +	"univpll_d5",
> > > +	"univpll2_d2",
> > > +	"syspll_d3p5"
> > > +};
> > __initconst should only be used for const data, but this array isn'=
t
> > const. Only the strings the pointer in this array point to are cons=
tant.
>=20
> That may be true, but the way it's currently done compiles through
> without warnings with CONFIG_DEBUG_SECTION_MISMATCH enabled.
CONFIG_DEBUG_SECTION_MISMATCH doesn't catch this type of error.

>=20
> >=20
> > So you have to use either
> >=20
> > 	static const char *axi_parents[] __initdata =3D {
>=20
> This results in:
>=20
> drivers/clk/mediatek/clk-mt8173.c:515:20: error: i2s3_b_ck_parents ca=
uses a section type conflict with infra_clks
>  static const char *i2s3_b_ck_parents[] __initdata =3D {
The compiler catches if a single section contains both modifiable and
constant data. The linker doesn't seem to check anything here. So you
have to do it consistently per compilation unit. (I'm not aware of any
problems if you do it consistently wrong in a compilation unit, but
better do it consistently right :-)
I'm sure getting it right isn't that hard, so IMHO this should be fixed
before your patch is applied.

> which can be avoided with static const char * const axi_parents[] __i=
nitdata
This should be __initconst (to do it consistently right).

> > or
> >=20
> > 	static const char * const axi_parents[] __initconst =3D {
>=20
> Which results in:
>=20
> drivers/clk/mediatek/clk-mt8173.c:568:2: warning: initialization disc=
ards 'const' qualifier from pointer target type
>   MUX_GATE(TOP_HDCP_24M_SEL, "hdcp_24m_sel", hdcp_24m_parents, 0x00d0=
, 16, 2, 23),
>=20
> With the following patch this can also be resolved. Until this is mer=
ged
> (or I have the OK from Mike to add this in front of this series) I
> prefer to keep it like it is at the moment.
I remember trying something like that some time ago, but without
success. I didn't modify clk-composite.c but still I would be surprised
if it were that easy.

(The result were commits like 4a043d79dc2d and 145047de9940.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
