Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B9BC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgwboYod7k4hY/DGsiALiGa/TD9FW84Gs6eOQoyfSoQ=; b=LrYX+PRz/0RDmimMC3nA/snBms
	LoJTN1Y2RwrmjF76re/uAeVacvtG8Jojgnww5daStp3SX2Upe898m2+QY6fGgPmfmahq30E71jQVR
	fb0SHylXyMYkjjtYa7ItVQchMu3LInl5N54yihjefyS5syG9rauVBwiFswJEGf8GkrP47WJIkkyV1
	O39+aj60G6KmB1az4JkDLS8z0x5CFqH2EhIID9OxPx5TC0I8yGv7SB5HwziimZmJlej5iyDAB0QjM
	wxmIMnA+C6LvQylvFUsK9Hr9tzykV/2PH+gg8qKJUnQIc9UQR8FT2U1naP848EadYjkpns8QUuRqS
	kEiSU2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ9p-00HQ6q-0V;
	Mon, 14 Aug 2023 15:07:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ9l-00HQ5x-2P;
	Mon, 14 Aug 2023 15:06:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34688615AF;
	Mon, 14 Aug 2023 15:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A20CC433C7;
	Mon, 14 Aug 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692025616;
	bh=+NIKQGsKmMMJbWFy16rBGIgRnc+Ftb898/twa/T7r7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iguzc7DllXfmP7krdyWbHbMkYboZP7rMjJtswoyw5kS5vxprid9l9xOYb6xNpnCzr
	 AEJVOetq7XDHHXuSKOd4mTRb5KyBr3CdWdremFn4n4EYE12cF2r6vP9i8hn3jh9srl
	 MeYbnYJHbNfND77dHGBaULNEXEiR3/xH7zEb79lZ1J6Y/At/0iNmuSN1kzJaveQno7
	 +5oSrtFk70ei0SFBZ97WzP2qH1NSNTH7on9oqtmpSegd1trHNElUPnWsn+PivJB/w7
	 hqu1ejd69/RfT2HNXM8OZAgKYKxxAorQufFasTlrrP4Qo4zZnPvegnJAsYxTVb73h4
	 IQ27ogWNy1muw==
Date: Mon, 14 Aug 2023 17:06:53 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jean Delvare <jdelvare@suse.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Zapolskiy <vz@mleia.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 00/22] i2c: Use new PM macros
Message-ID: <ZNpDDWiqpGlZ01fb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jean Delvare <jdelvare@suse.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Zapolskiy <vz@mleia.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	virtualization@lists.linux-foundation.org
References: <20230722115046.27323-1-paul@crapouillou.net>
 <169100562778.1919254.5355387350651563678.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YOrVHCxcIjSDhBYQ"
Content-Disposition: inline
In-Reply-To: <169100562778.1919254.5355387350651563678.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_080657_870056_1787D8DF 
X-CRM114-Status: GOOD (  17.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--YOrVHCxcIjSDhBYQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:34PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Sat, 22 Jul 2023 13:50:24 +0200, Paul Cercueil wrote:
> > Here is a revised version of my patchset that converts the I2C drivers
> > to use the new PM macros.
> >=20
> > Changes since V1 include:
> > - Previous patch [01/23] that updated the amd-mp2 driver has been
> >   dropped per Jonathan's request.
> > - [09/22]: Unfold _DEV_PM_OPS() macro
> > - [10/22]: Convert to use regular device PM instead of using
> >   platform_driver.{suspend,resume}. I figured it was OK to also change
> >   it to use the new PM macros and keep it in one single patch.
> > - [13/22]: Rewrap runtime PM line
> >=20
> > [...]

Applied to for-next (via Andi's branch), thanks!


--YOrVHCxcIjSDhBYQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaQwwACgkQFA3kzBSg
KbaDMw//VbdoB1uujcbHlW8pgRVSqHqnF88zf15UYW4oQMPcz5HTf2NthklikoXP
VZotOIw8HpQfsLEJc9ZOw6WaA+g1/1A0kJ6nft2+w4lXiT1lRRF0Nbq9VLDJ8iXS
se9KGtH9oWoiaDSRWT3rcpPTW2C5sPMBl9nz9Uf6zzx43rq2ATtETKSp1qi+tNXe
D2QeZ6Rq8U7xak/PyGO1DSM0IEHMygAQNWn7xU0GM8x5m/OREG1z4nodwrfgo0eO
a1iXMQ1yhJWFE2bVR9RncJqOcq+fIjnQs9ckAHbVB3E4qjO8N9jW577W9AEnmxhi
tAnS+LmXLz1exjmqAfeJ+R+KHUkT/Bj3eTNdnYk2vEdxR2OV+a87dfJMARmb1E5f
/92dgijhP2RRi3gNzIidpmHVqFF2L0jEDkWjd9OiZtU6gTmlt1oi815msusEeYic
AYR6Xr2bvlNuw0VCPyp2hn0NvhvzG3JZnTdZ3m0KYuqvX23wVf6Kp6PI+xnHqF8h
tqW9h1oqXlbhY2BsoWgVgiECeVbd4kUNhPh4nKiA+BPov7NFkFs7lU5jz8qqvpEh
d2O/6g2bL9qLQWmvOBMmQrLLtCXH5OQWSJMT+Y6gGtpfDlXYXZGVpGkPF3XWJCNP
hwQhPiLVTevWUMJgFmIPd3hxyb8Brn6BDBx1qb8G1sciMZxYULw=
=Jr5W
-----END PGP SIGNATURE-----

--YOrVHCxcIjSDhBYQ--

