Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3B2C5AE59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jun 2025 17:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8KF/gcrk3ilT9uKFluoEEhpYSAtsTFEcohFFm2risw=; b=UMZFrEY03Pxe8Z217SwX3YUPgo
	avzcxlWwfq+ZDPz16Hoh3SqH8qzzo1l16Nf6MfTbz6a4LMGtUhS8xcAg85ODVlF+Aq5BecQ4MA0oM
	n/PQ3GtJ1jQXxOZD6PZiUFNwJ7aIwgxhbFsFCP9lFPhII4MFhqRZJPuB4iHFs4Bj4ie8n174J0vf/
	WP/wi+0u2eDmqB9b/xpAjteMPP8St8raGb/ESQaHTIYVa5Kywa4BuquqtKVsXFPZ1ftQ6b+Emf/Hu
	QwYKUe3za/7xhidWKHqxl6P+ac3UPGdLTO7PCbyX8lLyHa4UC5k1PLFvAn9S7kckGEnRUNTD9hJ4A
	t8xmX7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEE1-0000000G86e-2BRv;
	Thu, 05 Jun 2025 17:17:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEBo-0000000G7U9-4ARX;
	Thu, 05 Jun 2025 17:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46EF6614B8;
	Thu,  5 Jun 2025 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD5C4CEEB;
	Thu,  5 Jun 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749143740;
	bh=Is9PhigI+NRiop6o+N5MbVbepMB53nyr70V3V1AmBcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWk7p52L5i9B3e1tGaXOOuI7fK/E6do4+ncgC7RtDv/8o+jt4oXEJvRPyXbVNF6D2
	 sfwD6jLka5mR2N9F0wr5DhtAGuACgNyND4ae8KiAzhKrjmcuONw9t1dC8tZ5EcSmnZ
	 pPRGDh6l+IHBCdvU8osWphSOotyxeah+DrIyBYiqUhVybStasKvKiVHl0lD9NXQLjT
	 FzDMlfs9TW+py09tsPGEAiLIAxq29u9JAVL/WIYgvDljwSjU4Zmevhi2AKPDCaHmpX
	 1xd/r8OOcwEJersk4TC6O0shzHCcn10MB6JcF0P2XB/eubyHZk96SbRQykJ0a33lU1
	 v0kTtX/tfq4WA==
Date: Thu, 5 Jun 2025 19:15:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ben Greear <greearb@candelatech.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH mt76 5/5] wifi: mt76: Remove RCU section in
 mt7996_mac_sta_rc_work()
Message-ID: <aEHQuQPuX8cuCXWY@lore-desk>
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
 <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
 <909d2ca8-8409-997a-768f-8e9be4c5168e@candelatech.com>
 <aEHMZe0_vuml8eI9@lore-desk>
 <7b381baa-61a5-2a19-1bd6-47ad4abfdf3d@candelatech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQZh+hYhrzya4vOG"
Content-Disposition: inline
In-Reply-To: <7b381baa-61a5-2a19-1bd6-47ad4abfdf3d@candelatech.com>
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


--rQZh+hYhrzya4vOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 05, Ben Greear wrote:
> On 6/5/25 09:57, Lorenzo Bianconi wrote:
> > > On 6/5/25 04:14, Lorenzo Bianconi wrote:
> > > > Since mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() c=
an't
> > > > run in atomic context, move RCU critical section in
> > > > mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field(). This p=
atch
> > > > fixes a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().
> > > >=20
> > > > Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_=
work to support MLO")
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > >=20
> > > Thanks for the quick fix on this, it appears to solve the problems we
> > > saw related to this.
> >=20
> > ack, thx. Can you please add your 'tested-by' tag in this case?
>=20
> Tested-by: Ben Greear <greearb@candelatech.com>

I am assuming this is for the full series ;)

Regards,
Lorenzo

>=20
> Thanks,
> Ben
>=20
> --=20
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>=20
>=20

--rQZh+hYhrzya4vOG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaEHQuQAKCRA6cBh0uS2t
rNBaAP98W+euo+7SVQvnDZx04WeqMaGZGJhO85raS5FZZID5RQD+LRozmj1RhTxO
EEnIIFxmsR18vviclCF5swGkTfZ5kQs=
=Vc0x
-----END PGP SIGNATURE-----

--rQZh+hYhrzya4vOG--

