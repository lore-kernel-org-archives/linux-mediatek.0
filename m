Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E38C60A2610
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDFdqUPz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M3FQqFzf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YmIyJHLhfqfVnjjdZyBd1VHQ43Q91L66Z3wUwsYbj70=; b=XDFdqUPzlm1F/Zr1d9M7b9cIUS
	ARPOFsCHn2wDXZRBvJuHYAHyR9BZyWSW8ZtZ5yKeyMz4jEn2jBDvqzTTwvh766PHuNVGFZP85uIpA
	jSx0pV7wtZq7BGDjhsy5RCKPAzUqHtP4SsZv+pfe43kSlBiXNYVS64F82iiVh9Q93EPRXS5hDSkRb
	YI7XB1fB0lMAt7BAbXVTs1QOUgTeQH96KQBQaKqjrIf3iCf/l80SXgRh/hyVqKLIHixT8u+AnTxZA
	U1llxfcHLO3sVm0W1UICznvL67creHw3VQw2s6WYysyk8h3sFfPRw4hx0CdjuMc8gRGcQru19sUeh
	1PpiDfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThgq-00000009K9I-3dA3;
	Wed, 18 Nov 2026 15:35:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThge-00000009K5s-2rpy;
	Wed, 18 Nov 2026 15:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795016101;
	bh=51dwE9+j0e1mawOBNMOi0nQ9g2gIMsjDwbanm/5LQiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M3FQqFzft/Ir+kHAV0p/RwbOGW3u27zvr6sW1lPU+5YbjNxcyQY61Xv5g4w7jct62
	 nRRIqmM8exVWdDoK5r3z7QNiwZxHTD2W9ZH0YdWey5yIc1pg+tAgJrjq8HXWrXqiHf
	 oCb/tCqyuYglr5qCzF148U536E2cxDwn5doz9KpnwMAizCt5Z8gxpCV7ocYB5CaR4a
	 epwIZqWKk419fQBbY2P52F3hIuweR7Z391GGDaLDccZJG1Y9nbbhzgPDzlBuToHY14
	 bTKJJe/VqEBXXMz5yTM70lI4bKWakajb/NuRJwnLqTycU6Xf61Ag87lL3h3RT6B3gk
	 +aWFGoeCKOouw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5E6917E0564;
	Wed, 18 Nov 2026 16:34:57 +0100 (CET)
Message-ID: <f804ccb29fdda80673f7150b24390fdefce04505.camel@collabora.com>
Subject: Re: [PATCH v9 08/14] media: dt-bindings:
 mediatek,vcodec-subdev-decoder: Add MT8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Rob Herring <robh@kernel.org>, Kyrie Wu <kyrie.wu@mediatek.com>
Date: Wed, 18 Nov 2026 10:34:56 -0500
In-Reply-To: <20261118152219.GA1746506-robh@kernel.org>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
	 <20261117032950.1425556-9-kyrie.wu@mediatek.com>
	 <20261118152219.GA1746506-robh@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-EzpDPXQ5rHo8aaNXRlwQ"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073504_916373_FADD08BF 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: Fan Wu <fanwu01@zju.edu.cn>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Kees Cook <kees@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, Irui Wang <irui.wang@mediatek.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-EzpDPXQ5rHo8aaNXRlwQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 09:22 -0600, Rob Herring a =C3=A9crit=
=C2=A0:
> On Tue, Nov 17, 2026 at 11:29:44AM +0800, Kyrie Wu wrote:
> > Compared to previous ICs, the MT8196 supports a 10-bit decoder
> > and has a decoding capability of 4K@120fps. It also supports
> > 36-bit DRAM IOVA address and Video Power Control to optimize
> > bandwidth and voltage usage.
> >=20
> > MT8196 uses VCP to run the decoder firmware, so require mediatek,vcp
> > for MT8196 and move the mediatek,scp requirement into the condition
> > for the existing SoCs.
> >=20
> > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 52 ++++++++++++++++++-
> >  1 file changed, 51 insertions(+), 1 deletion(-)
>=20
> This patch should be based on this one:
>=20
> https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Ack.

>=20
> Rob

--=-EzpDPXQ5rHo8aaNXRlwQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav3FoAAKCRDZQZRRKWBy
9EukAQD0ZTCdWzl/LYHeFQ4jPv5f0c/GvDvpO4ddSGxPgZzJlQEAtSL/JNfxGUlF
ZCRrbteHcXbERxxd7ObdAXxvqyOB2Qc=
=ic/T
-----END PGP SIGNATURE-----

--=-EzpDPXQ5rHo8aaNXRlwQ--

