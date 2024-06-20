Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF7AC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENq0t7yuq+8PH8wBYrueBrGUXOhLYaXTE7V+KPZiQ24=; b=UTpiL+8CP9UEb1se03s3TsJnvU
	vWWL3yPM9guoLXzdKfrC3wDQu7MQsxpqM+xJzJlhtOXaBls4fCWpgA/V8q+W1rLdUR/1EoOtcbXMs
	wiC58FkSF2CtXMKVRH3Fzjih82Bqd7HjM7R5wSfpGAtDmN2sYFUq6SVqw0m2JIvzFEEqMa45cGIbQ
	VDLDPEQy9nGbijJ5CS/3g7g9wNUif3VYHguqoY9Y8yaSHxgA0AvVDtOu4QuvfGKCl2uFQ1i01dnjB
	0F+6Z/bfbEqmtS1YS3Hd9W/JQso7MgI2Pp8+/UTPd87Ri5uc2f5CHzT+uylcHvvQYaEQDcz/d2dfj
	Uh9mzHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKKQ-00000005lEQ-1M2U;
	Thu, 20 Jun 2024 16:08:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKKM-00000005lCR-0o3s;
	Thu, 20 Jun 2024 16:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55B63621F3;
	Thu, 20 Jun 2024 16:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C28C32786;
	Thu, 20 Jun 2024 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899677;
	bh=ENq0t7yuq+8PH8wBYrueBrGUXOhLYaXTE7V+KPZiQ24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOM6BGt2OOXCTOqxJ7ShuoaMFdMiVWHmjpUpg1mXdxvlFUOtYed5cN6M3EjLPURge
	 vQSW78nBzJaTu135tqXoLoTQHOxBhyFEp7F4RNx0FIWroniF7oIS60DPtXKubR51hU
	 ijLNnFIjLJlpIapK49s4gMGN7+KaQxW/dabYuVeT+czmM8cOdq5myHvWfy8B/PiRIf
	 4GdTOpc1A1QOnNwR1VLBCAZMFTpPsbU4ar044GAxaKWOzmW3UzcXi56d12g84+F20/
	 OtA0/vn+ihqVQ43J0mogXSsGnJj6ZT5tguC6rNDGcjwel1TXg3RuNHIo3aM7vyVkUp
	 KjEM4xtBhznJg==
Date: Thu, 20 Jun 2024 17:07:52 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: mediatek: Makefile: Generate symbols for
 DTBO support
Message-ID: <20240620-luckiness-creature-612b1720f8f3@spud>
References: <20240620101830.1097548-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZcV0FUu31o22hhk2"
Content-Disposition: inline
In-Reply-To: <20240620101830.1097548-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_090758_319172_3C88546A 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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


--ZcV0FUu31o22hhk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:18:30PM +0200, AngeloGioacchino Del Regno wrote:
> Add DTC_FLAGS '-@' for mt7986a-bananapi-bpi-r3 and -mini to
> instruct the devicetree compiler to enable generation of symbols.
>=20
> This allows proper support for Device Tree Overlay(s) for those
> boards; future boards that need DTBO support are expected to add
> their own DTC_FLAGS_{dtb-name}.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Adding these symbols has on a few occasions lead to people asking if the
dt maintainers were okay with it, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ZcV0FUu31o22hhk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRT2AAKCRB4tDGHoIJi
0hUvAP9lshp0KANjh89e216Ok9kbY6stskVHqQWSUOM7b67zcgD9ErHLBYOeldcf
llLJ64iVEOOmmfgVgnzRP7FjP+N0+wk=
=Y/hg
-----END PGP SIGNATURE-----

--ZcV0FUu31o22hhk2--

