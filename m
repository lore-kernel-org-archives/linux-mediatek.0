Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087860A2618
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EpFaeXTP;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fe2/18J1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vIXaxwabzQ8+Hyu7ckpupUBYG45/UINkuK4etw8/0xM=; b=EpFaeXTPczYkp/TK/MIUEJwAW8
	MTM7A9aP2Iges6ErOzmB89GzTnsVDS/816a2de6Y3CBypYAgkuoM8rlxNmHYCyESxEosI8WUIWr+R
	+l2nIRBUT9xAl8aT8qKr4LP/yhh8VSX57oftbM+enZcT3+EEQ9dZlhoP7jzoJoZi+dlKU50q0bZkz
	dPLerWumNGkIv+fjpV3XNc4fZ8jdsMpUxmPSswQ9tPLkvPiJlzKabEUdQaOujBo9Y8FLJKqh58z1h
	ImmkMwCZDBE4eyUOIr9rpXNag3kb/xtgQ9ZKy+rFM6bIGrPAweON8jE0VbJ5TZTY3P4v7cebhoLVK
	9K0QswXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThhO-00000009KLH-0ffd;
	Wed, 18 Nov 2026 15:35:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThhI-00000009KHt-3zX5;
	Wed, 18 Nov 2026 15:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795016142;
	bh=Pa+l9p/ldmFV5IzkC7e19kzsj1Gaw7fnpk5iOSUaRGQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Fe2/18J1Y2lrX6s3KGi1hDkc4VGGUhXoV+T5mwr8GtCf1GSJ275r0E9kw3HxkjBO4
	 UpG0xmlRDEL4FvKm/ZHIDsTvhV76dLuifnu3O+R67M9PmOOkdxc3Fusplve3aD9jQG
	 LsOJ8nZaNGTwUkh2kG63o1krsjvpSuiq4t2uwHJJZSsEUb7HwbCcdPJt3NwTSyc6Ny
	 j4o4Jj9AS1yyATJftwF2T9Xr7+iI3Rx0AX4rVdr/+qj23OWvVqgh/ApZlvHqnu6ivc
	 8XZ8xOSfhB0dnwfU4NV+1eo0HZAb0J48OFnxFGJEuFJfe7/MqBI25X/SXnDiTWtx7x
	 Ww+LNjbsQRX+A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C106C17E0564;
	Wed, 18 Nov 2026 16:35:39 +0100 (CET)
Message-ID: <41750a65530034b0dfb144f4c8c10bae3bbe60eb.camel@collabora.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Rob Herring <robh@kernel.org>, Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Hans Verkuil
 <hverkuil@xs4all.nl>, Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>,  Irui Wang <irui.wang@mediatek.com>, George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, Yilong Zhou	 <yilong.zhou@mediatek.com>
Date: Wed, 18 Nov 2026 10:35:38 -0500
In-Reply-To: <20261118152011.GA1714890-robh@kernel.org>
References: <20261117085834.1464723-1-kyrie.wu@mediatek.com>
	 <20261117085834.1464723-2-kyrie.wu@mediatek.com>
	 <20261118152011.GA1714890-robh@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-39yOFI3IZD1p7uEEO9ym"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073545_202990_C02B29D0 
X-CRM114-Status: GOOD (  16.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-39yOFI3IZD1p7uEEO9ym
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 09:20 -0600, Rob Herring a =C3=A9crit=
=C2=A0:
> On Tue, Nov 17, 2026 at 04:58:24PM +0800, Kyrie Wu wrote:
> > Add compatible for video decoder on MT8189 platform. Compared with
> > former ICs, the MT8189 decoder use iommu to instead of smmu, and
> > use scp architecture, the frequency is only 406MHZ, and cannot reach
> > more than 700MHZ. It uses two clocks named soc-vdec and vdec. At the
> > same time, the decoder supports the vp9 decoding protocol for the first
> > time in single IC.
> >=20
> > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 24 +++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
>=20
> This patch should be based on this one:
>=20
> https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Ack.

>=20
> Rob

--=-39yOFI3IZD1p7uEEO9ym
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav3FygAKCRDZQZRRKWBy
9J+DAP4gKGQQnQ/zLHxmgqQbgAGqlrumu2hJskKy01zGA4GVPAD/fm6R5hueQywc
oui/a0M7xHVlfupp0bee2wjaGx+5QAE=
=t7+b
-----END PGP SIGNATURE-----

--=-39yOFI3IZD1p7uEEO9ym--

