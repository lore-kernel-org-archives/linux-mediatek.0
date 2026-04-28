Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C88FF886D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=; b=YPOovsQ/RVWl1791rPAfM1jqid
	QG0s/UjoAZK5auTQ5+IxWYIdXuVzAAHidFSBAnEr3HybOJWe5kI+TqxpkHCV0M+d9nuQvbJR3lpX9
	/ehBliI0uyN9BbD0pOdGSxSjWkXwEJCZIGrV2JFR8zt+wKSfKgEdn46S4xJvfVvQtXnXBqqy21nr2
	j5IUMd9+pj1AaOcotsnkBq7yWFt+eNiAI5WD0RTWJkyj2E0d0NXlsrwm6OFePQ6aDB2KK4RL+HTco
	em9hX2iloPIUhvUE4PW/N/4gvyH+oD8niU9BIDSKETsuAznR0w/2O9x9nCgU7ieR8i5VkTR5sB+Hz
	L1C6+4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp9U-00000002Sxz-2qq2;
	Tue, 28 Apr 2026 20:35:28 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp9S-00000002Swr-1aM0
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 20:35:27 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d6ab4476eso116890761cf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777408524; x=1778013324; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=CGHWVWSQI3RIyRV0jSd6Dp0H0KHHEXVsZsccBgVwT54jE/3rcS2bCaSMPrWHghlFNr
         aCSs0/ISjxqfJOnHeqqjMSf7GvNxPEj8VAQWrhvHKhsJnC8QmPn7BQHWeDJgn/RNkJDn
         9hXW1cL9fz02S9Azi+OG/XsVI20BA3hYR9I5dbyH0dXVOiM8dtDBaSS7JtUy38sxpqwo
         sjrJWbZqyqs13vGShhL3tMSZjoEZnEbLTy75K/tWu9Crrc7J7QXgSnPfExF2JoRUtnA9
         StGvmyXa0yIpmD1ESA0cgmxSnkczjhMwaR16+LNeUdhSlKG+j16rqE9DxVHuvF6bUxvC
         2bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408524; x=1778013324;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=WtLkF20APxl4Wg0OgSPE/ZalKpviswBJlXuJfq7jATaFsdi8IMh062Nulub9Ax4QjR
         K4YbW/kkQujVx2nnR6hI4TBPu0RSyxV2NKXcZvTsOE6ZhkPhGdQFI74kMprfZSIEJgTe
         dt24xW69u1NbJ+6931hNx5VDaXfmDKMw4FYUR251yG3LuyAVgAmwPl7pYIJcRHee6eoB
         0AuAHWi2gYYuFBmkS2TumMCA/n/En3y+cK/81YPwsou/wX3rAK4CrbWJsGKu+uUmU3Db
         bFaOJDxSOTb2aJuSeyUconxHeW8/Qw4Noq2DdwRToACN6A5nGUoDpZXdBnLVbvDElLXJ
         zPgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qNcSDJ2zUcn3INV1SiCdjrfxFthc/Ai8fKeI29u3NW0pf0rSctq+rhdLgfrKWwtY2OwTHeJHBQobOohvtBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrntJlQNDZNFRuS4rsQbasW0iXWhT/jI6iIFynImisfekFcGU3
	wG2CWcpFOTqJSyYut2FtB4ZUMdQxgJB279EoCrxfyk3BWDiLvy6Qwr34aOkPZX5h6bc=
X-Gm-Gg: AeBDiet9TfSclLJHPnjSyo4T60Sc76Vw0KUY5pMS6EHC/xbUXIIx+N4CQFsf39kiTHf
	cOhqJsOvLHCAECrewo8Axh8LYAUimAXXla/0uJDoOTr5Fof2t8H7EgLaa3mBCeiv2VdBy7KuEjn
	uabj6wE+o+up5bifrw58LERzrRktVtqCjrxjR+McG4cxwAoxblN/tZdUy0mu2x0Z2N3l3TJVfUN
	aIDP/eo2EzO2u4a8q0w92bk72ZYBiQytgaAQ1sI7o2M1d1/BLnGnPZJVd0Q8KBZFxxjfSOa4QU3
	1SCWbyqImHaUhZFkX8O2P0q+aS4YnsVLFKXDnbAxMPerKhd0AbMA7BglojYSP60K6p2wcubJ0yM
	wiqLBe6Gk4qG5L6agXOs2JeaL5m4NCQ633hVdiskW2KCpV5iy1atTWzsJSLSy/ChSWPrBu9wxOU
	fKLp7Z0R0uHK5Ns5x5G4HljUHR8nHZZPrBpTm0fNU=
X-Received: by 2002:a05:622a:347:b0:50e:60d7:b272 with SMTP id d75a77b69052e-51018a79483mr17709131cf.41.1777408523633;
        Tue, 28 Apr 2026 13:35:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100dbaa48asm24893241cf.29.2026.04.28.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:35:22 -0700 (PDT)
Message-ID: <48ec46cc064fb5d367be6336bfafd888586f7857.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: free working buf on error path
 in vdec_vp9_slice_setup_lat()
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
Date: Tue, 28 Apr 2026 16:35:20 -0400
In-Reply-To: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-rldXSCr7JE/S7Fo4lx/T"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133526_437279_215C5799 
X-CRM114-Status: GOOD (  14.40  )
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


--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 30 mars 2026 =C3=A0 10:02 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 deco=
ding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0 | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..3dadb5cc8876 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1168,7 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9=
_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf=
);

This function never fails, please remove its return value and remove the er=
ror
code below instead.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0
> @@ -1176,14 +1176,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

Same issue, that function should not have had a return value.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;

Ack for this one.

> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}


cheers,
Nicolas

--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEaCQAKCRDZQZRRKWBy
9I7mAQCKtYOYjxEZtyyws6YnoZefw8GOxDT6CrR4VAMH4mJxOAD9HYVii/B6UZO/
0E2YLN5lf+OdoZWjC16cj/8Y7uLZaAE=
=+BZO
-----END PGP SIGNATURE-----

--=-rldXSCr7JE/S7Fo4lx/T--

