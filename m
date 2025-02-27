Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180FDC021BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDeYYUOHDnMiBpLFvcoGjESPSceT3e34+89HKRm6dZI=; b=g+/gjEQuBYT9l4qWuULIt8wD9r
	5hWB6Dp5ynKcMVBRlMnqM/JwHh4Klqdjsk7ElJorXx7nvHx2YWgKMiEMVfiu7Ea4uOCKwygvSmtUt
	Wz9C72Ge5/HrwNKq0w1O6wOowU24Xmt3/f/PsQ2apNWWXTYS4mGpvADrYClv1kmnOUX7xm9Qwmwij
	EP/I60YJmAg/zq5/HEsnhgcgX1TwFYWsUYJXLkKje3a9E52UIOvttNrSVetclBGL4vz5hqpfrLj56
	nwrO7i7rgCR6ijF2BW0kEQqSNJwPtj5pnRgC02v8e163yIVn0VCH4ma93BJSBlQyBBlblRJm+wMUv
	lskwCduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZPn-00000006ijf-0j6y;
	Thu, 27 Feb 2025 08:38:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZOE-00000006iW9-3TEx;
	Thu, 27 Feb 2025 08:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8D0E5C10E7;
	Thu, 27 Feb 2025 08:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9A9C4CEDD;
	Thu, 27 Feb 2025 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740645425;
	bh=nRbj/Wkfu4NpdGGUja9RSPwp1X8dZdVwrbBMJ/2V0wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRkxdmgokJlBe27n3RIU7ojbt+6jpjnxlL94eKr6TcvXAyZXXYLS+rBDbVJVjv5BR
	 MZB6qyjZyrvjqgzO1hlFGzXr/ZK6e8Zj7Kx/AmDypMr3NuJOiPYeFSCJDJBtL1rAKi
	 hU6iqYEbfpEh/YnEyctlqDgGjTODN3TYzh/YFVfimCs1ECvUBd6RA2+QbPpAuPtaOV
	 LcwHnGjmBAtamEYnvRcabR4R+9O/oZM1rUOm4EFoU99TPGg9E03ouiJfb0FYqe580S
	 2BQWn7cwGorXReTMdyhVlMgOiAVab+nE6XCa2lpFYoYQeRhl0oYSsURKDKlg2PBnTE
	 mYXL0AK8kNe1Q==
Date: Thu, 27 Feb 2025 09:37:02 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net-next v7 13/15] net: airoha: Introduce flowtable
 offload support
Message-ID: <Z8AkLpF1svgNfXNu@lore-desk>
References: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
 <20250224-airoha-en7581-flowtable-offload-v7-13-b4a22ad8364e@kernel.org>
 <20250226194310.03398da0@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3EJw5ixjEJCaV9I4"
Content-Disposition: inline
In-Reply-To: <20250226194310.03398da0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_003706_904819_35459999 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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


--3EJw5ixjEJCaV9I4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 24 Feb 2025 12:25:33 +0100 Lorenzo Bianconi wrote:
> > +	foe_size =3D PPE_NUM_ENTRIES * sizeof(struct airoha_foe_entry);
> > +	ppe->foe =3D dmam_alloc_coherent(eth->dev, foe_size, &ppe->foe_dma,
> > +				       GFP_KERNEL | __GFP_ZERO);
>=20
> dmam_alloc_coherent() always zeros the memory, the GFP_ZERO is not necess=
ary

ack, I will fix it.

Regards,
Lorenzo

--3EJw5ixjEJCaV9I4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ8AkLgAKCRA6cBh0uS2t
rHkvAQDr0fPTwe5MsGWTZebtC+cvgeqIcwk+UMbKIk75G9QRHQEAyMgTUip42VH/
4sD9pimv2XO4Yc7c3UHDupHqbjzpkQw=
=h8X6
-----END PGP SIGNATURE-----

--3EJw5ixjEJCaV9I4--

