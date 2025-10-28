Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F0FCCF9EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGec7L1K3/ls04vGgFBjzEMz/ItTRy+/HlhRqpV5zYA=; b=dOoFqMUc1ii8ac8Coencdfda49
	QAD17YllatdcLng6fJ5BTSry0pJRafQ/8C/DdKR2lLe9POioYi0dboZu4MzY5CFoGBAzjgHxd+aDx
	zGKkj3IuPibyzu0VgI4GE/J5hRHoD0JIkAX5fnj7SEJV7JKNLhyEMJC5c4Rxnoxf8FjLtmFxg6Veg
	7c8pzhmHAVXxSkRB+aV9vWzK+zlMPqwyNWB186Bz1Fb1JeXlf0C9JeW232wvkNnA87TFC6VBbXUaA
	nLpmXnd0/IKivfq1YeqzEBhKhrPHqU6iyjkx1KV5/pYCylNcuglLh2wG8158ND4KFdhg1EJV8Ig/y
	I7hgDhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg3k-0000000Fe5h-3pIE;
	Tue, 28 Oct 2025 09:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg3j-0000000Fe5I-08ar
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 09:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 013CE41A93;
	Tue, 28 Oct 2025 09:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8BBC4CEE7;
	Tue, 28 Oct 2025 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761643925;
	bh=VGec7L1K3/ls04vGgFBjzEMz/ItTRy+/HlhRqpV5zYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8GuF+2C0gkg1jR1+zGVr+ql1TzwWyBiUNtHdbNYldTOUsADT8IgzVDkW2AEiWPy4
	 8i4a6idUC4IfmaWCKjCLZLDy+BO3RNCTSFJRa/q4v6Dl8gxZqQAEvE8dY2bl8mg2Hd
	 3io+Lj8zAbN+ByG1oN5O5vBhRNvNCy2iYbX2acO6YQ6lU1NuZEg7HyNSMF8bL7bG2j
	 pXi/jpy9BShw7NR3R5/37B5xirDasa352fRLMQMg+I1PKdppeEUcvusNApTlbBEm2F
	 wm4+J96spMJzxz6EGipmKJUD1jDygu9URQHTzf8fXHbAQviw2Piaeyow350Q8hhL9A
	 jA8+oPlWAOFFw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDg3l-000000000Rm-0xYa;
	Tue, 28 Oct 2025 10:32:09 +0100
Date: Tue, 28 Oct 2025 10:32:09 +0100
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
Message-ID: <aQCNmZpOquAlL49K@hovoldconsulting.com>
References: <20250924133552.28841-1-johan@kernel.org>
 <aP91nfnpShIhXcVQ@hovoldconsulting.com>
 <ac27d9b1da68746c62c03047fd7896e2303ef1fd.camel@ndufresne.ca>
 <aQB9BIjXEOHpIy3_@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/z9wxTx+yneLrdmE"
Content-Disposition: inline
In-Reply-To: <aQB9BIjXEOHpIy3_@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_023207_112004_E56DCAC0 
X-CRM114-Status: GOOD (  23.79  )
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


--/z9wxTx+yneLrdmE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 09:21:24AM +0100, Johan Hovold wrote:
> On Mon, Oct 27, 2025 at 07:29:39PM +0000, Nicolas Dufresne wrote:
> > Le lundi 27 octobre 2025 =C3=A0 14:37 +0100, Johan Hovold a =C3=A9crit=
=C2=A0:
> > > On Wed, Sep 24, 2025 at 03:35:49PM +0200, Johan Hovold wrote:
> > > > This series fixes VPU device leaks during probe of the mdp and two =
codec
> > > > drivers.
> > > >=20
> > > > Included is also a minor documentation update to make it clear that=
 the
> > > > VPU lookup helper returns the device with an incremented refcount.
> > >=20
> > > Can these be picked up for 6.19?
> >=20
> > They are picked already, please check in the tree,
> >=20
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commits/n=
ext
>=20
> I can't seem to find them in that branch either, and they are not in
> linux-next.=20
>=20
> (I seem to have trimmed my original message too much so that the patch
> summaries were not included in my reminder. Perhaps you are thinking of
> the related mtk-mdp3 fix?)
>=20
> But I do see an incomplete attempt at a fix of the reference leak in
> that branch by someone else in commit cdd0f118ef87 ("media: mediatek:
> vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()")
>=20
> Can that commit be dropped in favour of this series or shall I rebase on
> top of it?

Scratch that. The merged commit is correct. I'll respin this series on
top.

Johan

--/z9wxTx+yneLrdmE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaQCNlQAKCRALxc3C7H1l
CNI1AP4mIpY9GNfiGHVm9Z4vAFW+glStwC22iPrdWVr53rxShgD+OHcwlYKvCt+/
P8dYWux9RIhpLNyNVx4owqhrd7Dv8go=
=J7Jh
-----END PGP SIGNATURE-----

--/z9wxTx+yneLrdmE--

