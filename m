Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BBEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/b1PEiCv1fKzGOxSbiyZDN0HigW/1OSYfLKLOqVpx0=; b=Dc1QRrjdBOI6a0zqv2+rX8Xjtf
	gA2JlNWyM/w+eLM4zRdh/tQqrw8JVLnw/RJdvdYzQy40ajmJH9S5nb0FQTMGjzuXLMwYvkRIHmfj5
	U8NLkdw3YgXK7Vl4R2fEGnPuwxHxFaABUC6Mt60KsnT08JDaMhGcXpaTBEJ42y9rTiz4aLq0NU0C/
	Fem4ZHbVSLa2X98r6yjXB0IpuPYv5eCKI+pFmK6xHthHiG/5WhdADmwUO49Q0oMHIVhM40/MNM/Kx
	+6FcHyGM2wJ5KeJMDmcEdc6l5Cm66ViZ422uQxatkVnplqTvXY1qgdh3dxSvaPIgmdaYEqHtgv2n2
	4bKZORtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dbE-009fK4-3X; Mon, 12 Dec 2022 07:51:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dax-009ezr-D0; Mon, 12 Dec 2022 07:51:31 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1670831481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/b1PEiCv1fKzGOxSbiyZDN0HigW/1OSYfLKLOqVpx0=;
	b=A+bB8E2vvc9wH5nBPnOfRvzsuOmo8YLVrfpEkRY/Y1UU8n/LROf5FE9OgCV3AbYiIsqgUe
	Y1MBqpFp5qPoL5uIplUrEhPendybXGWyHXW+5PVyfta7HnCKh/BOOQAS2ZzQ/gR7zzBx9Z
	a1phKjPd68JtJK6hUbIKn24CO5nfd9h0GaujfOCql84PTUDbmPwiE6Buq+YqJw8X//+WAA
	sVv8/PE2Lh3ZNZIc7XhT+pQ4Z4c1LAz03px2YUCjWQcLW4Iivu2MC6wmrXWcJUv7avV0qC
	vX0GsZ+Z2N6U4lTVh8KT0+cMORdUPPgddMR9QTOcJkzBMUQiHg2Y+9Lh7p8CyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1670831481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/b1PEiCv1fKzGOxSbiyZDN0HigW/1OSYfLKLOqVpx0=;
	b=fkBD4w8mCeUebYSbNeQAEZiKPII2aGaB6deOItFKlIwrAdc0TG+AJu3jR3ToVmUFFDw4Ta
	HtfebAc/G83RbSBg==
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, John Crispin
 <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, Sean
 Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen
 Chao <Landen.Chao@mediatek.com>, =?utf-8?B?bsOnIMOcTkFM?=
 <arinc.unal@arinc9.com>, Vivien
 Didelot <vivien.didelot@gmail.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Linus
 Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com, Woojung
 Huh <woojung.huh@microchip.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 01/10] dt-bindings: dsa: sync with maintainers
In-Reply-To: <20221211225823.nde77nlfriok4q6x@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-2-colin.foster@in-advantage.com>
 <87o7sbh896.fsf@kurt> <20221211225823.nde77nlfriok4q6x@skbuf>
Date: Mon, 12 Dec 2022 08:51:19 +0100
Message-ID: <87mt7tt5zc.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_235127_644697_AF885CE8 
X-CRM114-Status: GOOD (  13.84  )
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

On Mon Dec 12 2022, Vladimir Oltean wrote:
> On Sat, Dec 10, 2022 at 11:18:29AM +0100, Kurt Kanzenbach wrote:
>> You can update the hellcreek binding as well. Thanks.
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcr=
eek.yaml b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.y=
aml
>> index 73b774eadd0b..1d7dab31457d 100644
>> --- a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
>> +++ b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
>> @@ -12,7 +12,7 @@ allOf:
>>  maintainers:
>>    - Andrew Lunn <andrew@lunn.ch>
>>    - Florian Fainelli <f.fainelli@gmail.com>
>> -  - Vivien Didelot <vivien.didelot@gmail.com>
>> +  - Vladimir Oltean <olteanv@gmail.com>
>>    - Kurt Kanzenbach <kurt@linutronix.de>
>>=20=20
>>  description:
>
> Good observation. If there are no other comments on this patch series
> (which otherwise looks reasonable to me), I suppose that could be
> accomplished via a parallel patch as well? The diff you're proposing
> does not seem to conflict with something else that Colin is touching in
> this patch set.

Sure, it shouldn't conflict. I'll send a patch to update this
separately.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmOW3XcTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzguuMD/92WZk+2aqc2j0T+MK9KJHhGJ1tCGkp
XuowkXMdvKL85HUq/E4MD8Sek6H8QtzHw8tKFTkku2Vhszo2bV6cr65bajQGVmr/
uCwP5WqsHXzbjWiZcv4f+0/yZ2/Pvif0DMNHvGsI+GvZurrwvZLZdQBvQ/tw0CyC
/6S78qGSxcB15Fwyd/My0oS04qLr1yYG9rZTuV8mQiGwTPu+1iv8lAQNarMWhRx+
a9rE7roZqUDO7OeBfNmz4gzHPTkadG9jUCpy3U9YQOq8k+rdLmuEN6kt+Mh/DFVv
QgX8b0/hCVt0io9vq3Z1wrkM8xXuQ+54z1Yq/E0VJ6+RnngnkmSUwGso5/JLI+p4
+g1BCFw6MciOaEtinHKYZTjUQ++KakbaS4TiYlnNuW4HIEJ8EGOad1PJzBNuvd7g
9Hc+xx8DiRwjzZ54ME4OfsKIvb461+uZvpNgTg/A/QVtz+TweTFEa7zXagGxgshs
mNotZdRcqAMIUrX+4pvuf5iLV98eTK7QLvIorPhPhfnLRTNKewXuxyC/iUDsDtf5
c/iJPpOalSER1hDHakNs35E0I1OHgK4VxbbTpiJGv0NS7h6JzoTJ7dMnluBSnSPe
7hUmGbffICETV4LW+Qv0BznRKWBwJEdhfTccr+V2EJEsNmAVQYLcv7mrg3P/Ew+J
U6K/Q1zEc+X79A==
=xWGZ
-----END PGP SIGNATURE-----
--=-=-=--

