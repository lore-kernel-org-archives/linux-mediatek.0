From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: Fix the null function of format_val on
 regmap_bulk_read.
Date: Wed, 26 Aug 2015 13:35:56 +0100
Message-ID: <20150826123556.GB2977@sirena.org.uk>
References: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440589396-696-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2015 at 07:43:16PM +0800, Henry Chen wrote:
> The regmap_format will not be initialize if device driver not declare the regmap_bus
> when registering the regmap. To avoid the null function of format_val when
> called regmap_bulk_read(). It need to give a format function when regmap init.

> Call trace:
> [<          (null)>]           (null)
> [<ffffffc0004cbdd0>] mtk_rtc_read_time+0x9c/0x134
> [<ffffffc0004c9618>] __rtc_read_time.isra.3+0x40/0x7c
> [<ffffffc0004c9688>] rtc_read_time+0x34/0x58

Please don't paste entire backtraces in, they're enormous and tend to
obscure the actual content while adding little value.  If needed then
edited highlights work better.  I'm fairly sure I've mentioned this
before...

> @@ -783,8 +783,22 @@ struct regmap *regmap_init(struct device *dev,
>  		map->defer_caching = true;
>  		map->reg_write = _regmap_bus_raw_write;
>  	}
> +/*
> + * For bulk read, need to hook the format function.
> + */
> +simple_format_initialization:

The indentation is all messed up here, we're misssing a blank line and
the comment is not indented.

> -skip_format_initialization:
> +	switch (config->val_bits) {
> +		case 8:
> +			map->format.format_val = regmap_format_8;
> +			break;
> +		case 16:
> +			map->format.format_val = regmap_format_16_native;
> +			break;
> +		case 32:
> +			map->format.format_val = regmap_format_32_native;
> +			break;
> +	}

Why are these format functions sensible?  Converting a null pointer
dereference into data corruption wouldn't be ideal.  The commit message
should really cover this.

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV3bKsAAoJECTWi3JdVIfQXMYH/A9IffVVQ6WD6+QPWoWQSbfC
O26DLVbJx3+kMNKyoWg/6NzAsAkXZBZFqs2Uc4TkeVJkS3I4PKPT1jgVfYqC0KI0
1AFZ8kOHmHjVfLm1oM1SJ/bglGHC1MXNeX6+f56RDporml3RcGXNTSfuLtKuKH91
DugFiqkpe8EZbFbB3UgPzZEy/Ga1x8jFkKaWx0ogI1pVuUsTKSCHTnU+h6SUFuDd
RWSMPbhjox2NysxxkEElXnxS+XkeT/iYdKcoFZtuDB7KRLO8YazRAd3fgjK78pu0
OgP9vGA+abbgIU/viTUSbRSKgXC02mFrg+OiQQw+2VeX6kKC3ErQet31/khmEC4=
=Yo5v
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
