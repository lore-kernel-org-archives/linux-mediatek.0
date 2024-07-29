Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B78FC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 19:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jxx/SkjVHvt0255Bi5jRYTg2VX9ez7wP2Y9ENAPNYE=; b=T0paqVuBJEJir5SzuahC8DIxVU
	i5p3yf0Yp9J00C4sN4h/lf3RWz4sk/bIUQTDBdKDs2tdRa06EtqaVvqP4cjb0rSybSl9E0bk8julr
	JcCm0+S7DfUt/ZMLLelEMHIT+mJWTqyM0Knl0fvM94MFtAnc3scn9e6xaeV80F8ZlLeZmuJqV46FY
	Ya/4YKHZ4BVUGKPn1n2xi4jmSIyXNtSfVv7UwkJd6Y8EXP1Bxf08yYTZXbp7TpAT9sCrIcdMwiUsQ
	N4FRjEZ5O1SSqq4qmAJClU3Eo8IsTilehS6iv2aHL+J/BYQ99uDtK+q1JTvb+U2+YvgMqcisAkaJI
	xiS6IViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYVlk-0000000CSEK-49kB;
	Mon, 29 Jul 2024 19:10:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYVlI-0000000CS7O-1qZ6;
	Mon, 29 Jul 2024 19:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 666BCCE0B8C;
	Mon, 29 Jul 2024 19:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C00C32786;
	Mon, 29 Jul 2024 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722280221;
	bh=GeKFbCeom+VCaHgl8+PZ2JYGr43jkE4VDnS0ZOHl118=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/evAa/d22sRjeBoHWUAG0XI3zAn5CgjCDbxrFakPLvhyGkH1ZiB8hNs7aqvTXMYZ
	 5TUL6JW0aAKfa/B50hKl1p46kcghGQ2640KQImdQwmrGS4aHuFGrXF4egujzxnsdpN
	 LzKd6PjDPDzIBHj+j7JOnB5ajN3S1W801Gtaizt3WwMJ26zaaH5ItyKZZV42PUBL6v
	 FPj0Ad0YJVjfyr21oU3yEIf1MAkTrerMsKGoUzxq+g3+Jz0FEzADw4hYhlCsoVH0k9
	 rloWD0aWdv3l+WkuVM3cDuUdsE3rnW9qhDZcvJpKFlCDa44lTH+mYhszjS+/Fkt0bo
	 HgvskIRBbwgiA==
Date: Mon, 29 Jul 2024 21:10:17 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX
 performance
Message-ID: <ZqfpGVhBe3zt0x-K@lore-desk>
References: <20240729183038.1959-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eeEMdISa/6n5flqb"
Content-Disposition: inline
In-Reply-To: <20240729183038.1959-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_121024_851188_AEA75ED2 
X-CRM114-Status: GOOD (  17.76  )
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


--eeEMdISa/6n5flqb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This small series includes two short and simple patches to improve RX per=
formance
> on this driver.

Hi Elad,

What is the chip revision you are running?
If you are using a device that does not support HW-LRO (e.g. MT7986 or
MT7988), I guess we can try to use page_pool_dev_alloc_frag() APIs and
request a 2048B buffer. Doing so, we can use use a single page for two
rx buffers improving recycling with page_pool. What do you think?

Regards,
Lorenzo

>=20
> iperf3 result without these patches:
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-1.00   sec   563 MBytes  4.72 Gbits/sec
> 	[  4]   1.00-2.00   sec   563 MBytes  4.73 Gbits/sec
> 	[  4]   2.00-3.00   sec   552 MBytes  4.63 Gbits/sec
> 	[  4]   3.00-4.00   sec   561 MBytes  4.70 Gbits/sec
> 	[  4]   4.00-5.00   sec   562 MBytes  4.71 Gbits/sec
> 	[  4]   5.00-6.00   sec   565 MBytes  4.74 Gbits/sec
> 	[  4]   6.00-7.00   sec   563 MBytes  4.72 Gbits/sec
> 	[  4]   7.00-8.00   sec   565 MBytes  4.74 Gbits/sec
> 	[  4]   8.00-9.00   sec   562 MBytes  4.71 Gbits/sec
> 	[  4]   9.00-10.00  sec   558 MBytes  4.68 Gbits/sec
> 	- - - - - - - - - - - - - - - - - - - - - - - - -
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-10.00  sec  5.48 GBytes  4.71 Gbits/sec                  se=
nder
> 	[  4]   0.00-10.00  sec  5.48 GBytes  4.71 Gbits/sec                  re=
ceiver
>=20
> iperf3 result with "use prefetch methods" patch:
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-1.00   sec   598 MBytes  5.02 Gbits/sec
> 	[  4]   1.00-2.00   sec   588 MBytes  4.94 Gbits/sec
> 	[  4]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec
> 	[  4]   3.00-4.00   sec   594 MBytes  4.98 Gbits/sec
> 	[  4]   4.00-5.00   sec   590 MBytes  4.95 Gbits/sec
> 	[  4]   5.00-6.00   sec   594 MBytes  4.98 Gbits/sec
> 	[  4]   6.00-7.00   sec   594 MBytes  4.98 Gbits/sec
> 	[  4]   7.00-8.00   sec   593 MBytes  4.98 Gbits/sec
> 	[  4]   8.00-9.00   sec   593 MBytes  4.98 Gbits/sec
> 	[  4]   9.00-10.00  sec   594 MBytes  4.98 Gbits/sec
> 	- - - - - - - - - - - - - - - - - - - - - - - - -
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-10.00  sec  5.79 GBytes  4.98 Gbits/sec                  se=
nder
> 	[  4]   0.00-10.00  sec  5.79 GBytes  4.98 Gbits/sec                  re=
ceiver
>=20
> iperf3 result with "use PP exclusively for XDP programs" patch:
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-1.00   sec   635 MBytes  5.33 Gbits/sec
> 	[  4]   1.00-2.00   sec   636 MBytes  5.33 Gbits/sec
> 	[  4]   2.00-3.00   sec   637 MBytes  5.34 Gbits/sec
> 	[  4]   3.00-4.00   sec   636 MBytes  5.34 Gbits/sec
> 	[  4]   4.00-5.00   sec   637 MBytes  5.34 Gbits/sec
> 	[  4]   5.00-6.00   sec   637 MBytes  5.35 Gbits/sec
> 	[  4]   6.00-7.00   sec   637 MBytes  5.34 Gbits/sec
> 	[  4]   7.00-8.00   sec   636 MBytes  5.33 Gbits/sec
> 	[  4]   8.00-9.00   sec   634 MBytes  5.32 Gbits/sec
> 	[  4]   9.00-10.00  sec   637 MBytes  5.34 Gbits/sec
> 	- - - - - - - - - - - - - - - - - - - - - - - - -
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-10.00  sec  6.21 GBytes  5.34 Gbits/sec                  se=
nder
> 	[  4]   0.00-10.00  sec  6.21 GBytes  5.34 Gbits/sec                  re=
ceiver
>=20
> iperf3 result with both patches:
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-1.00   sec   652 MBytes  5.47 Gbits/sec
> 	[  4]   1.00-2.00   sec   653 MBytes  5.47 Gbits/sec
> 	[  4]   2.00-3.00   sec   654 MBytes  5.48 Gbits/sec
> 	[  4]   3.00-4.00   sec   654 MBytes  5.49 Gbits/sec
> 	[  4]   4.00-5.00   sec   653 MBytes  5.48 Gbits/sec
> 	[  4]   5.00-6.00   sec   653 MBytes  5.48 Gbits/sec
> 	[  4]   6.00-7.00   sec   653 MBytes  5.48 Gbits/sec
> 	[  4]   7.00-8.00   sec   653 MBytes  5.48 Gbits/sec
> 	[  4]   8.00-9.00   sec   653 MBytes  5.48 Gbits/sec
> 	[  4]   9.00-10.00  sec   654 MBytes  5.48 Gbits/sec
> 	- - - - - - - - - - - - - - - - - - - - - - - - -
> 	[ ID] Interval           Transfer     Bandwidth
> 	[  4]   0.00-10.00  sec  6.38 GBytes  5.48 Gbits/sec                  se=
nder
> 	[  4]   0.00-10.00  sec  6.38 GBytes  5.48 Gbits/sec                  re=
ceiver
>=20
> About 16% more packets/sec without XDP program loaded,
> and about 5% more packets/sec when using PP.
> Tested on Banana Pi BPI-R4 (MT7988A)
>=20
> ---
> Technically, this is version 2 of the =E2=80=9Cuse prefetch methods=E2=80=
=9D patch.
> Initially, I submitted it as a single patch for review (RFC),
> but later I decided to include a second patch, resulting in this series
> Changes in v2:
> 	- Add "use PP exclusively for XDP programs" patch and create this series
> ---
> Elad Yifee (2):
>   net: ethernet: mtk_eth_soc: use prefetch methods
>   net: ethernet: mtk_eth_soc: use PP exclusively for XDP programs
>=20
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.45.2
>=20

--eeEMdISa/6n5flqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZqfpGQAKCRA6cBh0uS2t
rIUMAP4nuNOMAUEsFdsLjRwAyFNgf1vOCZYQoyFon6wysD5fSQEAlHKbTNTyt0u4
EsoZUJ8VcK/cKEWZoQJOtnrr7BxBVw4=
=l8GM
-----END PGP SIGNATURE-----

--eeEMdISa/6n5flqb--

