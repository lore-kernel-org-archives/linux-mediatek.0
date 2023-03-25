Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C21C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnTqiki8T3iai+PWCcp6RqylatZWC2EbVMPN+OweMAc=; b=AsRbb5em4kk1JMJW4sLko/A67x
	TKyxXXPzb8Mfjl9fSbqVq+PEw/V3xTioI2yesLCD8sYQnbA9A4pRH2iowrMJIUslBn7UlNHqnj1KI
	5IVS+VP9vvgDYMWvVH57qSOqeuDe0gzqDz251gu9ImDx2NpznYZ+c1D5hQOp82tKhffifbYRSnweJ
	J4CKiA57Qlv9W/NKKFrkB7eHxOxjwIzzX/YJ9r0hEp6pDVopD1Ew7BgZjFnBG+rR5jDL35ixncBOG
	IW2iEsvY8HMUnIV4+wF8prpsjzY2/mTFq7G36Ysrtbz7MmPJ4zKYYs/F6m/sy84lN0yZq76C123c4
	9IQYDscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgBBB-007OlJ-26;
	Sat, 25 Mar 2023 21:12:01 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgBB5-007Oka-39;
	Sat, 25 Mar 2023 21:11:57 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 30DA61C0AB2; Sat, 25 Mar 2023 22:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1679778710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnTqiki8T3iai+PWCcp6RqylatZWC2EbVMPN+OweMAc=;
	b=H4pQaUj23/NDj4KCPyTfxa7KgjIVR2k7rPLzT2q+kVkdYjEjOkhkdFdJ7iYoFDgDRfthk6
	LqBcrN8gRsyvc6uj1Kmvuj9shfv9voK3VAKXfuJC0xQAHKdeF6g7prE0J5FlBRusZEnKRH
	RrVuBd/CeLdWgQLpIjRetioPo9yHezo=
Date: Sat, 25 Mar 2023 22:11:49 +0100
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 03/18] arm64: dts: mediatek: mt6795: xperia-m5: Enable
 Frequency Hopping
Message-ID: <ZB9jlTsEb0Clf1zu@duo.ucw.cz>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MWSEsw2ULXAy+rk4"
Content-Disposition: inline
In-Reply-To: <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_141156_184113_172FF1FF 
X-CRM114-Status: GOOD (  10.67  )
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


--MWSEsw2ULXAy+rk4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2023-03-24 18:54:41, AngeloGioacchino Del Regno wrote:
> Enable FHCTL with Spread Spectrum for MAINPLL, MPLL and MSDCPLL
> as found on the downstream kernel for this smartphone.
> Which one to enable, and at what SSC percentage, was found by
> dumping the debugging data from a running downstream kernel and
> checking the downstream code.

What advantages does this have? Lower EMI emissions?

Best regards,
							Pavel
							--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--MWSEsw2ULXAy+rk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZB9jlQAKCRAw5/Bqldv6
8rUCAJ9aZSUig704fVpSKPDFjNbbTy1qsQCdGQuoDXEUMy/Us5cQaR2yWRfm+/s=
=X9R2
-----END PGP SIGNATURE-----

--MWSEsw2ULXAy+rk4--

