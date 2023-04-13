Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED3C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRSK3E8Kl5/8z1piUAcGPRfayyNOWbZ+bT6QSdYKONg=; b=cmOveBAn9yL5lDFyO5Sl4BfEUa
	2brC9cnFW99Q0H5HSpYuMSrf9SElE0+PcyRVuUYjKOtRcTP6thERzkdt8gGMnyHohjGY/eqVq6niY
	FOLvM0qVgkNsg8gLWkfHqXgGazjl59Yqfxi4QrrdrRzsItd2FhhHjPGxL/P3h6YjekdpsmO5lAsVl
	Q71A9p6zRzOxTeZAdf+2/GikFSi/QsdsMYi7XTOoLpCotgM3jxlzZpbtNw5HBpne8f2VEgrsBeBub
	9xneYeY5ve4tdsR3k+7bhyS3/eIz/3mTYDM7YXEZ/hug8136sUotLnXf3pZM766PBEW39CiBWWyjT
	BAX0sFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmug9-005xa4-0o;
	Thu, 13 Apr 2023 10:59:49 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmug6-005xZR-1z;
	Thu, 13 Apr 2023 10:59:47 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 534171C0AB2; Thu, 13 Apr 2023 12:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1681383585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRSK3E8Kl5/8z1piUAcGPRfayyNOWbZ+bT6QSdYKONg=;
	b=LjeTjTTVcnrJJlQRfPyGyFD/CUImjye9iew8VUm3ePym5yz99qw+obRZLFlyh4mV4w8KxK
	Ajry4pl2Kay9ICKw1TpYRIwjuemkQ3d5A2C86OF5uwiHn12G5+CUlya9dBjfXqg47Zg+mb
	2UDu1yOBggVVuYp9i2+eXHKtIEzZnlQ=
Date: Thu, 13 Apr 2023 12:59:44 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 5/7] leds: leds-mt6323: Drop MT6323_ prefix from
 macros and defines
Message-ID: <ZDfgoDERkoQhb8cO@duo.ucw.cz>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSL+mJlc+nVyvJtD"
Content-Disposition: inline
In-Reply-To: <20230412153310.241046-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_035946_795104_36200D11 
X-CRM114-Status: UNSURE (   9.47  )
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


--nSL+mJlc+nVyvJtD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2023-04-12 17:33:08, AngeloGioacchino Del Regno wrote:
> This renames all definitions and macros to drop the MT6323_ prefix,
> since it is now possible to easily add support to more PMICs in
> this driver.
> While at it, also fix related formatting where possible.
>=20
> This commit brings no functional changes.
>=20
> Signed-off-by: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>

4,5: Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--nSL+mJlc+nVyvJtD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDfgoAAKCRAw5/Bqldv6
8ne3AJ0b6283xdNW8QUAldXKyT4W2792EACfbzA/yFwIaU6k8PWKzRoapKW1eBQ=
=3u/N
-----END PGP SIGNATURE-----

--nSL+mJlc+nVyvJtD--

