Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D915EC54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzxifZ/NdoltWKmyiuN6imx75HAhf4NgVqu/1YvSeb0=; b=J5oQn+pJ0FjShD2RuCR9TByh3l
	07unPEu7qDxK/7kxMRVkiaSPmf8C4mWOpCI00lIrm6/PcgLhMFUy1VIxzl90PNdB3+3rf5Sf1EPiA
	sX9xPDFWFHn3cwuY3GYlNwzeZJHR8GQ5gaEoGoAPrPRyY9nyewn79X8nwxRH62kIdsKG1rmXF/y2K
	lqzEG6cdcuFYmIaFTV5B3sWcroS3jY719vy1WmG3kxjKzUMsfsw0Pf58wS0ZM6y0YK14Rmeh3SXUs
	nShezrJOxdz1tlS7z4ibVbF89hm89/Pf6j+2NoGWHZqfvl05a/aZEqvsc4nRzR/SA/XaCeO1UwOcU
	yfJXjksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rni4h-000000080tS-1dsj;
	Fri, 22 Mar 2024 16:48:59 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rni4f-000000080sS-0Hmg
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Mar 2024 16:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ezxi
	fZ/NdoltWKmyiuN6imx75HAhf4NgVqu/1YvSeb0=; b=C5Ewx1W/xQ3t7Ny7X3wq
	1OaJ45FEPAkLMBSzdSgEzZ37WKuAp+iNFi7wdpgvolxjlFs5YI8R50J7U4LU1Onb
	c/bgsMRNiT47Vq/CQ/fvSzj7W+LjUfCJRY41x3yt+gopV7zbErpMsh7MwXZ40V3Q
	FZn1nDgS02CrbdF5ZPqlgid9ZOYuUVHnYqB542i4G/yIpEjsTQLPJ8kgTyfk+ShR
	HrcGrKOBhl/LLBnNpMcPLod1ozLcpM7Knt9Ho9sDxUGzbhXKvunqy+2j/lQFJ/2O
	8w/wX7B/pQJTkQe/IEYkvdWAyKj2EUlGd6rjmjcpN3jpm3GqlbnKFTPRztTh9pxu
	HQ==
Received: (qmail 3924065 invoked from network); 22 Mar 2024 17:48:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 17:48:55 +0100
X-UD-Smtp-Session: l3s3148p1@YwRumUIUZNtehhtF
Date: Fri, 22 Mar 2024 17:48:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf22dmwBpN7Ctk3v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk90DgmVWePBMrYC"
Content-Disposition: inline
In-Reply-To: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_094857_421778_48BDB332 
X-CRM114-Status: UNSURE (   7.87  )
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


--gk90DgmVWePBMrYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  static const struct i2c_algorithm at91_twi_algorithm =3D {
> > -	.master_xfer	=3D at91_twi_xfer,
> > +	.xfer	=3D at91_twi_xfer,
>=20
> Seems you made this by a script, can you check the indentations afterward=
s?

Yes, I noticed as well. But other (not converted) drivers have issues
there as well, so this will be a seperate patch.

Thanks!


--gk90DgmVWePBMrYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9tnUACgkQFA3kzBSg
Kbbr8A//XEXud+6wIKsFTjfvJagkwqlNQp4For0+4AnAo3VuIMv44faNDOSxB63k
K+vOfRi2HAVzhVrYUBQLf4thG+KXeX+7OXTO+HUwm81u+mdor/KfhPshTZfelzR4
Sn9yxlg5kv2BQ3uCiNdv/7iznbabfUZPtQb9BnqBCj5O3nq5k1+WJYnm/1FamL9y
M4h0p+yg14kIIMPV8fvDzWKHwQGsrEUcVMGLo7Nhj2tFai5yPJZCMzHpakzhVZQE
wWsnWISmOwkFScr8cI8K8I5IQ1u4+2gDSUK0egM/spTBPqLfGamRt0SeVJnYEQQ7
Owy4DrIPRiOITKuNc/DG6/+TeujZjLkyRuVwHbmP2woTVZcpc9pijAxzZDi8uQZg
2zDdXj5mwtQMwkc+YwfTjnyAA8P8tbiAFdXgBcxn5w/4/by3uM4EtZBCEGhjXyDu
8yTFnBzKNuNJJ3tiixvkB/GrTApip1rQ1vMxqZ706IMyPKXLQkJpbkBgVQ7vZtSt
3AHRdwSBxBYBupcBKOxK5hMQLceYqyLnTVwppS7Om/ey7MkrnEFuCYWhmFuDb5MF
5Tk6iReI6pt7T2lU/JNW9vWpkeMHDomHJ7T23RSMUmzQfsi4YvWFFJ87Yd4JRtrD
wpacw1VztKHA12REQNWJHMwslzINn556NtcsRtarShBM5Xboofo=
=euQt
-----END PGP SIGNATURE-----

--gk90DgmVWePBMrYC--

