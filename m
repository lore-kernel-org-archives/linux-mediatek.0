Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7341F41998
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2026 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBfzyu2TGg94jDcHyA7UEDezz7c2+m1UW527MciqLkg=; b=cVREsfiCfmn/ZaK6rA0IL7Yiee
	Q1qIT0y+N7ocnAEWU79+PNxmpOfVMK0kpD6GB0rbn63jxF3yJ6BVZyDyNSEFuS+9nerNVbfCExlZa
	ObXI+9lPD2iXOuLjpCEbUC29aWG79t2joX9kx52iZtbEZt4Th9yx8yVPL1G99AGxWLbM3A2eB/KDx
	1wC3+ugueZBEfhok+25zJRrQ4W4QBDYCFi9CAVUUQHpvFw5C2GEgalArufDXtE9BmV4hCtRwI1Vcz
	KEIBif1DFVB5lMtR1cPSQMXALZ3aZrs/WtRK59l/H8dRswk7hoCKRRVQneEWFMhgqtj/RUpyHZlUN
	p+mYltxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCz7P-000000016fK-2VQ7;
	Wed, 15 Apr 2026 12:13:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCz75-000000016dz-0sbW;
	Wed, 15 Apr 2026 12:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FF8C600AD;
	Wed, 15 Apr 2026 12:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECA2C19424;
	Wed, 15 Apr 2026 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776255178;
	bh=aBfzyu2TGg94jDcHyA7UEDezz7c2+m1UW527MciqLkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifJIeiZnhCaVmaSWobmLdMqbdMACSYdM6EqNqCvgYs9brjTkG2Vznr3RSYD38so1u
	 IxcFt+gx61/NYZWbi+dYOhSTFgT0y5GuAvVzI4d1PNyBIiNoiQc1vcAQnHIZeU7Ff+
	 ByKcsgPr1L22Gh60pJzkec+ZJllaUuwVYXbxQQDsPy8wkyUBo8O2HcdzhWiTfDaiXA
	 f7MuZ5ApFMFBrLmJESYteB9vPPzB76nJPKTRswF2cZv9cIOXkyC94phwVje5qcglS/
	 Tjau0+8P4OEFG0t8OA+2ffoZBhFsTMqhShzOGyf2V72koe77G0b5WWvOQCT7EVWvgv
	 pn9SD7YG1hDfw==
Date: Wed, 15 Apr 2026 14:12:55 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand
 controller for EN7581 EVB
Message-ID: <ad-Ax97ny5gg-yjz@lore-desk>
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
 <abBPufvrG8I8UP69@lore-desk>
 <CA+_ehUyfP7bohsSZEbjp-KLxD084NcR+2SmhDNrpoKQE=BiHcQ@mail.gmail.com>
 <ab5bab39-88be-4f58-aee6-2bb0dc49a732@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8vPczH/oiUxX08+n"
Content-Disposition: inline
In-Reply-To: <ab5bab39-88be-4f58-aee6-2bb0dc49a732@genexis.eu>
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


--8vPczH/oiUxX08+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On 4/15/26 11:47, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 10 mar 2026 alle ore 18:07 Lorenzo Bianconi
> > <lorenzo@kernel.org> ha scritto:
> > > > Enable spi controller used for snand memory device for EN7581 evalu=
ation
> > > > board.
> > > >=20
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > Hi all,
> > >=20
> > > it seems this patch has been reviewed by AngeloGioacchino, but it has=
 never
> > > been applied to linux-mediatek tree (or at least I can't find it). It=
 is marked
> > > as 'New, archived' in patchwork [0]. Am I missing something?
> > >=20
> > > Regards,
> > > Lorenzo
> > >=20
> > > [0] https://patchwork.kernel.org/project/linux-mediatek/patch/2025022=
5-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/
> > >=20
> > Hi,
> >=20
> > friendly ping here. There are lots of patch with review tag and ACK
> > also for 7583.
> >=20
> > Any chance someone can ping maintainers that take care of picking these=
 patch?
> > Or someone that can reply on how to handle this? Maybe we need to sync =
with
> > them? Lorenzo (and also me) are fully maintaining the Airoha ARM target=
 also on
> > U-Boot. Also on OpenWrt this target is starting to get traction and is
> > getting used
> > there, so Airoha is not considered an abandoned target anymore.
>=20
> I think the following Airoha patch set has not been picked up either:
>=20
> [PATCH RESEND v3 0/2] ARM: dts: airoha: en7523: update dts
>=20
> MvH
>=20
> Benjamin Larsson
>=20

ack. Thx Ben for pointing this out.
It is not clear to me if these patches should go via linux-mediatek tree.
@AngeloGioacchino @Matthias: any input about it?

Regards,
Lorenzo

--8vPczH/oiUxX08+n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCad+AxwAKCRA6cBh0uS2t
rDQuAQCnScvp/PlYWDJUXaQxTJ0+x4isrD9cGiuLlUR6FLCOLgD9EGIOIf01gaxB
5BbOzMFMcHGr+2KmLZKbLvT2Ket6KwY=
=0i3n
-----END PGP SIGNATURE-----

--8vPczH/oiUxX08+n--

