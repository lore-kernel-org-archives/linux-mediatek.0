Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E012D43366
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Dec 2025 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiMFkK/Hes2AYBR6C7hXhd7OwOUlmTe/EmB4bs+KvVI=; b=NJBqOCdvxtaTODY9xfKoaclZkR
	1utW4p5h/gzonZ4aFzViWR+ndleL8tjbadT3TfVDs9PF8TbL55oKhl/EOai7NxZ1zcg2ygpovefT7
	48Z/VxqdWllvhfHcIpXeiq55fbqeY38vFRZorjW8H0oskmPhPanogUoRS3Fcd4ecf+ODhyAPwU34Y
	DaqEUmDxmvoowTkXdM5Mv1l1R9kDwAmdT/P8MvUPTZ3fYXlOr9pRwuFmnFvAbHPJxgEktrag7psPK
	T0OpDzxrH96lm2vBlZA2NmZ6aPSksZ360js39dEsyJq8LYoxhmap5NUWeywryRyb4irOoYo63v+hc
	jY8aNXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTskL-0000000HXJe-2g8A;
	Fri, 12 Dec 2025 02:19:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTskJ-0000000HXJG-0kY2
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Dec 2025 02:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB6CD439DC;
	Fri, 12 Dec 2025 02:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB8FC4CEF7;
	Fri, 12 Dec 2025 02:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505941;
	bh=BgiaZ7V7m0ozSVnXi4W5objETFPBD27OWXPjCZQsXiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1CdCIFy1DIdaM12ODSJg9551ugg/J3MTmBm6s+LtkGOknQmEz27CG9AALgfgrgan
	 vP5ay3qtdd3cNbI5hOOEfZ2Wq15n6dtshAh66W6PrektoBGLJZnITSE9QwrPKY6TaJ
	 etvshAGhoCUzYDgqJl+KPvLXgpFfYXLRsyUPkF6iha/7AM+LmMi5d8QL8fU1eIhLiS
	 ztLtfcHFXz0G/iGHIlw1M+RtbZoKChoif7UXJB5536FyrXqWzdWBvnKiYNsMLsDsSa
	 IkvaDembqQuBYaa6FLpR6QBYKr5ceN3/H7KAU/M8NnyvGlF3CuP0Te7wjSujU18ngH
	 7nwAFREQsmvRw==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTsmr-000000007n6-1c7X;
	Fri, 12 Dec 2025 11:21:41 +0900
Date: Fri, 12 Dec 2025 11:21:41 +0900
From: Johan Hovold <johan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
Message-ID: <aTt8NSV4SP2ojKvi@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
 <20251028100454.4086-3-johan@kernel.org>
 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
 <aTjnH_i0q0xyLysD@hovoldconsulting.com>
 <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WxNnx0V4vXI1/jrz"
Content-Disposition: inline
In-Reply-To: <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_181903_260780_D8A15F56 
X-CRM114-Status: GOOD (  29.04  )
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


--WxNnx0V4vXI1/jrz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 10:58:41AM -0500, Nicolas Dufresne wrote:
> Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 12:21 +0900, Johan Hovold a =C3=
=A9crit=C2=A0:
> > On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> > > Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9cri=
t=C2=A0:

> > > > Add a comment to the vpu_get_plat_device() documentation to make it
> > > > clear that the VPU platform device is returned with an incremented
> > > > reference count (which needs to be dropped after use).

> > > > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > > > =C2=A0 *		device for using VPU API.
> > > > =C2=A0 *
> > > > =C2=A0 * Return: Return NULL if it is failed.
> > > > - * otherwise it is VPU's platform device
> > > > + * otherwise it is VPU's platform device with incremented referenc=
e count
> > >=20
> > > I picked this patch but rewrote with what felt like better and dense.
> > >=20
> > > - * Return: Return NULL if it is failed.
> > > - * otherwise it is VPU's platform device
> > > + * Return: a reference to the VPU's platform device, or NULL on fail=
ure.
> > >=20
> > > hope its ok with you,
> >=20
> > Sure, my only concern is that just saying "reference" is too subtle,
> > that's why I explicitly mentioned the refcount.
>=20
> For me everyone should read "a reference" as a kref based reference count=
ed
> structure.  A quick grep across out documentation, this is the vast major=
ity of
> the wording. Though, I spent limited time looking.

It should be sufficient but given how many people miss this it may still
be worth being more explicit.

> > Btw, why is patch 2/2 marked obsolete? That leak is still there both on
> > probe errors (which I saw someone else posted a fix for) and on driver
> > unbind.
>=20
> I had two patches fixing the same thing, it just happen that I ended up p=
icking
> the other one first

Ah, I had missed that and the fix is not in linux-next yet either so
without a reply it wasn't obvious.

> and liked you documentation fix, except it was replicating
> obvious weird english such as "if it is failed", and documenting the error
> before the expected outcome (opposite of my preference, not sure there is=
 any
> rules or guidelines).

Yeah, I considered rewriting the whole comment too but given that the
surrounding comments used similar language I just amended what was
there.

But I'm totally fine with the update you did.

> https://lore.kernel.org/all/20251008090156.14224-1-haoxiang_li2024@163.co=
m/

Johan

--WxNnx0V4vXI1/jrz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaTt8LgAKCRALxc3C7H1l
CI4zAQCm11arIiGlJXVGdACTl/5o23m/siC6R/rPSNyApJb1yAD/Xq07G/sc3JHg
wl+RZmvhiWbaR/6a85YoWu7Px2Qhfg8=
=4Gsc
-----END PGP SIGNATURE-----

--WxNnx0V4vXI1/jrz--

