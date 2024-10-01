Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479F7CEACEA
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXulM5NNyQnLn+/2qCYEna3vkeP9trJQR7rr/IOu6Bg=; b=If7D4sWuwbfR4WcntSFzhHFlKJ
	Wkd4pahGppQTKl8WukJwyUUdUZPr6KkXPizB9Bok/lIiZbGZ1khcrB2Y3j3Mjr1YbVSj5036uS2d3
	sshe93SjknbbOTuBZ1/BgCQpFC+EUICqqzZLH1cNS30x2Da7StNFOJcUV8tuS4lZMOAL3nmWFrZet
	8nM/IsjowfXxqSvqzgoNfbSPDth/p/LJF1ZjGnB1EGbjFulaDCDtEWKfruVE9xg0eCsk4qvGgmvN2
	4UQMYy5X4LLz4J8UCxJptcrqg2OZfe221E0svE6vtUwBF8vninvmhqU6pkpqfMsdyh7W6a9AuCfUj
	Pqs3XWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgUI-00000003dpH-3qpf;
	Tue, 01 Oct 2024 17:16:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svgT4-00000003dkV-47iO;
	Tue, 01 Oct 2024 17:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nXulM5NNyQnLn+/2qCYEna3vkeP9trJQR7rr/IOu6Bg=; b=OJ7JPjHou4P5obA+aZ/POgqSue
	nq0Tt5mEzrXLnZnVMoc9pcSvH9mnXvqHGeGzX18HhnV+dAYKLYL8ig29YRbZpDSsWzvomvcyqt6Xl
	C/tkFHka7BA9cbdit9SyUgKpFQSalJBnvbkw1PhdjfrcwkW4Yd5H2M18jbYHcuBl+tzeFEA0gMw+G
	Zp9yat1VbVnHqARWMr4gglTLlH0mNL+lv2nD+f6c3WdQ0dBKDwkowLCzYKByt+AE+J4Ilg4mjA8ne
	DViBy0jJAmrlItVHk+pCexyLIlZ1I+KvqEd0G0l7hTQWk+Z1hNkO9c90U8JIb80Aa0QMczgrZCrxr
	2vws7wNw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svgT1-00000003FgL-07aG;
	Tue, 01 Oct 2024 17:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F7295C4769;
	Tue,  1 Oct 2024 17:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A75C4CEC6;
	Tue,  1 Oct 2024 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727802915;
	bh=F9k4VZbS9kuyT+dY46dvKKzolIXCmDvataW7QyUZChE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYTZFTx//clBH30h0txuBjU8fVzOO1H+LDnSJ2R1xf6adKL6r7diYBAFx1IFqrCS5
	 QSc/UrKceRg+JiE3k8XRZDxyif+rlZh3ZpNtgTMYjWy5fqi13BvMrESsPsLuJGHtoY
	 j8Pd1pCaFFlH/+ttJoIdywZ0W+j4z9c2e/aP4n4pAm0fgSe7WQRcn5hHLDtnh0Zr1p
	 RmfZMdnqegvYCTLQUjNj5wZ+ADHnocgNnTbNd2XlN683kpG7dGAa5ldphO96bf31gL
	 hqXgIdHRgh3+VfzTdgt4EYP2QZ6Ho4W2leVmPhA593qvBwKch4QCsi7hQc7i++apvC
	 i/MXhiHGwkj7A==
Date: Tue, 1 Oct 2024 19:15:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Avoid PCIe resetting for Airoha
 EN7581 SoC
Message-ID: <ZvwuIBr2V_FFbYYA@lore-desk>
References: <d8941149-9125-4fe2-a1c0-ab29223a0c87@collabora.com>
 <20240930193756.GA187798@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q6lfzaRupebapF3G"
Content-Disposition: inline
In-Reply-To: <20240930193756.GA187798@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_181519_304951_1E4E3918 
X-CRM114-Status: GOOD (  19.73  )
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


--Q6lfzaRupebapF3G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Sep 23, 2024 at 11:41:41AM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 20/09/24 10:26, Lorenzo Bianconi ha scritto:
> > > The PCIe controller available on the EN7581 SoC does not support reset
> > > via the following lines:
> > > - PCIE_MAC_RSTB
> > > - PCIE_PHY_RSTB
> > > - PCIE_BRG_RSTB
> > > - PCIE_PE_RSTB
> > >=20
> > > Introduce the reset callback in order to avoid resetting the PCIe port
> > > for Airoha EN7581 SoC.
> >=20
> > EN7581 doesn't support pulling up/down PERST#?!  That looks
> > definitely odd, as that signal is part of the PCI-Express CEM spec.
> >=20
> > Besides, there's another PERST# assertion at
> > mtk_pcie_suspend_noirq()...
>=20
> I agree, it doesn't smell right that this SoC doesn't have a way to
> assert PERST#.
>=20
> The response at
> https://lore.kernel.org/r/SG2PR03MB63415DB5791C58C7EA69FF01FF682@SG2PR03M=
B6341.apcprd03.prod.outlook.com
> suggests that maybe there's a hardware defect that means asserting
> PERST# doesn't work correctly?  But surely firmware must have a way of
> asserting PERST#, at least at boot time.
>=20
> If this is truly a hardware defect and we really can't assert PERST#,
> please say that this is a defect in the commit log so people don't
> think that lack of PERST# is an acceptable thing.

Hi Bjorn,

I do not have visibility on these hw details.
@Hui: any update on it?

Regards,
Lorenzo

>=20
> Bjorn

--Q6lfzaRupebapF3G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZvwuHwAKCRA6cBh0uS2t
rI4xAP0f7H5YYjJOMPtAjiFgwoj5gmwqlZeERbA3WgcVx6T1dAEAl2Q5iAJrmoNd
9XD/DXlqF7zAN2eNFuhJqUUTcR3iggE=
=iw3M
-----END PGP SIGNATURE-----

--Q6lfzaRupebapF3G--

