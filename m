Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvMan7UlXYI8iuzMrpadfHtRVuiI1Esl7G1CZydmysU=; b=h0LFZvZu0HUAIvCgWV1nBA8t7e
	UchUzbA9rmOFaL52XGdbzxcXoOlR9SNBmh82/StJU21tYk6SxDRD/RbkdXSMQiMgFuuXwmPFf12cW
	I9QNQeCd8IdDdMk4/P9uoX7y2kYbsmw/0sHzRER5eAnIa1FaijDHTqfesnYkKukY6vA+HgcMJoCLL
	cj40vt0p4TbbJwgqGH4lBAX94+UISNNmE6xcmODH7gdDCPebXA9DG4ejv/qnVHwqOJ5PJjlm8KuuP
	b4AFuSVnHodyzTRtNVDqbPosJqJKFSCfBr1phLqYdEh8IYCbSaJbX3Qi1k0bW1a239bYG30kpztAI
	rYqCAgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrF52-000buq-Qg; Wed, 18 May 2022 08:30:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrF50-000btd-T4
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 08:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACBFB6165A;
 Wed, 18 May 2022 08:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2B5C385A5;
 Wed, 18 May 2022 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652862649;
 bh=mJJb/4OQ3K+BXo8Cd+L/PAtvSVNE3XIPsK9mQ+9dwiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+zdutIv5p2k+3B4+X900Urieq9PE2vgPA5T07eaOphbN3Jm8Wt1SsLzTLuxexhBK
 Bg2E2RQyKJHSpPZ+CVmGq+ReG9+2zvTKmFYn/3N7cOXAUtVYJT+awRHQ3FLXKhklsp
 SDR2NugJg2Xy8XgacCJs8DShSm1sfz/Fk6AmSEAHwPGvZPMHmYW+xhj23z8+tVDW47
 4VWlnI9yT4hnE+niavzZn4whQjvWVrsIowl0uzBRXaQXGAYsqr4XzosnKe7cVyONov
 RFj8LKyWsqeG5oDeScqstSRsGUTC9uf/GBfGybaOYxphBUUB7HANbALWVHrJgwznqS
 VHDv/+hxLN+iQ==
Date: Wed, 18 May 2022 10:30:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 10/15] net: ethernet: mtk_eth_soc: rely on
 rxd_size field in mtk_rx_alloc/mtk_rx_clean
Message-ID: <YoSutfDP5CXzgFNQ@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <eca56ab1af7f4bbedc4a6d0990a10ff58911d842.1652716741.git.lorenzo@kernel.org>
 <20220517183935.6863ddc7@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220517183935.6863ddc7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_013051_037532_88B31B0E 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: multipart/mixed; boundary="===============8495285461567962155=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8495285461567962155==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nOj9tn/EqN8+0tSv"
Content-Disposition: inline


--nOj9tn/EqN8+0tSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 May 2022 18:06:37 +0200 Lorenzo Bianconi wrote:
> > +
> > +		rxd =3D (void *)ring->dma + i * eth->soc->txrx.rxd_size;
> > +		rxd->rxd1 =3D (unsigned int)dma_addr;
> > =20
> >  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
> > -			ring->dma[i].rxd2 =3D RX_DMA_LSO;
> > +			rxd->rxd2 =3D RX_DMA_LSO;
> >  		else
> > -			ring->dma[i].rxd2 =3D RX_DMA_PLEN0(ring->buf_size);
> > +			rxd->rxd2 =3D RX_DMA_PLEN0(ring->buf_size);
> > +
> > +		rxd->rxd3 =3D 0;
> > +		rxd->rxd4 =3D 0;
>=20
> The clearing of rxd3/rxd4 should probably have been mentioned in the
> commit message. It does not seem related to descriptor size.

ack, I will do it in v3.

Regards,
Lorenzo

--nOj9tn/EqN8+0tSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoSutQAKCRA6cBh0uS2t
rDkrAPsFgjPlPYku7AlPv0qwt1GuK/wxa9vPkdKHgYEApUD5aAEA8fu7ZkWQFlby
2oNBn54QPPhGqhBRykcs6nvv39DhpAQ=
=EFN3
-----END PGP SIGNATURE-----

--nOj9tn/EqN8+0tSv--


--===============8495285461567962155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8495285461567962155==--

