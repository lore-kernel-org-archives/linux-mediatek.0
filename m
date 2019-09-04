From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [MT6660] Mediatek Smart Amplifier Driver
Date: Wed, 4 Sep 2019 12:56:30 +0100
Message-ID: <20190904115630.GA4348@sirena.co.uk>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20190903163829.GB7916@sirena.co.uk>
 <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richtek Jeff Chang <richtek.jeff.chang@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2019 at 03:07:06PM +0800, Richtek Jeff Chang wrote:

> > > +static int32_t mt6660_i2c_update_bits(struct mt6660_chip *chip,
> > > +	uint32_t addr, uint32_t mask, uint32_t data)
> > > +{

> > It would be good to implement a regmap rather than open coding
> > *everything* - it'd give you things like this without needing to open
> > code them.  Providing you don't use the cache code it should cope fine
> > with variable register sizes.

> Due to our hardware design, it is hard to implement regmap for MT6660.

You definitely can't use all the functionality due to the variable
register sizes but using reg_write() and reg_read() should get you most
of it.

> > > +static int mt6660_i2c_init_setting(struct mt6660_chip *chip)
> > > +{
> > > +	int i, len, ret;
> > > +	const struct codec_reg_val *init_table;
> > > +
> > > +	init_table = e4_reg_inits;
> > > +	len = ARRAY_SIZE(e4_reg_inits);
> > > +
> > > +	for (i = 0; i < len; i++) {
> > > +		ret = mt6660_i2c_update_bits(chip, init_table[i].addr,
> > > +				init_table[i].mask, init_table[i].data);
> > > +		if (ret < 0)
> > > +			return ret;

> > Why are we not using the chip defaults here?

> Because MT6660 needs this initial setting for working well.

What are these settings?  Are you sure they are generic settings and
not board specific?

> > > +	if (on_off) {
> > > +		if (chip->pwr_cnt == 0) {
> > > +			ret = mt6660_i2c_update_bits(chip,
> > > +				MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
> > > +			val = mt6660_i2c_read(chip, MT6660_REG_IRQ_STATUS1);
> > > +			dev_info(chip->dev,
> > > +				"%s reg0x05 = 0x%x\n", __func__, val);
> > > +		}
> > > +		chip->pwr_cnt++;

> > This looks like you're open coding runtime PM stuff?  AFAICT the issue
> > is that you need to write to this register to do any I/O.  Just
> > implement this via the standard runtime PM framework, you'll need to do
> > something about the register I/O in the controls (ideally in the
> > framework, it'd be a lot easier if you did have a cache) but you could
> > cut out this bit.

> In our experience, some Customer platform doesn't support runtime PM.

Tell your customers to turn it on, it's a standard kernel framework and
there's really no excuse for open coding it.  If there's some reason why
runtime PM can't work for them then we should get that fixed but it
really is *very* widely deployed.

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1vpm0ACgkQJNaLcl1U
h9D/Wgf/fF6J63LckawJfQOykVgSmyHQqs469Lx+ZiWwED24peJ4nfDP41ehqc2N
jIXIbNv3uhy0SKfDxmczPs6zHyy+XgWw3pHOHVQR7SX2ZBIU/JwBYSYtmJiZW9yo
GWU/tn7Yql2ApiXs1VRjJfCeiHWCpPg4WTAGOjP2LUeALkQasMQI9nwtqEoJWSyz
tZ15Q9sb3HyKa1Pl0qmh4IPIIQvCtpvD3DdTyHs8OZGFlWzUg5WC17sjRLpbqgxd
d75ADeY84KntmV55haCavSYQGD5cjIMD1pWRc5Ln0yOUKO3H3gwUHqgOgafmUbmc
cTfAzmpdBvy1P5aHKQZ0z6uU7LT39g==
=jNHe
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
