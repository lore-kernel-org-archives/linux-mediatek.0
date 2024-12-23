Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5004E7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IVem7Xwq8e87d+DyQwUDntC1RdrKyc1hWjo438RBYI=; b=C4wVYmUDLgix+ClZtc9PthFTNP
	GKRrE87rVikIouFEzppkD4TzpdJKQ7Uvm69H5daU64uJqQYwJTYD+OPOVqWg59Rq9D1Pv77zKTRI7
	Pn7W7a1O/caU8M8qYz3MhAZCffqWGMBsaXo5fdjcgYWDPZkrwJez2mf163Yb7mDtE++xpMYq5qQdC
	BVcIh/RH6w6Ua88LKtYNDHnEuCpIq3nhnrbsTZNcKX0sDk855PJ2DHWrjBl+QJ/YknWkf3brzxTv+
	HJ6r5YnaR9xr7MPb2fC0qVLN3Nrfz6F9X+rglHfwttD9CGWOvRpfaiXB5JYa1OabNcS9bAdZWajOm
	9pbP8FXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPcu9-00000009WFw-1Mzm;
	Mon, 23 Dec 2024 07:31:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPcu6-00000009WF9-0pcM
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 07:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66AE7A40B5E;
	Mon, 23 Dec 2024 07:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BFCC4CED4;
	Mon, 23 Dec 2024 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734939060;
	bh=Ygk6uUQxjvnjtMIv4tWwERicS++4MRefCsHhXVHUsRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwUNEdpVksa3VeJ8fBbfU5ZM7cveMPPtJwrh5dBwK0gEoqVYDdF0NbABXvUPIJWBw
	 xCqUqJSqJL6xtKZr6qQ7jAhuhWd71QCPd5TxS1HecY9J/hvR45WyJpacDQHEAg8Nxb
	 2n3UaUf++ISc2NX01EI862mzeWJQXkc5aNu91d3n3AsdRCNSN+HKnHjEJRyLACr5nh
	 BOO26q4g07K6IBNRx5aV7gSAqtRZNsSUNg+1F39wB4XcAaYzRqeyumIAvWSZFAj19D
	 3ux6IHIQ91x+ZZx51WabplqJyaEEdtdtBHP6L6K1CKNx6HfC+4KG2P1qz8+vVZVY4x
	 5cGLrZr9Tq1ag==
Date: Mon, 23 Dec 2024 08:30:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
	Zijun Hu <quic_zijuhu@quicinc.com>, Alison Schofield <alison.schofield@intel.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <mrix3q75mawxszrp25yzpsrvenlxx7bihfzyfdcnp7egubvxpf@lzp7fcaxwquc>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ziq55rb3fq2bwkl"
Content-Disposition: inline
In-Reply-To: <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_233103_007372_D83C1D2C 
X-CRM114-Status: UNSURE (   7.77  )
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


--2ziq55rb3fq2bwkl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
MIME-Version: 1.0

Hello,

On Wed, Dec 11, 2024 at 08:08:06AM +0800, Zijun Hu wrote:
>  drivers/pwm/core.c                     |  2 +-

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org> # for drivers/pwm

Best regards
Uwe

--2ziq55rb3fq2bwkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdpEa8ACgkQj4D7WH0S
/k4bUAgAh9LrZmd2eRZtQQDD7RKfHIeOmRCpwZcKO4VAM76QCcEzfVerUpZH2Emh
tkSaCY38C9pM9hE0HsXsYV6zg/MBAVCwiVGbn+rgTAVtuiDiI8ygmP7cdzKnk7Ke
+l0xcXunQPwe3UHEzAvvPiu57dMcQ6h8732mqwqWrRh43gPAWdpAgktFqFLPCRQf
1sOslGEFNX866KAUqB1jjxQSZjq0v0dXyd20GSu7yjzm7s1JzRG+msGCSSxv0vRT
SWDRWVHepQ1AT5THBbY6xaXnaiwoTbnv6NCw4WFz8OHbBtIb6Fm7UUE1PNTnZM0t
qDtxzk9rG0eZFX23d+rXwSg2JlM3VQ==
=zwtk
-----END PGP SIGNATURE-----

--2ziq55rb3fq2bwkl--

