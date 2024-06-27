Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB5C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ25jR3z93lAhTaPWLjRfXjHGsCe3FMl2kAvQZOLxtg=; b=PhN/1J7v6Sclt0ISLBJ3VFeiiC
	yFJLQerRLep8Q+JAaZAvgQjK/jVLWVf29zDAZzOlw5eR40eVyRxaNvnvURwLuldswI45EsvIc1LD5
	uLP4BtXGpQ2O0ailpg6AJ3Va6oC41km4HnvBc+uszy/hBqnaih39W2LwjMVnMmARPMqLuAXLxTpLg
	ISON1WujfEqci/RhLCZmKGBeig4rnmbN+qI6fdCuMAxUnJa7KBEGN4Io6kROIPk8ztb59FzD1+brw
	I1E3r1G6TDOrJujj9UKSYECpvlqjlGx47rVlI1uSgduovEjq5W9JQjKd59RJtbE3YLUZzg/GT/I59
	xFHFE7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqIL-0000000AfnC-2qXL;
	Thu, 27 Jun 2024 14:40:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqIB-0000000Afkp-43EV;
	Thu, 27 Jun 2024 14:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA15361EB4;
	Thu, 27 Jun 2024 14:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DABEC2BBFC;
	Thu, 27 Jun 2024 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499205;
	bh=m5vaRhq8fmi62ai7Q5mpzTz23lgG91PbJT19Sn+T5d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEmlBzzqClLEZ7frL7/6/UKcrfYPxI1ECcAU3WKc79c5NyD6ismGoYQ/OkVz0PJzm
	 qOdzwQcfRYGsVEL1dR6Je8CRXU7/xSh8leX7ebgDHHg3HDyrKgA7bLHTWHT1TzrElj
	 kRhFeD+j8+90UsmS5It64jjOQza7ZKHVpQKbNYvQCYjLLHm3omsTFdWQ6JMdlIi9Zw
	 IyVLOSSxrr3WgbY9NPkpJhSPe78sOaTsliPjYIhewSFLOBvPvlnq1sW0GmOverQQnh
	 JD9AUlRCHYMYzyG2hrXulazHLTuwSCqwybzMJrXRKOZu+2cVL+l0Y6blcts2JtmITf
	 TVfMaKxpzvP3g==
Date: Thu, 27 Jun 2024 16:40:02 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jkardatzke@google.com" <jkardatzke@google.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>, "logang@deltatee.com" <logang@deltatee.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>, 
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "willy@infradead.org" <willy@infradead.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"tjmercier@google.com" <tjmercier@google.com>, "jstultz@google.com" <jstultz@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
References: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ik3fmhlzuifyh253"
Content-Disposition: inline
In-Reply-To: <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_074008_280738_3E041DDA 
X-CRM114-Status: GOOD (  39.29  )
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


--ik3fmhlzuifyh253
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 08:57:40AM GMT, Christian K=C3=B6nig wrote:
> Am 27.06.24 um 05:21 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5):
> >=20
> > On Wed, 2024-06-26 at 19:56 +0200, Daniel Vetter wrote:
> > >   > External email : Please do not click links or open attachments
> > until
> > > you have verified the sender or the content.
> > >  On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian K=C3=B6nig wrote:
> > > > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=
=A5):
> > > > > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > > > > > https://lore.kernel.org/linux-media/20240515-dma-buf-ec=
c-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > > > > I think it would be better to have the user configurable
> > > private
> > > > > > > information in dma-buf, so all the drivers who have the same
> > > > > > > requirement can get their private information from dma-buf
> > > directly
> > > > > > > and
> > > > > > > no need to change or add the interface.
> > > > > > > > > What's your opinion in this point?
> > > > > >  > Well of hand I don't see the need for that.
> > > > > > > What happens if you get a non-secure buffer imported in your
> > > secure
> > > > > > device?
> > > > > > > > We use the same mediatek-drm driver for secure and
> > non-secure
> > > buffer.
> > > > > If non-secure buffer imported to mediatek-drm driver, it's go to
> > > the
> > > > > normal flow with normal hardware settings.
> > > > > > > > We use different configurations to make hardware have
> > different
> > > > > permission to access the buffer it should access.
> > > > > > > > So if we can't get the information of "the buffer is
> > allocated
> > > from
> > > > > restricted_mtk_cma" when importing the buffer into the driver, we
> > > won't
> > > > > be able to configure the hardware correctly.
> > > > > > Why can't you get this information from userspace?
> > > > Same reason amd and i915/xe also pass this around internally in the
> > > kernel, it's just that for those gpus the render and kms node are the
> > > same
> > > driver so this is easy.
> > >
>=20
> The reason I ask is that encryption here looks just like another parameter
> for the buffer, e.g. like format, stride, tilling etc..
>=20
> So instead of this during buffer import:
>=20
> mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted", 10)=
);
> mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> mtk_gem->size =3D attach->dmabuf->size;
> mtk_gem->sg =3D sg;
>=20
> You can trivially say during use hey this buffer is encrypted.
>=20
> At least that's my 10 mile high view, maybe I'm missing some extensive key
> exchange or something like that.

That doesn't work in all cases, unfortunately.

If you're doing secure video playback, the firmware is typically in
charge of the frame decryption/decoding, and you'd get dma-buf back that
aren't accessible by the CPU (or at least, not at the execution level
Linux runs with).

So nobody can map that buffer, and the firmware driver is the one who
knows that this buffer cannot be accessed by anyone. Putting this on the
userspace to know would be pretty weird, and wouldn't solve the case
where the kernel would try to map it.

Maxime

--ik3fmhlzuifyh253
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn15wgAKCRDj7w1vZxhR
xWQtAPwJBIt9KOXV4GXjTxsk3cvoA5WTGvgNoNHxfZFNkkr0VwEAjK0RT0gUDuHQ
YTAsHLqFWVRae1IwzawPQW9XPjtH0g4=
=KAkB
-----END PGP SIGNATURE-----

--ik3fmhlzuifyh253--

