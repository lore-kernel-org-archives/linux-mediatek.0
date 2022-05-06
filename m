Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4874C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPWaKayD6x6Z0H4LY8UDGdAaOis+ClzlIvPQcbaYbgk=; b=lR/IFiub0Antp1sNl/Wx4tvA51
	OY6EnS1bbOSF91CzVrBlx7QQYgLO0umcz9Jp/xBau0+i70AOZ/5/4a7qaBlRxez2l1t3mIEti29/k
	DZjRZHEd0UiQQoA2xW+0kgWF/RC8Homa/DULLeJrkgdfGkHUqoSrxlcrjWdmoccKrGdCA0k0iX3QQ
	WDb3dVq2i5l/AnKVIxrnZAhGYGIcJtqkVySOE8fspgY26WedN6EdQcOmme0xpUiZc47eGajceSj7W
	mcFqZ2ICnBXHVVuvKExpjLE5tmLV/8NCmq3fWaAUVvuT/S/vVEHbTqmsSR92an/gEy0KEWparR60Y
	drohLXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn4Sa-004y0g-5s; Fri, 06 May 2022 20:21:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn4SW-004y06-QN
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 20:21:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 928266221F;
 Fri,  6 May 2022 20:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B945C385A9;
 Fri,  6 May 2022 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651868511;
 bh=cLKLhRbbocol9rJIAJIP4JoIO/mWUJ8WKXroVZt+kQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kje+/43WAxiwcb2Qs2nxC7Bo1eaZoYyUrU3tYkZIFYt+oGj9BMUX1rH6eMjtR1Ry2
 Ujsvc/k4GpYTqKGjnf6pKT8whfbJLLNn3l9nq31cZnF01Uuyryv8V2eC65WzrEfF9d
 +TdESfWPWp4arAqXE8YEP4VQ12T7LtEw3cLToR9wqpofr1DTCAjRHkfluOcY2FS3lg
 k85hoPlcIaGX957zVhthJdUGGuIlPbmLRSI2QrutAE/DiHj0W/8AnwZr63RRi3zO/w
 Z+8/tOvmaAOwF/N3o7lqEWBp9uKw1wDL5JCDTcXrMRBGFce8/CVkb1dDltN9Kw5RSl
 57ty5sYUXIB2A==
Date: Fri, 6 May 2022 22:21:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next 11/14] net: ethernet: mtk_eth_soc: add SRAM soc
 capability
Message-ID: <YnWDWU5wqgfcWND1@lore-desk>
References: <cover.1651839494.git.lorenzo@kernel.org>
 <97298a5aeaa7498893a46103de929d0a7df26e8a.1651839494.git.lorenzo@kernel.org>
 <20220506104109.63388e33@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220506104109.63388e33@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_132152_933468_C16E733A 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: multipart/mixed; boundary="===============3005695611045369900=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3005695611045369900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rLjMcV4QepMwlsrM"
Content-Disposition: inline


--rLjMcV4QepMwlsrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 06, Jakub Kicinski wrote:
> On Fri,  6 May 2022 14:30:28 +0200 Lorenzo Bianconi wrote:
> > Introduce SRAM capability for devices that relies on SRAM memory
> > for DMA descriptors.
> > This is a preliminary patch to add mt7986 ethernet support.
>=20
> sparse says boo. I think you dropped an __iomem somewhere.

ack, I will fix it in v2.

>=20
> Please heed the 24h rule.

ack :)

Regards,
Lorenzo

--rLjMcV4QepMwlsrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYnWDWQAKCRA6cBh0uS2t
rD/pAQD0oGK1X3Ef9v8e3M4KKsaCWTwRUYRgX0rto1i3rbWRAAD/T97NIrVlJ2SF
KYk5kgfnn9NS4QDPqcXK8oG3nI37iQE=
=no2d
-----END PGP SIGNATURE-----

--rLjMcV4QepMwlsrM--


--===============3005695611045369900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3005695611045369900==--

