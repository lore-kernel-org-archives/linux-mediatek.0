Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE38F8FA9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+yqfVtUit0z28T25n+OJ23yNpKTcEeVWYfw6CCe+Zw=; b=TZ0bKwiIBjR0dJxtajdveMI0Q6
	C5tbvBd3FRywJlllPYHjDpjpuPJdjni8p5/uT8NcQ4KOsj2NBKRNZI+UB73SwB8SRCOOeBlK+y5Rb
	zxD46WcM+0DSmKYQ2vzuFiJ83AXOSolDCzNw59uIJLH+h7jzQzTH3N+v5rR1D2MUKIcfCq5tHhgMW
	vdsXmiCBMIzVFPY3aDJgLKCSM5ylbuBPeCbbsCzcw3XAzq8HwWi8dAr4tM1DkRuc46XBB6WEx9fhV
	PVcCXxhlTlm4s+Ih3nhhNeMVCA97PbjDkhECvZi2nhnglczuUgH6kRXpdqh1h5DrV+SRuoCPyoTOz
	6jqwuo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEgw-00000008xbU-3rly;
	Tue, 21 Apr 2026 17:15:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEgu-00000008xap-3XIO;
	Tue, 21 Apr 2026 17:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1556E419C6;
	Tue, 21 Apr 2026 17:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A2C2BCB9;
	Tue, 21 Apr 2026 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791715;
	bh=RqhR1ifSH6h4hvW6eeD7CwMBkMSMvldNwfsFYP4qNmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUWlT5Q+3y+u3fqIKUlf0nWl/6k7hCOiuN29BFQbtY2bjazd9bj/k9ITK+ij7fnrx
	 nhvL+hsakPFUmPNV4Kmf6QWFsUayVjeJwbHcBqSQjx/LqrUGkdQaJfsQPhgGMWuauH
	 /IHtsxUrdSL+FnY7BVlwdAqH5BD5IKcaI6Mi2mEhfDfcFDAFNDOjlaqLWENyxciLkY
	 iLR6x66KoRKltZflLw4FEuJD9mT3Z07bN/DVe6yrHspaiRCrlSoaGU30GFLDO7EfDJ
	 of5x6ouRdD5DaLzW1ArbRrNF9J81ypTFqND92qC14mV/QZBFJsX9sroJqLK1CG4+L1
	 iruZLVKTvKvLg==
Date: Tue, 21 Apr 2026 19:15:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
Message-ID: <aeewoVjN7EHLZTW_@lore-desk>
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
 <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l/XyUOK+TbmoSNvA"
Content-Disposition: inline
In-Reply-To: <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_101516_922981_6F67D340 
X-CRM114-Status: GOOD (  17.74  )
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


--l/XyUOK+TbmoSNvA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
> > @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct =
airoha_queue *q)
> >  		e->dma_addr =3D 0;
> >  		e->skb =3D NULL;
> >  		list_add_tail(&e->list, &q->tx_list);
> > +
> > +		/* Reset DMA descriptor */
> > +		WRITE_ONCE(desc->ctrl, 0);
> > +		WRITE_ONCE(desc->addr, 0);
> > +		WRITE_ONCE(desc->data, 0);
> > +		WRITE_ONCE(desc->msg0, 0);
> > +		WRITE_ONCE(desc->msg1, 0);
> > +		WRITE_ONCE(desc->msg2, 0);
>=20
> Sashiko has some complains on this patch that look legit to me.
>=20
> Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
> IMHO almost ineffective, I think you should address them in the same seri=
es.
>=20
> Note that you should have commented on sashiko review on the ML, it
> would have saved a significant amount of time on us.

Since this series is marked as 'Changes Requested', it is not clear to me w=
hat
next steps are. I guess we have two possible approach here:

1) - Post patch 1/2 ("net: airoha: Move ndesc initialization at
     end of airoha_qdma_init_tx()") with the series available upstream
     (not merged yet) in [0] where I am fixing similar issues for
     airoha_qdma_init_rx_queue() and airoha_qdma_tx_irq_init().
   - Post patch 2/2 ("net: airoha: Add missing bits in
     airoha_qdma_cleanup_tx_queue()") with a fix for airoha_ndo_stop() wait=
ing
     for TX/RX DMA engine to complete before running
     airoha_qdma_cleanup_tx_queue().

2) - Since all the issues rised by Sashiko are not strictly related to this
     series and they are already fixed in pending patches, just apply the f=
ixes
     separately without the needs to repost this series.

Which approach do you prefer?

Regards,
Lorenzo

[0] https://patchwork.kernel.org/project/netdevbpf/cover/20260420-airoha_qd=
ma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org/

>=20
> /P
>=20

--l/XyUOK+TbmoSNvA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaeewoQAKCRA6cBh0uS2t
rEaHAQCcKtKEMHUCG+eY2o4NV0BnCt9GTc/hVJ/zktJkukChSAD+OUbxW5LM+Bve
eEnUENXdlph4WMO5XEHV38IciwKqQw0=
=Rgkr
-----END PGP SIGNATURE-----

--l/XyUOK+TbmoSNvA--

