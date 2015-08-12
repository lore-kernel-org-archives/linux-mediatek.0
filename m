From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 07/20] regmap: Without bus read() or write(), force
 use_single_rw
Date: Wed, 12 Aug 2015 12:45:45 +0200
Message-ID: <20150812104545.GB19600@pengutronix.de>
References: <1439374365-20623-1-git-send-email-mpa@pengutronix.de>
 <1439374365-20623-8-git-send-email-mpa@pengutronix.de>
 <CAGS+omC6dFVnzWmQN2XGy31s1nm-hQJ6DigJREynCAf7A-PcFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nwn6wlxaqfRJxJFc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omC6dFVnzWmQN2XGy31s1nm-hQJ6DigJREynCAf7A-PcFg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-iio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sasha Hauer <kernel@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Kevin Hilman <khilman@kernel.org>
List-Id: linux-mediatek@lists.infradead.org


--Nwn6wlxaqfRJxJFc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 12, 2015 at 06:33:55PM +0800, Daniel Kurtz wrote:
> Hi Markus,
>=20
> On Wed, Aug 12, 2015 at 6:12 PM, Markus Pargmann <mpa@pengutronix.de> wro=
te:
> >
> > The implementation of regmap bus read() and write() methods are
> > optional. Therefore we have to handle busses which do not have these
> > functions. If raw read() and write() is not supported we have to use
> > reg_read and reg_write always.
> >
> > This patch sets use_single_rw if read() or write() is not set.
> >
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  drivers/base/regmap/regmap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> > index f98bd5bf5c62..35ad3783da70 100644
> > --- a/drivers/base/regmap/regmap.c
> > +++ b/drivers/base/regmap/regmap.c
> > @@ -573,7 +573,7 @@ struct regmap *regmap_init(struct device *dev,
> >                 map->reg_stride =3D config->reg_stride;
> >         else
> >                 map->reg_stride =3D 1;
> > -       map->use_single_rw =3D config->use_single_rw;
> > +       map->use_single_rw =3D config->use_single_rw || !bus->read || !=
bus->write;
>=20
> What if bus is NULL?

Yes thanks, that has to be checked.

Best Regards,

Markus

>=20
> -Dan
>=20
> >         map->can_multi_write =3D config->can_multi_write;
> >         map->dev =3D dev;
> >         map->bus =3D bus;
> > --
> > 2.4.6
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Nwn6wlxaqfRJxJFc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVyyPZAAoJEEpcgKtcEGQQxqUP/20kVCqJjcAXbm49iSrAniF3
Grypc/uWZqbNsdk7xs7i8W/JaQymRu9GWj0YVKjFJEz0uZ4C7kM5zVMj2v1Hazuq
Z8N2VaGIRiQC1Xez2LvQ8g2yMCANSWK2QS41PdEo9AcFXAkpaz4J466utUwZ8QDW
do+IaOve9sSLx5CjqfHh6WgnSsNiRBaTkP1pxc1gq38sx118bourMd0i2XS6Ogi+
kitgJhJUtqFI/h4vogkPmj+jCg9+WZHw3NHdwFZrlXrcibMvOpeGNgxyWM+YyjJV
67jYMZq3ANxMgrBbj0BG/7mbWsRcOV0qjxAxHhSlIXEIkFgOJwf87+mPDKuSGvQ5
ohvrp1bW52qUeY/RY/A+rqxBe9R/ojS1AEN0lyGqnZOvrn6mRnWbzydEUnwMSotm
mgtC5iatsYWux2edKSJC4VOzav+XkMCqRCYBnPHqcM3UbUngm+ilW0zI9i4CydSQ
iGFDur8jCredUFuC2JI1ctsxCitEktnrWNCHRkweghP8/FWVSqYZQ4EsGfzdh5jZ
ke56MLd5wXq91Ed1k2HpSGuaiRm5+PdfFaRSh2Cus7q+MExasYWIXIW69bmLYvia
g/amwGfQ02NoXBnzM+gslANAZ5fEjL8asCoLzvVvgg8nvz+sqYiw7iF/zNHo31HB
8VQ0pFkQ2Dcm7YnGkzse
=RpIV
-----END PGP SIGNATURE-----

--Nwn6wlxaqfRJxJFc--
