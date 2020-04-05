Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66C0C2BA16
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 03:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2742078A
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 03:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGBXBdp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2742078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q9Zai5ms2SqxgooYtmR9VydNVG6gtaSYEle89OJ8qeg=; b=LGBXBdp4JdvLdvAskOCaRWRiH
	GhNQRWKsX7nkEDO3uLY7/lrKTrACovAEXjq9wNfMLhXvqz6xFF4PRGh43M7yv3UVXd2v9zox0cmJd
	0uYnmk3LcK0sVoqAGqi53mmqgbd0PdbqIXOyRjvrrAD7Kc+jtPDskufasZhOafMAcxgf0/PirluQh
	dxUsvtetBb89JMgSsTL2BESbVbOka03rQ9NTQRrmbhEO/yb7D14Rz0JKsl3fcZuNNK3NjkPtoRTWF
	/IN1puK4yvevEKEHFxRKSt8vxTE2okIjk7wXX3qOP7k4qGqmOKZxHuABzkSlMBCn1W06ZNU7QsNbN
	tS0sAe71A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKvxb-0002Hu-Mk; Sun, 05 Apr 2020 03:28:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKvxS-00029m-V7; Sun, 05 Apr 2020 03:28:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id D4D2D296765
Received: by earth.universe (Postfix, from userid 1000)
 id 1A3C13C082A; Sun,  5 Apr 2020 05:28:23 +0200 (CEST)
Date: Sun, 5 Apr 2020 05:28:23 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: battery: add new battery parameters
Message-ID: <20200405032823.bje2tnk7fbaem3jr@earth.universe>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <8827238b51029886dea56ce3141b216361a3f299.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <8827238b51029886dea56ce3141b216361a3f299.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_202827_267063_CD50FBF3 
X-CRM114-Status: GOOD (  18.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrei Stefanescu <andrei.stefanescu@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 "Angelo G. Del Regno" <kholk11@gmail.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Markus Reichl <m.reichl@fivetechno.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, markus.laine@fi.rohmeurope.com,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, mazziesaccount@gmail.com,
 linux-arm-msm@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Baolin Wang <baolin.wang@linaro.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 patches@opensource.cirrus.com
Content-Type: multipart/mixed; boundary="===============4092610724290288462=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4092610724290288462==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qh6djbuvpcbq2w5m"
Content-Disposition: inline


--qh6djbuvpcbq2w5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 03, 2020 at 11:41:11AM +0300, Matti Vaittinen wrote:
> Add:
>=20
>  - trickle-charge-current-microamp:
>=20
> Some chargers have 3 charging stages. First one when battery is almost
> empty is often called as trickle-charge. Last state when battery has been
> "woken up" is usually called as fast-charge. In addition to this some
> chargers have a 'middle state' which ROHM BD99954 data-sheet describes as
> pre-charge. Some batteries can benefit from this 3-phase charging
> [citation needed].
>=20
> Introduce trickle-charge-current-microamp so that batteries can give
> charging current limit for all three states.
>=20
>  - precharge-upper-limit-microvolt:
>=20
> When battery voltage has reached certain limit we change from
> trickle-charge to next charging state (pre-charge for BD99954). Allow
> battery to specify this limit.
>=20
>  - re-charge-voltage-microvolt:
>=20
> Allow giving a battery specific voltage limit for chargers which can
> automatically re-start charging when battery has discharghed down to
> this limit.
>=20
> - over-voltage-threshold-microvolt
>=20
> Allow specifying voltage threshold after which the battery is assumed to
> be faulty.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>=20
> No changes since v7
>=20
>  Documentation/devicetree/bindings/power/supply/battery.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/supply/battery.txt b=
/Documentation/devicetree/bindings/power/supply/battery.txt
> index 3049cf88bdcf..5e29595edd74 100644
> --- a/Documentation/devicetree/bindings/power/supply/battery.txt
> +++ b/Documentation/devicetree/bindings/power/supply/battery.txt
> @@ -11,15 +11,21 @@ different type. This prevents unpredictable, potentia=
lly harmful,
>  behavior should a replacement that changes the battery type occur
>  without a corresponding update to the dtb.
> =20
> +Please note that not all charger drivers respect all of the properties.
> +
>  Required Properties:
>   - compatible: Must be "simple-battery"
> =20
>  Optional Properties:
> + - over-voltage-threshold-microvolt: battery over-voltage limit
> + - re-charge-voltage-microvolt: limit to automatically start charging ag=
ain
>   - voltage-min-design-microvolt: drained battery voltage
>   - voltage-max-design-microvolt: fully charged battery voltage
>   - energy-full-design-microwatt-hours: battery design energy
>   - charge-full-design-microamp-hours: battery design capacity
> + - trickle-charge-current-microamp: current for trickle-charge phase
>   - precharge-current-microamp: current for pre-charge phase
> + - precharge-upper-limit-microvolt: limit when to change to constant cha=
rging
>   - charge-term-current-microamp: current for charge termination phase
>   - constant-charge-current-max-microamp: maximum constant input current
>   - constant-charge-voltage-max-microvolt: maximum constant input voltage
> --=20
> 2.21.0
>=20
>=20
> --=20
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>=20
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]=20

--qh6djbuvpcbq2w5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl6JUFYACgkQ2O7X88g7
+poZrRAAjjnAXCTT9TeHNtk89vi+gUGZY9aNBAXKiAU9n8mE5QAdmour8g/7CMNc
BiZOIemjSVp+ro7ZFioRHyIxNQgJ3BsjmnsjRyflRS4c/x5r21ozUJVistzPt3Gi
345IP/Gs8mcJFyHZL6Wdu/zfPfcwZkT7JpVJTSzZHQWKOZw6Gg0zkIo9Bgua9/Mc
gZ1l2aooi+X6rIsor/2OBU1dMRT+05kvGNxAg3RQEdD5BDX5199OEz5jaxbLyVEn
RSK1tQNZfpZMamk8MQzlAAn2Tq2qNApTOwz6VAd7F0qPYE1NujDgqwRHz6Qnbj7/
LcBEarKGmlQ+lH6CE9fQPEla0aViuTIK77hWalERGO01z5FcH5HeCWyjfVScuM/1
t7ezLQC9tYYjZ0VJld16IGkq71lcqmY5hMca/H4s6vlKr40u5n2cz9gKCydPOfcr
Omwojhhh7+zR2jsBYbTDB8D/uTJaA3D/OwQZ6BSRwpKyz9UEQa75cPhKEM58RaWx
5U/SFkdhZ0dqKJVvhGYEiCl/SJAtw8AkYL3QIz9Q5nZb+V5hvWETgdEkErRpSTkt
Wa82G3fx4Hzpk6K/QaehNDNiye2MeH0mTp994Og3yMEx77X6P8ldH5BS15U7IqAs
743zK4ru7Fw70H6JgqzT4OdW0nFwv7RCGMD7HSR6HlSBycc2dCw=
=ZaOK
-----END PGP SIGNATURE-----

--qh6djbuvpcbq2w5m--


--===============4092610724290288462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4092610724290288462==--

