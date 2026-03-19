Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DAA1091926
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=; b=CoNs9HFe0JzMEM6q4SF7ioBDzi
	CfA62RQYC8SJGy8yJyzhUFkeCAdJIKy4Y5ERpJr0IOkzliBjLipHpOkfzP95NAMn/r3RLPTDI7j/Y
	hc8ioua8Kau5acmsPSA3OnXOxfmgIhz47ofVnGBOjlnhoyjSyRtL9HaYhxQEfpE1S73Ac/DAWCIAm
	mG8SgZa2d/c4kGjoQUaNw/iIa3mB0hkpcAO1dGilWT1lOqTJtxleQ9WV+TVv/uH3rFipzbMq56maD
	Tg4y88b9RM26OuF+JktdiwN7kQxSkBWv40OvSsr3/qHkogkKLX0R6QAWoTHZ15aMH6OeZexLxfpBx
	02Z4F/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Kc4-0000000BZhp-2lI0;
	Thu, 19 Mar 2026 21:09:04 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Kc1-0000000BZgi-3opK
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 21:09:03 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50905b779dfso15062411cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773954541; x=1774559341; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=Asm1Gf4S5+57quEvY8MXmmluQE25rx2ut7gyCq4U0HxAHnM6g6rZc3oKdw8dlzWRqr
         T6hSrA/rQ3nE7nq8iZCDhsGWr4mbqXaIslKNG3VHDJSk/CU+OdW7Z/u6uShWE/vg2vkI
         dt4mGhxrIbLmS9uGWpnKptxPhpNyB6l5rDizpL4n98IxXr7zT4UpZKWvq/myFzsix6EW
         qM2JBIknKF+tCGEDDVHOmypslS9MiMedLwKVWV673/cWCGCabTjvTIjMbi1B6rfa/oW3
         C7A7f/EwwAXf9UGFa6lwAAI+AG1BaANsPaeqlO3SUz7zR3TwFV2wOfRZAmY64aj3p3C4
         I8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773954541; x=1774559341;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMbfSQLQ1xEd+7s0+CT4TDbp3oywa75VWIVmbsOBScc=;
        b=C36GXSrL2lQYmnGIAVFt2BOZU1ah8KMw61APyo2PoSu+3jJGEuyQYlMhJHmJrDGMAg
         kQLNqBTvSDkOiIOxmz1kZH+MY4gpHd/rTQ/ht4bm9hwcysczkE/SQQdk9fTLaXV6VqSK
         asO8Pl5i1SOC/bl8RP3XsxvVWYKtY7Qdq6g5uEZobytMH1AhJucG2Hd6szCd+uWpFcmZ
         geYIo6ijQJxRDxN28GNXJP9ua+VCKhYmETPYHUUGqTyS/KNBWavw2BC9JGqZRHxntyNg
         gnrkP6Co6CIiTJZofbeBJgqAFgaqZj/iDM65wILTvSUmgqdKy3FiBtgONvGaT/BPbFnK
         NDUA==
X-Forwarded-Encrypted: i=1; AJvYcCVuNYyPdgJnrdo7Oe+qYwABq4CtFOo2H89zH+GRVfg0M2b1N7xSwstL2zlB2+iidl2D3PTGfvtVkbqCFDOchw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLU5Rf7ax7utWowb0QlTBc1mBmVVO7/jAjf0Y50v8+2rGwlLmj
	OTtqXrS3dsFuZzlHPduXt7K0emZYPGd+RY2CNbXBYtBzjV4/qNIxZVxxVHYs22BlgOM=
X-Gm-Gg: ATEYQzyLPOSgB1QWqQJ1bp0qHi23Cvl3IsNrvWdVBu3Y+/HxgedzcOawmzS3oUC999w
	DjsE3AAgSf/GGxxY25JIFFaQ0rFle9EW8NZiDMexxMixnKE9/0xJP4hLp/3uAu8NTeSq/c3MP+Y
	0IXTavX0gzn+T2RBM3+Tx5ska6zi3fN+Mua31mDiaTOF0nyHa2vVUNgvn+N67TFn2jsiezuR4ve
	3pJPqzbFnJ+/WHUQnS/kWd3lBUnVkOkQ3w6RM39sbTAv5evTh8P2izL+GlcSB2kiFo6A1ChQySt
	LhZ1EC6h1pT2RI+D2upAiX5rnE53C+EyRhuERbjHDjXgRaS0OwN4JZ7oLVbI4QuPz/cH3K9yE6U
	STl3pNsuQi6hQffwzXF0mk2r3MkTplssoolR3MiZPtEcTk6ftmMiaDwBmITQhALbyWH7qZwYzC1
	drigW/jHLRao7DjprppkESM+yDcj7+y+MAoDlgJ14=
X-Received: by 2002:a05:622a:8c4:b0:509:2527:d789 with SMTP id d75a77b69052e-50b373bdd66mr13176761cf.6.1773954540418;
        Thu, 19 Mar 2026 14:09:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85257c9bsm5961546d6.20.2026.03.19.14.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 14:08:59 -0700 (PDT)
Message-ID: <ebeb15d9479e651f31be59b797f4e95cf1713243.camel@ndufresne.ca>
Subject: Re: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using
 __free
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org, 
	m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, 
	tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, 	matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 	johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, 	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, 	tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, 	linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, 	linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Date: Thu, 19 Mar 2026 17:08:56 -0400
In-Reply-To: <20260310200513.2162018-5-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
	 <20260310200513.2162018-5-sanjayembedded@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-P5pBQoC3BtsCjb7Hnh/k"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_140901_965508_7D815701 
X-CRM114-Status: GOOD (  15.34  )
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


--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 11 mars 2026 =C3=A0 01:35 +0530, Sanjay Chitroda a =C3=A9crit=
=C2=A0:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>=20
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
>=20
> No functional change intended for kmalloc().

While I like auto cleanup, I think consistency is key. kmalloc is a tiny li=
ttle
dot in the sea here. Most of our leaks are in probe() error handling. In v4=
l2,
you find a log of init() with matching releas() call, which get constantly
forgotton. My suggestion would be to focus on one driver at the time, not
kmalloc across the kernel, and try and "port" these driver to consistently =
use
the cleanup function. This should also come with usage of quard() as its th=
e
same objective.

You goal should be to return at any point in the function without risking o=
f
leaving lock/spinlock held or leaving memory.

Marking as change requested the codec releated patches in this series.

Nicolas

>=20
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
> =C2=A0.../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c=C2=A0=
=C2=A0 | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c
> b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..3184939f793a 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, c=
har
> __user *ubuf,
> =C2=A0	int total_len =3D 200 * (dbgfs->inst_count =3D=3D 0 ? 1 : dbgfs-
> >inst_count);
> =C2=A0	int used_len =3D 0, curr_len, ret;
> =C2=A0	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] =3D {0};
> -	char *buf =3D kmalloc(total_len, GFP_KERNEL);
> +	char *buf __free(kfree) =3D kmalloc(total_len, GFP_KERNEL);
> =C2=A0
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> @@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp,=
 char
> __user *ubuf,
> =C2=A0	mutex_unlock(&dbgfs->dbgfs_lock);
> =C2=A0read_buffer:
> =C2=A0	ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
> -	kfree(buf);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

--=-P5pBQoC3BtsCjb7Hnh/k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxl6AAKCRDZQZRRKWBy
9KL5AP0StbOgEgmi9hNrOmp59Azp5ubjHNUiKBoy3k0YPFJl5wD+MXkfWFOYepSc
n+TSCme76s+FElTo92PrABWSwDA54g0=
=noWy
-----END PGP SIGNATURE-----

--=-P5pBQoC3BtsCjb7Hnh/k--

