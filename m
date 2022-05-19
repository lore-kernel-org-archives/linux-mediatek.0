Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD87C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ud9FReeQiy7YIzyh3XIqRK8ArSdpvQOfkDfxTfYYJWc=; b=qJLpql90tJ1dEaNiSM1l9/hQIc
	QvNYAmo8pdWqLWYihUeYUWB8Nr2+zyxEdyZjg2xLdVsCWP1SAwHFw6NSESKb+CD+FKFnY9cu3SiEh
	SvdmSQT2BMe7wH3Mzo4Zznl+Qe0R8wpCotdonXPeHwoZ5tQchy3aLoDlw8ycoiDA358zXnpzSOept
	EYhkotNK5H0O25OlSe6yJfJBvJucm90rFxDcNjPy3WNQLMZl+0ydTl5AFDrDGtnn/Lo9V1Ct7icJX
	LCIHqWvjF2xQ6j21KJBjPhN/Ji/dkuIyi7fBDpLgBKvz2wDqMLoAXkGJrGZXvLZ+RuSQgCPEZvZoQ
	QUjFgoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrawa-005dkt-NO; Thu, 19 May 2022 07:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrawX-005dhQ-BD
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:51:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEE03616FF;
 Thu, 19 May 2022 07:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369D2C34100;
 Thu, 19 May 2022 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652946692;
 bh=FfHT4dH2rOQjGAgKaeBVEfcrb90XoHDYJNfYFwMsxqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wdv6bZZW5o0QW+rLup4siFbRoAjk45vnoN2mBGF4tNrdcd66OnuMRG65UQonX8drr
 8lGlydQqEA1F4HaXRjzM2tLRFkz1VPSZNN7REHWsnI4pFXI6LsbLxiHzqMrXTD4Uck
 LWfKHIP977c130bKAkPbczwSlC0tqqYAwJf61e6dWPNJupadE/Z0aG6+CZ8mAeIPF2
 FBPYyqQIr43HrGQhWuginBW4P5SG1y7+Xxh1cS93ikwaxiRVMzhYM4yRy6YZ8YeXnN
 FHmDu0tjisuECWEyEVCML7hB8WY3PbV/B/JOyv115n0FBHEB72P08WuToCiISPBZKJ
 +rjLTLvUacrpw==
Date: Thu, 19 May 2022 09:51:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <YoX3AMlBFfDcl69o@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
 <20220517184122.522ed708@kernel.org> <YoTA+5gLC4zhoQ0F@lore-desk>
 <20220518084431.66aa1737@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220518084431.66aa1737@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_005133_501848_3A5EDE68 
X-CRM114-Status: GOOD (  22.13  )
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
Content-Type: multipart/mixed; boundary="===============1110651282627346280=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1110651282627346280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8OQvFQTAYPTT9lFf"
Content-Disposition: inline


--8OQvFQTAYPTT9lFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 18 May 2022 11:48:43 +0200 Lorenzo Bianconi wrote:
> > > On Mon, 16 May 2022 18:06:38 +0200 Lorenzo Bianconi wrote: =20
> > > >  /* PDMA RX Base Pointer Register */
> > > > -#define MTK_PRX_BASE_PTR0	0x900
> > > > +#define MTK_PRX_BASE_PTR0	(eth->soc->reg_map[MTK_PDMA_BASE] + 0x10=
0)
> > > >  #define MTK_PRX_BASE_PTR_CFG(x)	(MTK_PRX_BASE_PTR0 + (x * 0x10)) =
=20
> > >=20
> > > Implicit macro arguments are really unpleasant for people doing
> > > tree-wide changes or otherwise unfamiliar with the driver.
> > >=20
> > > Nothing we can do to avoid this? =20
> >=20
> > I used this approach in order to have just few changes in the codebase.=
 I guess the best
> > option would be to explicitly add eth parameter to the register macros,=
 what do you think?
>=20
> I don't think there's a best known practice, you'll have to exercise
> your judgment. Taking a look at a random example of MTK_PDMA_INT_STATUS.
> Looks like that one is already assigned to eth->tx_int_status_reg.
> Maybe that can be generalized? Personally I'd forgo the macros
> completely and just use eth->soc->register_name in the code.

I personally think the code is easier to read if we use macros in this case.
Let's consider MTK_LRO_CTRL_DW1_CFG(), it depends on the particular soc bas=
ed
on the register map and even on the ring index. I guess the best trade-off =
we
can get is to explicitly pass eth to the macros as parameter when needed.

Regards,
Lorenzo

--8OQvFQTAYPTT9lFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoX3AAAKCRA6cBh0uS2t
rMJTAP9dIIJyzXlJOTfk8iKUs4K1OR4VWsGZQxS/9U+Knpof5QD/ared7Qln5hSb
jxz/VwPojHBJxLWHwNrp4ROvp7awIwA=
=/+XK
-----END PGP SIGNATURE-----

--8OQvFQTAYPTT9lFf--


--===============1110651282627346280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1110651282627346280==--

