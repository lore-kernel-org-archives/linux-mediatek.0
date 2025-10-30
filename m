Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC70CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpvPz8Evg1uqXZ9QqUcwXD9sbXxzCo0XoLf7Z7zGoCg=; b=4CdtmrSbwvgk0JimBT8rjkHvqj
	5sigIew6YHykbdvSQl5U294Voqew5qrV4Mw0H1yDowSBpZ97jtIDRJg4pYxkNm4v+WGzMwkCnHv0y
	m6PcKfsuGvVB6wVDsiyOHhRuefvBtx6mJSnuhZYnbAtNlRDEMKKQyrWG8L+lDnQM+/+5a6FIt+76O
	hTmZ/OYYptSq1NLSJCTq5QuIX7wUyb+sfHTKuR9TDUqoQ8/JnpV/vS0T3jJ59ja8zOkHgrWnVmNvs
	diILrjPpOh1ZhqxFoq3VLPxmRpEa7xkOpGrjITiKtBuxqqPZsM3aAA+RZsiz55OWcWHU8MyZQfp/Z
	6iyoESBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYLb-00000004g5p-15r7;
	Thu, 30 Oct 2025 19:30:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYLZ-00000004g5Y-30MX;
	Thu, 30 Oct 2025 19:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7C16033C;
	Thu, 30 Oct 2025 19:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99D8C4CEF1;
	Thu, 30 Oct 2025 19:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852608;
	bh=gpvPz8Evg1uqXZ9QqUcwXD9sbXxzCo0XoLf7Z7zGoCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up8YvZK9QS2dUL4OocBLKevKS4IIseSnRAaQV3qK8jrwgpzO24eHxQdwkpF+yxAyL
	 PQO9nzoWvAvHZ6ho/VcFj2LgQrJ14z/f40WqLMF/Pw7hbEnqwMFrX7p5SsDSD1Al8C
	 hNltFy+QHKC24egmoXqgho9Ddq3+KypkJldzoAzOl6oJvWxYC4XY1dnEdcgiUnwqMc
	 /GM/1e2dDzx3FgrCv6F74//wOlYBEVOsFXOeaeEHT6SkaXRKDPiAgR2SoqtgqRqLie
	 Mkpj7G7tIxJw3hhANOcmtIn/TyJzd1hADvQV3EGklU6/nfgZkTI70rDCbMDw9vLtSV
	 Z4lJqn6HgdWzQ==
Date: Thu, 30 Oct 2025 19:30:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 01/11] dt-bindings: arm: Add compatible for MediaTek
 MT8189
Message-ID: <20251030-unaligned-effort-0758c4d0e42c@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-2-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4VLCKuvwTCyd6EE"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-2-jh.hsu@mediatek.com>
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


--G4VLCKuvwTCyd6EE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:33PM +0800, Jack Hsu wrote:
> This commit adds dt-binding documentation for the MediaTek MT8189
> reference board.
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--G4VLCKuvwTCyd6EE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO8uAAKCRB4tDGHoIJi
0mJiAP4j0BV9X7Mo0HwHRId91we5S3x0+Bj2sMUgTli8nbZSJwEArA5lXdfdiW2f
FLUaAC9puo5RzUlkLzKDy/em1sA+RQM=
=dGpl
-----END PGP SIGNATURE-----

--G4VLCKuvwTCyd6EE--

