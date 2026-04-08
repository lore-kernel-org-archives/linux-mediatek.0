Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F610F9972
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2026 20:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=; b=sSAboYNTz2hiQPMkWHPzd+pO4M
	cNBM8MoWm2o8Xoof+kDJyV+mH7DMmjP93ftIT5lmjbiFYjnneuefcqLzhIFM5VEEgJn3weBaOo+og
	kbIaLw5AETVxSeDYKa4cgjBhO/uBaLyLR/CVboqziOB68zXyIqr4s9R8tvbEaBV3D72a7xDmjiqY1
	3po5UdXXnq4He3gzSOYv7KC6kdZ9M/LKAEv3EXXqqnUY/0JapXOGCGuCqIijkkW3xLlJLPBRp06V0
	VQuiPIS2+xhSen496Lmw1xDXqHGXu5XAF7dKR1Pp8eZtozuhxk6+mC3/yjcIZ+Veq+9n2NUb+k0cW
	iq4hnHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZQG-00000009Nge-30lD;
	Wed, 08 Apr 2026 20:22:48 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZQD-00000009Nfu-2AGX
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Apr 2026 20:22:46 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d8e11b948so1744871cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775679764; x=1776284564; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=RBlNsejb1MsOC/WsTg9OBzYIYs7rv2025vA3Y7bq+I4bKlJUEYp7vu5nXn0zv80j/d
         e5S5NG4uRDHaF4sHFtfjJxr3uPNB0+oWO2OzTUNeU6VLLo8MdJiVGx2iXMWyO4pGiO3Y
         FR/SoQSaGAHN/uHTlt0SXR7vhje1RZfj5ay57a4XYEc9CNPUfiIGSBDJM/CATqq/x/AA
         NT4HVxqIHf5dJ0CaGBxty0h4wFa6cj8wyWlABti43H/oIVUkW7kzuqPRaF7L3MwJMpp+
         vWIGDrFDNXxZWKyN1L9ZiS+Z8K50+ky6DFvPwnVbXErbd3CmAe7pYmgLrcNr05yAHIOA
         Iq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679764; x=1776284564;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=CoDe6IhE5iDp8heXLe1cVNbqZxQ+x0XMiO32kGpA4XrpnYMOPUAUibkr1JQP/RJIO+
         YFFEZXImge254fHbKfQhgvj6FjCgNkikr6fZLY3iICbmt4qE8OTp0DvlaLmHK4vpfdj1
         QEK0wfuBD8s3DkBd0WQLPJGy8H56QKW15DtyGNMEKRnKWkqPn/5H4L/hz5DCOoi9qiZo
         qJOog7Bg10L9V/I0LPK16yIVtdEtBZbqlyRNRC8L7QIZrzy0cZLrgjhpWVBb5gp36IaP
         Pfc/bwQIRaIt3+FHYHs3ditH/US3QW8yaPi6CEk6RRfPSRQM/NT+dW/RQ+QG8B5Qv2md
         HMfg==
X-Forwarded-Encrypted: i=1; AJvYcCVL4E75SGrkRxalwENAGOPX0k/ooMoKyauesFLclzmvznki4EzhY3tbWisCpjqcgR2OhdzrNz5y74COTcI2Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3QBh9gyicWdDw2o34J2fUzGsPuuTwZSjpl2iq7Cmrvu34d0Qk
	BrvisNriEu4pYPi9kp0W5GXe4wJvkpwDvqmW2/7K9h+wYU0Z7qyPAuCKWz/BpcoGBWQ=
X-Gm-Gg: AeBDieuB6DeD8gRjoLTd3R7HssoLFUnNUXyF1ydSthmw5j/22QXf6o9qxcSfIYGnS5T
	/jMvhuw/xytB3wXc74Dp6QS5X2w5ZinCvoJEhz/Lj9TUlB2t2j4EKpctedIjxx4SSH+FwyWAcXc
	AH0XYWIz/xoCnwjGBAsBjOQqqbfJuMlA4vOwN7Q6+2Fk1TNcIxsRp+7OtypK55Wz4YWEhyrVkSm
	UNsfvy9tCC9UuFmA/QbEokn4zOKXBPDlo9ttWIFiJANEpNnrHszejQrcdE6SPG/nct3yQCU9EdD
	bniNSiHBPj0APit3vozETv436rK54rDPmawxvh7NoJRyha6EfE1HICKJtQnOYgBU7E/Otxg718C
	Z3yRAMvKOa+AOHlOZmBnCJSOR2xNEWtHtKw3Vo1gPDf8DgHIxnqmFdyvtvCtCB6XqcqnMjquZ9X
	xfbOT3AD2kFjaj35Cr9Q3i42mDC9NQ
X-Received: by 2002:a05:622a:1984:b0:50b:4ba4:9add with SMTP id d75a77b69052e-50d62a9ca10mr334496991cf.34.1775679763542;
        Wed, 08 Apr 2026 13:22:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm192301041cf.0.2026.04.08.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:22:42 -0700 (PDT)
Message-ID: <cd1de04076917d65ccd7dd91d9392af7977a4906.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs
 (series 2/4)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Jassi Brar	
 <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Date: Wed, 08 Apr 2026 16:22:41 -0400
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-RDSjhy/5yQt09mvK/09B"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_132245_571625_7BAB3A12 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--=-RDSjhy/5yQt09mvK/09B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 25 mars 2026 =C3=A0 11:57 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
> CMDQ APIs introduced for MT8196.
>=20
> Series application order:
> =C2=A0 1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this serie=
s)
> =C2=A0 2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
> =C2=A0 3. [Series V2 4/4] Remove deprecated CMDQ APIs
>=20
> Please apply this series after the MT8196 GCE support series,
> and before the following series.
>=20
> ---
>=20
> Change in v2:
> 1. Rebase on linux-next
> 2. Fix build error of -EINVAL in patch2.
>=20
> ---
>=20
> Jason-JH Lin (5):
> =C2=A0 soc: mediatek: Use pkt_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
> =C2=A0=C2=A0=C2=A0 shift_pa
> =C2=A0 drm/mediatek:Use reg_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API chang=
e
> =C2=A0 media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
> =C2=A0=C2=A0=C2=A0 cmdq_pkt_jump_rel_temp()

Can the two last be applied to the media tree alone without breaking anythi=
ng ?
Otherwise I will need to wait for the soc: patches to have landed.

Nicolas

>=20
> =C2=A0drivers/gpu/drm/mediatek/mtk_ddp_comp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 +++++-----
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-cmdq.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-comp.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0drivers/soc/mediatek/mtk-mmsys.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++---
> =C2=A0drivers/soc/mediatek/mtk-mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++--
> =C2=A0include/linux/soc/mediatek/mtk-cmdq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++++++
> =C2=A06 files changed, 44 insertions(+), 17 deletions(-)

--=-RDSjhy/5yQt09mvK/09B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada5EQAKCRDZQZRRKWBy
9BvDAQDiGnxs8IuI1dVJpXUEYd4nLqhHu0mrYWUd+Xo+VGU9BQD+M4bHsQCcq4KC
eU/cm+cZeMh1990/2+dj1+RYXPBBewk=
=HqBw
-----END PGP SIGNATURE-----

--=-RDSjhy/5yQt09mvK/09B--

