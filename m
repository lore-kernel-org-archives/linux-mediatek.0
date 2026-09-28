Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80920CA5FA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=; b=2K4XEIlRb5fhlR8XSrGVWdSCCo
	Ywx5gKKBhnEOTgm/CsF8eovFfdanZ26Y1jgk47XFFkIo+HYt358jDb4Hegueyglw/SISdpk7gnJrs
	Ev58dkiiQmm2ruZT2/Qd1MfrdzaUV1ESnuyhCeoAGSMz3iebnNrIioZYiPlIjeWtWbgM1UdzYZQt8
	A+4WMX2pOYeATaidBdKUopV4qqYQWw+CioVDFW1s8pTx5p4MFi7GGXjRO3i8tn+EXNVXea3dAsnwp
	Hr4wLTcfgIAQj7oV/Kc97OMPDseiuU84XGha2/zwlhmC+ROB4Y/YBDlLZ5xxNoftoh0fvAL7REbpn
	PArZqy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIql-00000001fWB-0eDL;
	Mon, 28 Sep 2026 21:25:27 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIqh-00000001fUY-0oLI
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 21:25:25 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-9142e0b0668so38050906d6.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790630722; x=1791235522; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=ycxVg3ybS0fVfOrpvUVASUwlyOgzIL+0nGKiZNFlc7ls1oAleQBr6QLCfNWh4eiVtZ
         tPKv+iKJDBCWEE3dw7us28hf+DJr8vjXeKwbCu2O247gshUkS7qVCVRc3qSW5+I5QXLf
         Ei06gkAP4OUXwK+3qvUec4Xzb6O3UpPiVFW1oNWPaxeGaBKVUAFt228C/IFf1hFSJsyv
         UNhWDKdlwNx7aS6YJZ2QeZkeUrpMzOPjLPLZrrg68jBZbvEIDhD5HLn0xaZFaHzepfo9
         POGH+92a36Zk5/yUFWVgZ7nprv3FLLds3B+KPJK2AayvhnYPk3ounKWQE1IsFrgwVPvY
         Hfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630722; x=1791235522;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+905VpPWFNsqdN9ZNh4c2Xt4scACgjmcpfbxIJWGn8g=;
        b=y3iHsIAPXHDvJXatXJ3RV8dQ00WTQI5UC4aeNzfLOImlH4+63nxA5T2Fl3BxCq+vZ2
         0+CnhUKFLszt5xQE8fAyYlwl1mw4+wRfa/OJEmy1VWPYPkCFupDzfrWFpaGPGBg+W713
         95xum+iTVWtK4s5rP58yhsJ8MgGux7UwftL4Xeo/IyuzJ/VODOZhF5neQ5gXfwRB34c0
         OHkus+pD2jtkFVhpIARJDL80jC6PKqj6LGmRkhPvVjmyQYkHN1GJRdIr9U7UrbqXzR6Y
         w5Ofac9OTi86xVrAlUzonllRoUkiH5M5/BZ6XxnXzBHZ5xNctzBw1V9IdaJlB/DJrVM/
         loIg==
X-Forwarded-Encrypted: i=1; AKwUvBzYmYwDYFHpQC1LCByV33H2QVTCp8qwR6ghGaNT6g9U6KqqOq5H2voeSEgdZK51m4cTqHTQixZFDyDiLkyK7g==@lists.infradead.org
X-Gm-Message-State: AFq9FYJbd3dMiJH8HssmAK5BdbOWrxIjW8BF5/eXGNCTK+LxWn+P8wvS
	DJCzmg6D69GjvPcyFVspV4sHSiFfh2Db/jM4cvXiXV0U4beC+C3QDXf0+JHGMR2kPnI=
X-Gm-Gg: AYBFou272KhylgtTxS1qbPiA+NjMFvV39faPjk9KHaluWGwe0+bG73OHSDGKsDma8aW
	a1P729QVV3U3TwbMKExAjCfFoMLcHcX/U5IHScJkJdr+Nb27pUtD3Bz58oQY2m1TgLtcnXRJkoq
	yAcrUsV+KGP0O2Sz5xYtDDljZfqmFBWHREDSsemE/hH7OgZxgVF3Ub62mzMLGOtMYxOtuexQ0mY
	+iafc3pmDcl7nqYdCURSaB+ZXXe/hODIF+3aaxc6ByVfgFCW5CclvFRuq7Xnfkh64pe+nVcmXvs
	4FTaL/2rVOuwOLW85SHseSUfMxdYIj4WpjjPkXmWMfH0uxiZTD/yN1vKRd4tV9Ql4GPeEbtcsB6
	PBgocga0CSBn92CPVV3PseNS6OMOns3uoM5MG/Px61CBEYwk6Ja5dr8dvckQwOAxk+K9FxB/Po4
	JAiqkuFAldb5d07uW2MXowxRfcC39Nd58Xz0RuJdFj5hEFovYSho0VCOpP6JJNY/q5GSMxgUaK7
	1Ge8WuPpJYZnw==
X-Received: by 2002:a05:6214:8409:b0:915:ebf7:34ad with SMTP id 6a1803df08f44-915ebf735a9mr45816036d6.12.1790630721868;
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-915e759a989sm35062676d6.31.2026.09.28.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:25:21 -0700 (PDT)
Message-ID: <1b837fecc1992e94bbe77229a2529c9eb1ac0c60.camel@ndufresne.ca>
Subject: Re: [PATCH v10 0/3] Mediatek MT8189 JPEG support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Mon, 28 Sep 2026 17:25:19 -0400
In-Reply-To: <20260720062829.7343-1-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-SM45MfqXGrobY1wEGs0I"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_142524_356371_3CEC8750 
X-CRM114-Status: GOOD (  22.13  )
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


--=-SM45MfqXGrobY1wEGs0I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

picked, ty

Le lundi 20 juillet 2026 =C3=A0 14:28 +0800, Jianhua Lin a =C3=A9crit=C2=A0=
:
> This series is based on linux-next tag next-20260707.
>=20
> This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
> support 34bits"), which introduced the `support_34bit` field in struct
> mtk_jpeg_variant. That commit has already been merged via the media
> tree and is present in linux-next as of next-20260707.
>=20
> Changes compared with v9:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Explicitly set `mediatek,larb: false` in the `else` branch of
>     the `allOf` block for older SoCs to prevent incorrect configuration
>     and ensure backward compatibility.
>=20
> Changes compared with v8:
> - Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
>   - Expand the description of the `mediatek,larb` property to explicitly
>     explain its necessity for accurately describing the hardware topology
>     (SMI LARB connection for memory bandwidth arbitration), independent
>     of the IOMMU driver's implicit handling.
>=20
> Changes compared with v7:
> - Patches 1/3 (dt-bindings: decoder):
>   - In the allOf constraints, only keep maxItems: 1 in the then=20
>     branch and minItems: 2 in the else branch; remove duplicated
>     constraints already defined at the top level
>=20
> Changes compared with v6:
> - Patches 1/3 (dt-bindings: decoder):
>   update the existing `allOf` condition for mediatek,mt8189-jpgdec to
>   make the 'mediatek,larb' property strictly required for MT8189 SoC.
> - Patches 2/3 (dt-bindings: encoder):
>   Add an `allOf` condition to enforce that the `mediatek,larb` property
>   is strictly required when the compatible string contains
>   mediatek,mt8189-jpgenc.
>=20
> Changes compared with v5:
> - Patches 1/3 (dt-bindings: decoder):
>   - Drop top-level minItems/maxItems for clock-names per Krzysztof's
>     review.
>   - Refine allOf block to strictly enforce clock constraints.
>=20
> Changes compared with v4:
> - Refines the device tree bindings for JPEG decoder and encoder.
>   - Patches 1/3 (dt-bindings: decoder):
>     Moved the standalone compatible string mediatek,mt8189-jpgdec
>     into the first oneOf entry along with mt2701 and mt8173, as
>     suggested by Rob Herring. This correctly groups all independent
>     ICs and removes the redundant items wrapper.
>   - Patches 2/3 (dt-bindings: encoder):
>     Applied the same logic suggested by Rob Herring to the encoder
>     binding. Restructured the compatible property to clearly
>     distinguish between the standalone IC (mediatek,mt8189-jpgenc)
>     and the ICs that must fallback to mediatek,mtk-jpgenc.
>=20
> Changes compared with v3:
> - The v4 is resending the cover-letter, because the v3 cover-letter was
>   not sent successfully.
>=20
> Changes compared with v2:
> - Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
>   compatible) as it belongs to a different tree/series.
> - Patches 1/3 (dt-bindings: decoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum`.
>   - Added an `allOf` block with conditional checks to enforce the single
>     clock ("jpgdec") requirement for MT8189, while preserving the
>     two-clock requirement for older SoCs.
>   - Updated commit message to reflect the schema structure changes and
>     hardware differences.
> - Patches 2/3 (dt-bindings: encoder):
>   - Changed the MT8189 compatible to be a standalone `const` instead of
>     an `enum` inside the `items` list, as it does not fallback to
>     "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
>   - Updated commit message to explain the standalone compatible design.
> - Patches 3/3 (media: mediatek: jpeg):
>   - Refined commit message for better clarity regarding 34-bit IOVA and
>     single clock configuration.
>=20
> Changes compared with v1:
> - Patches 1/4:
>   - Updating commit message
> - Patches 2/4, 3/4:=20
>   - Updating commit message
>   - Adjusted property descriptions acorrding to hardware requirements
>   - Improved formatting for better readability and consistency
> - Patches 4/4:
>   - Updating commit message
>=20
> Jianhua Lin (3):
>   dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
>     string
>   dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
>     string
>   media: mediatek: jpeg: add compatible for MT8189 SoC
>=20
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 38 +++++++++++---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++
>  3 files changed, 118 insertions(+), 14 deletions(-)

--=-SM45MfqXGrobY1wEGs0I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrbPwAKCRDZQZRRKWBy
9PnDAQCv7TgjjF2tq0hzFvsEpdGPWatoaiOzm0hk0reRJRopnQD9HmGDrTgAlCm0
1lNiRF/hRw9t61kIcl0mv3QOQl05PQo=
=A3bH
-----END PGP SIGNATURE-----

--=-SM45MfqXGrobY1wEGs0I--

