Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB09C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:08:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB13613E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 19:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB13613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt8LDFhjR9MkmVBh/xAEMOOYeipZtx97CZvy8m1SnKc=; b=zFif51DAbqKDBJqVe58XZW0Ztc
	6t5vc40xHojjsPV0kySra1vKX5wzT74K1OijaWzuAWrrVIENtgoKSjDIbrKEGnH55s+ZKX1N40wAR
	ssisY8bBJfs5zN7yXc62GLnvpOEIgwQkKNWT3DFioT9THwXvLoHK2FUJKHADw8OpvGUwEeqwTCxV/
	FN/hENjwiir+8ofbrgFXxWhc1KfFcEgaNWFySshJlh4eCbl/BgD1a9cPJEERcPo2scJSX4Pvu1fmC
	MhaE12gGvBIqxHed0WCu4Qw/ECxNvqgorlVU1Igl4MqxRALT6pw5x3ZatZxWXvvLIV2XGGSKOCN3a
	q+hvnXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhqj-000XvJ-Hh; Fri, 28 May 2021 19:08:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhqS-000Xmu-Te; Fri, 28 May 2021 19:08:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98D7B613EB;
 Fri, 28 May 2021 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622228912;
 bh=AEDyA3GATipU4hjbgBy152fdxUujTQ6/M3AzuQDd838=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTyLo6IPvVsO506QWoyW4La64eQ+DPvauUwVzQuZuhghRJRYN0F9sKgbITYBU+D0Q
 2yPm+4pzvrvPsdBZVfrwIzuDkPpbEOc/Bmd7YrHvaOxfObVWv8nRxMfcpTT34tBYv7
 fJPCh0pTFdDMCvTxaThRVAkljJdziRyOnISWfODNVfVx08Lqx6E3creAP9ktpx/YgZ
 zHQ3MQ1hyw9w9Qw+3sYTAvOYPWDkTd24cID+DcyW3bZ0ceMaH4OQcouylAOFM28eto
 0Wyq0SNe/+7qnvN3Iwpaj/kQgZlSB5oiIPHuuVlJHjVKOWPd8XSzuV7APtgig9t0jc
 qlzu4O89WRyug==
Date: Fri, 28 May 2021 21:08:29 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 4/4] arm64: dts: mt8183: add supply name for
 eeprom
Message-ID: <YLE/rSP1jBTRVcHW@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-5-hsinyi@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210527075556.1709140-5-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_120833_006925_3ECEB61B 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: multipart/mixed; boundary="===============1731091702594332595=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1731091702594332595==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jMGR8adNjQ4lPsSH"
Content-Disposition: inline


--jMGR8adNjQ4lPsSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:56PM +0800, Hsin-Yi Wang wrote:
> Add supplies for eeprom for mt8183 boards.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

I dont' take DTS patches, but this can now go into -next via arm-soc.


--jMGR8adNjQ4lPsSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP60ACgkQFA3kzBSg
KbaBlA//Tm2W+IM6kmH+B+RLRVS97l3JsNwtueEWM6MpariwdqX6ZQ2uZwFqZVMX
7iCJyhjfI+mtGRBsOZW016Mb1Rjokkv+mEBgV6EhhVqzFUCLSRAyhgpCr5/chexY
9sRB/2ogVNDIW89SRl7MGWnt/9tokLy/gP644kNdCksCcvX3d+Gpi90utYMeIy5G
N8i5ZaoAnMUaC14mlCxWuYe4lc7LER/lsuc7LFVXZMQwGJyGEdupVgY56lOnZFHL
xYl8oegikELcjGVV8YQ04fPdm2+1CyF7+dBu4Sj7UNyRSB8tNrDxo24iG8bj/iGj
NCQUnA3AnWLOfG1RsmKkMRg9dTa1CGfQ0xfIR6gXGPLDlebRSR2aC04Z+ImWvKYl
TxAz36CFm7z2b6w8PU9khSP5VNym586Zf2vnYSpMf1t4Zlj/h1OEOB+70kNZ11zM
n6A3PU1Q3E8NTVjhxpOCXA23bMQOIsjAihZd7qS4O6e+4CwRF88DQLWxA4NpAFso
WFWyywyF//zcvsMfXrgSB4ENcS/3yf+Xfz2DyCh85VFWW718PGBzR8ZNzSvkt9aA
Jf+srk4Y+x+7xiP7k2yriSB0QmxsztBt3c/v3TiqeCu62MbUQ+7wnyplJAa+TiR+
LV2IJoOoFCI6+Dg5sFqOi/DsTJoKB6Or9kqdLSfrIieXbVFlrAU=
=D4Si
-----END PGP SIGNATURE-----

--jMGR8adNjQ4lPsSH--


--===============1731091702594332595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1731091702594332595==--

