Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD6C3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJjno0ngebiuX7C9w99K4Qs1Ucuo7p0N2nbncgeNwto=; b=Rwa7XEMajQAGNF9O0Na6So1sa0
	uQpXJYLeL+XaIEAWPZLRFcCPjrFGaVqId1oiL4cIl+gQQz9U14kcy5ojHB0ls46PBJIoa/I796foD
	l8pyXI4AflxBaI0v++rsQTYLTMkwyWMjKX2MVYXZz6RtD8ZSmdnB69P3DfvZ9/IHhIxiikK/Sw14x
	DSPjE2pZTbKLKfFFmhKJm6/l5PPdxdD077sbdJEh338sH+fDqvHDY7llw2lH0ws8286e3qGUDnj1o
	RKJTD5iGaK5T2QUOpMaz3uULj4xhaGN9FoDCblUiEyqPm0lLLn4JZpN7Jj/9vnu55W5VCU8qz3d5H
	UNY7X/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u248k-00000003DV9-3lkR;
	Tue, 08 Apr 2025 08:17:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u243h-00000003CGU-03NB;
	Tue, 08 Apr 2025 08:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A496C4A0E4;
	Tue,  8 Apr 2025 08:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2C7C4CEE9;
	Tue,  8 Apr 2025 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744099908;
	bh=sdci4lJsO/FOikKIVq4yCkhQfnhsn9Us40sQtnVw+Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qzp9zD1fw7vRDLwtT0qI/gIR/GHnf3Qv752bVzjp7b5VGG06sX7xDK5fp961WVTEf
	 WPEAfUv/c2tzI+IBLGZ+y1Rx/KE1w9Q7Yf/tHlA3lLIe5QufpOu0k3puZt4WL4a5Is
	 VrpCeIsEhZrQ4QP1zM3Xn3XrPRmsgXFEfDQE+Qo1PAvmatJiHf3B/XPntRYegpfMYr
	 r8E9sOE+bqEf+25D9ZvKx626KgpcFQnDkzCvTVZVzat7FuIBUxJDU6QKvFIrMuhodP
	 ntQLt9UlAtCulJpHCkWXZy7RvYHOPdM/BZVkbc/fUibXacHQVeleZ7US4z/TeZ7cio
	 XP3uLDDN3mb8g==
Date: Tue, 8 Apr 2025 10:11:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Davide Caratti <dcaratti@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add matchall filter offload support
Message-ID: <Z_TaQbEeTZnKL9ei@lore-desk>
References: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
 <CAKa-r6tNa+Ltxb61g6E3h66pxW0XTDb76T6Wc2XMJCu8xuAvPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf4oqZqIraZr0Mc3"
Content-Disposition: inline
In-Reply-To: <CAKa-r6tNa+Ltxb61g6E3h66pxW0XTDb76T6Wc2XMJCu8xuAvPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011149_071294_486A965D 
X-CRM114-Status: GOOD (  16.00  )
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


--cf4oqZqIraZr0Mc3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> hello Lorenzo, thanks for this patch!

Hi Davide,

thx for the review.

>=20
> On Mon, Apr 7, 2025 at 10:04=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.=
org> wrote:
> >
> > Introduce tc matchall filter offload support in airoha_eth driver.
> > Matchall hw filter is used to implement hw rate policing via tc action
> > police:
> >
> > $tc qdisc add dev eth0 handle ffff: ingress
> > $tc filter add dev eth0 parent ffff: matchall action police \
> >  rate 100mbit burst 1000k drop
> >
> > Curennet implementation supports just drop/accept as exceed/notexceed
> > actions. Moreover, rate and burst are the only supported configuration
> > parameters.
> >
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> [...]
>=20
> > +
> > +       if (act->police.peakrate_bytes_ps || act->police.avrate ||
> > +           act->police.overhead) {
> > +               NL_SET_ERR_MSG_MOD(f->common.extack,
> > +                                  "peakrate/avrate/overhead not suppor=
ted");
> > +               return -EOPNOTSUPP;
> > +       }
>=20
> I think the driver should also validate the so-called "mtu policing"
> parameter. E.g, configuring it in the hardware if it has non-zero
> value in act->police, or alternatively reject offloading of police
> rules where act->police.mtu is non-zero (like done in the hunk above).
> WDYT?

ack, right, I missed it. I will add it in v2.

Regards,
Lorenzo

> --=20
> davide
>=20

--cf4oqZqIraZr0Mc3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/TaQQAKCRA6cBh0uS2t
rO5FAP9IPAyg0FFzsbCQb+ZqLZXr+62jP0nLzaeO/Mklx3HefwEAloAoGjXka5kn
3FvimlCwCpSabbKDUFgb6Nl9SpTVnQk=
=NtS5
-----END PGP SIGNATURE-----

--cf4oqZqIraZr0Mc3--

