Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4006BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeomY7CzFwHnBo4sBjMX828mH3+BT/kec/JjdZTbGII=; b=BdTOngFhDV3meeJHvU3V7HT4SV
	zfF8NOEUHc7YSkSblyhO3ozqDdBrm7ZG0FjAAl8NF+xzTkJl8us1pI9B8n61b61AjE5OhIYlz2KkG
	xLkI8YRrqp/+y8sLqL8CAYuTzkVyRNpYR786PTB55uZOA4jCBQtsRL/nPBCLC2FL77lnVQUIIauJL
	J38oBCXGeRyywinXwqa55BkEntZshWKc0njpL+lhZ3IgGd7Ers3VsZJcqgxf5FTSrOJqBIgZNBrMx
	KJh0gT8/bB9avIHZ32eitDxgL31OmQ240trcb37tsTKaubdWbfTW33HhMZywIZQ4nBc+fQvYlmIly
	JVKnpM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7bDH-002Cda-Ok; Wed, 12 Jan 2022 10:50:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7bDF-002CdE-4L
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 10:50:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E1E2B81E96;
 Wed, 12 Jan 2022 10:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E58C36AEA;
 Wed, 12 Jan 2022 10:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641984638;
 bh=WnA4+SPYcWYIlSIPOu/o74UT852UY+tLgfglnQtVtvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vn7cOp6vf1n06lI5WagEG4Hozxrr7+TzdBX6Bz+MdnIAihsrNuT7+9itDE8sizVle
 QZTz4efIYWafhzCH99u+Oq9/ZTDxfgJSZG+8sCXqKu3FAPDDwkFGGi2VqMjbNlwKy3
 ORxLMPFnOuJ6m2n/4eSrTBK5v+AX5BkelYJXJD8O9LslYt2ABZKLNXZIhSAwRS4BeF
 NEXXSKGMJF7/uj5N5edDBM2Ey9dZa7aO34HdNM8+qiy1AAlk24Ncae0VHrnvEAo+us
 J1KB+Jhe69PzoUuzn9hOG0zs5PSdQmvqMASjrPU1HrPict6EVB8DGwI9Pa+ivu8hfn
 tzPBGKXZDl5xQ==
Date: Wed, 12 Jan 2022 11:50:33 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/5] mt76: mt7915: add Kconfig entry for MT7986
Message-ID: <Yd6yeSfSfr8vmXH8@lore-desk>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <04237351a4cb3b773f68a1cc55d1b8c419ca06a5.1641901681.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <04237351a4cb3b773f68a1cc55d1b8c419ca06a5.1641901681.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_025041_356841_F25C26B3 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Type: multipart/mixed; boundary="===============0886628593967008826=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0886628593967008826==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cUIPHAJZx8Su6kMc"
Content-Disposition: inline


--cUIPHAJZx8Su6kMc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Ryder Lee <ryder.lee@mediatek.com>
>=20
> This enables building support for the MT7986 SoC built-in WLAN chip.
>=20
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig b/drivers/=
net/wireless/mediatek/mt76/mt7915/Kconfig
> index b8b98cb..8db1ddc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> @@ -11,3 +11,14 @@ config MT7915E
>  	  OFDMA, spatial reuse and dual carrier modulation.
> =20
>  	  To compile this driver as a module, choose M here.
> +
> +config MT7986_WMAC
> +	bool "MT7986 (SoC) WMAC support"
> +	depends on MT7915E
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select REGMAP
> +	default y
> +	help
> +	  This adds support for the built-in WMAC on MT7986 SoC devices
> +	  which has the same feature set as a MT7915, but enables 6E
> +	  support.
> --=20
> 2.18.0
>=20

I guess this patch should be squashed with 3/5.

Regards,
Lorenzo

--cUIPHAJZx8Su6kMc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd6yeQAKCRA6cBh0uS2t
rP7tAP9ckSML6Xqbnj0VwMwql7yklkD+AdtlOeUSKmOCm4Ag4wD+OQUkz9+QBq1S
ocrjA+jE6ORPjDw5a5T8FH9+M3+peAs=
=whHq
-----END PGP SIGNATURE-----

--cUIPHAJZx8Su6kMc--


--===============0886628593967008826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0886628593967008826==--

