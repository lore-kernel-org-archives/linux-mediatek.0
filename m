Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE1E77171
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbfhnpHP5iCIP8hoVNS20dSywm4zRcIJP5E1Flv0m78=; b=Y7j99BqzhJDqDkITTlKWu+03RI
	GadhGbYhHQo8Sp5nfA+W99a/PE8SC3fdTpKFL3HRl5SHQv8swWr/dRw6rb8reB92a24s7f8Sb3VRJ
	4F6LDP/hbKqvtTOc8B4UxeUun1v/fEbClHp9P6iKGP15ICYvwkpdem2WM1eHN++rjpTXUrEyXfTVm
	w0SXLR/BEs6Q1xsjSTotBcwlQS1qQieO7BjG7uo+IKXyaVBRCmhm7G/tzDhM7582Lhk1qJ/mCIDlr
	8tag6M5U5DXHrAlmiyKdoCWZxx26CRicBYLGysfgUhHcwN49B+NLPlTfXt0FpBn9SHHiRmimjBoDc
	GS20jHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6wS-0000000F80P-44yG;
	Thu, 05 Dec 2024 08:10:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6wQ-0000000F7za-0cFF
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 08:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CABB5C6CF8;
	Thu,  5 Dec 2024 08:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB7C4CED1;
	Thu,  5 Dec 2024 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733386229;
	bh=dm+XaarJmRd4PNMM8493FEpsyQu1VayQlRTan4XCkBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpPs2GWbGgUz5ytJZ+QuBg7XSizF7MBLb5wQ47CrA74Do8i70h2t2SfmkVVxQxJwp
	 RFeHBA6N+1cKlVI8Shsh2lySUArR5RSI6914U1xBrr+bvhH7rr7cEdzsA4Rgi1d66U
	 zkLJI2jbu5xXvGwGUD8mz6V+6eqzicBTjawuRRljctphJ44a5cfQaamr4YGrDaX/zh
	 IbgvB4IO9782E6ZkMrskDL8DfFasy49Ius/Vc5afr1384a7Ak3SKFeTCK94J8odFfT
	 MaHtfcFW9mpHPKOXqE35SDPO05JukSUMC0SYTE1DD/M4FAoBDI7at285cpbtMDTdO+
	 RFuFFL23OJDcA==
Date: Thu, 5 Dec 2024 09:10:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
Message-ID: <7ugfaj2h3sy77jpaadco5xtjalnten3gmvozowcle3g7zcdqs4@sqf5l47onbsi>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ya6wyfjwhlqhd5wu"
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_001030_224626_BFABDC4D 
X-CRM114-Status: UNSURE (   8.64  )
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


--ya6wyfjwhlqhd5wu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:10:17AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
> Remvoe the unnecessary wrapper.
>=20
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/gpio/gpio-sim.c | 7 +------

I think if you move this patch before patch #4 in your series, you only
have to touch this file once.

Best regards
Uwe

--ya6wyfjwhlqhd5wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRX+8ACgkQj4D7WH0S
/k6rewf+KsN2Irmv5Td5FMMxi+83vZgDfjxwj+eoLUlf72jMXWx89mPqbHAWyq2W
DVJONM/HQoPhG9ILJDxvkaVLetBPRY7QPBSVY8bMUaDT9ljXmnbxed/NGNngiATy
r1JyYMzf3dqlGSgJl6LhRpugodssXbGiDv8oVNRtLIHFd5MLH+xlUr0CFu0KsPSd
E4NADLSFAkpDIDer3BYt19RGkXNgCrbqzP8rfGN50Q9t+xuS58qoK2oY5+jzT11a
qccGFlDCzdaHWCVsLHVwXYWN2L5mxrrm09Dv8aS/0TcFMueK4nsasVRpUAplw+Gd
j791qtNhdb4QQUhbiOamc5BP/g6LvQ==
=1ED3
-----END PGP SIGNATURE-----

--ya6wyfjwhlqhd5wu--

