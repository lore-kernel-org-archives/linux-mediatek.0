Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0835C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szMhUXDGYPtEbY5jp5O+2jtP4h5CPng55U28Wi5L0bo=; b=fC4Nu3zeq8W+aVNzo5aI8zuFNj
	vqEaDuZnY2DnfiSS8zLbF8OSZDYOATXrsq2UgKYhYRZ4bP+IpK/H3Q9VDiKjXr+afHWi5k4osjE0l
	aN8NkUq0qB/eriaPvEU2iJdkmXLzGf2xFOS/srRu1cLy7VbyuSsJyA/hwW1Nac+6kOrZPgazHephg
	Gq4a4ABuuHDozRpHPm99RFk16fnEEFxYFkvDauhdpxEfvYmsulT3Ijch4jvMxi+jzVRMWl94j9poC
	S0p451QjJpg/xXffb/VDglQBURsJOlqE35zrowAp/kR7wZa1fe2wXs68eRd9DCNe8wuTtPexPpYcx
	o+uFkPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNUg-003Wwr-27;
	Fri, 28 Jul 2023 13:26:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNUd-003Ww0-2p;
	Fri, 28 Jul 2023 13:26:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 688D962154;
	Fri, 28 Jul 2023 13:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05421C433C7;
	Fri, 28 Jul 2023 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690550814;
	bh=lpIxrmKmbOC7WRk7UtNOjkyEwzHrgZsH0CggdVA8FGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5EVvaCzpJQ4I3pL/dqanw4An88CDoDbuoxNALg0XrSbi+gG8ZdD18x/u13pPRFvs
	 szdS5EFpi7oxt3xFKvDYOxTm8D5z8Gp3V86McLswxN0c+UChvniaenoibuvyAxQ/vG
	 u2p+TbOnwF9T87wQ3w6DqrgPk/5v0wqKbZ3Xq/oly9L/XSG4gkl6X1icdEcLra3Tyh
	 spwuMgqoY3ckyUtxgqTSacvHP+XihYaz6/x74xu/H/8dIh3wp83EwmhzY/gwKZBtr1
	 azeL+cbsqfGQCJGjSyw6Gd3UnyCXPinEl+Vl81NwPm0vQOxKqzmtUkMUmFsSC97Kz6
	 /hgp/mm0jbUiQ==
Date: Fri, 28 Jul 2023 14:26:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maso Huang <maso.huang@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio
 afe document
Message-ID: <557424df-a8bf-4b52-af4e-7f6dbe660cea@sirena.org.uk>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-7-maso.huang@mediatek.com>
 <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XT3kLeQv44OA4A+I"
Content-Disposition: inline
In-Reply-To: <a4f071a0-9e41-4de1-6721-f8d47475f41e@linaro.org>
X-Cookie: Ontogeny recapitulates phylogeny.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_062655_992979_82F16238 
X-CRM114-Status: GOOD (  14.18  )
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


--XT3kLeQv44OA4A+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2023 at 02:51:26PM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2023 11:08, Maso Huang wrote:

> > +  - assigned-clocks
> > +  - assigned-clock-parents

> You should constrain your clocks per variants. I doubt that they are
> really so flexible/optional on each SoC... or maybe missing clocks are
> result of unimplemented parts in the driver? But then this should not
> really affect bindings. Bindings still should require such clocks. Your
> DTS can always provide a <0>, if needed.

Depending on what the clocks are some of them might genuinely be
optional, it's fairly common for audio devices to have multiple clock
inputs and be able to select between them depending on system
requirements or to have bidirectional clock pins which may be either a
provider or consumer depending on system configuration.  No idea how
that applies with this specific device.

--XT3kLeQv44OA4A+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTDwhYACgkQJNaLcl1U
h9AF5gf+NIN7ZO19dqJ/AAyoSKsZgUmZxvpWcqc20xa2BWORhhpXVszso2nROeQY
jsefIMUnAc0ZTUc+dTecZiFZBTZKRAjeIa2yoESwzssTXpGzFjJl8Nik7G+RCTcM
Cz283cPsg9KbhhSqcBwKrmcFfnNpGpjgk9r6/gCtt01raGtRdzRlWJAWJH3eqe9T
OuE/jOaguHuHjkw49hcGqUdlSj5BqdPjO/6wMm9cuS1jQ0VPwAraH97T2JXH9sGK
ufNZ9h8Bh2XQGOFgK+ADXUP2DdGNuIP/uxz1kBRSL+1+VI8DjFD09wRJB1/92bye
JQFqsIVQhdj19h5m2Y/IKt/qut1ppQ==
=zUSr
-----END PGP SIGNATURE-----

--XT3kLeQv44OA4A+I--

