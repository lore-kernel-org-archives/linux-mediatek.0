Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D26FF885A
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99mfVU8GJDLtQ7RLKhF9hjWUyZLwCbQqY9BgFA2JdpM=; b=hLGExc4GwE+I+pgVPIaTeFNq8e
	osBrlcBYS/6E8Skaukyk2nSfUB7FVvZY+OkVLYr4O0J4OdDXMSWLy8oCxX1iYV2uazXwkDtqDtHrz
	Z0P5AryVDSAW4nUyi7t1QwzO2ZA5C1iVuUzys7oh1w4zjG3zJ08ZLhnDVk2lqbyhcvIFHgpvUv1D0
	1vMWsQDzmwOgAgKA614Qmsv5SIJJoXsYxdPQCO1d1R64CdsXTPKtWxYXS04ivCef1MvlXShgUB48p
	v+EqPqXNZC3jcaL3OH+3JaGPmhNskFDG7O2JXtsos322VavZ9qRkXhMl/SFQwTMDYNDNA5g2D++pm
	/yOhwypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIieE-00000006UVk-3bqp;
	Fri, 01 May 2026 07:50:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIieC-00000006UVD-2jXB;
	Fri, 01 May 2026 07:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB13560142;
	Fri,  1 May 2026 07:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F70C2BCB4;
	Fri,  1 May 2026 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777621851;
	bh=99mfVU8GJDLtQ7RLKhF9hjWUyZLwCbQqY9BgFA2JdpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3V+yawTPhZL042qlbGUzinmn18ktVP0xV4OOQforGZOxKCVFcb1n3Wp3Lc7TpeZB
	 AofDRa/xwD+TsHMJQUcepYRr0nNbJ1sYi3upKtIn+etPQYp3yyhkWco6foqFTM4fPY
	 GlzCA4SR9bx2W76qiW5DZd7jqTEe3EyK3x6A+tI6Zc3QFYuFg/myArU3YdzFb58cR0
	 hzNQ/x301ZFqGY/wG7pTGCmZvomkbKXtvP/zeuZdeH5Buz8Rj8f9ak/+GVGvsb5+oA
	 aOxe+GjE46nZBWtzo5jbqeK2DOR8dqT2gTm0cP9IpXXCtl042TcHco1kLji6YIYyuC
	 LgOHOBrLWynzQ==
Date: Fri, 1 May 2026 09:50:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
Message-ID: <afRbWImEALZHM2B6@lore-desk>
References: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
 <20260430181109.68c65940@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j9OAHKQ5ESftBzW2"
Content-Disposition: inline
In-Reply-To: <20260430181109.68c65940@kernel.org>
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


--j9OAHKQ5ESftBzW2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 29 Apr 2026 12:54:32 +0200 Lorenzo Bianconi wrote:
> > Add airoha_fe_get() and airoha_qdma_get() as utility routines for readi=
ng
> > a masked field from a specified register.
> > This is a non-functional refactor, no logical changes are introduced to
> > the existing codebase.
>=20
> Doesn't apply AFAICT.
> If this is because of the net -> net-next merge - please avoid posting
> patches which will cause a conflict on merge.

ack, sorry, I did not notice it. I will rebase and post v3.

Regards,
Lorenzo

--j9OAHKQ5ESftBzW2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafRbWAAKCRA6cBh0uS2t
rGq8AQD24P/m6asGn19jQW+oItzO9GpJHVfVkH6iFqxlm19LcwEAs2hxRk3MCcw0
AmZfLn+VYekbqOqDJ0GINkhJUOYzKAQ=
=L5cR
-----END PGP SIGNATURE-----

--j9OAHKQ5ESftBzW2--

