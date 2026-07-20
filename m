Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1965C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8shEkl9bfUBm5chmZQFFesp2M/GuSCNTbnqyFJ47KZY=; b=cjy/wL4WiWAh+gD8OFkjzOI3HS
	fSqwgCx9aG4iXVGld44xvSxGf6y6222kSgCf4hdcQVDdbiwh6mp+y6DENfHgw0OAQ0/GPMLSWQSJ4
	SSmQ564o9sj9uwT648hmElkixuJMhSCdeFh91xWTBoNElZyGvG/v6PInnltzxihZgbcM4T1Q5HacT
	vxqH9EHZTztmLUnMnKpA42SzeENZF9F91duS3C1V3x9VHlgs4rpqQxf9pJe+qIuYORHBSy2KIcR+F
	oP3UlbqAZiEGi5LcAdRXvM8rG6XSKwyB/NRKiEN6KSlDQxAIaCgNgKT2t7b/AEwbeubLqyJI5scfq
	n2wBZ62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw3L-00000007ziw-1CzK;
	Mon, 20 Jul 2026 22:01:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw3K-00000007zib-0XXp;
	Mon, 20 Jul 2026 22:01:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26A254398B;
	Mon, 20 Jul 2026 22:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EA41F000E9;
	Mon, 20 Jul 2026 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784584893;
	bh=8shEkl9bfUBm5chmZQFFesp2M/GuSCNTbnqyFJ47KZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TpuTzzCtdwyrM6qitqt4emn/cmErizKX5pgjsAO8dkEAzni/H5D+HcWiacDR3ef2Y
	 fslA460AD6nOE7WXh36+2xYoQP7RLSjZmwycfAKIDsfvbmyx+bvAyOw0XOkusT1RZ6
	 fbkH4/VwrRMzIafhwBXZ3Fnp7TPlYWc3e+PJIq/taQFzzgrJB0/w5rHurl7JE7F8zp
	 G9931HBstUO/amAaQIFHemvNXZPskb88dyQB5or6m/0Xqs13qRKivWOe4MKL7i1OZ8
	 SNXbJdA4OLfVbM7wnuNmzO6zp9vGojydljZnoQqRWaU8xZyKkzj5DKguVBdFLnhNTP
	 oP+TNHmEvsboQ==
Date: Tue, 21 Jul 2026 00:01:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v8 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <al6ausK3oaED0JQ9@lore-desk>
References: <20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org>
 <aloP8n-EVtAHnl-l@lore-desk>
 <20260720144816.4d32909b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Pkeet7k5saMLTzn"
Content-Disposition: inline
In-Reply-To: <20260720144816.4d32909b@kernel.org>
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

--3Pkeet7k5saMLTzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 17 Jul 2026 13:20:18 +0200 Lorenzo Bianconi wrote:
> > I'm not entirely sure what the next steps should be for this series.
> > Thanks in advance.
>=20
> You have to repost, once a patch is 2 weeks old korg patchwork bots
> insist on marking it as archived.

ack, thx for pointing this out.

Regards,
Lorenzo

--3Pkeet7k5saMLTzn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCal6augAKCRA6cBh0uS2t
rHfsAP0ThBpx8LlBnccLWrshYDI4Kd572l7LahBkxSCE//NK9AD/Sn0vNdoXEqW5
+Y/+8BZgBUZmeKBL6AHFKkdBb3mg0g4=
=rk5o
-----END PGP SIGNATURE-----

--3Pkeet7k5saMLTzn--

