Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14533C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FhwugJK5hduP+K2TzUeyyEPOEnljVWN7ev2XrceL+Y=; b=tDZmMjMAMZIICTq56yvpEeZ0gA
	ik8L29tOPw1hziVj/tnRfAY0B+3fh2MTE4n5WxpYUbjWLoKX468gAQVKjIDRr4D/rv2DN5Zqz5yQp
	KQbnzPQEPYgxPrYiPXbca/nC+aYq1lxLhsA49h1XvcGYDax5afnJxLKiEh82kMDSzKWhdVj5VUBfi
	d5yg0jRLpWXiYBGJ9VqxH0vKZlMmFitNXBOXZOuxSmHM/oDoGuLhuQab8I6cNxZ/tkxRbvuoFKuLH
	B+yNYg5CwYjpQW95MgMf4xzT2ZUsHIz9u+jOsTj1mHPkumC27NjOBJgGG9fHIopDi+V+pWOYpVIac
	RyO8jxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGIV-001Aig-D6; Wed, 18 May 2022 09:48:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGIS-001Agx-3f
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 09:48:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99AA8617B4;
 Wed, 18 May 2022 09:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DABC385AA;
 Wed, 18 May 2022 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652867327;
 bh=lv4HBe8Wz66POFUcjOZzWjCJJ3a3Qv9oZQxybybs8dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CIMawBjVDfDDMMhlmDCJY/yrMAjt2SSIwXqnjmd3tS4PdMgks21T0Sb6ttzXYbv61
 ULL2ftPjteTxt9snhY1aNU+9QrGFzq9f2avl9qq7E0jjkdybiSx2aco92RtJvox8kl
 UHRcpGdK98VxAq7GWNdyW4+lb8OWliGnccgw0CUsu2uJ4xDcnlZOFMSc/1uJ7Q0G3f
 RcUYVRTIIURdnL16sRNHJSM6dvGwnHL0sciJDyez5yNyAv/zoibfWOrDepzySmtscb
 qL5m6AAxgncPSWOGmnWCuWpbSe/S+03MJS+L5g1DZIJuujbyRcTZOvrzDE16wyfDQ4
 giEeVFhaZBmmQ==
Date: Wed, 18 May 2022 11:48:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <YoTA+5gLC4zhoQ0F@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
 <20220517184122.522ed708@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220517184122.522ed708@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_024848_219559_467F2FE4 
X-CRM114-Status: GOOD (  12.84  )
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
Content-Type: multipart/mixed; boundary="===============7870843203566672541=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7870843203566672541==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yGUCWlv2qAlCwbOl"
Content-Disposition: inline


--yGUCWlv2qAlCwbOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 May 2022 18:06:38 +0200 Lorenzo Bianconi wrote:
> >  /* PDMA RX Base Pointer Register */
> > -#define MTK_PRX_BASE_PTR0	0x900
> > +#define MTK_PRX_BASE_PTR0	(eth->soc->reg_map[MTK_PDMA_BASE] + 0x100)
> >  #define MTK_PRX_BASE_PTR_CFG(x)	(MTK_PRX_BASE_PTR0 + (x * 0x10))
>=20
> Implicit macro arguments are really unpleasant for people doing
> tree-wide changes or otherwise unfamiliar with the driver.
>=20
> Nothing we can do to avoid this?

I used this approach in order to have just few changes in the codebase. I g=
uess the best
option would be to explicitly add eth parameter to the register macros, wha=
t do you think?

Regards,
Lorenzo

--yGUCWlv2qAlCwbOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoTA+gAKCRA6cBh0uS2t
rKu7AQCqZ6gTV/nH6swFYufh/JvGdCvn+Ju4SVI9ORYBZxNvLgEA0u4maXWDKZI0
eaenqEJ2bXJPNuae7fRx9qniJRt97gQ=
=/+Hi
-----END PGP SIGNATURE-----

--yGUCWlv2qAlCwbOl--


--===============7870843203566672541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7870843203566672541==--

