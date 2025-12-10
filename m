Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E0DD3C924
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Dec 2025 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GE5RptosWdqJy/yyq4WzVzSYS2R40OO8bXPy8Eb35g=; b=AX4whgW8/IYwudGAS5NtroG6A+
	OFAHCYWSF1QZ3YUYscAiRbIpcD4NRXB05a8QuJtmXpGVjzhNTn5P/emNax8tIuoiqRMidum8XbXxj
	ZIwLpVAOt83TzmLTh80w3lUI+s8b7/mM5Lc9pk+YXiR8haUyACRFrMvEQmbCn9Npgc8SmaesHdrI8
	HsLJOcorQf5hjMDf4F3ZM+ebYQC7yMJZ6RUREPo0UA1N1exTW9ljTAAuXsoGInk1rg78tTDIjnME8
	25MKhsn/3xpBZj3GD98XOjXVQ0vmMa+M9meD2app33Ui+0cc7wQcks5tOMrX0zcV6kHE5gModytqm
	J/DAjutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMaW-0000000Fahr-03Xl;
	Wed, 10 Dec 2025 15:58:48 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMaT-0000000FahH-0G6v
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Dec 2025 15:58:46 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8845498be17so79997846d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Dec 2025 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765382324; x=1765987124; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GE5RptosWdqJy/yyq4WzVzSYS2R40OO8bXPy8Eb35g=;
        b=25eZ2ntPTYFn+2ghV0jAmMQIJMGbh0Th/r05wjNtfz/uqPbXDIvHp7ZUQjx/ImntBe
         0W/Ov4D0mn6WaDM+qOpd0XzRgjqdaqqJay6QTYdaFHeUjzxJYrtTMjim/D1w7oGisMOr
         iilv4t86tEu5whs9UcfhFNSZdVhdEYuaSua9qvHk9uunHr863DErXln8SYUqPxQXZ/pH
         LDCTrpQ14eJXjHAYf8+daSgmNToP1TWObcLsRTHTdjb3+CW2FP59VDw3KazFcrLNgui7
         IrfWwKkpK98ZsRZySU9uxFlxgxZNLcL8dXgkSN7qvneq6QV05vUlugjefdWbqNf9Xtik
         8rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765382324; x=1765987124;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GE5RptosWdqJy/yyq4WzVzSYS2R40OO8bXPy8Eb35g=;
        b=soeFu5I7DZvx3t7hnoogLSvDgiw3rbonmxsYEWqyUQ4z6XP8Zs5h39WCA7HPBL+3GR
         r0xDzQgN6BVRcXJ7lPDt6Gtwm/ECU7CsPs0lOFz3r2ssWjFWbLr5JHS8UvpwD4qORpaJ
         3YYUg4CMsW5jl1F0rwCzUdEppvc+iC7oerE1COJbV/mDNtr1M77XygxC3lWqPo1Tnaxv
         bYdGz2S1zhvH/b7vJuyrrd28r5hmkCtLaQtpid8gm8BdUcvXC22xcxlUzQxZFdHSHqAC
         2mcd2+YIYJm79OKW+bl8FGU816luI6XRn9mNEhdiP0seLAcYTbtBGUA5XUKJzE8FsFB7
         6fWw==
X-Forwarded-Encrypted: i=1; AJvYcCUpBrrCzJOuKZ8ekz+KtjmnlzTtGOLBwrzMYx6+KnbPueb02sizcoVgeyf9q2dzo8yN1ayJ5K8kvgHFSz/8Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhwptiSpGki4xzzIz8IP2HDOesAQH8jVEyHlZAPNp8oF5XxHJl
	ujye5ZUGgUPrsljbnmCJ/IYw32bAyypkgRaNwauDLsOGsoOY9j/1NY9S/uIzaClgmmk=
X-Gm-Gg: AY/fxX5krDVhhjcwKjCLD9BpUKluYVysx+lrqua8GgJW4riUmiG1o4HgoqSibm3TqEB
	Fe+NXgUiX9SRsZ4IUXabYF35HRR/wUePZqzlI7SupmE5d8wlBA6z8wxVIUQuMLPgcgMZp47Br/9
	S1Lt2MkHWoQsozUk5KPhn4bppiwsCSMi4n5F762rtvJs7qv4/V48Kt+Ph63CtbYL3zvcOVnhEvZ
	sWuuEhAsHqWl6JywA250BUljCrIem597SlRLupEY8maOoDvvGN+80j4aOJw+nep1UQqoFNQqcL5
	7xLMetK0CivqTeucMxKKI4jsesFD6+yy6v3mL4ziasMpFR6l4azOy3wY9zow46cYjK0LXv3XB9/
	jkpflGdIF/HHyVhtiYrXKrJqM9HSTRBXub+jG+W9Q+V30e+EgN7Tk0NIBkpxqtWKDaaqnvrFckC
	SITy7ZgAgmfYFSoJDgLD3KWd6y3cA=
X-Google-Smtp-Source: AGHT+IF6i0V89RApudcP5yeANqOOTTwCYv/qsuj7/dQsvJiJLLv2PXtBBDPe+3zPaacPXUeT/ZONBw==
X-Received: by 2002:a05:6214:d08:b0:882:401c:e37d with SMTP id 6a1803df08f44-88863ad3a25mr40591616d6.63.1765382323629;
        Wed, 10 Dec 2025 07:58:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec2d32esm333676d6.5.2025.12.10.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:58:42 -0800 (PST)
Message-ID: <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei	
 <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 linux-media@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 10 Dec 2025 10:58:41 -0500
In-Reply-To: <aTjnH_i0q0xyLysD@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
	 <20251028100454.4086-3-johan@kernel.org>
	 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
	 <aTjnH_i0q0xyLysD@hovoldconsulting.com>
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
	protocol="application/pgp-signature"; boundary="=-+J+gL0rfBvLlL7o9z/0H"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_075845_202015_DB083A83 
X-CRM114-Status: GOOD (  26.18  )
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


--=-+J+gL0rfBvLlL7o9z/0H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 12:21 +0900, Johan Hovold a =C3=A9=
crit=C2=A0:
> On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=
=C2=A0:
> > > Add a comment to the vpu_get_plat_device() documentation to make it
> > > clear that the VPU platform device is returned with an incremented
> > > reference count (which needs to be dropped after use).
> > >=20
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > index da05f3e74081..5808311d2b15 100644
> > > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > > =C2=A0 *		device for using VPU API.
> > > =C2=A0 *
> > > =C2=A0 * Return: Return NULL if it is failed.
> > > - * otherwise it is VPU's platform device
> > > + * otherwise it is VPU's platform device with incremented reference =
count
> >=20
> > I picked this patch but rewrote with what felt like better and dense.
> >=20
> > - * Return: Return NULL if it is failed.
> > - * otherwise it is VPU's platform device
> > + * Return: a reference to the VPU's platform device, or NULL on failur=
e.
> >=20
> > hope its ok with you,
>=20
> Sure, my only concern is that just saying "reference" is too subtle,
> that's why I explicitly mentioned the refcount.

For me everyone should read "a reference" as a kref based reference counted
structure.  A quick grep across out documentation, this is the vast majorit=
y of
the wording. Though, I spent limited time looking.

>=20
> Btw, why is patch 2/2 marked obsolete? That leak is still there both on
> probe errors (which I saw someone else posted a fix for) and on driver
> unbind.

I had two patches fixing the same thing, it just happen that I ended up pic=
king
the other one first, and liked you documentation fix, except it was replica=
ting
obvious weird english such as "if it is failed", and documenting the error
before the expected outcome (opposite of my preference, not sure there is a=
ny
rules or guidelines).

https://lore.kernel.org/all/20251008090156.14224-1-haoxiang_li2024@163.com/

cheers,
Nicolas

>=20
> Johan

--=-+J+gL0rfBvLlL7o9z/0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTmYsQAKCRDZQZRRKWBy
9LyKAP9enelzywFizrpad8u/0Za3pIfyQ9BcWEt7RBs2neM1GAD/XXHUI1c9UEpL
yRRdzGOwhD2B25O6fXVKtUS2AKIoNQY=
=Bzdj
-----END PGP SIGNATURE-----

--=-+J+gL0rfBvLlL7o9z/0H--

