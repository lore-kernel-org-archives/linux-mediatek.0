From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH v3 3/5] phy: ocelot-serdes: convert to use eth phy mode
 and submode
Date: Tue, 20 Nov 2018 10:18:22 +0100
Message-ID: <20181120091822.blfreis63eqt6cgg@qschulz>
References: <20181120012424.11802-1-grygorii.strashko@ti.com>
 <20181120012424.11802-4-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="upeqvdm2aqdtabke"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120012424.11802-4-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Carlo Caione <carlo@caione.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Manu Gautam <mgautam@>
List-Id: linux-mediatek@lists.infradead.org


--upeqvdm2aqdtabke
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grygorii,

Thanks for the patch!

On Mon, Nov 19, 2018 at 07:24:22PM -0600, Grygorii Strashko wrote:
> Convert ocelot-serdes PHY driver to use recently introduced
> PHY_MODE_ETHERNET and phy_set_mode_ext().
>=20
> Cc: Quentin Schulz <quentin.schulz@bootlin.com>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
Tested-by: Quentin Schulz <quentin.schulz@bootlin.com>

Tested on top of latest master branch of net-next
(e432abfb99e5642a7e7fcaa1c8cb0e80c8fcf58e) on a PCB120 with VSC8584 PHYs
(for reference if we ever find out there is a problem with this patch).

> diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-=
ocelot-serdes.c
> index c61a9890..77c46f6 100644
> --- a/drivers/phy/mscc/phy-ocelot-serdes.c
> +++ b/drivers/phy/mscc/phy-ocelot-serdes.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/phy.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -104,20 +105,24 @@ struct serdes_mux {
>  	u8			idx;
>  	u8			port;
>  	enum phy_mode		mode;
> +	int			submode;
>  	u32			mask;
>  	u32			mux;
>  };
> =20
> -#define SERDES_MUX(_idx, _port, _mode, _mask, _mux) {		\
> +#define SERDES_MUX(_idx, _port, _mode, _submode, _mask, _mux) {		\
>  	.idx =3D _idx,						\
>  	.port =3D _port,						\
>  	.mode =3D _mode,						\
> +	.submode =3D _submode,					\
>  	.mask =3D _mask,						\
>  	.mux =3D _mux,						\
>  }
> =20
> -#define SERDES_MUX_SGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_SGMII, m,=
 c)
> -#define SERDES_MUX_QSGMII(i, p, m, c) SERDES_MUX(i, p, PHY_MODE_QSGMII, =
m, c)
> +#define SERDES_MUX_SGMII(i, p, m, c) \
> +	SERDES_MUX(i, p, PHY_MODE_ETHERNET, PHY_INTERFACE_MODE_SGMII, m, c)
> +#define SERDES_MUX_QSGMII(i, p, m, c) \
> +	SERDES_MUX(i, p, PHY_MODE_ETHERNET, PHY_INTERFACE_MODE_QSGMII, m, c)
> =20
>  static const struct serdes_mux ocelot_serdes_muxes[] =3D {
>  	SERDES_MUX_SGMII(SERDES1G(0), 0, 0, 0),
> @@ -154,7 +159,7 @@ static const struct serdes_mux ocelot_serdes_muxes[] =
=3D {
>  	SERDES_MUX_SGMII(SERDES6G(1), 8, 0, 0),
>  	SERDES_MUX_SGMII(SERDES6G(2), 10, HSIO_HW_CFG_PCIE_ENA |
>  			 HSIO_HW_CFG_DEV2G5_10_MODE, 0),
> -	SERDES_MUX(SERDES6G(2), 10, PHY_MODE_PCIE, HSIO_HW_CFG_PCIE_ENA,
> +	SERDES_MUX(SERDES6G(2), 10, PHY_MODE_PCIE, 0, HSIO_HW_CFG_PCIE_ENA,
>  		   HSIO_HW_CFG_PCIE_ENA),
>  };
> =20
> @@ -164,12 +169,17 @@ static int serdes_set_mode(struct phy *phy, enum ph=
y_mode mode, int submode)
>  	unsigned int i;
>  	int ret;
> =20
> +	/* As of now only PHY_MODE_ETHERNET is supported */
> +	if (mode !=3D PHY_MODE_ETHERNET)
> +		return -EOPNOTSUPP;
> +
>  	for (i =3D 0; i < ARRAY_SIZE(ocelot_serdes_muxes); i++) {
>  		if (macro->idx !=3D ocelot_serdes_muxes[i].idx ||
> -		    mode !=3D ocelot_serdes_muxes[i].mode)
> +		    mode !=3D ocelot_serdes_muxes[i].mode ||
> +		    submode !=3D ocelot_serdes_muxes[i].submode)
>  			continue;

We will most likely need to rework this to ignore the submode of the
PCIe muxing if the mode is PCIe but let=B4s figure this out when we add
support for PCIe muxing.

Thanks,
Quentin

--upeqvdm2aqdtabke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlvz0V0ACgkQhLiadT7g
8aNyyQ/9HHbjSXFuhr8ixxQl4GCkfyYdRF43ffUphv+n1gtelhHeUjNXM5OSCncs
gBPNhNOreZPlyPI+myyvjVPfa+I+7MBUxTVy6psMIDVYl5qN4AGLE98iEBxZAicF
9Va3YXZcADUeKVcKurxx3ZnM24uZsrOzNvo0P4xzetRPSbf4WpXCvgLzBsR/8X/1
KjTFE3yg9/0YvASydPMAScI7S9/pBUVuWsPm0lHa8YiJBygSWKlbGMBz4PxqRhXe
5xHzm8mYOoY7oh513qOu7h5oGtcdxCnDdaIXmNyfXHFIIaYs4BhaUXVj3EDzTLj9
uPHUC5gtTWOzTLUP56wPPHjRgwOjp5R3kX9p/xvP2o5nJpS9qfxNGaw+o2bY9eC+
ONdwmkUJDHUqkFNTlHc8Mt3aTjvihloY9BCQjKkekXp6IpkfLinS1K9vqV7lTt7W
bdYkyvQXryZVIGOo37bFEdDXXrC8EA0CudUrEyH6KEYjVYrM/G7eyqDFuZ/fMJqU
RO95suerT1XF06yqzI2S/3Wdn6saIFVcHU6qqLui2LVBj73Xpft+QeremfWb6sg2
d6PtHV/OqdTO+/nxneEr0rGu4Izg7N1dXEQH9CCDJDtzLU9RgF5jVd8SAk28oajm
s/lesudMgYnV+JpgVM7/S0Q5oVdw5U1Uf+usHJxDeObIsgh+v/8=
=eLlX
-----END PGP SIGNATURE-----

--upeqvdm2aqdtabke--
