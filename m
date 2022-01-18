Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiQ1H5Owlvwns5DtkreRHscWLE62EwbxQrNPgb/Jrgk=; b=Mcu4shcs16CqRXG+r4fhQaK+tP
	3GHrZD8dMeyWZkWE4x2gVUvNEDSx3x2izPlBYD4IjCObmj0vJhbuxo41Sxyh59pqBgQAW9JOQAhgS
	Qea0C+Sjk14lWmOoePjkIkkZ7sYUgCZiE2HS91cpIE8OK6mJtF4qUMqxLy60tFA0Lo4/A3XWCYxpy
	PBzouLiwbycvc5j4JLgDMw6mP22KHBS55qVKTPPcIvTM3CDSnbUHkUiy9MzeE/kxNBnQmVgmKdxRW
	i624vkgP1ZGVSIEIO+jrHL+OLHXJFcHHJZAJEkIdghDL0Q3oxLvBf3yBjBmx5kAbNxI8rqz20YI/i
	pWzRbTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9rGj-002EOB-Cd; Tue, 18 Jan 2022 16:23:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9rGg-002ENj-OA
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 16:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D73CFB81238;
 Tue, 18 Jan 2022 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627A8C00446;
 Tue, 18 Jan 2022 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642523011;
 bh=CPBjykl0YdtPDt0O8OuKzWn8ZMyPWU7LDAE8XwEI+60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYAr/x8S3+J6jYf5Va67Ep0PjU/55ICkLRGw6/0KPoE0fKLmiQDkPuL9gsFqHPvDC
 794ntV3n3Qpd/Dl6e3QaT5fIPBHaTz0C0qeSlUZUB62+trNbHoyfsLILDfP9l34gq8
 bWA5efQhZh99YmMtgTkQdBOZhkGbRJ0XJHFiTQW1ufzySEkMY42xrdRnEIwO7tbUbP
 4hxccafKmGRVBPhwrWR9nEEvfdQJdku1V7Zq4ffz9gMezX1CcBfHT9ViJxtZa5pU1D
 QrJnJ4unP0h+bessDLC6/VFo1eoBpn64vzMBxaHZNX/ME/z5Lhb0aeU0QFY/9rDGvy
 6Sw7Jx1tU1MNA==
Date: Tue, 18 Jan 2022 16:23:26 +0000
From: Mark Brown <broonie@kernel.org>
To: guochun.mao@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, Bin Zhang <bin.zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com
Subject: Re: [PATCH 2/4] spi: spi-mtk-nor: improve device table for adding
 more capabilities
Message-ID: <YebpfgE+0KiaUn1X@sirena.org.uk>
References: <20220118141942.2624-2-guochun.mao@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220118141942.2624-2-guochun.mao@mediatek.com>
X-Cookie: Do YOU have redeeming social value?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_082334_971464_81BC4B2C 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Type: multipart/mixed; boundary="===============2052452802737350488=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2052452802737350488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRUgeTVMeJSL5mpn"
Content-Disposition: inline


--XRUgeTVMeJSL5mpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 10:19:40PM +0800, guochun.mao@mediatek.com wrote:
> From: Guochun Mao <guochun.mao@mediatek.com>
>=20
> Define a structure for adding more capabilities.
> Add a item extra_dummy_bit for new SoCs, due to design changed.

This is patch 2/4 but I don't have any context for the rest of the
series - what's the story?

> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
> Change-Id: I6f36e6fe1c752e57e85818758f742fb0e575bf7f

Please drop your internal Change-Ids from upstream submissions, they
don't mean anything outside of your Gerritt.

--XRUgeTVMeJSL5mpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm6X0ACgkQJNaLcl1U
h9B8WQf+KnOE87CpTi2k3CJw+ts9UgNADXzeOp55n1ctTzeShVE1/i7gGZHNXWR+
Sup+Mro4XuEOdBshNgmdrgc1ZUb/CwgIeEa2neFX4wWfAtfnqDudqUYLrt9C0Hq0
8jY5PAzUvVqKtcTqB6d4fMJ3dW4u0nM6QhkLJBi2RRWONPPjtk3HuCjLbew2o/qa
jK4KIs9GIzDzWsWO3rmd76CkpZWw1OsN7wNIOuqhJYgzPaiRN3NQkxBfbgi0VgzZ
avj7lJW+3I4ECi7GdTiwNNaMHEvzDqtxk0h+5ZeUYCEYy6hon1FRmwHvuF5it5PC
ZWFMgTyxTPC90vnPwMvgMwRxyUahNw==
=rfTP
-----END PGP SIGNATURE-----

--XRUgeTVMeJSL5mpn--


--===============2052452802737350488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2052452802737350488==--

