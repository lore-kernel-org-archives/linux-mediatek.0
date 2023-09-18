Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B015CCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj37pbgTvY4CEdHfGjO1xzlgwLH88SbfVMtsq7SGniA=; b=tOORv6hzMJUIdtqLAIvc5anayU
	DQW3OwoWs6X3Cc2TPxNJaR5JhnfoYBpOY4UEvuuByQut2Z3H0SoOBqC4AKPATiX3kIuUrb2xMnnbg
	gKuV3Yzp9ovVfou/VbWlF+o/IXCUNo7BAm9Nagbq+wSpy12oiD4x5ginMk26z7lLNSEVv3LcOt+Lv
	+nl+1WxB0V18ECsKjFLKEDYdjU3rqGlrRwLNAwW9BavTacOqPImtKnIvZp7BoD74TOt6p4Uh5Z2iI
	L3o/NzndorMmoHVM86r3xlu9Nz6HgXvENuiuRVQXUT/6/HRFVgMowO9wIj7SxMsqyqEecOuYNoXGs
	Ag5SG03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi95T-00Emx3-11;
	Mon, 18 Sep 2023 07:54:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi95Q-00EmuE-1W
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 07:54:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7157ACE0CE0;
	Mon, 18 Sep 2023 07:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7D4C433CC;
	Mon, 18 Sep 2023 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695023664;
	bh=a3re9QgHeOZBxzT5bdJ5U4VTTN31mPT7AHtXRfmJaV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moI/Gs7NvfV40COVsr1CU7NanXM6KqQR3MYY9K5GVkVb1+7T+hybfkstskwBIKfQE
	 oV0LzvIFSYuXEu/HGaAWJ6ruv2R4UqUtv/T++NgGCaJYD2PDmzhBbZQ+5lZ7GMV6qg
	 UNxAGuUREXkd6NYrP19SDx5Kmtlgiqv5+DeT+p0Re4kvuHLcTqluLEFtgvUQK8yUmH
	 pWSR4J5+GP66QMRcpaP7SJVi5DBw003QHNmweanr1xdT1m/6JyO1CY41vEMzJWlOcn
	 5fpyG2aJhe8H2kF4KAR7jZuszQL9FsaT1H7j0eLvHlnE0c+OCEaQDC6mlmY/CK4fQl
	 9w0iq/MLGVv4w==
Date: Mon, 18 Sep 2023 09:54:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 13/15] net: ethernet: mtk_wed: introduce hw_rro
 support for MT7988
Message-ID: <ZQgCLIUUbX51eV+R@lore-desk>
References: <cover.1694701767.git.lorenzo@kernel.org>
 <da27f7333fa31808ceae581d9bef5030c6072f33.1694701767.git.lorenzo@kernel.org>
 <20230917084728.GI1125562@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="STv4kEpNkY3aM+1s"
Content-Disposition: inline
In-Reply-To: <20230917084728.GI1125562@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_005428_699101_6D103764 
X-CRM114-Status: GOOD (  10.20  )
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


--STv4kEpNkY3aM+1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> > +
> > +			buf +=3D MTK_WED_PAGE_BUF_SIZE;
>=20
> clang-16 W=3D1 warns that buf is set but otherwise unused in this functio=
n.

Hi Simon,

ack, I will fix it.

Regards,
Lorenzo

>=20
> > +			buf_phys +=3D MTK_WED_PAGE_BUF_SIZE;
> > +		}
> > +
> > +		dma_sync_single_for_device(dev->hw->dev, page_phys, PAGE_SIZE,
> > +					   DMA_BIDIRECTIONAL);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int
> >  mtk_wed_rx_buffer_alloc(struct mtk_wed_device *dev)
> >  {
>=20
> ...

--STv4kEpNkY3aM+1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZQgCLAAKCRA6cBh0uS2t
rHLJAP9dn/+SX9tYlfHutMyHQJiV8Khmb/l/EFGbcIin4O+DtgD+LdGGInL4edXQ
VyKXBVc/lNBPzFUkLxDoUHUzmSJ4Cgw=
=B0aa
-----END PGP SIGNATURE-----

--STv4kEpNkY3aM+1s--

