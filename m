Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88489E68964
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8IQtCmj33W86d21B+EaX/sCF/MzMV/EOSoJK7YNil8=; b=wDd61ZVSmey9kxCBB8P/RGNIoV
	2vVc9+RuTZJM43zV3+Z0JN/LZBY1f/F3heasvT/vY8EZ/Oy779852PWTmqb0uZEAumt4GVB2Zq8iA
	F1t3gm/L9eexxEgLKyy1y2ZM2DhcrdFJDIGG+wLPY/IARHZZZ6kiPktRuqdWLPKa+q7kYa5pnB1eQ
	rcGxd3ueSlmre907DfnGiwC0FkbKeyYzoc/tp0PZf1v5tu1lgm1yT6N/wefgBJXooGx6P4ZIiGRcb
	fC4hzTaoL5aGtQ7TIx/eI60TdKvklet1vZgVZ58/rfNPpUtw8AZ4z5jWhdU13PdOJkRIh1dbLltCJ
	gMonotDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RXN-000000035lT-136P;
	Thu, 31 Oct 2024 09:32:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RW3-000000035Yn-1OFM
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 09:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52AD95C9445;
	Thu, 31 Oct 2024 09:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F95CC4CED0;
	Thu, 31 Oct 2024 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730367050;
	bh=z8IQtCmj33W86d21B+EaX/sCF/MzMV/EOSoJK7YNil8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5N/3ulfWm/A8PLepngAlXzNbpeeLQfnD0G7bPYVYejO8c18/o7VmfMh7mFffzx+4
	 UFV7bLwarSbu0TNS1PFo+tlaarasjjtzs8zg3GCpGgQ7g6SsOj0SFJVVJcsK183JIB
	 AeaObIsRydHOpJubLMPInAlOpUzpSmSoH8Dzi2TqMc+6O+YMdQD5BOuhUqkEa1f9A9
	 KxLQw8yKQPcKs5xzDccNtxg/aiU2CwItZzATuR/tq8uQcjfoZursvtA1mTtCZAW6Je
	 rGjDnppAvxurWmixQVN2e3Yr7H1v7Fxq+iQNF1ggCOvYjoxUtxsheYs+NCc0veN/En
	 R2rku15wijgoA==
Date: Thu, 31 Oct 2024 10:30:47 +0100
From: "mripard@kernel.org" <mripard@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Message-ID: <20241031-turkey-of-astonishing-reputation-d1de20@houat>
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat>
 <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
 <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yyz2c2rl56su2opo"
Content-Disposition: inline
In-Reply-To: <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023055_479889_7EE4AC5A 
X-CRM114-Status: GOOD (  25.37  )
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


--yyz2c2rl56su2opo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
MIME-Version: 1.0

On Wed, Oct 30, 2024 at 04:52:17PM +0800, Chen-Yu Tsai wrote:
> On Wed, Oct 30, 2024 at 4:48=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) <ck.hu@mediatek.com> wrote:
> >
> > On Wed, 2024-10-30 at 09:25 +0100, mripard@kernel.org wrote:
> > > On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=
=E5=85=89) wrote:
> > > > Hi, Chen-yu:
> > > >
> > > > On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > > > > External email : Please do not click links or open attachments un=
til you have verified the sender or the content.
> > > > >
> > > > >
> > > > > The recent attempt to make the MediaTek DRM driver build for non-=
ARM
> > > > > compile tests made the driver unbuildable for arm64 platforms. Si=
nce
> > > > > this is used on both ARM and arm64 platforms, just drop the depen=
dency
> > > > > on ARM.
> > > >
> > > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > >
> > > > I find this days ago, but I don't know there is someone who apply i=
t.
> > > > Let this patch go through drm-misc tree which already has the bug p=
atch.
> > >
> > > If you are ok with this patch, why didn't you apply it yourself?
> > >
> > > I think that's very much the expectation, so it's probably took a whi=
le to merge.
> >
> > That's ok for me to apply it if drm-misc has no plan to apply it.
>=20
> I'm confused. The culprit patch is already in drm-misc. So this one has
> to go in drm-misc as well.
>=20
> I can try to apply it to drm-misc myself, or have a colleague assist with
> that. I'll let it sit for another day in case anyone has something to say
> about it.

Sorry, I was under the assumption that CK had drm-misc commit rights? It
should go through drm-misc indeed.

Maxime

--yyz2c2rl56su2opo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyNORgAKCRAnX84Zoj2+
dirAAXwMtocqqWOLJX3eed/G1RYDirHeRZPuWU/rPZByXJzFkdOx2CbomE6jbcW0
37L5Zj0Bf3ZbGUBxEnKE2qlLavUFFw6P3brl86LznSy2iz0l7SD9zGdrx/ojiRkC
Vf2QI/XF3w==
=L+1s
-----END PGP SIGNATURE-----

--yyz2c2rl56su2opo--

