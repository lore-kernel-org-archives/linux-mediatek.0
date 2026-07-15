Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C12DC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=; b=QGmxEdXyYyjqDP/wTLDA1P/aFf
	ZUM8EFFk1gtZB2NbyUyR75oV4Rw/8HuTrOCby22rFWWSxgznmo8TAM8ltw3mcNOQJg701sJdEsV+9
	A2P/VNF3Yyryjxi769udhjd2oY+kh65HNZzEtHKGxxcKSf8+OLO5hWiO6qYEOU+p+5nC3nSmUxDxw
	1aaCPsyGOMEs89I1Gn91bYh7oheSmW5Cq+l/XMGJG0nXFnw9nxieQBDnk8ZNmawXntyYsD7Xu1fqh
	1HHwdiokfYumUme2K4BqDGJtm8DoeGumZTrrhh8tBZGOA9I2Rz86x6dWy9ZBP8eEoeL0V1rJYZjCf
	lGXcavSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7G4-0000000Fy3I-2xuD;
	Wed, 15 Jul 2026 21:35:14 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7G2-0000000Fy2J-1f6C
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 21:35:11 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-9697a691b5fso874166241.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151309; x=1784756109; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=lck8WKDi3McquTnEAFej18T4oTIFDKNgCnUyHnn5qnBzDQwNxyrWGHcBI+EusixnUY
         RRwyF/LsccD1+ysfaunhEYJERp8KTF4EPOmqfqpdSFcXptn7E+VjnG8rTS15podY2nCD
         XUehftS//F8+aBiPgrVxdNSmyQK6sn5Uh27pUoWOGbmSXSCIbrwbL92Pb+iPOqxWDqaL
         NQ2+frBKlPVteITxoTf12DuVE8dePXtN3lFHv/E/nkYYs4HjA0mcZrCo2oAgRzxZlQOD
         hl6ccMQ53Jagx3sgfpiSBqsaAb48EVVVHCM6ghLHGHaLlhSJOOMub0OZS8pyA5J8JYjF
         3vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151309; x=1784756109;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=by3QuZj0AupshzvAMzHQM5rUipr3tzd0SYh2svpqfTGu6wsZ/cNQPNf19McBHxggHD
         LH8YV7crm7lU0ZJT3LEhA5KmjblfkfMII1rTfm2xquj8sCtmaae37l0FmiFhZASTNTxy
         8vSaGBvz+m3JYWiMNgq0uOJCFVPEWEFhGj5abx5SMqApTl8I0th24NwtwzZgBbKqQNmr
         0D4CCzORXPz4xiLmuiUTny8klWAm6DMk+2EtiMSMvAuYpUxeY8AkJI5bt+zfPYSNHnXp
         JyTpSKYp6H9ntRKbsA6KahlhjCudaL3CeJcN4ZLBBouXXIMt6iVRQMKu62Dmth9+bQ2S
         6KJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr58pr1rEqiM+nybsUZERlUaobSQeFZ5adgZLuH5PUSVZANA5NcwtoDNrN6jM+R9AkSkmIHqc0eLS1LLMEDAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynuhgCNn7V1YDANyWJys/tP7ASlJTtKBGBVdfYbjhUAYvUoktJ
	VzMaN7DAXNDBOzuJQWt1rQr5WOE74IZkpv7pFGInUA/SuTiU6yuajneiApcl7xPCWVM=
X-Gm-Gg: AfdE7cmPCKtlBcRTemQyLwDWY936zc+QvQigy1BPwijl79FGSKqCM3pf8XX64K8c6i+
	oS6gOSlauhDSpmoHKJnsvTO2WH+gHm0GjERnGR1u+BB6G+anmpL5TZAkOnpyFr4ZFqm9HFEy7YP
	Z98uHDvqvgedLPtYeWJIG6w0+WIZnQKGaEIxu+0r+02V+FmWcSYr+65pXtFiGfkLg4bHp1+o81I
	AQUVPv49a0k0XM5z6RpCccUnAIpG3NTTq/pX0RcN+/KPsunZ8RDvss3JslcWPKRyxz+8vnaUgDU
	xngnl9kswspJGXwYEB+qM6SKTmue0TEQhTQcltEWCzPwjiqe9AlHwaXF3VGnwSpVc2xfcrH52Lc
	+fg6f7R4iFUQlzNX92LdsYXpVtQ3CWmn3mnJJuVRFdtBWV9uelR+1wi+37xcrX5tuP9qg1ETTms
	2m3lA7OBg=
X-Received: by 2002:a67:e119:0:10b0:745:7f23:a876 with SMTP id ada2fe7eead31-7457f23a8b8mr4213170137.1.1784151308881;
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3184b2asm10838154241.5.2026.07.15.14.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Message-ID: <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
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
Date: Wed, 15 Jul 2026 17:35:06 -0400
In-Reply-To: <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-BPGkvXWrEAcE1IG1kYVb"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143510_440109_F5EE5887 
X-CRM114-Status: GOOD (  13.34  )
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


--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9
> decoding")
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
> index 0f47b2671353..673b17d0dd8d 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1172,10 +1172,12 @@ static int vdec_vp9_slice_setup_lat(struct
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

--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf9CgAKCRDZQZRRKWBy
9GUlAQCiIYGKuOGYT5TanEl67O39XYvu/biLdLS48sx4lqa2UwEAq720eTrXwm+3
GboJu4m0lDSSaP4OwRGYTcVkIJSRGAY=
=bkfy
-----END PGP SIGNATURE-----

--=-BPGkvXWrEAcE1IG1kYVb--

