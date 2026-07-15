Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B1DC44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EpaaRrGWCXRWSePMszE17K/2eaVd5bxTxAyXQa/8ro=; b=AuhuMuWvKHk9B0OKaNKiey4lsp
	JGi+B6dlHNoFPCCNmS0eeugNBG+1xD79q1tQw344kVdnN+YDJkGKUgOHBL9jxXb/M/9VLQghIEBxX
	Z4dkcjprBtZoiaOanLsxmNf8taLtNZWyCvF9Lb/oEqDAdbI/2inbxPsA+FvNUGiU3d8BvtkGTvyHJ
	X1zYHjRXS2gU7pCmeHvLr5F0vm0bdy89fFBX4SvbhXTplu4xN8P4kdy37JQ/WaSW+5qA1jaiNxlVc
	WyG3A77Bi2I0LHOz895fx52CK5YZHK/10/0OLdpgsPSzQIzcMKK2hU3mbpUt2OQc6sKHBoujyXqz/
	HFPA+LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Gf-0000000FyEv-3zPG;
	Wed, 15 Jul 2026 21:35:49 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Gb-0000000FyCL-1zq9
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 21:35:47 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-7396940aebcso2207378137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151344; x=1784756144; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EpaaRrGWCXRWSePMszE17K/2eaVd5bxTxAyXQa/8ro=;
        b=HRvThdlyt9lqWw0cDVZ6A44wAGe0ItaPa8rH5XsEmKN9ypeP1eNCCZnCCehr6E1zHv
         WJW35li5xEtcmU93OM5hwdQ7sOU69S7byobpno1N8SMGljGxu0uRQmYUKH1ElsQP56Ut
         cVT81Xb6iIaS4QcPpm1CM9/sSdcm7kGrxXDz7YqTHfAAPrEFK7DqJ4xEi2+18Q/RgUFu
         1IvtDoG8BpSzIBr+FOnW9XEaxuD7h7GTWPtXUbaInKKbT8zPo9O81IfY0MylYGobhmUY
         qNTtRq/yJHzIaGW73k9aAwdzr5fDEsa7WzWKklLuvbrYWC/0B3/w5RXO7GOJ0fGoLfge
         9BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151344; x=1784756144;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EpaaRrGWCXRWSePMszE17K/2eaVd5bxTxAyXQa/8ro=;
        b=UrTOgkd3XnE444TAISMM2pjvVgxUyFByQVk6V904k++ompetJBfwF5LNEmZjs61uTb
         bJ+d9ygjTsx5dcOq0BLLYQsk4EQNlz+N+ICYYyzBv8MA/4vLLrgdxPuJG7LZSU0EgBP5
         f1sMevQY+4jnTVLkAhEAWy733jL3rXlCyokPx9tHoszayYPmQlQ/UUhS5FqS0grG3hrw
         OByPqCZLXSxL53lO8EvzXtYcVeLwE2ZAZPYYVxUjG1rzNuJ7MFyJTD3gHBsfvtbQVffc
         6x5KtmQ3YgnHwNeN5uBB5tmIsUSUbHrB3M51ASCGSJgTMP0Mbnfv5peREj+jjZYyi2HY
         Vumw==
X-Forwarded-Encrypted: i=1; AHgh+RpHSPUWSyOMiIzXeS3aWUh9GArTflcnDzJT4B1fcI1LszWNToqoKgKjtFT0vVx9Ud7oIUmFe2al9+qKfA94UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdw1Sf0ePPg2b78qivgzAu/WVwg6q3jq+3N1GDkoL7oUoHcUv
	GuEFyKnikg6skDGnssPasdTeoQbvBeyy3eTR1JAG2H9PAZLuQ3UhyCtnL/Ng2Zp34RI=
X-Gm-Gg: AfdE7cndcqP9MSyus2MPfxpqWrZxlxtGNjl3wBT9Je5XL/PJwJOOIDrf+n3pKTtEk4V
	Gqdr3WcyXtTxZ8Ruw5FN7Rh1/3BGdBFTm30n7OGaHW8+5UTr+7dzwpE1v/PHxCGQhUsP+w7U3uc
	BPPwVKjh/QXUjOHPJ8qAEZq/xWKZbNMS3LVhrWSlIhqQzT4NgLNTXTfvQDyKSFu7QacIEZsNy8e
	HGngBhZpgSTQ3NKL6M1W457GSbSQmMXq50oHWYMt8LAf+REcplq7pb9rXBP5viqZXh/LbOmFM3t
	zk6Xr2mDBCfbKvr8//TDQKE74TQTqU0RRm35RjWQuYTNr5Pc/tAWrLs/yDVO2ioKZu26x5UmZ+2
	XzsNKXlKVaYfEtv4616BepWpGu3EwsgelVkA0hLB+BCdy4mtpfwLTk9zjFTaLacssKLamoDdemt
	gi5CsjfEo=
X-Received: by 2002:a05:6102:26cb:b0:729:affa:70fd with SMTP id ada2fe7eead31-74533bd8d76mr12786250137.8.1784151344161;
        Wed, 15 Jul 2026 14:35:44 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed2c94ba7sm11813347241.4.2026.07.15.14.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:43 -0700 (PDT)
Message-ID: <21427625c59d10a309beb656f9971e350f3e8e3d.camel@ndufresne.ca>
Subject: Re: [PATCH 4/4] media: mediatek: vcodec: free working buf in
 vdec_vp9_slice_setup_single()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 17:35:42 -0400
In-Reply-To: <20260506084203.202882-5-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-5-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-DMD/oOwECZhtXySoMRZA"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143545_522805_A2DBEAC1 
X-CRM114-Status: GOOD (  13.60  )
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


--=-DMD/oOwECZhtXySoMRZA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_single()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer.
>=20
> Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for
> mt8186")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 673b17d0dd8d..1dd0f7fd642f 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1806,10 +1806,12 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
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

--=-DMD/oOwECZhtXySoMRZA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf9LgAKCRDZQZRRKWBy
9GDcAQDsL1aA2cI34yx6YSzNqYl+sD31FYancPkFZfRBlYrukAD/WzwcjF0ymzwX
P1Lo2EOnXxeofKa8WzaogpsiOaZONAs=
=cUx0
-----END PGP SIGNATURE-----

--=-DMD/oOwECZhtXySoMRZA--

