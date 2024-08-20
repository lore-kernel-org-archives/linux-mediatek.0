Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A2C5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXZgAPEZm9l1oSfuQPjwZMJZu+qLnSTHXqOZL4/fdPM=; b=jiw4FyJD5bGG4hmq4zXDVltBdZ
	snlRhpvYUlBrzlxJ1rByWrTocj/+wZxBUg/KBDgIinzBmZ5Z7Tf81niOKMWFokxHMXzlEeZCbosi6
	ZejATQNW9KXickbHhNj4K+UM3q0GFw3HD78kD1GftNfXb/pMhfun1KJtHNt2QHaGlJXTJgywbY8h2
	SxcoZIKtNeVNHnBzSMNiwZuQQxolrLqEttDz/xrhStF55RwVJz3zCHgUXjZgViHChLi31HK0edL+H
	JQENAoMZZAPMwMfbBnXAFFVbv/ohFtia4DqBIea4wboLwfFqzh0sr7Lg3JVLpbH38bufoJLrzn/TW
	3FINu6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKWe-00000004Rhc-49CQ;
	Tue, 20 Aug 2024 08:47:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKVx-00000004Rcu-30Qr;
	Tue, 20 Aug 2024 08:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72CAB60DEC;
	Tue, 20 Aug 2024 08:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7575C4AF0B;
	Tue, 20 Aug 2024 08:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724143612;
	bh=jP0UPp0f7Mtz8ZNyfHvVjWkbkcPAV6QZpbFis998vsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEq+Qwwq8P7Xar8SqDplvBo3kIv21WIHqa/LVVSxmYF4NO4/MV+CWpvIMPueRVl95
	 LbwzPKsC50upx761bgOFb2CcjXKLKTVqi+qo6xFE6Ji0W87vTrid4TSTW0sWqbsH7P
	 aYbdz2YiGsYb2z6pzC+gIAzNijnhGMbLe1ZZDY8+29ETe3rh9fZkSLwcuafvhvt92y
	 8FIqbLjIkGFTRIPLeBaXe89rb5nAhkgGW0gB354b3hUGxksLC2mIyfTd1XmIJ9RtkH
	 85Be4m1rMGoG/elWkdV8D8M9zmjWqNgsiHlY+kcjjm1WV4ARCzi3TvQQLWtmaw60dy
	 +D7Ms6lCkbDBg==
Date: Tue, 20 Aug 2024 10:46:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 0/4] Add Airoha EN7581 PCIe support
Message-ID: <ZsRX-Hrn2fCITK4P@lore-desk>
References: <cover.1720022580.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IYc/7hkpgcMPfB5b"
Content-Disposition: inline
In-Reply-To: <cover.1720022580.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_014653_843953_59AEB7C1 
X-CRM114-Status: GOOD (  13.04  )
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


--IYc/7hkpgcMPfB5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce support for EN7581 SoC to mediatek-gen3 PCIe driver
>=20
> Changes since v3:
> - move phy initialization delay in pcie-phy driver
> - rename en7581 PCIe reset delay
> - fix compilation warning
> Changes since v2:
> - fix dt-bindings clock definitions
> - fix mtk_pcie_of_match ordering
> - add register definitions
> - move pcie-phy registers configuration in pcie-phy driver
> Changes since v1:
> - remove register magic values
> - remove delay magic values
> - cosmetics
> - fix dts binding for clock/reset
>=20
> Lorenzo Bianconi (4):
>   dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
>   PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data structure
>   PCI: mediatek-gen3: Rely on reset_bulk APIs for PHY reset lines
>   PCI: mediatek-gen3: Add Airoha EN7581 support
>=20
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  68 ++++++-
>  drivers/pci/controller/Kconfig                |   2 +-
>  drivers/pci/controller/pcie-mediatek-gen3.c   | 180 ++++++++++++++++--
>  3 files changed, 229 insertions(+), 21 deletions(-)
>=20
> --=20
> 2.45.2
>=20

Hi all,

any update about this series? Am I supposed to do something? Thanks in adva=
nce.

Regards,
Lorenzo

--IYc/7hkpgcMPfB5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsRX+AAKCRA6cBh0uS2t
rNVkAQDjeTpROA/Ztc6Z6ATzFvCBAg6SbtNQf3MAMx0ZNAv5wAEAqsAM5oi6C3U4
KLu/WPmuUg39yM3Z1OIwjPpCPaCGwA8=
=gLv3
-----END PGP SIGNATURE-----

--IYc/7hkpgcMPfB5b--

