Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1013C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaICdUhTrdW8msGc/teUrPPVU5nEdQr+/RnX/1kxoqg=; b=MUkR3CjVaJS3KFyoZNhwaUtDwO
	5jxx/laUAA90GzjK5nANyicYKswSNqCBCPF8LoKrm6AgRRtEoBHuj4IvEC/3AYkSFDlQecs1TWrsH
	VQV+uCiMxKWYfTPH+YDoJ61/i5gaNOuYGm8yx+lakCddncuI3RsXS6Bb7VQGig+u3kfPOXweu5Zbn
	ilvkC7hquc+8YkjTDPqXD3an24MeYNLwerP+vCnk8jf+/qeZWXkEfaWWj8UvAVoWJxyIcVXRelTPO
	e3659l7TyaUNfv8tTA+ErJSx3kH3BvHvfHQsHhve352MdX3gZc1mje4dxExOWjAcWFg8GevnaYG0I
	MS07mbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUk-005v0X-2F;
	Thu, 13 Apr 2023 10:48:02 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUe-005usX-3D;
	Thu, 13 Apr 2023 10:47:58 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 1C4611C0AB2; Thu, 13 Apr 2023 12:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1681382871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GaICdUhTrdW8msGc/teUrPPVU5nEdQr+/RnX/1kxoqg=;
	b=OrM1r28tp3q+WpY2mygdm6kfgJmi3iLfNFh08tehdsqY2l+I7F2/frwWb7bBLfjeycSe15
	eR+H9PD0sBp9c/KqOkCRXbuWdydiItsyCK1yMi+cEAc9f/8dmptUVDl8nh8Le3INaPqpUn
	v/KDmhVkTXh/15LG6F1mENWJTv3MH4s=
Date: Thu, 13 Apr 2023 12:47:50 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: leds: leds-mt6323: Document mt6332
 compatible
Message-ID: <ZDfd1jutBeuJhk/R@duo.ucw.cz>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JsiLXC6MGPwjPQAP"
Content-Disposition: inline
In-Reply-To: <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_034757_623757_386C6308 
X-CRM114-Status: UNSURE (   7.10  )
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


--JsiLXC6MGPwjPQAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2023-04-12 17:33:05, AngeloGioacchino Del Regno wrote:
> Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

1,2: I'd not mind them merged into single patch.

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--JsiLXC6MGPwjPQAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDfd1gAKCRAw5/Bqldv6
8t9nAJ9acR9003RcdeYoSBiGIuiGoFEn/wCeN2Ei2RynFMkjHD+HdevILECr/ps=
=hAqz
-----END PGP SIGNATURE-----

--JsiLXC6MGPwjPQAP--

