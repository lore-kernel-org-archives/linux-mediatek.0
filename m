Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0829BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8jhkwo//afNSCWNXt2Cew/D6DoO2xuWUmxF4KsfvXE=; b=KLqw2dXrXwkfsUe7zyhtMKN3RM
	SZGa9cg9RPltsr/JQCNfX2ezef5kuKGvJhIp3tIOxEs7F5I9Wz6ZdWSQNLe8hQCJbQPtMcFF6EVHG
	goEpdFP3A13wypCXMQD05X+P9t8cioLzfRnELESmpMs8bOljP3iSvPmnWoOzLKcaql2P7Vqn87Pht
	FoGzsg3GWD9KRx3Xt5YOgJYld1oEkq+8qu0ckCRH+kkf8QLqi5mP0L15nPsxo8q8HaZZTcHZCkl3U
	qAkPYgKExbDZqcVIlBEUoOwSC9PRJhXeY2aHlnkhPBfHA3i6zyRQiXfJnTUMz2yKiav2KRJg/Lq0N
	azBpYoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmps-00093z-K9; Wed, 09 Feb 2022 13:16:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmpf-00090m-1M; Wed, 09 Feb 2022 13:16:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A53A61973;
 Wed,  9 Feb 2022 13:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4156AC340E7;
 Wed,  9 Feb 2022 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644412586;
 bh=r+TyYwi977hPcUIqZmzER+AH6wmdkK7fSexRgOiCxEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJTxtz0FvwzUhuA9S8r+8ImuyAy7E/nJ9O59kMAza/2Ony5qRXbiAjqiJ9Xp3FDEa
 eGSGAwjEw5Ctpi+dyTQ6960QM2kInNlK47o8visp79UZSu02qxmcx/HRVLjsuZslcc
 dFC7zOlDAiRbIRn97Wrgtjgn9Upc+CprBxS67IKGaQOpCdkZ0rrwI/ckuHUDQdOyQX
 teHb6+Ykv5Tk/Y7KRkwSS+Q2B/TQDK45sETbBDCKp0l9JHec/Zk4KzvJ+0NsUDjAu3
 FwcVa2uKo7UYiwvq8pIilrrohz+1wmQvYxsEs4vD/jW102hD/hm9wacq48yNTjzrRg
 cjPBQWKFU4JpQ==
Date: Wed, 9 Feb 2022 13:16:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V5 0/3] Add compatible for Mediatek MT8186
Message-ID: <YgO+pXPtptHCQ9Zu@sirena.org.uk>
References: <20220209014443.12443-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220209014443.12443-1-leilk.liu@mediatek.com>
X-Cookie: Disc space -- the final frontier!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_051627_137643_C5A8519C 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Type: multipart/mixed; boundary="===============6823824985193899136=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6823824985193899136==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5R+mG6GScGdLDrKy"
Content-Disposition: inline


--5R+mG6GScGdLDrKy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 09, 2022 at 09:44:40AM +0800, Leilk Liu wrote:
> V5:
> 1. re-send these patchs based on v5.17-rc1.
> 2. add the flags: "Reviewed-by Rob Herring".

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--5R+mG6GScGdLDrKy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIDvqQACgkQJNaLcl1U
h9CTrAf+IL1W+QaItaOmV9RPnJ4UrhJnchjr0HroF9X473KfHJU09+xhzNuFyo5v
teyCMIi4gThNQV/AT1AejZO0sXe3mmj3jWcYTgsdoJ1hV2H/bZHWLDEpXVhWetBm
67z2vgk1radpZjWz8vD7E1ChdTaRAsi5pdMcmg6sh2+qaDSl3fNamIVT4TiAT/uH
C+EozMAZQXGq0QELx+JYSsxJi0CPVx9abSbiULA0B/qjrZT9wbsiHc9CiaE81AVE
dNxEeCXffZuBfPvLfYxsNY5OhyBwZoTrYSUxJ1ZNhwhQ36ZbkllpMkoweiOHw76n
nzqs5p2NmkZjXcmBTZ+DtCr39avFVA==
=p3Fj
-----END PGP SIGNATURE-----

--5R+mG6GScGdLDrKy--


--===============6823824985193899136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6823824985193899136==--

