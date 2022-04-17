Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F39C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Apr 2022 02:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QaxKWSLFrvrIcoeHRv8UCGIGA7BgMuRxQVf4mc8+TU=; b=3036jKSnpbmx6BikVpQZUpXzfZ
	EfJx14cSC3TYe30Dxyy8AM4sSb6XkW3w7kDGH5GDSR8VoRCwnFXbCUuF8qaD3mKVpbLuqwFXInmyu
	1suMWR00Kk8beYumYJcA/alv/MRDfI4nI4POokMRDToTDXMCWMjeISnkOajZqBtNzvSOCkG/uMPZD
	NtrtUy9wEMhIp9lfc7YehG2CUkt+Ax2iV4VE1+ACFUE+rQBYv+AcLRnFd/xZn/8VDnGqwLdregtda
	zvjRFZkpZnvL345Mh/1EOkCBzmNy3jxTQX4Iap6gqQOpNA9lw6PrJTWQDFXEn/lBykRUlkFf9Tjc4
	rNQ3h1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfuXT-00Dnax-N8; Sun, 17 Apr 2022 02:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfuXA-00DnYU-Af; Sun, 17 Apr 2022 02:21:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5956610FB;
 Sun, 17 Apr 2022 02:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48D4C385A1;
 Sun, 17 Apr 2022 02:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650162063;
 bh=3Or5js1bHSpH4RJIQirdiRYbWCrSzV8WTfLcT8C4kQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlKDgV7wPkiOfcrYcc9REIUB95IQjrh7Ajj2xJAt/OZz0BUH5BTPQnAKMRgmvfkr6
 MPW+cedTHRQ3dTqxvcEyiVvfwyj8f6ejWX6Z0/r49BQR78M5AJ1MAzVK2GCx5tuc2o
 lWaSaL3i3LPe3KFGP1aGXRXYmSoqodyqq97cdBsfs2nhhhQKWr1Vgez8egZz8he1Mq
 BTo70Xuv3FZ9zdCPvgZYBN9HiBuS9fZiVyEsXJgtCOERWF4jVGVhSchScpLaeL+g2A
 8IhcXjEUcIy5YSy0g3g0iZPDyW8pEFOeOo6V1HvGrJpqFyGTc0knaIfvRuMcs7dOjX
 Exdc9opIyiiiA==
Date: Sun, 17 Apr 2022 04:21:00 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 2/2] i2c: mediatek: remove mt6577 support
Message-ID: <Ylt5jNRmcuz3/rfc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <20220120185853.24266-3-arzamas-16@mail.ee>
MIME-Version: 1.0
In-Reply-To: <20220120185853.24266-3-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_192104_481920_1F370729 
X-CRM114-Status: GOOD (  16.01  )
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
Content-Type: multipart/mixed; boundary="===============5596840259825970765=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5596840259825970765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="07OTgMIzch1L49bR"
Content-Disposition: inline


--07OTgMIzch1L49bR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:53PM +0300, Boris Lysov wrote:
> The mt6577 compatibility was introduced back in 2014 in commit 8452c80d5b=
4b
> ("I2C: mediatek: Add driver for MediaTek I2C controller") by Xudong Chen.
>=20
> The i2c-mt65xx driver relies on DMA since it was first introduced. mt6577=
 does
> not support DMA [1] for I2C and doesn't have dedicated DMA engines for I2=
C.
> Moreover, the entire mt65xx Cortex-A9 SoC family (mt6515, mt6517, mt6575,
> and mt6577) which share the same I2C IP doesn't support I2C DMA at all wh=
ich
> makes this particular driver incompatible with these SoCs.
>=20
> The existing code used mt6577 as a "generic" configuration to be used with
> other SoCs such as mt6589 (for quirks), and mt2701/mt6797/mt7623 (in gene=
ral).
>=20
> This patch makes mt2701 (which is *actually* supported by this driver) a =
new
> placeholder for generic Mediatek I2C bus configuration.
>=20
> [1] see references in
> https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.=
html
>=20
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Applied to for-next, thanks!


--07OTgMIzch1L49bR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJbeYwACgkQFA3kzBSg
Kbaq9g//fmWkkWK0LIwVeoJtLBXlJYIswv6dgxNCOrHnIt+ddYEt0b7JiB4Tu6TM
q8zDoJEnCppxTlLTQmJWaKK8N9pe9+D2Zi5pjdIH+QsuRGYCsrPXs3rgMZZ9qygC
HMkWyYgZJOWwC8ON0rGGEJeFbcFKPmjUM4vltY7Ovf591744ZcT3YTkYbeu8L6cL
5BF1jxiO3HR+mF3ppDvOFUj7ssubHPaQt1u8ekExrpPJ/p5qcQA/qXrmX6odskeF
vsfrCWtt2Pm3ZhnnDmZZgtRYv0rqBgNLh3E27j2Whg7/dFZXipmIoO1esfqFv7D9
aCLVWZO4DK3DDTIfoTBeO2xFfrd1MWrtnKJQX5Y1djhAU2Q7arWj7Kv1FYtWWnhr
Zi0WoRTBfn6jgwt1DMHwGZa29p0VX8ms5ixvfInW2INiaITGhcwF2dnKxWm5fgGA
9MgNlvPk28IqhxpVh7VVoxlMR3tHDpVrlrMQVoU9NtgsSGTDrcgkfwCtB3DcWLF8
NLYTamUNf0rkiRsooqb5hW98sExSbxac+doVQ87RBXycWEtVR8p6uNVGIcu5CgUR
pMOQYw1+Z/tEEMh6jOmWaWmKeim4RigL3Sr9BOmlVwTEsEnv73TarKw1kmupRAUu
xN0lxxfHjZ/W5YZi8J2cKE6q3N7iG86Ui5Yp7YBZeXWLZAOZ0DI=
=gL9Q
-----END PGP SIGNATURE-----

--07OTgMIzch1L49bR--


--===============5596840259825970765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5596840259825970765==--

