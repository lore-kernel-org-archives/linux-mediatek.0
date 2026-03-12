Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A2106ACEE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI0QF6B7GTpvs2phHUpBZw7BOsfXgNyP/NfUwECWnrI=; b=lfZvxuavI3ODvWSfv52a20Z55z
	dGfVvUEL8eyVNYOpLGJG/l9FCh54r8RVPRgTa4LpR/LCMaKIFjWsUIybAZuzk1UlAxpMMXotT7lJz
	uRrlHye/aiEJjmepfP3BnAlJs+xSkchUYQTzTpJSkvWfGCXbwbg/1Sbzh95L/FTC0BObHtfX7UAJf
	4C1XbrgCuH/ZVFKQ/mujJz2jAv+J5jIl+f1HQU3JDeDT1lBOoP7ML0/zuEaLeBkBZ49DLH07LOtek
	AUj8r4ZXJlsKgJ+bvbiyk3FsnilN6L90wYZd1GB0+dYhaAsKG8+chP47DsxiDB+YHVf8Oyxn+jK9a
	f32AhMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nMf-0000000FQJt-2Vzm;
	Thu, 12 Mar 2026 21:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0nMd-0000000FQIT-2viM;
	Thu, 12 Mar 2026 21:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA42D61336;
	Thu, 12 Mar 2026 21:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF7FC4CEF7;
	Thu, 12 Mar 2026 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773350078;
	bh=PI0QF6B7GTpvs2phHUpBZw7BOsfXgNyP/NfUwECWnrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clkxEPBKZxEf659r5ImYpASzkk9EJQaPrZpJfHhDr81HRo8Un+bWQ1x/DZoTK1VYS
	 jKCQKBN2NTj7eIX+eEYhb98SKzN0GuqCCIIVXLbXv3UIeNeU6hhQx/K736A9gxBnu7
	 Heq2q+j6rbsvy8e4IRwA67aZUA6x19egSiOOPdEyJebBl2eZjOAU3qf1U7OJBwkc04
	 HBtoe4AubLHSj7Jys1zlysVWhllflJ5GMTQtKaGc1g22BBA92wFdVgh363oAbGFwPU
	 98YKpYspsudCb1rMglQnFP/f52la01xFU2fNptxEbPGJsWVDiqqDES6qgTIGYZrBSm
	 4XPlMxZzMyOOw==
Date: Thu, 12 Mar 2026 22:14:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <abMsvOMnnuTdoG-9@lore-desk>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
 <20260312172430.GA1267298@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aKPrcNYyqP8X8EOx"
Content-Disposition: inline
In-Reply-To: <20260312172430.GA1267298@kernel.org>
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


--aKPrcNYyqP8X8EOx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Mar 10, 2026 at 03:46:53PM +0100, Lorenzo Bianconi wrote:
> > Select the QDMA block used to send the traffic to host cpu according to
> > LAN/WAN port confiugration:
> > - QDMA0 is used for LAN devices
> > - QDMA1 is used for WAN devices
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> Is this a bug fix?
> If so, perhaps it is for net with a fixes tag.

I guess we do not need to target net tree since airoha_eth driver currently
supports just the LAN interface via the MT7530 DSA switch connected to GDM1
and there are no WAN interfaces officially supported (PCS/external phy is n=
ot
merged mainline yet, it is only available in OpenWrt).

>=20
> And at any rate, could you add some description of the before and after
> behaviour?

Theoretically, before this patch, GDM ports were equally distributed between
QDMA0 and QDMA1 while this patch assigns LAN interfaces to QDMA0 and WAN
interface to QDMA1. However, for the reason explained above, this change is
not currently visible to the user.

Regards,
Lorenzo

--aKPrcNYyqP8X8EOx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabMsvAAKCRA6cBh0uS2t
rFDmAP93V3ccszOsfcw+0zhgr1R1obkSmoIKk52roRfL4F4otQEA5pU4amZ23tfr
L8d+Ej1Fj3I3fcJLP56yYMmhSvkcTAA=
=5Q0S
-----END PGP SIGNATURE-----

--aKPrcNYyqP8X8EOx--

