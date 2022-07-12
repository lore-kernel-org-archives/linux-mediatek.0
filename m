Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34A4C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z75XBxac83AD/01WNBjzMKhL34pl8GUpHS9djLaniSc=; b=Z93xxOJVSINnRXQ3rYd5dF2jhM
	TQmi7gQ2Zc0+S8MVn4LmWFjKmi59yuUXVHJaWxvOlqXiJ2n+koQABPQ04ay6/n2OF0sj+X45o3MK/
	tcGNa75sLvssY80dhBI/+HKce61LCcVHhsJftdfYI0I4REaLBbnQEDhX8OqTgU5FfK0yV/VwEYte/
	chtY0Gg+j6JRUMJTCJnBpGRiUM1u4hnBDSGmIHazDOCsPWSUOTb3w8JkgXyayMCwweOiA5ssoj/o9
	bx0YPhzHfiwC73lYrn7dAEKdAatuJZeDbx6eDkdeKQuLYm8O4ZwfXuE9Q4Ko+O9UKeFdMxH11RgTe
	6ZBJuFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIa7-00CesX-GF; Tue, 12 Jul 2022 16:17:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIYF-00CdSa-Bi
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 16:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72ED4B81640;
	Tue, 12 Jul 2022 16:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA4C3411C;
	Tue, 12 Jul 2022 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657642552;
	bh=z75XBxac83AD/01WNBjzMKhL34pl8GUpHS9djLaniSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNqdeFyiuaMMJRziNdEeeeQAk8KUgVepagmGp3kn9ZfVYGAYJi9OhMKdPM2wEn0np
	 YNAqQ2KPfPC8vOwC+tuVFLAq6AipH3ciqQW25APyAQvTg+mBqdki5TE49d4LeG1Fro
	 FPjdc7vDLIU7OgdJMQTs4WWbIcGpqD6Ih/pICfXV9S2y8l6A3AOi21mpxtpulTiHU+
	 nMtZnPD4sPwiQh7SLg3tvbegddT8ZjOAXMn6biZoj+O8nbUQCGE7h8jdpKFE/3IZj6
	 9YBdqjPJRCT+vuQM7xPunSlhVSPy14rvSP4AxtvAwuMR1YfutI8rFz6nPMI90TzBZV
	 l8KoxMZ1KFNXw==
Date: Tue, 12 Jul 2022 18:15:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: Re: [PATCH net-next 2/4] net: ethernet: mtk_eth_soc: add basic XDP
 support
Message-ID: <Ys2eNDOEkxV2adQ3@lore-desk>
References: <cover.1657381056.git.lorenzo@kernel.org>
 <dc3235fd20b74f78f4f42550ca7513063269a752.1657381057.git.lorenzo@kernel.org>
 <9c0b3cef3029ea71f7802eab6214062aad48d509.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2G/tHNH8cP3VjQK"
Content-Disposition: inline
In-Reply-To: <9c0b3cef3029ea71f7802eab6214062aad48d509.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_091555_572830_21696A4C 
X-CRM114-Status: GOOD (  10.16  )
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


--m2G/tHNH8cP3VjQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 2022-07-09 at 17:48 +0200, Lorenzo Bianconi wrote:

[...]
>=20
> The XDP program is apparently under an RCU protection schema (otherwise
> you will get UaF when replacing it). Why don't you have explicit RCU
> annotations? (here, and where the 'prog' field is touched).

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Thanks!
>=20
> Paolo
>=20

--m2G/tHNH8cP3VjQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYs2eNAAKCRA6cBh0uS2t
rGsIAQCsl8FNCzvD1YvUChkEmwGLZV26abfGh19wBclm5RwHDwD+J3HnUaPkNOcp
5icwhyCR3aYCMzmmSnpei5cFRx5OiQM=
=tt8/
-----END PGP SIGNATURE-----

--m2G/tHNH8cP3VjQK--

