Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C61C83000
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI3TC+ytQK7wb5FzGmyYvvaetqrg8PjBZ5grgtsldCU=; b=agEOpwGPY3NGn9n1mS54/Mt+66
	CanXSXQxYVNxckzc+kiZhh2XRthKE8cd0SVAA72sFjDKgIE+5Y8R3Ea8NT3LoKZ8xsXHRiQNwSYMf
	Le+neLJnrnm85BGfVOfzW8MmOiEkXLQ/Va0u2rSzuaR3OthBAOLZnwqpI8i/2AGS/LTXc6dqASYmg
	6kNetq0OE4ComyIt7MNupxChNuyYsPkFmBZ0ASFahAaHOLjDQlBqWEi2MuCHFJqf3qS0YCU8HZfJq
	k6vpivaeRqMtnKAIqMyiXgkLTUkVbOckTgQcRcwKNP6OpBo64MkN8p75BJpURGf84wGey0FFhopRf
	ityJe/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUru-00000009ZWc-1Ie4;
	Wed, 25 Jun 2025 18:29:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURDH-00000008z0J-3QZO;
	Wed, 25 Jun 2025 14:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74817A52063;
	Wed, 25 Jun 2025 14:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918EBC4CEEA;
	Wed, 25 Jun 2025 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862098;
	bh=z3DlrwGS2dulcUFskpXwOZRGYXJoYMk2ic/qJ7NGQ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFIqdS12pTHVGBcdnEP8Mhwbq8Vn1QSVptDV8QSj9OzKInmqJJlubSE0Rcic8OqV4
	 FeQEaSu4ab1LNWXUe9qIiFlo04j9zzeCeUbRb/cK32ZPel6jnJ+gRL6lwXoBcVqJsI
	 bxxyLcZ91QyiWLVmMUrT4a+7Y0fZW1oP7bgStgZ6pIJqYujkCU+n3LiLV9bIKPKl7G
	 JhOO1Z//ElDB/3t9iR8B3cgnf6F69y2hIl9fVMflxTpeEx3bNLm4dGpDZlLxUYsaDg
	 AhQT94SqA19zhZZTVryynJbE+77vBQyjheGKvGaIFhivXut/xhCvtIQYk7MxxcznAV
	 0qZ4uj9UwOGOQ==
Date: Wed, 25 Jun 2025 16:34:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, john@phrozen.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 0/3] pwm-mediatek: Add support for MT6991/MT8196 SoCs
Message-ID: <z3jombms3o6466wsxx66xkuppyjdzeiwphke343llinhsl3vmj@t35gj3dc2fxm>
References: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5zmvddaeyo4hoae"
Content-Disposition: inline
In-Reply-To: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_073459_919360_3B7DE100 
X-CRM114-Status: GOOD (  10.83  )
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


--p5zmvddaeyo4hoae
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 0/3] pwm-mediatek: Add support for MT6991/MT8196 SoCs
MIME-Version: 1.0

Hello,

On Mon, Jun 23, 2025 at 02:01:15PM +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for the PWM IP, version 3.002, found in the
> MT6991 Dimensity 9400 Smartphone SoC and in the MT8196 Chromebook SoC.

applied all three patches to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next

as material for the next merge window.

Best regards
Uwe

--p5zmvddaeyo4hoae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhcCQ0ACgkQj4D7WH0S
/k797ggAh4/X9IUMj216zP9Qt66t/ivkC1Z+SDL2dpjzRMEwFuAhDo1EsHRRymfS
L98tEHQ00vOfPPg2qxs8I2zFRKgNieSef2xgEGSt/eGH1KxPxg05pgTUjEV5l88V
spN1/cKXf7ndw+iHibA4tYXOeciigNN8WrcAont+mk9mvEw0o1Rg7ma4OW26qrCm
g0CVqVsNvAxoqQ7AJrsXk67N/y5LLdcpwOvfKK/2aEehL2A5Jaz2Txa/RBX2Fv58
akRrqrLZ3mKDXL3GD/ZOY+Rpr3J4/qwMCn14ZbL4t5/Lu1f2shk+aeOS9KJK/QJc
rkTCrfOsoNcuAvkNliKqtl/H+g7UJg==
=Agi6
-----END PGP SIGNATURE-----

--p5zmvddaeyo4hoae--

