Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E874606A321
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o8fzsKv1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=baM8f1mr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CqRWFQU4HAOohXLgQtCLu/UPaRloWyOWXgxDIeawiJA=; b=o8fzsKv1daImhh1C7sojdbXl2S
	7itQCF/PYnsJDKF2bVu73WMaCC+Rhvjzw1hwbRc+4R7qSSfny8p6QgdiX1NRYdd8DbGUHix0ulE0V
	odMFNByvoQgtu6OYNBBBHMVYSyUSGfqtCGUfZX34LOXiQ4jeDNUI9w+APTHf32gh6k0Zcyk/wZTy5
	2393BoVHSAX98Cx9kiHypXO+P+R2jsj13tUghT9Z/SZNjOsyb/pd5aQFY6hWBiKNy+TkuMXfUN/p/
	A+HglpOJMqUvQTuPX9mvj3rRN/DNyc+M2vFdQIJHW8peLEgpqW1B/T0F+Tp0TSCW0X0aIIx9hhKzC
	U9eFhzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJaw-00000000rzc-0Z4t;
	Sat, 28 Nov 2026 14:40:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJau-00000000rz3-0H3s;
	Sat, 28 Nov 2026 14:40:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9488601BE;
	Sat, 28 Nov 2026 14:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5B41F00893;
	Sat, 28 Nov 2026 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795876801;
	bh=CqRWFQU4HAOohXLgQtCLu/UPaRloWyOWXgxDIeawiJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=baM8f1mres9uO12OFtOaFlb3HfysDztOwr+6e4+HBes09OTmAg0wFd64Z3M6l/C5R
	 aXLfcLuuSy/3VX0ad+w6/SR6tyw+mq3NhgaYu02a/002VbNkbf1ZSWf63VXLqXGtVY
	 plAt18yjJoNH8rFP7RaMLPf0fDU7Er1/ROhJ9aOVbaZ5tYAKwC46ct7zq847c4W/Jb
	 rz0vcU6riiew1UWOPlZWbUM8h9ETslnQDqm7BGLyOKSTfxH5OTA5cZF6Ls4YIlY/Gu
	 3iroaaKXmQmg3ekcFa2+s5d7Q8XeXwWfzn0AYhYdimTE5LoE7JGk5yiSdNHemBPZny
	 7G1ltZUF1h6OQ==
Date: Sat, 28 Nov 2026 14:39:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6]  arm64: dts: mediatek: Add MT8189 Skywalker based
 Tarkin Chromebook
Message-ID: <9ec63a02-b5bc-4053-a57e-73fd8d290531@sirena.org.uk>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8m+wOKX6nK14KkC"
Content-Disposition: inline
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Cookie: /earth: file system full.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--V8m+wOKX6nK14KkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 28, 2026 at 07:44:24PM +0530, Aryan Sinha wrote:
> This series adds initial support for Tarkin, an ASUS Chromebook (CM1405,
> CM1406) on Google's MT8189 (Kompanio 540) Skywalker platform.

This doesn't apply against current code, please check and resend.

--V8m+wOKX6nK14KkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsK57oACgkQJNaLcl1U
h9Dh8wgAhupAOzs6+deFwZFiqJq70oQELcg4aIForI/rMIZH8rAKG4Dga+Ea4E34
0VRBwb5ocmyZrm20NFpj+4WjKnejGQVNlDoCixTEI+3+Ay9ZnCxSKgA4d5BGv/EZ
c/1ybKEPiq+ejX1RaOGgTgjbvETFt3q5k9qQiSceNQvq3NtTo/1XB/3D3RU/etGP
SSrcIiqDJL0gpv7rDNB9/iIdwp+25Z1vSvS36HUs98UdERooKnZBuAhq7hH8J4yO
ZNsl/20kqqu6JkV2NYAcM2Wq90EwfmF0TPl0UZrV89zNBb804LVnyBjeiZnm210n
kk3dT9sF3dTgvd1SNrL315i7zRfP0g==
=qnep
-----END PGP SIGNATURE-----

--V8m+wOKX6nK14KkC--

