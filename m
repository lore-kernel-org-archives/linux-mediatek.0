Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FEFC27C43
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9rXrmt7+8lC/knKP497JPEr1C/VriBpknTuw33hit0=; b=1Oxq/W57tID417q1FAcB7lcD82
	7IdQnbnBZKg7E1mxuET/Alt12nkb1TBLfuwXT2L/f4J3C3d7TpNU+NtbCfxeVTccfANa7ZoMq2uvr
	uAKC5XSA72wq9UjsAOMEGio6uyXK+QSoeqp25TWYBoUnVjM0rxS6VruU18/aNix+AW2kZ01hKnDH5
	1mWYFkA7VMp7zjC2dRNrYx5HJorTi2mwMRtDRn1vtMJqECmbblkdWDbfh/3Mi/zfaGW/82j2LJt/t
	NuW5+u9t8diqGHnBL7TKvKhv9TjWTYjGJCCaUKjzod5yLm/n0ggoZRxL4DZfPJ5HqC/RK+YHfViBu
	dtI6d2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChHz-00000007dW0-2TUC;
	Thu, 30 May 2024 15:01:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChHw-00000007dVB-1Grf;
	Thu, 30 May 2024 15:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7AEA62803;
	Thu, 30 May 2024 15:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64C4C2BBFC;
	Thu, 30 May 2024 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717081314;
	bh=f9rXrmt7+8lC/knKP497JPEr1C/VriBpknTuw33hit0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBSAZJmeLFUhs3Jcwhyp3/kZBkI/0GUWOjTf2m6GbQUWtJ7l8TGe6p7+ZasXZ5xEH
	 dNiQW5VBgWpgu3R1pc05d7kqdmfT/8Dgv5dKot+NAqENkYOfCfTwe6I1jfG0twfVGR
	 mqe5MNfQOmD8R1V6TPUJwzjleX1FwVnCDZZvs+b5fj/Tem9lDRr5AwwuExXfYZDEd9
	 df/EjXzziWNKngavXZOR6W0jQvQZNgfhTzdnbt2BToaYRsO79+ZMJmVpoRh4XMa0Wm
	 xq+2aTJEqG6jeiCmkjrhh9azTF4ik/jQrpOPaiP1bvEwHG7mnBC28voatWR8zGU0Le
	 pZsaA+1PKvCiQ==
Date: Thu, 30 May 2024 17:01:51 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"jason-jh.lin@mediatek.corp-partner.google.com" <jason-jh.lin@mediatek.corp-partner.google.com>, 
	Jason-ch Chen =?utf-8?B?KOmZs+W7uuixqik=?= <Jason-ch.Chen@mediatek.com>, 
	Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>, Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "jkardatzke@google.com" <jkardatzke@google.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Message-ID: <20240530-inventive-nippy-bee-bb6fa6@houat>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
 <20240527-determined-sage-piculet-bfec4a@houat>
 <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bsilt325yu2nqtmw"
Content-Disposition: inline
In-Reply-To: <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_080156_479980_ABB74EB7 
X-CRM114-Status: GOOD (  38.90  )
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


--bsilt325yu2nqtmw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 07:15:34AM GMT, Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) wrote:
> Hi Maxime,
>=20
> On Mon, 2024-05-27 at 16:06 +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, May 26, 2024 at 07:29:21AM GMT, Jason-JH.Lin wrote:
> > > From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> > >=20
> > > Memory Definitions:
> > > secure memory - Memory allocated in the TEE (Trusted Execution
> > > Environment) which is inaccessible in the REE (Rich Execution
> > > Environment, i.e. linux kernel/userspace).
> > > secure handle - Integer value which acts as reference to 'secure
> > > memory'. Used in communication between TEE and REE to reference
> > > 'secure memory'.
> > > secure buffer - 'secure memory' that is used to store decrypted,
> > > compressed video or for other general purposes in the TEE.
> > > secure surface - 'secure memory' that is used to store graphic
> > > buffers.
> > >=20
> > > Memory Usage in SVP:
> > > The overall flow of SVP starts with encrypted video coming in from
> > > an
> > > outside source into the REE. The REE will then allocate a 'secure
> > > buffer' and send the corresponding 'secure handle' along with the
> > > encrypted, compressed video data to the TEE. The TEE will then
> > > decrypt
> > > the video and store the result in the 'secure buffer'. The REE will
> > > then allocate a 'secure surface'. The REE will pass the 'secure
> > > handles' for both the 'secure buffer' and 'secure surface' into the
> > > TEE for video decoding. The video decoder HW will then decode the
> > > contents of the 'secure buffer' and place the result in the 'secure
> > > surface'. The REE will then attach the 'secure surface' to the
> > > overlay
> > > plane for rendering of the video.
> > >=20
> > > Everything relating to ensuring security of the actual contents of
> > > the
> > > 'secure buffer' and 'secure surface' is out of scope for the REE
> > > and
> > > is the responsibility of the TEE.
> > >=20
> > > DRM driver handles allocation of gem objects that are backed by a
> > > 'secure
> > > surface' and for displaying a 'secure surface' on the overlay
> > > plane.
> > > This introduces a new flag for object creation called
> > > DRM_MTK_GEM_CREATE_RESTRICTED which indicates it should be a
> > > 'secure
> > > surface'. All changes here are in MediaTek specific code.
> > > ---
> > > TODO:
> > > 1) Drop MTK_DRM_IOCTL_GEM_CREATE and use DMA_HEAP_IOCTL_ALLOC in
> > > userspace
> > > 2) DRM driver use secure mailbox channel to handle normal and
> > > secure flow
> > > 3) Implement setting mmsys routing table in the secure world series
> >=20
> > I'm not sure what you mean here. Why are you trying to upstream
> > something that still needs to be removed from your patch series?
> >=20
> Because their is too much patches need to be fixed in this series, so I
> list down the remaining TODO items and send to review for the other
> patches.
>=20
> Sorry for the bothering, I'll drop this at the next version.

If you don't intend to use it, we just shouldn't add it. Removing the
TODO item doesn't make sense, even more so if heaps should be the way
you handle this.

> > Also, I made some comments on the previous version that have been
> > entirely ignored and still apply on this version:
> >=20
> https://lore.kernel.org/dri-devel/20240415-guppy-of-perpetual-current-3a7=
974@houat/
> >=20
>=20
> I lost that mail in my mailbox, so I didn't reply at that time.
> I have imported that mail and replied to you. Hope you don't mind :)

I haven't received that answer

Maxime

--bsilt325yu2nqtmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZliU3wAKCRAnX84Zoj2+
dvrxAX0XabP7ScLHGhP6JhXAY0/kO0KsAhJ6bXLTnMOtM9E/W4y4qvPNP4LCV3Mo
XV4YepABgM/zYB5oYrwydUNYU7q9S94P/MmmLhGyY8VJb52Xv+ugqz9UT6kvA1I0
w0SqyRcoag==
=wGDo
-----END PGP SIGNATURE-----

--bsilt325yu2nqtmw--

