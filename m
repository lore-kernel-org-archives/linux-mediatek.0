Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70C5D1D87B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZT8eUVAP1Th0PhWw2NBLyprwi9M9ThW0WrOYeOJ1ok=; b=09dWtbyE0mc31kNn7QpMQ16UcZ
	1rkehizWx47c3OuCgQfEsoVGmYQNHpNYo9rRvfP85R2fO5neZ4o/eC7uwTE9sKFjNFUw3E3QMhOIS
	aVAYY4qMISYidx23gRR8IZGVS2dxs3v234Q/QQd4iLS7aQU/ZezEY6iEOBsJ0UpjA4+zcmlxyyxd+
	b6IcqkfsaX5V/idbaLXbvI9z2816SJD/zDiGc+87LXDrwx6T0jF9pJF1youNvyFCynfLRjiuQrJpL
	E6ffdVRgIpMqExEnV6IHkFteuMUNHL2PHcR8rQAaJftzKKfrimYbqhqeSI2PyXe0jWgXgKRfBCk3L
	MQNbKcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0juS-00000008nUi-2oTI;
	Tue, 15 Oct 2024 15:56:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jt2-00000008nOp-1EDJ;
	Tue, 15 Oct 2024 15:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9F37A4329A;
	Tue, 15 Oct 2024 15:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4594C4CECF;
	Tue, 15 Oct 2024 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729007702;
	bh=FZT8eUVAP1Th0PhWw2NBLyprwi9M9ThW0WrOYeOJ1ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Me6mUSlJBOODqtENnFguUrYd2grSuTFrIEjflVdbxhijjEN1wVDSv5C3eiQehdfh5
	 PZgnTuMFb7HH8nRmaB/XG+ZUDGEswzxkZuu6Y4pvFGJx0XweHnQrfyAAVrLrZLGFyp
	 x0DUu9PM8mrsknA+ceaAn62sG0Dp2rC2opS8zPr8AvDAkFDEugF8JGW7/mX+b+VNEq
	 WxhHeFq/NJCM3yfo7sfXsHW2QY1OJKNEeRfeARGZh7Zldvhn/uXEZMdO7B3MlWRfgY
	 tGJIjHwGZRpqUfBEl5lzYEjWcMaZbbm97Dq6eNWuaoDQuHq3SKWBKMoF6Gq6YqBaqT
	 Ty6NDEmJ99jrg==
Date: Tue, 15 Oct 2024 17:54:59 +0200
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
Message-ID: <Zw6QUxpdnJtorc_e@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
 <20241015073255.74070172@kernel.org>
 <Zw5-jJUIWhG6-Ja4@lore-desk>
 <20241015075255.7a50074f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h6qBPvwxWse3BTuY"
Content-Disposition: inline
In-Reply-To: <20241015075255.7a50074f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_085504_424570_3AB93DB1 
X-CRM114-Status: GOOD (  22.45  )
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


--h6qBPvwxWse3BTuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 15, Jakub Kicinski wrote:
> On Tue, 15 Oct 2024 16:39:08 +0200 Lorenzo Bianconi wrote:
> > On Oct 15, Jakub Kicinski wrote:
> > > On Sat, 12 Oct 2024 11:01:11 +0200 Lorenzo Bianconi wrote: =20
> > > > Introduce BQL support in the airoha_eth driver reporting to the ker=
nel
> > > > info about tx hw DMA queues in order to avoid bufferbloat and keep =
the
> > > > latency small. =20
> > >=20
> > > TBH I haven't looked at the code again, but when I looked at v1 I was
> > > surprised you don't have a reset in airoha_qdma_cleanup_tx_queue().
> > > Are you sure it's okay? It's a common bug not to reset the BQL state
> > > when queue is purged while stopping the interface. =20
> >=20
> > So far airoha_qdma_cleanup_tx_queue() is called just in airoha_hw_clean=
up()
> > that in turn runs just when the module is removed (airoha_remove()).
> > Do we need it?
>=20
> Oh, thought its called on stop. In that case we're probably good
> from BQL perspective.
>=20
> But does it mean potentially very stale packets can sit on the Tx
> ring when the device is stopped, until it's started again?

Do you mean the packets that the stack is transmitting when the .ndo_stop()=
 is
run?=20
In airoha_dev_stop() we call netif_tx_disable() to disable the transmission=
 on
new packets and inflight packets will be consumed by the completion napi,
is it not enough? I guess we can even add netdev_tx_reset_subqueue() for al=
l netdev
queues in airoha_dev_stop(), I do not have a strong opinion about it. What
do you prefer?

Regards,
Lorenzo

--h6qBPvwxWse3BTuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZw6QUwAKCRA6cBh0uS2t
rCyKAQDDWOwLJQOoDmMd9LiMu19jaoyDYvhimdVvvRQYcr5rcAD+JJizGAhBA8wi
/V2iQsgIkeOGWyDjiuxvCNclacQM/ww=
=cJ72
-----END PGP SIGNATURE-----

--h6qBPvwxWse3BTuY--

