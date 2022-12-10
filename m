Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB7C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty5wsGimI0tKO4tCsLTXg96lpBlywCG0/ZSuieeSBNw=; b=j/QMQeFZnG4jLa+p7oWodGhucM
	yPiSJkIFdsQ0mCFuFo/fR8PcnSl6djhW4aJ87mUoWNYh/nRaJRtmR79U3aZseMHDb0QxJgUIblf/3
	myxSn/tITJkur5EfhDM6OlQ79VzKEV066ouBLzhH0iuvd6Q3oRRqRqvGLZatGoEifR6XbaImTOayL
	xLA9ptjIYX1QOLp93LtiAlX32vfDfd9+DZvw5wd1g5/Wak7LzHh7euHRPUikkw2+Vswja/Zi9km28
	yT3IG058j4Gemn+yn0fjCxoJlRvn/qH0hjL702LD325Kl/Pv34rFQz5bdIbFsgxuSH1i/Nx1SkRs+
	nhM4eKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wwU-00GDmm-UO; Sat, 10 Dec 2022 10:18:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wwI-00GDcb-27; Sat, 10 Dec 2022 10:18:40 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1670667511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ty5wsGimI0tKO4tCsLTXg96lpBlywCG0/ZSuieeSBNw=;
	b=z4YFhF/4tnkRVvjv/OClKIp/5pRw40DctYX83xCGrgIVgpabgHlXlTO5MirwipzH98lhqq
	TRfavDq5zBiKwzwECYHlNm4VaCLNmUN1b1bW2ANkG5tjxuI1WDNw/3hUbmDLYchO+NWExq
	/+3sUjxrNzDQfycwHZwbD91gSij7fOeJFvyn7ln/dCNjNhks8vJOYuuWCfFrSY3aOHuDLe
	F8bgvPKrR6Z7NmjSO/5N6yGn/Lb3AWNxjltqgMp4kDTB9DkRhihJdiQquseUAod/KyHDkx
	0GjMt/1BCftpv/mLax/KKu+NUOssKiFz61elqq05VLC9u0wmg6ywK2IuijQHAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1670667511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ty5wsGimI0tKO4tCsLTXg96lpBlywCG0/ZSuieeSBNw=;
	b=jUtHSXMT5MAJkecXlOrwudnyd6w97zyYvKRhYfEB1n79hLqdxZKcSt/HHrjSvQ/K6el/g/
	RKMDdW7Dcwyd1OCA==
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 =?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, Vivien Didelot
 <vivien.didelot@gmail.com>,
 =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, Alvin
 =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Linus Walleij <linus.walleij@linaro.org>,
 UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, George McCollister
 <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 01/10] dt-bindings: dsa: sync with maintainers
In-Reply-To: <20221210033033.662553-2-colin.foster@in-advantage.com>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-2-colin.foster@in-advantage.com>
Date: Sat, 10 Dec 2022 11:18:29 +0100
Message-ID: <87o7sbh896.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_021838_436369_146826C3 
X-CRM114-Status: GOOD (  14.56  )
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri Dec 09 2022, Colin Foster wrote:
> The MAINTAINERS file has Andrew Lunn, Florian Fainelli, and Vladimir Olte=
an
> listed as the maintainers for generic dsa bindings. Update dsa.yaml and
> dsa-port.yaml accordingly.
>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
>
> ---
>
> v5
>   * New patch
>
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa-port.yaml | 2 +-
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Do=
cumentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 9abb8eba5fad..2b8317911bef 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -9,7 +9,7 @@ title: Ethernet Switch port Device Tree Bindings
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
>    - Florian Fainelli <f.fainelli@gmail.com>
> -  - Vivien Didelot <vivien.didelot@gmail.com>
> +  - Vladimir Oltean <olteanv@gmail.com>
>=20=20
>  description:
>    Ethernet switch port Description
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documen=
tation/devicetree/bindings/net/dsa/dsa.yaml
> index b9d48e357e77..5efc0ee8edcb 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -9,7 +9,7 @@ title: Ethernet Switch Device Tree Bindings
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
>    - Florian Fainelli <f.fainelli@gmail.com>
> -  - Vivien Didelot <vivien.didelot@gmail.com>
> +  - Vladimir Oltean <olteanv@gmail.com>

You can update the hellcreek binding as well. Thanks.

diff --git a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek=
.yaml b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
index 73b774eadd0b..1d7dab31457d 100644
=2D-- a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
@@ -12,7 +12,7 @@ allOf:
 maintainers:
   - Andrew Lunn <andrew@lunn.ch>
   - Florian Fainelli <f.fainelli@gmail.com>
=2D  - Vivien Didelot <vivien.didelot@gmail.com>
+  - Vladimir Oltean <olteanv@gmail.com>
   - Kurt Kanzenbach <kurt@linutronix.de>
=20
 description:

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmOUXPUTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgrQFD/4qzANLVIDNmAXq6YHaa1ML5D21go2L
PrwddcGJRfn4INzwchv05dIML2gtqasZ6ug1NTpJ8ypmod396M/i/J62taZ7TEM/
9DK9rARUgAUdXCeM95tdlV6pmA6M46Sf7iYYH/enczZNkTZI/qCQrRN/4qDq+WAs
MVRNX4++Qw3ytahvNXrzlDrKoDY4N0NqpJ7kPyWvwqo5dSpAAlLKWhASXvh3qrae
6ObFLssKhEFIfKNErR6iQdcqOREGRH/LJyKX4u7m/CNGDBz5x6riMDMOh5Rih1LG
qeEZ7gJoTsISVySHQgJ58EU2LNdPpbr8y+DEFgDpxjnXDCW90vPzCxu9kbi8jwIR
XrHaRTDagP+IQB4aOpbbxLpNHwa3yuYjSF0A1N7keXWWG9koyXU5MOruMOnveyXh
O7Eu/47wTx8lY5i5n2Tbd3I/6i6zmTmVogL5RBjml9RgZvDuKi2Gmu/IFCdXVNEw
6/uBpkTepOHRyhOOZbIcWfZX3hqeC6THGwHAf1pJHSsCTGDwFBWJ/z13wSa9ZBDI
2OZGCV37dYLLxgLXbz4KOTNzUsTwlIztDZklGfEyHoHtqX7UdFuzlzL1+3Di0yHB
zjpvFphD8FMokYY8pOfsyz5k5CpqXJISAZ15INvc5FUX6upDS8xGNGi5AJfZ71XR
OvYRLoO2PCLRuA==
=ti3Q
-----END PGP SIGNATURE-----
--=-=-=--

