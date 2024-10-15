Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E94D1F9C5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3x05/iWQkrdQdnoD8NFZZRDkLEPrALiLb9TpzuwUQM=; b=BbIeP6yHNfjiEjRGgM4KY1l/q0
	3INH/MYoDvXPFV16Ut1qwfGCyPgBmro1l7h+vJNiuJCJRoxxFgKEkEU9fjq2L3qEMjEBVrJ5PIUKl
	f8rTgM2L6rzq8cX0N1cQio5Zy7ahgE+2IaurvlTG/gPQ3kGPOQkX+33YllfgJxReJDuvfrKg+4/Da
	f7GO9+VR/rbnBJ0AMrjbMtUkqy6t+mQfoy3gJtw6CZn34RF/t/jGYFvdGa0YsAmQOr3grXRXpMU0H
	9LJVStEjYhx1NlwGUog4kojNlsDWMqJEgWoWMjb3RMvC2d9eomPbmxj5Z9uy3BIczHeIyIv32VJup
	yoLXEKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oE7-00000009WWq-0Xok;
	Tue, 15 Oct 2024 20:33:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oCf-00000009WJl-0iin;
	Tue, 15 Oct 2024 20:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1729024278; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jwww7gRQHfBX0chd0jT/PqoypZG+ZFlT6XJIWplL5vTeTufNWOp41MOxAQC6Q/LV/ZRpZX5UBvPVpCzRB6FMNtrxyEZ84Q2/oHsm/IiM50Nk5k2BPoidpVEIH26QRGQd5RrLlo/5EveWkrnpIBAKKtl1sXHfew9GLBvKiiDqkCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729024278; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t3x05/iWQkrdQdnoD8NFZZRDkLEPrALiLb9TpzuwUQM=; 
	b=IuRqM1/IWd9C6ZFNcrGO4mb3V+ZARxquYFUxgMcNH7Qr+kAHjGZEP6WUFKyqLXzkKBfmk5QWP0RPqGvIZPhcU7tQuT8E6AQAa4XXK/J9Ox1Fqz4jr8ntUXF9f0bVuMnZ5MTts3+r2aCjWGivrxZW5kksdYc2wvQ+j5HB++n4WdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729024278;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=t3x05/iWQkrdQdnoD8NFZZRDkLEPrALiLb9TpzuwUQM=;
	b=OBMAgv84wc0VNms2thoO2pvKlssV8a8PHglZNeZc5Q/8n+m9fRwByGeUDQBuq1VV
	imiboeizclOdd0+zob+6LHwn3UpIMQS10B+r8+okbPsraKswQJ+xvUzjzEIqnaa6vPv
	6d5WXqeIcRD1P+gQcOjugmzcl8dOduRRdTTe2VQw=
Received: by mx.zohomail.com with SMTPS id 17290242769731012.8904185135845;
	Tue, 15 Oct 2024 13:31:16 -0700 (PDT)
Received: by mercury (Postfix, from userid 1000)
	id 7FE011060433; Tue, 15 Oct 2024 22:31:05 +0200 (CEST)
Date: Tue, 15 Oct 2024 22:31:05 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v8 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <vb324yv7s7yew6m74lfvdv6wnuo6e4rxtiu2q7okypttw46ox2@lgfdkie6o3t2>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
 <20241001104145.24054-3-macpaul.lin@mediatek.com>
 <5nvshurbpmjkqysphfrfxhekq3c6od6a2uqai4rfxns64mdvf7@ftjvgjnivr3k>
 <20241009155222.GB637580@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2l3agui2g5zltsjn"
Content-Disposition: inline
In-Reply-To: <20241009155222.GB637580@google.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/228.999.33
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_133137_290038_5F11D41B 
X-CRM114-Status: GOOD (  15.92  )
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


--2l3agui2g5zltsjn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
MIME-Version: 1.0

Hi,

On Wed, Oct 09, 2024 at 04:52:22PM +0100, Lee Jones wrote:
> On Wed, 02 Oct 2024, Krzysztof Kozlowski wrote:
>=20
> > On Tue, Oct 01, 2024 at 06:41:45PM +0800, Macpaul Lin wrote:
> > > Convert the mfd: mediatek: mt6397 binding to DT schema format.
> > >=20
> > > MT6323, MT6358, and MT6397 are PMIC devices with multiple function
> > > subdevices. They share a common PMIC design but have variations in
> > > subdevice combinations.
> > >=20
> > > Key updates in this conversion:
> > >=20
> > > 1. RTC:
> > >    - Convert rtc-mt6397.txt and merge into parent MT6397 PMIC DT sche=
ma.
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Everyone okay with me taking this without a pull-request?

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--2l3agui2g5zltsjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcO0QUACgkQ2O7X88g7
+pq0FQ/9FMCSq1lfOMV4aYkiPMJgvA+Yi89RMy4XcuGLf6F+EvXVlOJN4qdpFD8D
Pe40iww7vsZTqfHbl/YOLF4g2vJKqxz1wU/TeY2dVv39o++IYhoVaSaQjoJrtHgT
8p8cHExz+AmO9caP5P6uGx6oTISGKhDr7ZwAY5ntAiacuFhDxJHO3qOXZ/IRzhLo
WjhmBe4YjhuInmTz0Hq609b+9s2qIwf+aeuxenap+/V2qlZh213GwolJiDc3x+nu
oa/CCu0c4Ocm/PFmqNdinqGv1hxAP5BlzwTBhVjCWVE3/av6G3pjXzlGRBD+1/QH
u4mE566PcmYY1AcM28A+sDng1OU362Jdj9xoAfvQRLlvioQ+e4rW2hPxo3Ix4KOK
bWDwuSVS96Pm/5F2lqXCTqmxYWPD5M9gSdFhvTebVq/OIEh6F8Oqd0wU79T/va8W
EavPKNvXjekoPv/o7zKStW8Fu8HzeCAvYnDBEjmr7igL+8fKI5SGvcNV3SgSmyBE
Tp/RLXiICnFqwzKVOS5n9EotpwQvWQEwlkPMhPKjNAi0E06FB/TZRTJ0/f1J+w4E
TiwnYKQYKaNaM293kor6pNz/PCWvDK1kBMRSOYcmscu8KJjYzmvi/NaBXsHP5oZx
0aOTHfrk7EXHEWJoLssNe4VKphceb4PosOWNK04tR1yEpcAKc+4=
=wdwg
-----END PGP SIGNATURE-----

--2l3agui2g5zltsjn--

