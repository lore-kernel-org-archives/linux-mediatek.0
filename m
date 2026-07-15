Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6DC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=; b=wLf0nvP5SXtV39F29ki0/TweRy
	MOFlOPliq4b2N4wyCxDoRXZp4AF1DwOOUoBNLKG6s4R86WGarW3Pz3O/kc1wUjZzUuLM80ovBQPu/
	gMWiIfmxnUyXNjTFx4Nf9EO3vTFrgbfFyR06kQjBFMBjtPsZnXDnaThG4Ho1IC23g1qveyBrl4LlO
	4PcAyAdnz6BLO4kiWVN3RTT5/fbGjmO76o9BpepkknDUACLMLH8hY6+/VxJSWEN41cBr/i9aNEUyb
	dMg4RH3Z/btbSufN7yBpBX18deIp3lHtdKDZFQugtxb7cCQSaOwZ5B+O4g6rqGFpEedFdAtQ0hF8t
	Gha5YVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Qt-0000000FzCz-385M;
	Wed, 15 Jul 2026 21:46:23 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Qr-0000000FzBh-0jsf
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 21:46:22 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c2a818fc4so47751561cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 14:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151980; x=1784756780; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=;
        b=aQ4ye3HPIb4kApBSJUwai1dMTtQ9m93knBhSsMXPV6+r46/XRBQ85fpIKf2WZRv2ZL
         TSNBI48s0RQnKMsNzZheo0Z6oYdP3PECRnh/lVF9DlOd33nx+hq7PUUNGfePlwi2MZEM
         zpuuUhMa6avUcoYtmiFHNzaCGTQ94WGbruh2Lf92ihfgU2JLnkg7HUtoWOF9pD/cGnIW
         Z+JJQzV+lDIxJg8g2+/CCgcvXJ9xC7EBR+XPtii6t4j8TtMqcwsg1xhIsjnjMkU0Mmh6
         N+Klko0UupSgFWvq8JWBGKVmXLllxVsUOvbv79Wk1G5Dx3Ja3O0+6IDPsnO2uCMVI+Iz
         0zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151980; x=1784756780;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVIF/EVfgZRuLP2uDuLbmiiZlQAtiovpRtZGImmG/o0=;
        b=Sns3CozmI9tCl1bTvQoB9SA5TZoL4bsppw7dY17YYiIVld9xXZywfaYZalPb0vtipR
         kubCsIusWPMP05UyUVUzhSvmm04J8RunToYu6Dq8XwUzNQd8Ca64zSxIKL97kBVnNetA
         84a2758yDs6fmSCVjIh2kxGiG5DnQtOFB3mTKHyqGBrhe5WI7AWeA6pwcqVV3ZUhd5AP
         vdMS+djBs7vCQ3PC9JZgWcJBkxKApNogJEskp1/EzuG6EOLDxM5RxicvRMvNjkWOh9jO
         Oj3Uy586Heq79/g1sbmoGGbHsI26Hf4arpsGtx7N+MvEVKuPtcnRuzMudHlMeqoVs9WI
         fPfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0uukKSOm0QsMWVqi1fOgN0I2XQtaJzXpt1GLFR2R67lJt4iiBWHux7XBgNcDU3ngyHhG70zLgJ/dvcDfvWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBJvxWH0AMWdbff0WIEJZBQzIgR2xIvV48niOoB8zUTGtMuwLI
	Ow+ZP3pU9ap4K6Wf7/M13AUNy0TwjeKqmS69/8ESj5QfrDBs3TRe9LIYvbzhrJ4xExQ=
X-Gm-Gg: AfdE7cnVSHf95OHaqZTxVsMSCIwmp45TTYTCShGMY9lll1J48m3PXrkdGIVr2CnOKkI
	JD69NTOg5Pma8KEDweYhjbyFP+ClvNbHqVUemKI453IKFgRrr+qDbQLFDBzx0UJ5soOmuTpbVhC
	6O6rHyKNlyxBTJfXJyOVM1XNL1WjXFlfUaD0M2up8Ra65aeyUo01Nw7KoCjqtQ6fMTGBvMDf+Fc
	jMKEHDyUdoZiQ0FzdE3N7cB7zANCrxkj5zTOFS2Zy42JvgMauK6qN+z4jxOfwrjQLJs9ml1kJ0l
	MFaY8y1SAmQ28tzK8XXhDYLDz8SROLQ+d85klu5WX3PpuIRM5o0g82HC0/DiRc5bJy3YC1Gydsh
	b5K4BaLivasr0oErR9HyfgN2KOXAkYdiOSCjb8PUbiwNa+YWmqVbbC+yRWYZJ4V1Ha5Bb4hoBpJ
	u+vAC2VGU=
X-Received: by 2002:a05:622a:1391:b0:51c:7b12:6002 with SMTP id d75a77b69052e-51e4f22e410mr44796391cf.78.1784151979625;
        Wed, 15 Jul 2026 14:46:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae24d04sm140744181cf.18.2026.07.15.14.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:46:18 -0700 (PDT)
Message-ID: <99cac4207e627acca350b9ddb5d309755a243c07.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: free working buf on error
 path in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 17:46:17 -0400
In-Reply-To: <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
		 <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
	 <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ppTn3qsVv2dDuNzXyobN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_144621_238146_A1FF2531 
X-CRM114-Status: GOOD (  16.84  )
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


--=-ppTn3qsVv2dDuNzXyobN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 15 juillet 2026 =C3=A0 17:35 -0400, Nicolas Dufresne a =C3=A9cr=
it=C2=A0:
> Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> > Add an error path label in vdec_vp9_slice_setup_lat()
> > and call vdec_vp9_slice_free_working_buffer() to free
> > working buffer to prevent potential memory leak.
> >=20
> > Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9
> > decoding")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

After consideration, I will drop path 3 and 4. The working buffer is
implementing a re-alloc scheme. Even when the alloc fails, some buffer rema=
ins,
which you didn't cleanup. In the end, its not very useful to clean them up =
as
closing the driver FD will do that (calling IF deinit). I'll pick the two f=
irst,
as its fair cleanup.

Nicolas

>=20
> > ---
> > =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > index 0f47b2671353..673b17d0dd8d 100644
> > ---
> > a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > +++
> > b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_=
if.c
> > @@ -1172,10 +1172,12 @@ static int vdec_vp9_slice_setup_lat(struct
> > vdec_vp9_slice_instance *instance,
> > =C2=A0
> > =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> > =C2=A0	if (ret)
> > -		goto err;
> > +		goto alloc_err;
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0
> > +alloc_err:
> > +	vdec_vp9_slice_free_working_buffer(instance);
> > =C2=A0err:
> > =C2=A0	return ret;
> > =C2=A0}

--=-ppTn3qsVv2dDuNzXyobN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf/qQAKCRDZQZRRKWBy
9EzQAQDiVoRUElKz/0sSs5MKXnDN1ovXGYsSQ8nfQ9eu4Ww48gD/WlCA10wlGxfJ
wbiBdJUn/z/YeSOAt9q9KUFJ8Orc2Aw=
=bZm8
-----END PGP SIGNATURE-----

--=-ppTn3qsVv2dDuNzXyobN--

