Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB091099B2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL4Jae89rSVWL2OaJl3ccag8DjPv74a4ghmLhVe/bfM=; b=qOlvB7ivWvgDX4lxYZlNnzWQXC
	d0eZNCw+fE37631EdaVRa1Qi/+ADk7ikm1RPAULvoQY5LoYnC1sqpFxMIQjRgt6Pb1Zrsr40M2CFF
	RrnJznPpDd8Ue83cCvm450OA60SjjwNWHg/3sQWUw4Dw5XzKfsV0zmjLQnGrcGIXvYtGl6/gChfEM
	RVO+rqWYasaJ9K5usHy4SlCk1FlLbXjmLFqUurhz+NQ+GrHs/RsQQ947U5i1Cmy3NkuymBqR/GeaS
	OgP4LLyLHmySjXqidBrwLbhY8K391kxtXv7Kda/3VfDAjCoxcMDSowe6uu5r6Z8XMmqd/3hrDP/KG
	fYP39cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3df4-0000000DFrC-2t6d;
	Fri, 20 Mar 2026 17:29:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3df1-0000000DFqH-3L4B
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 17:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2458543E7C;
	Fri, 20 Mar 2026 17:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB805C19425;
	Fri, 20 Mar 2026 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027759;
	bh=KL4Jae89rSVWL2OaJl3ccag8DjPv74a4ghmLhVe/bfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEZeT8MqlG7GzmP92SVfj1bXegNdXjW7KC2l2yubQ/cYdoq0NbVZgmeyuvi8Wi/jZ
	 ZfiGcJtww7qlVIe3+/pEpqkd7cgmb3GOX+iePJgEqYPqNIn6RMiqGv0liws7uMjwxI
	 hKqqBy55P5huOnyhCsAgQoRFs9/I4vGqDeVPGdui9wi50yioIxNOsvdjzqtRu5ErZk
	 ikVF1yCqvuYLkanDeyjf6A0swpttVwwatVA86XteWRj5SKYKx1FpOyvJ7TCptBC0bk
	 eEPVn6pay1p7xwT6Ptj/l8dwpd/p5rwUV9wvw9DScPGE8MiVIaxL6Tw7GERtZClZ6p
	 jljQ+fh6ehBUA==
Date: Fri, 20 Mar 2026 17:29:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260320-deed-baking-c9a56f5a3396@spud>
References: <20260320094212.696671-1-cjd@cjdns.fr>
 <20260320094212.696671-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F1qAZaavm09AyQvY"
Content-Disposition: inline
In-Reply-To: <20260320094212.696671-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102923_862963_6F3F7EB6 
X-CRM114-Status: UNSURE (   7.24  )
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


--F1qAZaavm09AyQvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 09:42:11AM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
>=20
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F1qAZaavm09AyQvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2D6QAKCRB4tDGHoIJi
0jdwAQCWqo50ANE3wn0rwkGs1a9NHi1dTUKZkUxcs6zAGNOGRAEAxIzz3jmj2GCo
A0OSSo/0h6WBQbAHkWTB+0zxRfxn7QM=
=1CjB
-----END PGP SIGNATURE-----

--F1qAZaavm09AyQvY--

