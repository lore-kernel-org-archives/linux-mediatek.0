Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B65DFF495F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCrGrXBRzw3Kv3fNUxxYQyeRIObn7RdJ/sUqUBNRyb4=; b=FcsTdMZoAUYT9nthhG6+0BYxTY
	m12HZ+74MkJLuqs4AMnfrPofMzvbCRR7ceLY6DV20I9W3acAJnSUosLr93JzEacYl3y/eca7alvZ0
	I/qVW2emSaomll1lFHRWMLpjI3g/O0O1G3PIOi3aJ7alutK+SJ+Dy+XIREFcLw99iLKkd4I+6BPpV
	aFOu3JLUmXqZOcP9zlxTr4JOh7iQcO9SqYFWgPolTTpIUPYu19gNIKQWKj11TtdbYkxYNiLnBj//s
	ovB1sxgJmBVL8Ag211N1pPv56lGsMRbgtLwZAybS1eVqu1/g2inzQsgzQl/lbFDaaCNT0roIRgvnj
	vb9phw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77fU-0000000Aod8-22FB;
	Mon, 30 Mar 2026 08:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77fS-0000000AocS-3zKB;
	Mon, 30 Mar 2026 08:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62FB76011F;
	Mon, 30 Mar 2026 08:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9246EC2BCB4;
	Mon, 30 Mar 2026 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774858094;
	bh=WCrGrXBRzw3Kv3fNUxxYQyeRIObn7RdJ/sUqUBNRyb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8r/ZN4QlWHd5eTR5Z6U6Mo2prZPK+wl8OmlZEewr+yefBoZWEiid8MH4KlpyqOKu
	 6F09K58FT1fwI4bkSgqlZ9LsyeEvEXZRXYrQR2rmgf9KLq9m6cjsxPJISf/F2ndQYf
	 wGnJpJpwxfCYXAmY7FY8ezMqNcfktKbP9hbWFnnLlmkieXvmNcWFUvdN7Kv83+cd3A
	 TrAZEcXyxchyQ12INEtah9NJ6YgenzXI+tomBYZjFwEYI0PrdUqt4XtC2gnfOMNTFQ
	 0PhdzeLtlzbMLeQ0d6dx0B4JUCOUM+1SVrgXvPdHIsiwKW9IZiOu2KLhqB7ya9cSgk
	 7Azs76izr/c9Q==
Date: Mon, 30 Mar 2026 10:08:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 00/10] net: airoha: Support multiple net_devices
 connected to the same GDM port
Message-ID: <acova-OzNROZPypL@lore-desk>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
 <20260329103653.7593cbb2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T79mHm2wjmVHKFmE"
Content-Disposition: inline
In-Reply-To: <20260329103653.7593cbb2@kernel.org>
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


--T79mHm2wjmVHKFmE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, 29 Mar 2026 15:07:50 +0200 Lorenzo Bianconi wrote:
> > EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> > Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw multiplexer that
> > manages the traffic in a TDM manner. As a result multiple net_devices c=
an
> > connect to the same GDM{3,4} port and there is a theoretical "1:n"
> > relation between GDM ports and net_devices.
>=20
> Does not apply.

Hi Jakub,

ack, I will rebase in v2.

Regards,
Lorenzo

--T79mHm2wjmVHKFmE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCacovawAKCRA6cBh0uS2t
rLjsAQDqRNDCLAkpZdLlO6pj8AWlmRpg/HjyTEK9ZSoHwgMlHAEApL4xBjPwtYZN
nwAYpyHCC9SZNb8pHXJrM/i12uFA5wM=
=wkgu
-----END PGP SIGNATURE-----

--T79mHm2wjmVHKFmE--

