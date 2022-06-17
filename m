Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D351CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIIdvhmxnRBN8on1LtB0WzQxvwihcdr7IOPcssiwO3M=; b=Ua/b/V8NkviZtBquVm9megnO45
	J1n6h69AA9Gnb9vRArsCO89ZH4HIaFc7im7NPXn1QUm8dKrze09k0cuEn0CsklOq5tV+yGguz2iEw
	Gmg/nUpODgfksJMynglp002NVP0mR7za48QNuQshFtljctJ08s/QnqDTz5gdrZBnCYrJ7ld1nLxJi
	gk373QmVXtApBA7PtQR6bxOPzOhK8vJp3yiXj4kmmjbisxO2nzITc+aMsU/LdNkSBYWKf5qkcua7+
	PaUsmX3aNqKvzXKBrQc6mxR9F8w71jCtGnR0XXN6K5QvgW7QyO7jUkeCpzOyrNTB4sPM2p+GwBTwf
	NQBoVkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Rl-0070k3-7v; Fri, 17 Jun 2022 10:43:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29RX-0070gJ-Le; Fri, 17 Jun 2022 10:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E0B2B82968;
	Fri, 17 Jun 2022 10:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAC4C3411D;
	Fri, 17 Jun 2022 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655462588;
	bh=yT33ldFU3rebbAEBjPVl2UkmZ9uxE9nDsQERpI2t9lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdx1va0VaQIh0gxvFkKdeiiFbfXa3T0b+JeBy0oJzTaivbrMmS+D0PfDsHJdoSTQg
	 2ysTTvtnPkcGrCtB8dVLefaKCHPFytXWFhB+76e63k9gDlJWx1Gr5TJckULV5lnrld
	 2t2HnZ7aCSrwi8beAPSBdu17SYaecrUjjbzWHIfwktOap3CPn3xhnEPJ/GVCrMnZMP
	 aV/NKzU4I/2yEbQ9k2H2Mbo+FwYOMj3j4yaqyqBlFeTxBU2prtl0yLfpCboSTMN0Xd
	 +xtfgY/csMyT31WruFvag1vLsQHp/4vKy4y7uXDLzIBkDjdWiEa1RuDvuQ+kvSN/w1
	 aNJyEpuLjiE5A==
Date: Fri, 17 Jun 2022 11:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO
 request
Message-ID: <YqxauLOp2sWOU/uc@sirena.org.uk>
References: <20220617100632.1447811-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jXPaouEK3FOmFDrR"
Content-Disposition: inline
In-Reply-To: <20220617100632.1447811-1-fshao@chromium.org>
X-Cookie: 98% lean.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_034311_878356_F8A8D290 
X-CRM114-Status: GOOD (  11.52  )
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


--jXPaouEK3FOmFDrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 06:06:33PM +0800, Fei Shao wrote:
> The lockdep mechanism reveals an unbalanced unlocking on MT8186:
>=20
>   [    2.993966] WARNING: bad unlock balance detected!
>   [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
>   [    2.993978] -------------------------------------
>   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request=
_mutex) at:
>   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
>   [    2.994012] but there are no more locks to release!
>   [    2.994017]
>   [    2.994017] other info that might help us debug this:

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--jXPaouEK3FOmFDrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsWrcACgkQJNaLcl1U
h9BEggf+NYEXEA4i95MJoX3RIZCLZsS6j2/wpgysgdDQZK0wcT2Jdy79DDrPIx8K
EQfqgLqIlxrdpjIJn0B3kIN1x6iczamii3Gd+h7odYHf7UWYgvSorSts5Jg0YLwx
Ze17TDN/kFiVmxsE0BKNbTEoSB9teKhpbM0z74xVsg2PMZ2sC/m/5IWPVgHcn/qq
mhjzVUfER075+eOTEaxV+4E9G2TypWG2GAjNrklf6J2Czg842Y0BnO/3Tk/AS9q4
RDigvbROs4g2+pUJAjsIcHhq1LqNf7yo8tSPIT4Evd+uN/AqddkXr166gcn+BOmX
BoRJF1AR869q0iJ4JoVS9xuzSXbswQ==
=v6CV
-----END PGP SIGNATURE-----

--jXPaouEK3FOmFDrR--

