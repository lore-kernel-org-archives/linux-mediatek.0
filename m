Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00380D3B994
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 20:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weneXfNVJ7zOQ6jk7rha+Mva6f5rhafesHIx5rAX4pY=; b=FdgUVe1SX/lo0yprgHsCP6d8fg
	zBv8EXUWfgxp9y3Yr6ezJtI5q906Q9AaIDwwBIHnZAXGj4gRwJODqGW0H1QUcB7i1Da7T3D1vhhhu
	PxGhab69Nk6J8KTiCVpDoCwb6NZXp4OvDbemfVhD1EH6KQKZiCZX5y88SoH4yGy7BjA5d/G+ir0lh
	Y3H0fOQ3wmF8RWV72lJie7tGeX525ioKVgILIkRxsl285GgDvStr2Ehvt7x4WUmzmSYYVFsRgC7nN
	eH6j9kA1wZIQuD2tWcjX58oI+sfg9VxwD7EC2mC5oUUnuI8sbG7PlgkqL3SyAPFTz8iccaZ8Y+OAc
	HD//OHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4Ya-0000000Ek2s-2RQD;
	Tue, 09 Dec 2025 20:43:36 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4YY-0000000Ek2T-1kX7
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 20:43:35 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ed7024c8c5so45476211cf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Dec 2025 12:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313012; x=1765917812; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=weneXfNVJ7zOQ6jk7rha+Mva6f5rhafesHIx5rAX4pY=;
        b=NGvn4r8d+9srQzn10Ib8R9/RfFrs3xa2rfTUPN/CQI2j/V4WE0g4MmgeiMFwUjGT9n
         ODLfI1ei+ui4y1NA8lfPsGVbV2WxPMd1LKOhS+tXm16EXxV4Omnqr7xZhH07VTxXfjkp
         4RVRa8vfQDIGi7u8lzuSot7dGBdGXJKssON5NjwG4M7siZLq4ShGwXQm7BWBM3PbQU+g
         LRkbiajw0pFU39/RQy99fgk85kBV1KIamNKZ5+c3gL5GXRE6m0umSv8DgFhflDuXMx+9
         srbxsZLbsd040lvAdYBQdFHADXCcezZPEWuu0UdFhobMa7GN3Lh8NEyz8WIvBLj+Q+pl
         E41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313012; x=1765917812;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weneXfNVJ7zOQ6jk7rha+Mva6f5rhafesHIx5rAX4pY=;
        b=ZjFJA/2WugdSt06CGVOTujuQW68+TqMhBguWDQRNlyirrhdLhs0nsur99m/PuUUBO/
         huB4Yl2Sj1EPEBcU/FsDBh/waqvxfSRatAK/Q9HtXNYLIIDKd1TwFqVIBvmC1+ReMCTi
         HlfNdJMMoaSl8j1WtHvn8A6m04Pn1GruHxIkpDWHhFgT5WThq3XfsQnIokV7/pfos95f
         k8HlM1zDiUM4Cq2Fg1g4FQaAB2lplu6oXgni6GbSXhfQNlwuAM7FqwsU7bvBg91IoBVs
         pMJxuWKwsGnODauHNsouVnMVX3vK33/2vg03EbZAqMwWqQ6X744+v1z+cFpOP4RrG5jw
         s7wA==
X-Forwarded-Encrypted: i=1; AJvYcCW2mJaAkyihJxkl7LmH+IZtShR3uL4jHRPr2B8aDBBQmfor5raQBPhW8JVt1ySsFQfFjP/aW6jyG4Pr+AwSKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiP8IYW60qE/WQkz/aHIGmnHqzV2gIyiagNQqbeMIBHtWj8fUg
	n/b1CYUeowH4fRGSheORsndo8y9XwSP0jvUidp6sZzuixfqYulPQopCy6DblmF4Rwpw=
X-Gm-Gg: ASbGncsMI8AFAcYTKLWgP6uIapUwaSfXp1Pgp/g128cjOe+ayDbNJV5DN3FkNFzMBU5
	glyBcwuQLwvkC5zbYPEDXskaT+M/UFVkAgvHahYD78xp9g4mdTia/cyqEAbVGS0UcnMJutD1syz
	jUQtZ+YcmtZxLJtIO7N8m44Ex2M05yKlxy9NkPKjqi7hp/KShv/K9divuDm/CHVM4uos1401dnG
	yrl4gCB4jObrFJzuajgGnzZ+cVIqjx0EsYvoJCbSnH4bblvXMg5/bylIuiYppwyj8Yi1vLTm/uP
	faU5XMbgSzT9u9B0r3bZMq5hpXDXD9EpRezskgTQQYEeqF0z2QTM3LixXnXskLUPpLpaFjTNDt4
	UZZV8glW7Z6sKr7DqlSUSgD/v+TeLeiK3E8E3Y34Jiahh1Y04t8myPOuLgmozi7StfOPf6OR4Wv
	Ygz9wDct42Ybw5uQ1F
X-Google-Smtp-Source: AGHT+IF7CIbPoUT7TqfUIErNLH26jeQ7FGydXS4DlUaPIqfS18IW9X1btJxpQzdxCkmmR6rIS+bzFA==
X-Received: by 2002:ac8:580d:0:b0:4ee:1ef0:9474 with SMTP id d75a77b69052e-4f1b1a535a5mr185021cf.21.1765313012364;
        Tue, 09 Dec 2025 12:43:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276dd360sm109568801cf.15.2025.12.09.12.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:43:31 -0800 (PST)
Message-ID: <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>,  Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 09 Dec 2025 15:43:30 -0500
In-Reply-To: <20251028100454.4086-3-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
	 <20251028100454.4086-3-johan@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-0QYF48HqKzMye6sfDXbi"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_124334_591473_03F1A215 
X-CRM114-Status: GOOD (  17.09  )
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


--=-0QYF48HqKzMye6sfDXbi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> Add a comment to the vpu_get_plat_device() documentation to make it
> clear that the VPU platform device is returned with an incremented
> reference count (which needs to be dropped after use).
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index da05f3e74081..5808311d2b15 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> =C2=A0 *		device for using VPU API.
> =C2=A0 *
> =C2=A0 * Return: Return NULL if it is failed.
> - * otherwise it is VPU's platform device
> + * otherwise it is VPU's platform device with incremented reference coun=
t

I picked this patch but rewrote with what felt like better and dense.

- * Return: Return NULL if it is failed.
- * otherwise it is VPU's platform device
+ * Return: a reference to the VPU's platform device, or NULL on failure.

hope its ok with you,

cheers,
Nicolas

> =C2=A0 **/
> =C2=A0struct platform_device *vpu_get_plat_device(struct platform_device =
*pdev);
> =C2=A0

--=-0QYF48HqKzMye6sfDXbi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiJ8gAKCRDZQZRRKWBy
9FX9AQC0h7x2rUbHRnE6hDsHx9XZJHXL4R1c0FJ/hKVfBhBq2QEAmXZqS+V45vbE
9v8cAJQrroNT5li42FVpIGMWy7P+Cw8=
=7pPC
-----END PGP SIGNATURE-----

--=-0QYF48HqKzMye6sfDXbi--

