Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5DFC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG/I5PjISR3GNky3YgXH7WZr7Mj1eUteE0sJsV/JQNQ=; b=1DSWVG1tbu/7RTL7QKhp4wDp/c
	suLlyD9T/tLihGpcwZsVUSZR7lhuSahbRh0PQUrDxOs53+utz5Pkdm0xMFkbsI4zVmXyomghd0dft
	l7uldCCAhsGnQMtJsxUn0fIJvHkAl+8/IJv8H0Aph+BMjaX/tfPk2g7nI1yPJB3v5aiVkqnTqyWIF
	8ITagCQkfoUuMTu11MoWfOOj8KszliMTe3CKbNS8J2s4MCpLlmLURtYanEDvUi6KqjVba3yQXXndh
	2JHDX+K7dyn8jCmMM8tdA4HOW8dzvs1bmZnLkjlauehEmBhJiZMIvURlSS7zzWzzOBTBEA76iojRj
	uH1I4s2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKuT-00000004d9G-0q6x;
	Wed, 29 May 2024 15:08:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKuP-00000004d8c-3yQw
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 15:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AE2061252;
	Wed, 29 May 2024 15:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D8FC32782;
	Wed, 29 May 2024 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716995288;
	bh=s7ps87vVMx2pZPlwmX1rES59yV6+9ATQata99PWEn08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibMzuFMTCM+AQiG5i8eWDBciUQ23hxUTJF7vdNWCjI8/jV0NK/q9Mehp6YnJuNnZj
	 0WVcg60MMuEtmDrcbvinf+xjsw4wMjPqOksOzcwSof+CuGb7OS8z7rnBzRo0aYV6ne
	 l8MvgmfTNFDEMPn/Q/kw3OgTU/ObgQNm6gpp/tOd5vRTGtZLMxO4pqE9oY8m71vx+p
	 jgPU36T6VROJvWp+SstqHlgmuZVMI6MNoH6xvnKedj+gL06bCtds6VaPzOt/wHl7bj
	 3PXUMvsy1whjY38Y2+iyAU680EgFI4t2pNZ5Gj17ZtT/1WRFe76bWLxJTUgvemSsHN
	 4xaaNzKw9jroA==
Date: Wed, 29 May 2024 17:08:05 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, daniel@makrotopia.org,
	dqfext@gmail.com, sean.wang@mediatek.com, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	nbd@nbd.name
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add debugfs support
Message-ID: <ZldE1cBeAk9jw3hs@lore-desk>
References: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
 <9ad6b014-11e1-4def-8217-b1fbeac768c3@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OaVPF9wAGqO9CW/o"
Content-Disposition: inline
In-Reply-To: <9ad6b014-11e1-4def-8217-b1fbeac768c3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_080810_048080_7173CC16 
X-CRM114-Status: GOOD (  12.53  )
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


--OaVPF9wAGqO9CW/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, May 29, 2024 at 12:54:37PM +0200, Lorenzo Bianconi wrote:
> > Introduce debugfs support for mt7530 dsa switch.
> > Add the capability to read or write device registers through debugfs:
> >=20
> > $echo 0x7ffc > regidx
> > $cat regval
> > 0x75300000
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> In addition to Vladimirs NACK, you can also take a look at how
> mv88e6xxx exports registers and tables using devlink regions.

ack, right. Anyway in my case (mt7530-mmio) regmap is enough to dump regist=
er
values. Thanks for the pointer.

Regards,
Lorenzo

>=20
>     Andrew
>=20
> ---
> pw-bot: cr

--OaVPF9wAGqO9CW/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZldE1QAKCRA6cBh0uS2t
rDG1AP9/CYLBt46VeY5RGxfWpNGfr2xd1FICgLMbVOLHU8LZfgD8CN57WIZxzRwa
/1pgn48IUmvDKL/SrWwzuPMPlYWMfgc=
=/dg/
-----END PGP SIGNATURE-----

--OaVPF9wAGqO9CW/o--

