Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57432CF3959
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 14:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtaXDtIlQ+aZv3XeFJdds6mqTEjBCovbRMFB5xz3VRI=; b=2vzSNfaDQdg6tUqBVO8+sMoPFW
	OPOOosmUUvBj6G0QrOOet4FF1px4APL+Zc7qDbQxGuolmwDOQSeaTzibpcFIKCK1YpTm2MRJEzZFN
	Z256rKC6GFir3HWpivabr3ib3aK/RlBHK2P/mLHSCjX0EeXanO8hKUddRPh8nFog/leW3FgSJyrTa
	PXI0HjoN6vjq2eIlIAHnLw4fKfdjTiQ08mzkSXlL9r5O6oR51Nx0JAyNmu1baCME+YRUaZrp0nmsq
	0gZjD3/5R7NmTgg7JSal1rjtwpsvRZ006gftHkXKcpvTEfL6vEBHcj93wABGdlr2ydC6NX1odz8RP
	2sJXCD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srIM3-0000000ATfZ-3mEs;
	Thu, 19 Sep 2024 14:41:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srIKw-0000000ATYZ-3qXw;
	Thu, 19 Sep 2024 14:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10D6B5C2711;
	Thu, 19 Sep 2024 14:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC355C4CEC4;
	Thu, 19 Sep 2024 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726756849;
	bh=DtaXDtIlQ+aZv3XeFJdds6mqTEjBCovbRMFB5xz3VRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/fncxpNGg8lXlXWpP4iqecKl6t0r64SrwUKC/ELG35CBvL4uDdXzkv4gdOoTmO3v
	 jcAAqJINj6tNXeut7mSZJYIS8WzeSTVmmtOKI7NCasMSEoW+6yqs95Bgp1EJnbcwjn
	 2mAlMKDA14XMoA7Ky/ziQaTNzfkJHEnW3Ful8VcQaoyVZ7TLNu8U8HS+qaNmg0GuLl
	 AoK7dUIC61Nod7UAuDkV/fbgOZrDBcJk+o026x/cxjFvKIrz/G5+pbnBoNcRzayZF0
	 9NmGb46JEOe9vc32XJYioQNIedbOU4q49Wj4PZj2OpKOghSep7ao0MsyYWyoobzbVx
	 aLMWk/jolWqCA==
Date: Thu, 19 Sep 2024 16:40:46 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>
Subject: Re: [PATCH net] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
Message-ID: <Zuw37gJFhnVdfSuV@lore-desk>
References: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
 <20240919074210.GE1044577@kernel.org>
 <Zuwf57d09WBYKtSS@lore-desk>
 <20240919135222.GC1571683@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jf6gr5Sasy5BNssU"
Content-Disposition: inline
In-Reply-To: <20240919135222.GC1571683@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_074051_068161_E9458C4E 
X-CRM114-Status: GOOD (  29.28  )
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


--jf6gr5Sasy5BNssU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 19, 2024 at 02:58:15PM +0200, Lorenzo Bianconi wrote:
> > > On Wed, Sep 18, 2024 at 04:37:30PM +0200, Lorenzo Bianconi wrote:
> > > > Align PSE memory configuration to vendor SDK. In particular, increa=
se
> > > > initial value of PSE reserved memory in airoha_fe_pse_ports_init()
> > > > routine by the value used for the second Packet Processor Engine (P=
PE2)
> > > > and do not overwrite the default value.
> > > > Moreover, store the initial value for PSE reserved memory in orig_v=
al
> > > > before running airoha_fe_set_pse_queue_rsv_pages() in
> > > > airoha_fe_set_pse_oq_rsv routine.
> > >=20
> > > Hi Lorenzo,
> >=20
> > Hi Simon,
>=20
> Hi Lorenzo,
>=20
> > >=20
> > > This patch seems to be addressing two issues, perhaps it would be best
> > > to split it into two patches?
> >=20
> > ack, I will do.
>=20
> Thanks.
>=20
> > > And as a fix (or fixes) I think it would be best to describe the
> > > problem, typically a user-visible bug, that is being addressed.
> >=20
> > This is not a user-visible bug, do you think it is better to post it to
> > net-next (when it is open)?
>=20
> Yes, I think that would be best.

ack, fine to me.

>=20
> If you do so please don't included any Fixes tags.
> Instead, if you want to refer to a patch, use the
> following syntax within the patch description.
> AFAIK, unlike Fixes tags, it may be line wrapped as appropriate.
>=20
> commit 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")

ack, fine. I was not aware of it :)

Regards,
Lorenzo

>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > > Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for E=
N7581 SoC")
> > > > Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > >=20
> > > ...
>=20
>=20

--jf6gr5Sasy5BNssU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZuw37gAKCRA6cBh0uS2t
rBqRAP9X7zSpYurYZzc13ZVBPyfcbcBSS82Z1mV5gswUUIWyhAEAunu6uKQwoQIz
Mjj4oVkKbrY2CJQq1NzCkgJRvTZK0A8=
=z+1M
-----END PGP SIGNATURE-----

--jf6gr5Sasy5BNssU--

