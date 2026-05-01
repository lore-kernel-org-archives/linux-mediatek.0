Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62C5CD3423
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2026 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=; b=AzO7/F+RRqWjrt3IyFa2RrrO2M
	WHB0yt2w/5YCDKqGuHuL0WC4OrkZ/sMg6q0mCYDI5S5M0Y0lIsPwf3eltFUrDGWSX3mB/ClRvCPwa
	1618w8b8Sbj03NaVduqgxVAvMCwPLLtAC/yKyMREOC9wANnpXM6aIgDrVHb1/EE535m5XGBJjrlub
	ufVFVNLARyDgJw45FHJ9qs08I/QEimwJsEh5GDMobHo7zjpP+b9SCpIXsSj4oMPnfw9JOT6za0sN5
	NmCTMqmHrbmhKjB9iLCVMmf10gNSyPrwOK1hAqq1moRS/Onj7xBgv4vih3rpcHkE2lzH4sYVI1f1c
	hNRg4iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIspQ-00000007aMB-1DlA;
	Fri, 01 May 2026 18:43:08 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIspN-00000007aKd-1N4k
	for linux-mediatek@lists.infradead.org;
	Fri, 01 May 2026 18:43:06 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50d876329bbso17863801cf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 May 2026 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777660983; x=1778265783; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=;
        b=Zwfp6AYSIdcxKwqDUMbfXouncK2qlfVJo64M5ffnKIVxUR0YNd9Lp39vSVHNjD8UQ7
         SzakN/rV0BVPT2VAvuKU862bTO9mf/hu/D8gYFdYuXraZfy9mIKMj/dS3JA1UjrC2qnG
         RQ2/uM+O3TDw90gLX0FIusJK8xqQqXrNegOYbkpE95nmp3Xu4GyUw7PqW56W6cIfP++G
         LfVumXFOQ4eVKx0is4YM2IrqaR/vHf2/p6GIZzj7AqHdqh6oDuzfW21tDiLLuMMpzw5M
         3ZPy69Osc2AknX362uvKp+SpvTXRWOVuSq0XECJtuE+dT+aSbTbpi55aNWjKraG0kRQ8
         z94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660983; x=1778265783;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=;
        b=JeQrYkvSMBEgeLklIZ/YcoeGmUbyVssclR/gHRdaz3jNRKH423era5uZ06qZILQQtS
         VsH77uRCpzCnWFUj7lCNufn03LjColrbIa5Lpd96Fm2mRT4rZqRHbYfNFvsmtmTl73bI
         gSlaGLxho1Yf8A71QpqMcNeXMEgMHIN+2clW291hrfO2VvXRWyCBTjJln3i6Tni0k0pN
         db3HCMb75FuN+8KlR8aRM787+epeWU0CNsFXiPOuU7Mrb4R3oS5Lb1BQ2H9PCPNfFEby
         4G6KYIF7JmBc9EaqHTzuVF+tPIdCjky1Ne6PCEGjODklWL1sRVkXKd4dEqFparOwDVt1
         YLIA==
X-Forwarded-Encrypted: i=1; AFNElJ/CR41wigRkeRC65AlYAaX3bh3Pjt60xD4Tbv3XBZpNf7rohs5HnUTCJl0hvl6eK4vnuYv5ff+uqbyU1PkUSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQib+vGKB50VznF0BkKoeSzFb8J9DL9qBknNRVJ9qYC8SBoduh
	kkoERUnMcHiWF+Vbh8wEZi7XefFkwqeRFeySijjDDAR/vtexNLkN8nrOUaXeyDcfAf0=
X-Gm-Gg: AeBDieua2BNoZGUsadRAbu4YN0WJORGLYiaT7ozd/KA7GyTvCifki13fkcFDNp7zfow
	Weo/fR5nQ6AbHrQ0r1WW1/5/PRQQb//rQ+F23R+plJTdLeWKfk0qEGSK2cCQbzj7t2Ph42gm0n+
	yjA7F4KUi6ENAeGeH+IZorm52QyjayyImMLL5IW9QBc8sXV3BNQoRGZvx3gQow06l4tUYOA/S1i
	swyM5+v69o/VQAiYiv8ovXpA3eZMK4yCKyuf7o6UyEz9ZnLWDm6yz0mOD9+cyxkfRk39iMg0py7
	ME9dD0YHlez+sxRl0DcbSOkZJoNrNKBozui69n5kpNvPEBJ5G/wSodNrrtUYeWf9XBS5bjIS10s
	eH1yvBUQJgEJLwDtSrZuIgG4Ss8XerGdurL3KZygGa7Duv5a4PLP3aJHAk3losiykf9F1y+c6Jn
	GsY28n3CCL8VfoU5ry6aovbvjEoshBdLhMzPCcOUDJDxQgMQPuF67n5mNMIK5GNSob
X-Received: by 2002:a05:622a:480e:b0:50b:445a:4139 with SMTP id d75a77b69052e-5104bfcc501mr5650901cf.54.1777660982833;
        Fri, 01 May 2026 11:43:02 -0700 (PDT)
Received: from [192.168.42.160] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51043c1b8fdsm17375141cf.6.2026.05.01.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:43:01 -0700 (PDT)
Message-ID: <8ac864747a72c2a02db277438c7ed441b38aa5db.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: free working buf on error
 path in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 george.sun@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Fri, 01 May 2026 14:43:00 -0400
In-Reply-To: <20260429065221.175159-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260429065221.175159-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-yncNRVXEvUL82zIfX7FS"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_114305_373535_BADC39EA 
X-CRM114-Status: GOOD (  15.25  )
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


--=-yncNRVXEvUL82zIfX7FS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 avril 2026 =C3=A0 14:52 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 deco=
ding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> Changes in v2:
> =C2=A0- Remove two functions' return value check and error
> =C2=A0=C2=A0 code, since these never fails. Thanks, Nicolas!
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 12 +++++-------
> =C2=A01 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..5a424d738fed 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1166,24 +1166,22 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);

You forgot one essential step, which is to remove the return 0 and fix the
signature of vdec_vp9_slice_setup_lat_buffer(). Otherwise someone somewhere
these days will add it back base on static analyzes.

Nicolas

> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0
> =C2=A0	/* setup prob/tile buffers for LAT */
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-yncNRVXEvUL82zIfX7FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafT0NAAKCRDZQZRRKWBy
9AkeAQC/nCc//1RNy8QZAEKkoAfSlPNlsSTvZa319kmNYUGXLQD48bQPV2/ZQqpv
raeVmn5f4p0Z4LwV12HpdtM/hgcdAw==
=ogX7
-----END PGP SIGNATURE-----

--=-yncNRVXEvUL82zIfX7FS--

