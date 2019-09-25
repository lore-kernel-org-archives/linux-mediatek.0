From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [MT6660] Mediatek Smart Amplifier Driver
Date: Wed, 25 Sep 2019 09:50:23 -0700
Message-ID: <20190925165023.GJ2036@sirena.org.uk>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20190903163829.GB7916@sirena.co.uk>
 <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
 <20190904115630.GA4348@sirena.co.uk>
 <3a9f66b3-bdb7-9bec-a9c4-ac58d3efa543@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1286266860759516056=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3a9f66b3-bdb7-9bec-a9c4-ac58d3efa543@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richtek Jeff Chang <richtek.jeff.chang@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============1286266860759516056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FO0yZLwVDWUwTKck"
Content-Disposition: inline


--FO0yZLwVDWUwTKck
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 06:04:23PM +0800, Richtek Jeff Chang wrote:
> Mark Brown =E6=96=BC 2019/9/4 =E4=B8=8B=E5=8D=887:56 =E5=AF=AB=E9=81=93:
> > On Wed, Sep 04, 2019 at 03:07:06PM +0800, Richtek Jeff Chang wrote:

> > > > It would be good to implement a regmap rather than open coding
> > > > *everything* - it'd give you things like this without needing to op=
en
> > > > code them.  Providing you don't use the cache code it should cope f=
ine
> > > > with variable register sizes.

> > > Due to our hardware design, it is hard to implement regmap for MT6660.
> > You definitely can't use all the functionality due to the variable
> > register sizes but using reg_write() and reg_read() should get you most
> > of it.

> =C2=A0=C2=A0=C2=A0 How can I fill the val_bits for variable register size?

> =C2=A0=C2=A0=C2=A0 I try to use all 32 bits val_bits, but our chip some r=
egisters are
> overlap...

> =C2=A0=C2=A0=C2=A0 Do you have any suggestion for this issue?=C2=A0 Thank=
 you very much!

If you use reg_read() and reg_write() operations you can hide the
register size within them - the rest of the code thinks the
registers are all the 32 bits but when doing I/O it can use the
appropriate size for a given register.

> > > > > +	for (i =3D 0; i < len; i++) {
> > > > > +		ret =3D mt6660_i2c_update_bits(chip, init_table[i].addr,
> > > > > +				init_table[i].mask, init_table[i].data);
> > > > > +		if (ret < 0)
> > > > > +			return ret;

> > > > Why are we not using the chip defaults here?

> > > Because MT6660 needs this initial setting for working well.
> > What are these settings?  Are you sure they are generic settings and
> > not board specific?

> Yes, they are generic setting. It comes from our hardware designers.

You should probably be using the regmap register patch feature,
it's for things like this where the chip should always be used
with a different set of defaults to the silicon.

> Should I send new patch file to you in this mail loop, or I should send n=
ew
> patch via new Email Loop?

A new one please.

--FO0yZLwVDWUwTKck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2Lms8ACgkQJNaLcl1U
h9DWyAf9GJg6rx9ZA0HyG5Q6KMBXqXHcD5FiF/ew+TDWG91wurQF0lIa3JOuBM6P
5MIzrRqWv0j0DFyUD+E0TLtruxSh5zWNV8De2kE84wswFX1f6QA7FYOKqs9iTQ/I
RdCU8CfdrVviYD7cphFaaaF2Aq/dlSGA/kRINOiWswGyYaHLB78Z/TYLD9L5tPTk
yo5ju5eLjrAL4PPOso49/VhONhU6BOcIjmOBiix3NkL45BzNS1gPVGsggRcFC3Rc
aaBv1Fd3lPfExjOG9p5H6PGzGLjtPh5DwK7AuXs0RaW8cUWdrIsvRARD6R6+OTCr
5g84bg+BvEfqAeb1XolhPuf7EpZ/Ow==
=C2/G
-----END PGP SIGNATURE-----

--FO0yZLwVDWUwTKck--


--===============1286266860759516056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1286266860759516056==--
