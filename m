Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A089DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHsJ2BhBEwUCl+nQ1P9t2zjYRGSMAbsZ6HrHCzG5fyc=; b=3u0gkkmPDH09Wvtv5YfKVreOEb
	zqguc4DYpORPwOMyi5jiEcM6Dn078ycALIJp5gVcY1HFvlyIqh2UqQacG/PYZ4STltZhAul/3JVYD
	FsB4nM5PTNIfHFsstcnJ3Ed4R0c5EbPOE62vwXdcbhKABFw1KX1uHtG+tuZVUl9KXZ1j8oCgf6l/T
	0wRU7oHHIacVkszv2dG9gGSU5WzHtA7vcjVOocPndl5H66FuNFx0MMDAxbrzmOYjtQJa7jB+ErjvS
	by2Lcp93Au9+dN6jBDbeTkhqn1nnkIbt2nrOIzATCd1XSo2Ro7bfsGG6XQLrrXO5zfLTlSxgPNFSt
	fxDCiwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns760-00E0bZ-4s; Fri, 20 May 2022 18:11:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns75w-00E0aq-IR
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:11:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 798F0B82D91;
 Fri, 20 May 2022 18:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72113C385A9;
 Fri, 20 May 2022 18:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070281;
 bh=k/yJclsWlrwAFMAoHXAQBg8IUcASAQM+ZxdCKiEZ3o0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gWzdXZX8E2cheZv2N7f9vQRmDrxDCYMjKMAirb/L+ZiAI9bkMaqPQX8dgplfBW2l+
 urhqN5F3kd0I4MidxnVeVINAjqG74n/jsqvgm8dWzeQLeHV+vaownZI4tK/sVQmoI4
 NYrOBX1gSF0oGs1l8at4wRt8ingJR7/BCodpA8nAXUCvQ6WyLVeJRYjkv9qMqdfi1V
 mrPcUlH1bqw8lgWlgaKa+Yw1xmDty+3YAkaFmHgbYwvU7Mvo7wcPl3HojbAKVRQrO4
 lvbn3IMpKp49shNVCCCuUbUyHNQN0hrOz0D6gePQWsnXjquhjyAwJxDRHx+33m0o07
 zF5GPSVolicxw==
Date: Fri, 20 May 2022 20:11:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <YofZxFO2nGuPCyZi@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
 <20220517184122.522ed708@kernel.org> <YoTA+5gLC4zhoQ0F@lore-desk>
 <20220518084431.66aa1737@kernel.org> <YoX3AMlBFfDcl69o@lore-desk>
 <20220519091224.4409b54d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220519091224.4409b54d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111124_789694_93C980FA 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Type: multipart/mixed; boundary="===============6888228106358256048=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6888228106358256048==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hegm7aOIsPhLkENM"
Content-Disposition: inline


--Hegm7aOIsPhLkENM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 19 May 2022 09:51:28 +0200 Lorenzo Bianconi wrote:
> > > I don't think there's a best known practice, you'll have to exercise
> > > your judgment. Taking a look at a random example of MTK_PDMA_INT_STAT=
US.
> > > Looks like that one is already assigned to eth->tx_int_status_reg.
> > > Maybe that can be generalized? Personally I'd forgo the macros
> > > completely and just use eth->soc->register_name in the code. =20
> >=20
> > I personally think the code is easier to read if we use macros in this =
case.
> > Let's consider MTK_LRO_CTRL_DW1_CFG(), it depends on the particular soc=
 based
> > on the register map and even on the ring index. I guess the best trade-=
off we
> > can get is to explicitly pass eth to the macros as parameter when neede=
d.
>=20
> Yeah, do you, I was just sharing what my knee jerk direction would be.
> You know the code better.

reworking the code I introduced a register map removing the macro dependenc=
y.
I will post v3 soon.

Regards,
Lorenzo

--Hegm7aOIsPhLkENM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYofZxAAKCRA6cBh0uS2t
rHdnAPwNnnUCfrfNOQE+XS8G2+JVOD3zD5Mm04pipDf4xGwi2AEAwmpnbYwRQlnZ
ivMIn2SWK8Rx8uxbKDxQAGNFLEFD6A8=
=XugI
-----END PGP SIGNATURE-----

--Hegm7aOIsPhLkENM--


--===============6888228106358256048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6888228106358256048==--

