Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54834CCF9E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq6vPTE5D8vp9z0Ik6OcuXF3IvLLXrGywxNTTZownOA=; b=mVA0wOKDH+QegiaoFQUG/tmZjO
	p7VpSyU+895Yr/qAZekShgB7WxnbZ0cN8tspsDjDnTAQcpRfhE6LQ3sruW3CEYI5N7HNJAwI5ly/M
	+AelGy8eyzpF3DWoHHv4+5jhklMU5IfBjgdL9Q62TGJCInsjBTs5i+tiVzqT6mukfhP/+BbpdUwAc
	jJVsLdEgTdi+7JZNFUibrV1KSOulMYyRY/ouFduWCWV72aH4H2jnpiXiYzPpHtZgnl1RatikhaaNi
	vpSNtgT1QrqBM7LRIVxt90uuo6lI32YSy3qzDeYpLWCz0sVtT8ZMt9olpGZvSPgxay+L5bQ0JJt9t
	oI4cJMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDexI-0000000FXIY-3cNp;
	Tue, 28 Oct 2025 08:21:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDexG-0000000FXHR-0mun
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 08:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E692453A9;
	Tue, 28 Oct 2025 08:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C53C4CEE7;
	Tue, 28 Oct 2025 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761639681;
	bh=xq6vPTE5D8vp9z0Ik6OcuXF3IvLLXrGywxNTTZownOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm3Ko8xUw6mz5bmJKElBxZZnc515gBzgYlexGEXTV7+8ewILjEH/LGcGkouyx29SR
	 wgIfheQtmzQZPBzeMQA2eWORMrkBs9m0HrYfCROHmTyILF1+bbZoHEIZXVoy5PXZX5
	 ncD4rqLHmbW7bpY/lDmLZu5yXkcabWXCoUoxX8oGHzp3GxsJZfV6gj51xGK17R6186
	 8gcSsdp1Nqf1mrclcD63+PtKgC0q19fR4qYh455JA+OkFPZBqkvBuyA59a6lS+gwlh
	 hKsn1BnpMBoBUoQIGX/w9AduHALhdmjlzaQFG+GiazcDX90tjtSiPXq0arK56IDgg7
	 v61HDSTvPTwCQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDexI-000000007wt-2LbI;
	Tue, 28 Oct 2025 09:21:24 +0100
Date: Tue, 28 Oct 2025 09:21:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Message-ID: <aQB9BIjXEOHpIy3_@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
 <aP91nfnpShIhXcVQ@hovoldconsulting.com>
 <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ha2fucMgPiStiQXJ"
Content-Disposition: inline
In-Reply-To: <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_012122_247067_C34A42D8 
X-CRM114-Status: GOOD (  19.10  )
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


--Ha2fucMgPiStiQXJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 07:29:39PM +0000, Nicolas Dufresne wrote:
> Le lundi 27 octobre 2025 =C3=A0 14:37 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> > On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> > > This series fixes VPU device leaks during probe of the mdp and two co=
dec
> > > drivers.
> > >=20
> > > Included is also a minor documentation update to make it clear that t=
he
> > > VPU lookup helper returns the device with an incremented refcount.
> >=20
> > Can these be picked up for 6.19?
>=20
> They are picked already, please check in the tree,
>=20
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/next

I can't seem to find them in that branch either, and they are not in
linux-next.=20

(I seem to have trimmed my original message too much so that the patch
summaries were not included in my reminder. Perhaps you are thinking of
the related mtk-mdp3 fix?)

But I do see an incomplete attempt at a fix of the reference leak in
that branch by someone else in commit cdd0f118ef87 ("media: mediatek:
vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()")

Can that commit be dropped in favour of this series or shall I rebase on
top of it?

Johan

--Ha2fucMgPiStiQXJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaQB8/wAKCRALxc3C7H1l
COHPAP4o5c3CdMjYcKPhRiv7y0Mt/SbQoTayD4O2ysNuNFLRCAEA3yz1kO0nlCQA
6lld/IVLC+92XTeC/aq295ogntl20g8=
=y1OE
-----END PGP SIGNATURE-----

--Ha2fucMgPiStiQXJ--

