Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8C8C5B555
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jun 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H20oARnwguLVFi0luYgWxOb5qnom2+HQL/iTM1arNqg=; b=oAZF5x1wMX9OJPHxcOhTCK9ZMF
	VqDCEVSSFonVa5228VpDUpOvrTsJLQ4s98tnHAeu0V3uZoyBr3LlQvsDGTPpawGkbGrWcvpFIbY0i
	i+eFfNPWrq+GXoONh4OLThcRnA27w+nkgd+OuBDA33YcgJdmkYVl7QXaPGA7ir74R6B017/GY6iaj
	3IgJiYNODkA8tZt1w64pvKswLK8JVKy8qlnWCW/tcDLKcchABJbG151zxEvYfgftQZ0/XVm2xg137
	Nq3hDwfuDupKXBqp3gXUPwKai0p8JFps2tQL+Iw55y7Bm6x8eYz3yw0dQVc3IPNNkGaGL+QhTIppi
	+/CwogZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9Rw-000000089mC-45t3;
	Mon, 02 Jun 2025 17:59:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9KJ-000000087dn-1GES;
	Mon, 02 Jun 2025 17:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B966A614B1;
	Mon,  2 Jun 2025 17:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE01C4CEEB;
	Mon,  2 Jun 2025 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748886718;
	bh=H20oARnwguLVFi0luYgWxOb5qnom2+HQL/iTM1arNqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3c57b/q5sC7VlHE+QTwvCeWrhi2u0XZOeLUwcTSOMHzvsgdVHVF1/e3JxL3LGYj2
	 njHmW+hCkfLrE2iWaeRNlAnhPEOdaQHxhse/btLMxpJHD+s5zqdstkYmbZJVFsBBwH
	 X5qBcWdsLJx3AVGXUS0v21Sc1t4SOLG1TdMb9frBSloqFGJDlRA7a+0jZgRcU9R6MX
	 fBpWs22G7eFTaKC1rkzNpskxb9kDB/vbnNPnYO0fnS7EoendwDw5QMTkPi+oLZUXFF
	 bWpOeZlkEKSGvJA5jltUiqygDql/EWuA8ukesb17KgfhPzT7TwFFfszDUrRvwXJr4i
	 nNJypcK4qdzww==
Date: Mon, 2 Jun 2025 19:51:55 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: airoha: Fix IPv6 hw acceleration in bridge
 mode
Message-ID: <aD3ku-c4n-im8wJF@lore-desk>
References: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
 <20250529-airoha-flowtable-ipv6-fix-v1-2-7c7e53ae0854@kernel.org>
 <20250530180637.GR1484967@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WGm1eKw4kD/fuTp9"
Content-Disposition: inline
In-Reply-To: <20250530180637.GR1484967@horms.kernel.org>
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


--WGm1eKw4kD/fuTp9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, May 29, 2025 at 05:52:38PM +0200, Lorenzo Bianconi wrote:
> > ib2 and airoha_foe_mac_info_common have not the same offsets in
> > airoha_foe_bridge and airoha_foe_ipv6 structures. Fix IPv6 hw
> > acceleration in bridge mode resolving ib2 and airoha_foe_mac_info_common
> > overwrite in airoha_ppe_foe_commit_subflow_entry routine.
>=20
> I'd lean towards splitting this into two patches. One to address the issue
> described above, and one to address the issue described below.

ack, I will do in v2.

Regards,
Lorenzo

>=20
> > Moreover, set
> > AIROHA_FOE_MAC_SMAC_ID to 0xf in airoha_ppe_foe_commit_subflow_entry()
> > to configure the PPE module to keep original source mac address of the
> > bridged packets.
> >=20
> > Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> ...

--WGm1eKw4kD/fuTp9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaD3kuwAKCRA6cBh0uS2t
rJZeAQDU2f/xsrBtwpH4Z5GZn40kGaIkjZNPpkzQMUOzR/F22gEA0l4SEdoCpmuj
iCwUL0hgCrxws4X1lZ0eEaGAYtxo7go=
=Lqy3
-----END PGP SIGNATURE-----

--WGm1eKw4kD/fuTp9--

