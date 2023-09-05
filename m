Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B44DC83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f59k+3ERB33HYOEgWyHwdXXM4ua7VavtUJEU9qewAAY=; b=lvUoN0/WznqGhcK1XhWxJBa4/E
	sNS48vJqLYZ6Z5i8AKV8bfnlTplDv6oE0Jqpl2a52PirGxRR0QCBsldArN4p3UeL8t3U794E4sQgB
	LaX0zRWrsUy80SCAUsPXKZVlq37a0NYAzDHWAnKGHhxZALe4C8YqjTTV3dwotj1APB3uVDxn6k8pY
	kjmLlo7XPZCt79in5UPehVbpVONdPovcyrrISpKyiYl3Org4EYvMCNfz2N3HQ2R4vLC3PwMWtpO0h
	OjF/9HpCFanFMphWw8Qm56j+bceF+X2UDnrKhAkJrNvd0iyEQaNidixps7B4ut5m/H/kncrmYUuE9
	oecilyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWIl-0066rI-2z;
	Tue, 05 Sep 2023 13:41:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWIi-0066q4-0j
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 13:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7E1DCB810D1;
	Tue,  5 Sep 2023 13:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA8CC433C8;
	Tue,  5 Sep 2023 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693921261;
	bh=Uvy2CPc4Wf3EmKiapYddhGQwSCoeFK0JXoU7RKfJDbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ef6ARLaLyVlsExJtD1u2IbeHQs6i4Qmn1d6d4745bnC2cgBTDU77MMyGSLuYGGE1E
	 MjPEYpDRVERFuNQhaL+wC8ezxuL7/sJN0vb4GfMjhbkmc8xPwj+fW21w1YoFAuEifK
	 VTtJj/jB2uLOPHjbjlGhcbKPORnltb/iJdZmK5vOEM20RTpypJhQX3+6QoLFwhIJ7x
	 2Qb4me9mbLj5AMipUT4r2RFXVzAgkJGgUyViGL57o+vffnujqL6ahaBYODqL6ZAPGM
	 9seyX7aNIqggY6azgVSjIxJsqc5N/6OIdTCIk30jPoCFHnFfr4tjAELSBKshMHeCx8
	 91LqBPdWW8GJw==
Date: Tue, 5 Sep 2023 15:40:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	dri-devel@lists.freedesktop.org, helen.koike@collabora.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, daniels@collabora.com, 
	gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org, robdclark@google.com, 
	anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
	jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Message-ID: <6uusq7jlofbztz34yksxbr6vgqq35a3x7ibuqm62dyrpzve4g5@boaladlcrjnv>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
 <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
 <427ceb32-054f-41ff-df95-446b18aa178f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zzvnm44fyzbgrw5r"
Content-Disposition: inline
In-Reply-To: <427ceb32-054f-41ff-df95-446b18aa178f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_064104_557896_CBA09A73 
X-CRM114-Status: GOOD (  19.43  )
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


--zzvnm44fyzbgrw5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 07:06:43PM +0530, Vignesh Raman wrote:
> Hi Maxime,
>=20
> On 05/09/23 17:27, Maxime Ripard wrote:
> > On Tue, Sep 05, 2023 at 05:11:43PM +0530, Vignesh Raman wrote:
> > > > > Also, that node actually has a label ("usb"), defined here:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
> > > > >=20
> > > > > So you can end up with
> > > > >=20
> > > > > &usb {
> > > > >           dr_mode =3D "host";
> > > > > };
> > > >=20
> > > > ... which is the simplest and thus more robust one.
> > > >=20
> > >=20
> > > Should it be,
> > > &{/soc@0/usb} {
> > > 	dr_mode =3D "host";
> > > };
> >=20
> > No. The &{/...} syntax refers to a path. &... refers to a label. They
> > are not equivalent.
>=20
> Sorry I was not clear before.
>=20
> With,
> &usb {
> 	dr_mode =3D "host";
> };
>=20
> The target is <0xffffffff> and fdtoverlay fails to apply the dtbo.

You do have /plugin/ and have compiled the base device tree with overlay
support, right?

> With,
> &{/soc@0/usb} {
>          dr_mode =3D "host";
> };
>=20
> The target-path is "/soc@0/usb" (usb: usb@78d9000)

Right, and that's not the path you want to modify. The path you want to
modify is /soc@0/usb@78d9000. usb is the label, it's absolute, and you
can't mix and match a path ("/soc@0/") and a label ("usb")

Maxime

--zzvnm44fyzbgrw5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcv6QAKCRDj7w1vZxhR
xfUfAPsGADRw4k1O20bltzgYsVzleJ+qXoptLhYG6tJKe0W2dgD7B15nLB6bDOQA
W+FAFDt2PF7aelZR4Wdn21phYMb4LAI=
=BmTo
-----END PGP SIGNATURE-----

--zzvnm44fyzbgrw5r--

