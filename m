Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A519B606A32D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Te+fqW+K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0Y7Bx5i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H4M2KIRE5a8Yduva+gW2HsKpcDmtHsDzLl02OQNHYTY=; b=Te+fqW+Kys+HGlIyFYd7VcbWGh
	hemsIV9JZHMhG7j/OWFT8N6LwqMJQOAWPH/d2pQ1tlmTliNaW1wHBWJwM1t3mMYaI9izOpMt0I4jC
	r5UgulGWC8LzbqtH53FX0vZ2bUJz1OYB3XS9QLZaS9tAN6Va1rj0qrkeEtKDKtl0qc6T7aGO3+8BI
	qN0UA1Ra1VaZANnUWEWrZZ6Plx5Mt+JJxxMYpLdSQzPp4UYom5yV9KnSAL4Mhu7NeJLONnlK+XRln
	Z3joTA/xux6j31o6uYMAwgjmBCO5PlR4JSpIp40eIWfuOWrPzbsMOqvFAgjddeRMk2KKVh00iQ5pQ
	EhaGZKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSbW-00000009c8F-1S0i;
	Thu, 12 Nov 2026 11:04:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSbU-00000009c7H-3onQ;
	Thu, 12 Nov 2026 11:04:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB14D6343C;
	Thu, 12 Nov 2026 11:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255D61F00A06;
	Thu, 12 Nov 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481467;
	bh=H4M2KIRE5a8Yduva+gW2HsKpcDmtHsDzLl02OQNHYTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U0Y7Bx5igfoFnsIhBYRHENpnKYi05KKx6zHBnvw+ACFNWO11KFwbKuabv5br+W48c
	 iqDGJyALqgkjnzD5pUVTxcNuXAOTlv1wxjcnCGH8r9I1rqaJpDRQPksU4g8vGRcAK8
	 jka04pke2L3Cjh4gCWGMwax/QCxs+oCwQndbR/vBK5JC0wwEL1+X2J+zSv0oyxaM/s
	 LW2+duB+GPWIbu2OKFHY7h7jzBZuVTEaXtSYqBuxY3bR5wpkx/kh+WfD2jamyzNnSk
	 4yWvIQCTZ+KfuXYyJweAEU0HQwOc+awml6peyn0yxPpyRmHDM/kT3lR3ZAdKEpWcLh
	 3Awb3TkOIymuQ==
Date: Thu, 12 Nov 2026 12:04:25 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Xia Yan <yanxia@cmss.chinamobile.com>, netdev@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yanqing Wang <ot_yanqing.wang@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yana06070@163.com
Subject: Re: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix
 device_node leak in mtk_star_probe()
Message-ID: <avWdOWzBtEynoi7t@lore-desk>
References: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
 <u6jz3rgrlwhlbhqwgi26lsa2knkwgjws6scbb6e3dq6bkjmudi@hiulukf72wrr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M+g60A+VzcHE/eYH"
Content-Disposition: inline
In-Reply-To: <u6jz3rgrlwhlbhqwgi26lsa2knkwgjws6scbb6e3dq6bkjmudi@hiulukf72wrr>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--M+g60A+VzcHE/eYH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 12, 2026 at 11:51:30AM +0800, Xia Yan wrote:
> > mtk_star_probe() gets the PHY node from the "phy-handle" property
> > with of_parse_phandle(). The helper takes a reference on the node it
> > returns. The node is used by of_phy_connect() each time the netdevice
> > is opened.
> >=20
> > That reference is never dropped. Every error return after the lookup
> > leaks it. Unbind leaks it as well: the driver is devm-only and has no
> > remove callback.
> >=20
> > Release it with a devm action, registered right after the lookup.
> > The error paths and the unbind path then drop the node through the
> > devm cleanup.
> >=20
> > Found during a code review of the OF node handling in ethernet drivers.
> >=20
> > Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> > Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
> > ---
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>=
=20

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

--M+g60A+VzcHE/eYH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavWdOQAKCRA6cBh0uS2t
rLnFAP4t87cBlMJ+fUJahaPjJi8B3GWxyaVfmrXmlILfRGb5qQEAsjrfcpkk5YhG
7DqsExQBjxDfj0q+vBkDdWDJRPn3NQ0=
=yqVZ
-----END PGP SIGNATURE-----

--M+g60A+VzcHE/eYH--

