Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EA3C25B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 11:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7+QvELfdkMIXtHzcw2v523cQiD0lw8Z01s5c+Jzwro=; b=3UCdtmDSzlq3c4dFNiZW48rT3v
	AomWhG/Lv8fY01YbkldHMdONml+h+ylQmvtV0kzQnyU9BwaWKlbTVoxza/kapJhZ3oru3nKsjRUds
	qcNQvarax0Cfffn4w1OaubDTTYRuMEt/MPf7WXr4hc2iJc0spF+uoa7vsEa8Uf2jgwSeODP9iW2TQ
	HyImX2caWa87UoCLPTR3/EW+hp7uI3/OQCKxYgaIAyJ3yT2OFsnVbXd8u5oW59F0L7Kg786SOYP1K
	evK5SFXgepd6jaaOBJPghkeHUycMWA+1azizr3knbECd5LooLFemoRVoqZSGD9Ve9jo3jMAK4df5z
	nywvWD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vQi-00000007b2A-1baI;
	Fri, 17 May 2024 11:07:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7vQe-00000007b0a-2C5M;
	Fri, 17 May 2024 11:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FFB2619F4;
	Fri, 17 May 2024 11:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A15C2BD11;
	Fri, 17 May 2024 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715944031;
	bh=qepJpb+INo15UPmEy1U24ZqOyd6+e3G2rBEzzbA1XW4=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=AmLfuhIBN1KnqaliLyugi8WI6e4hzmsCPH9zYGtSuoe6BLQ6RmOX/0qXTRClqtrm2
	 YWMGLkCpjwwh+GaTTY0Iw6uJ4jqOKJ9w+ZLpsY5MQmU47nSiuU2bkSJ03/yVQWNmDr
	 WBi8SGHPDbWGe2ZGdFOr+jbXFp0yAt4oSPJHacrcOJRe5uy8zkpzOHlqq+pXpKQvoY
	 mQaC7BYYYpl1GvR8NcXS1VdK08dEReVKRgjZ5h05/pKNq3zkTyi8VoH0AddKcE1KE9
	 tEvSBp8t8rB9lzi204rf/U5Byqyc1x8Pxirg3DDMhy/gXEu1TDqQtTWlv6y5JPmjRL
	 2HG80Y8QRvsnw==
Content-Type: multipart/signed;
 boundary=2e7c618b67a0e9241d302089bef35dcad20c6b884d610d157a60289baad9;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 17 May 2024 13:07:06 +0200
Message-Id: <D1BVE3G40OVL.3KX13LU75M122@kernel.org>
Cc: "Jani Nikula" <jani.nikula@intel.com>, "Chen-Yu Tsai"
 <wenst@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "David Airlie" <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix spurious kfree()
X-Mailer: aerc 0.16.0
References: <20240517093024.1702750-1-mwalle@kernel.org>
 <de0191f3-271b-4f0e-aa73-910543587c9d@collabora.com>
In-Reply-To: <de0191f3-271b-4f0e-aa73-910543587c9d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_040712_667605_8805CFEB 
X-CRM114-Status: GOOD (  25.12  )
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

--2e7c618b67a0e9241d302089bef35dcad20c6b884d610d157a60289baad9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 17, 2024 at 12:35 PM CEST, AngeloGioacchino Del Regno wrote:
> Il 17/05/24 11:30, Michael Walle ha scritto:
> > drm_edid_to_sad() might return an error or just zero. If that is the
> > case, we must not free the SADs because there was no allocation in
> > the first place.
> >=20
> > Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid ca=
llback audio detection")
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediat=
ek/mtk_dp.c
> > index 536366956447..ada12927bbac 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(s=
truct drm_bridge *bridge,
> >   		 */
> >   		const struct edid *edid =3D drm_edid_raw(drm_edid);
> >   		struct cea_sad *sads;
> > +		int ret;
> >  =20
> > -		audio_caps->sad_count =3D drm_edid_to_sad(edid, &sads);
> > -		kfree(sads);
> > +		ret =3D drm_edid_to_sad(edid, &sads);
> > +		/* Ignore any errors */
> > +		if (ret < 0)
> > +			ret =3D 0;
> > +		if (ret)
>
> Eh, this will never work, because you're clearing the error before checki=
ng
> if there's any error here?!?! :-P

Don't get what you mean? Yes, I'm ignoring the error. Thus, in case
of an error ret will be zero and there will be no free. If ret was
zero, there won't be a free either. So you're left with the "normal"
case, where you have to free the sads. Just like before.

> Anyway in reality, it returns -ENOMEM if the allocation was not successfu=
l...
> in the event that any future update adds any other error we'd be back wit=
h the same
> issue, but I'm not sure how much should we worry about that.
>
> To be extremely safe, we could do...
>
> if (ret !=3D -ENOMEM)
> 	kfree(sads)
>
> audio_caps->sad_count =3D ret < 0 ? 0 : ret;

Which is the same as above, but you only check for ENOMEM?

-michael

>
> Cheers!
> Angelo
>
> > +			kfree(sads);
> > +		audio_caps->sad_count =3D ret;
> >  =20
> >   		/*
> >   		 * FIXME: This should use connector->display_info.has_audio from


--2e7c618b67a0e9241d302089bef35dcad20c6b884d610d157a60289baad9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZkc6WxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gAqQF+If8ohfxWzONaLs9k/KTwOxp40wyYspvp
WPYgaY0y+YvqmfPt97bXGMvUrmaKiCVsAYCDq77Zckt0yPwr05dGwlFZov0Ytzw6
mKkHukD+eW43LnjracU3q6+XD7wqRPUSsQQ=
=180b
-----END PGP SIGNATURE-----

--2e7c618b67a0e9241d302089bef35dcad20c6b884d610d157a60289baad9--

