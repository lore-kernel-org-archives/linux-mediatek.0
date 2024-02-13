Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C2C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEomQul/5eCObV/qD4WM2mcnanKsiiwtICoSctvTsiI=; b=oiLct+33z6WGumnSNsPu4FA349
	IYzFX7pta4vTqlelR9I1ZHfgsz8fXNiN4L2/72y7u30qvIw3GJy2AT5kbdBk/uo/g9CjSikT96taa
	wIqnD5wSERJe6LHkws7H6rBpHQipORJY8SPNqearnH5gbXGkMmv3CnuNXQArUdWpfZNZaZpRfJk4v
	2ukfgZd5D7Fkpe07hT6ClZdYB/wsSiB2GJGOhMJZPLi43fbqHikvwYsyLxPADxf2xX7B28kFEd4we
	bBuQQOLZb6XLALCJZvSyka4CcKzBuj7lOTjnLPz7sf7OBnsFb5kdxPipaPI7RhFW0x89QUTXubw7b
	VpATy+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxV1-0000000AJfm-1TTE;
	Tue, 13 Feb 2024 18:27:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZxUx-0000000AJeo-47y3;
	Tue, 13 Feb 2024 18:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51DD66163F;
	Tue, 13 Feb 2024 18:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0996C433F1;
	Tue, 13 Feb 2024 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707848834;
	bh=EEomQul/5eCObV/qD4WM2mcnanKsiiwtICoSctvTsiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9har22VlNjrYsAPs23QWx5F8JakOzwdFC/1lruS/tKrJ6yCdOKacC/pvKcHDz4Xz
	 6a547DH5vES8zAB0+Ko3c4DV1ft+UNzaCM4D6spIfaDUQ1h/aPuGS8GYeyPgk6tg32
	 rlR7/TpUrkBx0FKXGTeMjckIYwUa9s7YsPM6COPcWvtlCKj/ubPqjXtDePdZsirvde
	 mY/lo93ZMjgCRU+pvuqePeywS2cVeHqY+3ji+wb/9rlI0a/fpehdZilUY0UnO3aIfp
	 lzFcAhNF5MWxuBrSqHW2vyp6dJAmALqiOt1eVe140g3DjeiKBJV5ijVytal/2mA1AJ
	 yeT1Lu9qurpqw==
Date: Tue, 13 Feb 2024 18:27:09 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add compatible for MT7988
Message-ID: <20240213-shortlist-unhook-7e7cc4e66c0a@spud>
References: <20240213130044.1976-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pHlTLsj5De7/cwug"
Content-Disposition: inline
In-Reply-To: <20240213130044.1976-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_102716_094034_04659B9E 
X-CRM114-Status: UNSURE (   8.79  )
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


--pHlTLsj5De7/cwug
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 02:00:43PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7988 SoC contains two on-SoC XHCI controllers. Add proper binding.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--pHlTLsj5De7/cwug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcu0fQAKCRB4tDGHoIJi
0rlwAP4zf4fOz8BYPdkqy1M5Qin5dK9+hRmGcVhgbwy2Ggv7jQD/V8NfIOo4BDHi
iI7P2IJcaXKvELYNAQLya8Fj3+maVAQ=
=fc+4
-----END PGP SIGNATURE-----

--pHlTLsj5De7/cwug--

