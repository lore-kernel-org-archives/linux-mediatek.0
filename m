Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE5BCEFD10
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhN1WAuMMr05B3KPSfvPQnFSaJ788oFx+QDIhlRIVYE=; b=yBUDZZVaOEWm8/r3INDr4Zeit1
	pezPmoIfUM8sBb/RHmWKL4S3CRNzwDlUM61RphwpV0/4yDYvnpRCVKr6Ch5Hug4vEq2tk9Rhk5cko
	jGsd+3GPtoBMfKcgE9hapJv/S7d/rV+2TMz5xp69mz7Ji0D6Na+8MULdW6mgybxOQQXJsF7hKLOO2
	hpb6MqAgUcY2NhO3D25qSDmROtdHeqDCRVIFKfGNKsRv5woQFFCcSi3z8ulVeXoxGO+A4tCIly1wK
	EY4OdhaazbSphoKQA8EYMpugwoHF4RcKg2EyNbyPVHmM7JFks/jp+f3XSG5HA9+UfaycMwJIN/HsE
	F64mL1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdELB-0000000DqqK-0MOX;
	Tue, 06 Jan 2026 21:11:45 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEL8-0000000Dqpg-2zNL
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 21:11:43 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so12161286d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jan 2026 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767733901; x=1768338701; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhN1WAuMMr05B3KPSfvPQnFSaJ788oFx+QDIhlRIVYE=;
        b=AYVuBmXv8swR9f7E6gxklqJm9uLW9xcY/wlai7CnG4WLG3KDnC2qPLhafqRI/zIK3r
         mULVDeEgmT1yjV9LdHKvaoPRcUmfSuSNG6/BF7l+S1FyVml4NpufjojrbmiSBi0c+opm
         QFrDXzhOTYWTaeTH1qNqSBSayGGKzuUV0fsfpGAIPIuADyZ+eiWVrbAeVZoOz6+dmocQ
         6Df2gxlV0mDWKFThs3cVA7q+pK/PNItI+E2yQ332MkzvQLpJS0GpLLMspvqpBuioKr/a
         nVjwoDKnIhhWhoM1vkD2hFQrldGWsdVeo7oEgsOO7kcAIOhfV+zXV4+3DwMZ6ue/vOby
         PywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767733901; x=1768338701;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhN1WAuMMr05B3KPSfvPQnFSaJ788oFx+QDIhlRIVYE=;
        b=mPxux6qZdbIZ5wBuo5WGdFGW923o7xo5rqvYpyl9u6CV5fcSgn0VHtUQDEeW+pvjo/
         ExgyJ+EBmmeM6PFJLkFjiYEAJwiOPMHVRD5BsctC/wyAthWG1rgrGL08AQkHe3csUCij
         s/y+YaCdj+mh8J300aQVlLG6mhThfvFzCIzyAH6nPKZ2QY7XQfoR/BqEGZ24GcBF+TFi
         yxTEF1A/q41eUg/pN2GKesmBpGNzy5QOm6Z6L4UTeTAwMa2jFYofdYOklgFhwjGEcMgq
         ahh3WIR+OK0tHrJCH9SBIspEtL36zkRuIWp1CdR8nhsM7tD/d7tWYyNu7kXIc3HcTq8p
         vKEA==
X-Forwarded-Encrypted: i=1; AJvYcCXI1aF88ut/m8vztKIq0wFAV3fzY7O9N0tbUu/CWsCvREKxrQ6niEmUbzxLZd3BYo6H2e1KRAFQuajiC09N5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx45ZJCQb1wRwqypuMvmm2J6P4Xilvg7o99TujrHDBtgoUJqn6W
	5rjIX1+fkjXhA24Bdd87QmDaxYcfh1CYC4c83eKlulUX5ynluJwc2CeuHkGC0yAJxds=
X-Gm-Gg: AY/fxX6rVW6ABEq6gqVgJh+PWyV5KyO73flmBwNaAQ/dbi3xUAzt4G7N9MTGvr5nOw5
	1NEVKgzNaIlyfNPyTXfbHjy/mihO7ZysmwOtwxtvFFmvJNI9ZkG55xZE/w7XFzerX0IXEPBAL/P
	hMrZY7QjKvozTCua4yL0C4TYH7Ss4P/GBrhdr9LHjX4U0DV2EgrwIEO3jOvKlOtw2lfoiGOLz+g
	SSh22HJwX0zhQe6rsUDAedaLxJ4lEPuEEMDF0U2BdPG/y/JPVNcRqbbcbWulj0UFBD8on1QVOUI
	zl0mA9BN6S0Mk3TM7BC/wFrrk8zpLm2crrow0QpkeBNpFkPoA2KPg/ZJOv/26IzwKnDzpRpr7wx
	vArf0fgXMb5G0/7SD8Aqaj7rjM3qTdWsMlMLjZuiNqqthnyE5gwBKEg55H0L5tkUi1Ykk4BRtTp
	egCXQvE5+xPD2VLH+0
X-Google-Smtp-Source: AGHT+IGkuyCRu/Q0Kl0G1KNS2qkhBKE92qfOqtUSoW0GG/DuxCV7QpwSsCvsAQoK2tmgoaaLEgC0Kw==
X-Received: by 2002:a05:6214:3c8f:b0:88a:2c78:d625 with SMTP id 6a1803df08f44-89084257197mr4038516d6.48.1767733901288;
        Tue, 06 Jan 2026 13:11:41 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234c96sm20302746d6.27.2026.01.06.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:11:40 -0800 (PST)
Message-ID: <e792da7b15eb4f58820f4c44dc695ddfe40d5007.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Tue, 06 Jan 2026 16:11:38 -0500
In-Reply-To: <20251224031721.9942-3-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
	 <20251224031721.9942-3-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-eEh22EQQUYjPOaWs78RQ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_131142_807586_2A824EEF 
X-CRM114-Status: GOOD (  29.53  )
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


--=-eEh22EQQUYjPOaWs78RQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 11:17 +0800, Jianhua Lin a =C3=A9c=
rit=C2=A0:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding documen=
t.
> Additionally, it corrects the inheritance for MT8188, aligning it
> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) and singlesingle clock requirement.

singlesingle -> single

> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.

Was already mentioned earlier, badly introduce DT code create an ABI, and f=
ixing
it is the ABI break, not the other way around. The MT8188 issue should be f=
ixed
on its own, with proper Fixes: tag.

>=20
> Key changes include:
> - Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
> =C2=A0 represent the correct architecture.
> - Updating MT8188 to inherit from MT8189, ensuring proper support for

It is odd to have older chips inherit from newer one, should be reversed
assuming you can fix MT8188. See more comment below.

> =C2=A0 34-bit iova address-space (16GB) and simplifying clock configurati=
on.
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.

Do style change in it own commit, I don't mixing reformating, with fixed an=
d new
feature in one patch will create much interest in your set from the DT
maintainers. So please break this into at least 3 patches.

> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.
>=20
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

This last paragraph does not seem relevant as a commit message. Consider re=
ading
this message in 5 years, would it be useful, and answer is not, since we ca=
n't
see the review and testing process.

>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> =C2=A0.../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++=
---
> =C2=A01 file changed, 44 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..814b53ef46e7 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -17,13 +17,19 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec

I guess you sorted these, this is the type of style change that makes revie=
wer
unhappy, do this cleanup on it own.

One thing the driver implementation tells me is that mediatek,mt8173-jpgdec=
 is
not different from mediatek,mt2701-jpgdec, so in theory, the DTS should hav=
e
aimed for the second item and an implementation of:

  compatible =3D "mediatek,mt8173-jpgdec", "mediatek,mt2701-jpgdec";

That just shows the screw-up started a while ago, I'm not saying to change =
that
now.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8189-jpgdec

That one make no sense, if you want to allow this compatible alone, put it =
the
very first item, its meant for that. Though, considering the chronology, it
would be logical to say that MT8189 is based on MT8188. If we go that way,
MT8188 should get added into the single item choice and the enum/const pair
shoudl be reversed.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt7623-jpgdec
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-jpgdec

This must be kept, its unfortunate, but its in the ABI.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8189-jpgdec

This would be reversed.

On the implementation side, in code, you'd introduce a variants that matche=
s
mediatek,mt8188-jpgdec, this will ensure the driver now works properly with=
 past
DTS.

Then in DTS, which is not my domain here at all, what is appropriate will d=
epend
on what happens if you assume MT8188 is same as MT2701. In my personal opin=
ion,
if that is unusable or worse crash or hang the systems, I'd drop the broken
"mediatek,mt2701-jpgdec" so it won't probe anymore on older drivers. If its
usable / used in some ways, e.g. if it work on 4GB systems, you'll have to =
leave
it this way, since you'd regress some users.

The rest is a bit over my head, I've a simple users of DT like you, but
hopefully these hints are good enough to un-lock the situation. Notice the
chronology logic needs to be applied down below too.

> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> @@ -32,13 +38,16 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> =C2=A0=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> -=C2=A0=C2=A0=C2=A0 minItems: 2
> =C2=A0
> =C2=A0=C2=A0 clock-names:
> -=C2=A0=C2=A0=C2=A0 items:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jpgdec-smi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jpgdec

So what happened once the driver on MT8188 tried to enable jpgdec-smi clock=
 ?
This is relevant to what can and cannot be changed, was it completely unusa=
ble ?

regards,
Nicolas

> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 mediatek,larb:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description: a phandle to the smi_larb node.
> =C2=A0
> =C2=A0=C2=A0 power-domains:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> @@ -51,6 +60,35 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/io=
mmu/mediatek,iommu.yaml for details.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ports are according to the HW.
> =C2=A0
> +allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec-smi
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec
> +
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8189-jpgdec
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec
> +
> =C2=A0required:
> =C2=A0=C2=A0 - compatible
> =C2=A0=C2=A0 - reg

--=-eEh22EQQUYjPOaWs78RQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV16iwAKCRDZQZRRKWBy
9IFvAP9gJU9igmAjidakuJKz0akdpOjt4yNcvs8FjB1MMY98fQEA1nsKZhTWxs1n
ad7uFPYE7mdheCU2tU4bBl/ournlIQs=
=cORP
-----END PGP SIGNATURE-----

--=-eEh22EQQUYjPOaWs78RQ--

