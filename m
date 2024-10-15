Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6114CD1D88D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWm1yxIpKQtW+rkoY8dCflI9QtjF5H4i5xBVGoXK7yk=; b=gwE8u+BOrxXF7DYyOchyj3yhDj
	BEtYJbYjFfYQ2bG6198YnOvkyT2+gDEiF+j0x5Ov7iEPVw3vU3Vtez6Canrd7q3uSl3UaCtm9nUkW
	NvlTNpK9GE787FHtrEzOFamVQNp9iEr+/HKdlXbPiPWCAi7lDBUfSYAUDgyGBTDdJGiNaaYku25/B
	5ezkMOEUoCX+H4gAfz8glNWFnH5/A6by63MLlZyKhglQFG8CCFKg11qv16babjnVibfAdg3zRO+ko
	bTsuYO+lwLWTrA89HIz5VAU0r8wzAmPeYp2lcKahuugRQ23hT7gzb8UH7IpzbLr0dM4C9FslrmDep
	9Ac4ieVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kXW-00000008t7a-1Noe;
	Tue, 15 Oct 2024 16:36:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kW6-00000008swt-2ASy;
	Tue, 15 Oct 2024 16:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9465FA40E99;
	Tue, 15 Oct 2024 16:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A8DC4CEC6;
	Tue, 15 Oct 2024 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729010125;
	bh=GWm1yxIpKQtW+rkoY8dCflI9QtjF5H4i5xBVGoXK7yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYSpCLiFFbk99MbwJWuhV/BdLYniMHM6dvnlGCbmKeibF20YGJqJM5wiMkDE8v4xM
	 S6iSfeXv6ljhCX5oQnxxsD4Qz2zpr1f+l0KbXLjVyscMFvMOGqzmYiz2WlxissMvUc
	 ePRVCcwx2788Wdrji3hGK414s7W/ZsYRaTr7dsvezLvU8wbLh+C5rMLzqeUuriBxwl
	 Xqhrnl8GwrhtC/t5T439GRRAsEhzXM/572SJPbIYxhyBCdi484JctA92DhyqCNmFv3
	 lM0MZ2FsAVNJRmWZU1qMBTWUZVD8H05snujJ/vh97mCfIGoJCL+hrUpgt9pFgxVrEe
	 rj2Hhqp2ZoN3Q==
Date: Tue, 15 Oct 2024 18:35:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
Message-ID: <Zw6ZyoJCv0_EOnpf@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
 <20241015073255.74070172@kernel.org>
 <Zw5-jJUIWhG6-Ja4@lore-desk>
 <20241015075255.7a50074f@kernel.org>
 <Zw6QUxpdnJtorc_e@lore-desk>
 <20241015090952.6bcb5856@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVu69demth5zU5/X"
Content-Disposition: inline
In-Reply-To: <20241015090952.6bcb5856@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_093526_642914_31C959DD 
X-CRM114-Status: GOOD (  24.19  )
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


--CVu69demth5zU5/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 15 Oct 2024 17:54:59 +0200 Lorenzo Bianconi wrote:
> > > Oh, thought its called on stop. In that case we're probably good
> > > from BQL perspective.
> > >=20
> > > But does it mean potentially very stale packets can sit on the Tx
> > > ring when the device is stopped, until it's started again? =20
> >=20
> > Do you mean the packets that the stack is transmitting when the .ndo_st=
op()
> > is run?
>=20
> Whatever is in the queue at the time ndo_stop() gets called.
> Could be the full descriptor ring I presume?
>=20
> > In airoha_dev_stop() we call netif_tx_disable() to disable the transmis=
sion
> > on new packets and inflight packets will be consumed by the completion =
napi,
> > is it not enough?
>=20
> They will only get consumed if the DMA gets to them right?
> Stop seems to stop the DMA.
>=20
> > I guess we can even add netdev_tx_reset_subqueue() for all netdev
> > queues in airoha_dev_stop(), I do not have a strong opinion about it. W=
hat
> > do you prefer?
>=20
> So to be clear I think this patch is correct as of the current driver
> code. I'm just wondering if we should call airoha_qdma_cleanup_tx_queue()
> on stop as well, and then that should come with the reset.
> I think having a packet stuck in a queue may lead to all sort of oddness
> so my recommendation would be to flush the queues.

ack, I will post a fix for this. Do you prefer to resend even this patch? U=
p to you.

Regards,
Lorenzo

--CVu69demth5zU5/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZw6ZygAKCRA6cBh0uS2t
rECMAQCP8qliDLSMBcAHmqy1hBZkYFYitylH9KF7F5cQFr8FTQEA7c//B45U79ZJ
Fh8jI1y16EPnfJQU1jWQym8vc8S7SQ0=
=KonI
-----END PGP SIGNATURE-----

--CVu69demth5zU5/X--

