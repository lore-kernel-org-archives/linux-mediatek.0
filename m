Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513A606A32A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WuZyg+Lm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hK4CLmUU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OCZTGaCFLCsYJTt74vJ9dAjfbmceFOVIaPHdnU3R0Vg=; b=WuZyg+LmgleavMYj0KYt+xkv9j
	MddZD8es1J6QEEnhrNG9YawoXZbysgZNNpYkQory5kpOZSZodg3YJqtUhQs5XbTV02tQ8F/MWHt4I
	2wbRdSumOGG8iET+WcJPqZRxekc/maLD8+MYWvrfjt1SHez+RlhD45aqLy9DtPNHNoSVf882nsT+7
	BZ0ZhEwVvt4dJ4YNcMp5VxpqtYQm7yjPLbhkA8ju5RbA7v/0mXoPXIGiZBAkKipRxMqVq84Zn9aUM
	i7zFXL5Iz0GXEYob3uF0KjqMFaH0T+OwG5Fq1S3ZP2S3WpBd2wZu7ApcY+sHxmPODkuuL45rV3s2l
	q26Z3YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKAO-0000000EMAe-1ccK;
	Fri, 20 Nov 2026 08:40:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKA9-0000000EM7x-1TDc;
	Fri, 20 Nov 2026 08:40:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E48D7434E2;
	Fri, 20 Nov 2026 08:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8601F000C4;
	Fri, 20 Nov 2026 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164003;
	bh=OCZTGaCFLCsYJTt74vJ9dAjfbmceFOVIaPHdnU3R0Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hK4CLmUUEefRTCa/OduHAYiA83k5mlUlmHSUBtKKg7nZA4S2PvxBY/e4UTwS8V7T5
	 je1tgSp1qsPINAFW5QCWTaEH0w2HUPDd1VZj0GiLhRmm1eue4P6r7BrbmxlgoUvX+t
	 2PcgcUtGwuGAJyqfHz1zwhiIDCyhjJpiGSlAswOhoFK2L3RQ7O13fPUI1l03TLvEhn
	 H6pZzf6mxVyxNtfmo6LDWRnE46tPFoybx1BYDQ9PHXYe2atLS38oQPThXTtyM+kN6o
	 bouNadSyplwf1BuA/5tXz+lGxqpwlvD2nbrS838wBdbeHZRBnCnLYOAGzNZuVAfb5S
	 V2SzsSnUcBIqw==
Date: Fri, 20 Nov 2026 09:40:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: sdio: check the RX packet length in
 mt76s_rx_run_queue()
Message-ID: <awAHYUeQXyiItg_3@lore-qca>
References: <20261119124928.1398520-1-maoyixie.tju@gmail.com>
 <av8osemFMD6C2EdK@lore-qca>
 <CAHPEe=FFgzM3L9aiBNczg2AQ4JiG-p+eFKLemjrOMzekuBmHpg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IyzNOabBFX4ct+Jl"
Content-Disposition: inline
In-Reply-To: <CAHPEe=FFgzM3L9aiBNczg2AQ4JiG-p+eFKLemjrOMzekuBmHpg@mail.gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--IyzNOabBFX4ct+Jl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 20, Maoyi Xie wrote:
> Hi Lorenzo,
>=20
> On Thu, Nov 19, 2026 at 05:49:53PM +0100, Lorenzo Bianconi wrote:
> > I do not think this patch is correct since we actually consume just len=
 -
> > MT_SKB_HEAD_LEN bytes at most, right? I guess we should add something s=
imilar
> > to the patch below, what do you think?
>=20
> Thanks for looking at this.
>=20
> The fragment is len - MT_SKB_HEAD_LEN bytes, yes. But
> mt76s_build_rx_skb() first copies up to MT_SKB_HEAD_LEN bytes from buf
> into the skb head, so a frame still needs all len bytes between buf and
> end.

ack, you right.

>=20
> > +     if (data_len > len && data_len - len > buf_len)
> > +             return NULL;
>=20
> The caller passes buf_len =3D round_up(data_len + 4, 4), so this check
> never triggers. With it applied, my harness still reports the same
> reads past the buffer.
>=20
> Also, rx_check() runs before mt76s_build_rx_skb(). For a TXS frame,
> mt7921_rx_check() and mt7615_rx_check() walk the records up to
> rxd + len / 4, which a check in mt76s_build_rx_skb() cannot cover.
>=20
> So I think we should keep the check before rx_check(), as in this
> patch. Frames that fit are not affected, and the loop already ends at
> a frame that does not fit.

ack, I agree. Thx for fixing it.

Regards,
Lorenzo

>=20
> Thanks,
> Maoyi

--IyzNOabBFX4ct+Jl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawAHYQAKCRA6cBh0uS2t
rE6BAP4shk3MXabjlp0caLHfRwygk6zb5Nhlb27aRWMLHkUiCgEAnhJKQlsfCUb7
nC8etWnjWA8G6qYx7kV1eLKJ4sptcA0=
=ELHR
-----END PGP SIGNATURE-----

--IyzNOabBFX4ct+Jl--

