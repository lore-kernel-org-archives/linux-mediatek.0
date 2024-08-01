Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55EFC3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzBD7IMujxoOrTLMylUbrnQpAGsXY6JVI23pi1Z1PkI=; b=Zw3eDS+m9f8k9IfjC0alOS9aEb
	aRrpPsIfM+V6d006JmpJrfcCS5HtjkF9y8kxkQnuTnRz00hKLbH/dPA/D0P0lefa2xP6B5hVhsr0o
	Yt0EZUQcnZR7fuiVDxIFKyeYJ3bkQPSnjVIxg4BhU1RhDnv9CWL88mokL+BovYza5X8JXsH7PfWe4
	8nhsf3WNuly5RdNCbRPaZdlyKhd6RwTZmdtwAhtepZKE95W0zY3s8Z4BgKnn3xHUn1GO6C4eo/aLc
	iUYYX06WIFnyeY/8RQnt7dY5Gv+XBPXTFkVEOYOhctRPY8u+L2Azg442GYjP6eZRqxt/n9Ou8ubhu
	WkHQsT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQGu-00000004AjN-2ABX;
	Thu, 01 Aug 2024 07:30:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQGQ-00000004AdV-3NFX;
	Thu, 01 Aug 2024 07:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E31036276A;
	Thu,  1 Aug 2024 07:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE09C4AF0A;
	Thu,  1 Aug 2024 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722497417;
	bh=WzBD7IMujxoOrTLMylUbrnQpAGsXY6JVI23pi1Z1PkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jukcYLVtOi9LIv2gj0gl9XwGfAEC28HOav2+AeGJ3J5KdJDQrD+NIMDsIWQXtGJQk
	 DW65asz/5fiPWSvZTR2UAoQvuNYP2I+RwhVYgnUI20XCj8aEjnk5Vc2ktQl1glZXZm
	 Q37TVZU5U8NurGvlmUwNLrc9tmsZkwsjxbEhfoEpM/eVWkrdMZmbePjLuYwPiUu1kL
	 aPaY7fZMp7owGCecDgyo0kjyYK7OC9j7MTy/qj1vH/5j11airUkYcMiaOqhxm+405h
	 kVaE9p3dTxP4IWqEcAJn43qQ0enM7neb6Oyz5XJgYTpbyFuqvp++MsoeOch76ON5ev
	 nrXUtL73v+TWw==
Date: Thu, 1 Aug 2024 09:30:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX
 performance
Message-ID: <Zqs5hcFMx1g42Zrd@lore-desk>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <ZqfpGVhBe3zt0x-K@lore-desk>
 <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
 <20240731183718.1278048e@kernel.org>
 <CA+SN3srMPLcmQ4h_iNst71OkQPFcCYxBRL0Q9hR=7LjJ86TFFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rYSnn6hAqwxzEyp"
Content-Disposition: inline
In-Reply-To: <CA+SN3srMPLcmQ4h_iNst71OkQPFcCYxBRL0Q9hR=7LjJ86TFFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003018_952380_DBFDA09C 
X-CRM114-Status: GOOD (  22.85  )
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


--5rYSnn6hAqwxzEyp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Aug 1, 2024 at 4:37=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > On Tue, 30 Jul 2024 08:29:58 +0300 Elad Yifee wrote:
> > > Since it's probably the reason for the performance hit,
> > > allocating full pages every time, I think your suggestion would impro=
ve the
> > > performance and probably match it with the napi_alloc_frag path.
> > > I'll give it a try when I have time.
> >
> > This is a better direction than disabling PP.
> > Feel free to repost patch 1 separately.
> > --
> > pw-bot: cr
> In this driver, the existence of PP is the condition to execute all
> XDP-related operations which aren't necessary
> on this hot path, so we anyway wouldn't want that. on XDP program
> setup the rings are reallocated and the PP
> would be created.

nope, I added page_pool support even for non-XDP mode for hw that does
not support HW-LRO. I guess mtk folks can correct me if I am wrong but
IIRC there were some hw limirations on mt7986/mt7988 for HW-LRO, so I am
not sure if it can be supported.

> Other than that, for HWLRO we need contiguous pages of different order
> than the PP, so the creation of PP
> basically prevents the use of HWLRO.
> So we solve this LRO problem and get a performance boost with this
> simple change.
>=20
> Lorenzo's suggestion would probably improve the performance of the XDP
> path and we should try that nonetheless.

nope, I mean to improve peformances even for non-XDP case with page_pool fr=
ag
APIs.

Regards,
Lorenzo

--5rYSnn6hAqwxzEyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZqs5hQAKCRA6cBh0uS2t
rNZrAP0eoKULRJ3mk5g+ma9i4CaSGMfF3dbb7VK1e4BzjNQvzQD/W6jl6gOfuYuJ
K3hcqA1i0ABxgAdLVpxeoE6H4UBzzwA=
=7+zW
-----END PGP SIGNATURE-----

--5rYSnn6hAqwxzEyp--

