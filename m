Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740CDE77173
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z4PuvMEcGxSE7TKmAHfjY7KVFYMO6x+pDeZgUbadF8=; b=UmyyNTKo2WMLP31XuGIytiZrNF
	aCyg3XxOdRTbWjxHfiCDNiPeCPhqXwTRsXTkxZVNIN350T4FT3mrnRSPrZwd81hXpWuk5x7f6cBXz
	SysaE/y3CDUWqjYWP9aM62BGyen/1MB9iB5iH+Q4SdSS/PSnrey50GdFVGwH+XJNIbFhslFiSXT08
	7ciRJTQrrHcUniWeSA4N0PC2Foq+gtpJtJX1hPIQrTaes1jeOCYm6TCClGf/kq2fJi3vtOJ4kffZK
	Q0aBSSevFrtWMy8v05LYn7nBnxG5Cj+azdJWlH7XvSxTmGDKH5FytGkLaR6tWi7Z5ACZlCbeZAnRy
	TRC88QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSeB-00000000n63-2viM;
	Fri, 06 Dec 2024 07:21:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSe8-00000000n5D-41uD
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 07:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABE395C6F85;
	Fri,  6 Dec 2024 07:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F657C4CED1;
	Fri,  6 Dec 2024 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733469664;
	bh=eXgkPnSuV1DLMSpxicSxCmpRMc11qSId1Ps39ZgC62E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+wG9rcYnotlrUeuc0PL7wpQWKlXXxbgXtHgvJy7YCCwHVZ9BkccRLmauWqsz+ZV/
	 iY49BGCvaEwufLj74wUd4KOO2j4hv4jUIw8urqblrYMJBpAv6CgCbIU/8R6GyV73VK
	 9c58t+wda7Myy5qJF2WzOXzK3/BQJ0i/AkjHXsZFMr7s3vepRv5asoxKqYToTl/hYB
	 VNEio9U05OacRjqjaygqmLG9eUZQ17GF0aovEsH5OsM54NY9ccCb7HeNz79C2xEmMj
	 yLXMkRkJbjJNx0ViCQboZDxE2VKg3DG3+oa6CDnctzD5D0J8giHgftdS96ghXZOqUx
	 A94yQD2wKTalw==
Date: Fri, 6 Dec 2024 08:21:01 +0100
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
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <7ylfj462lf6g3ej6d2cmsxadawsmajogbimi7cl4pjemb7df4h@snr73pd7vaid>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owd7bvwanf7sxd4s"
Content-Disposition: inline
In-Reply-To: <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_232105_233171_B2189DF4 
X-CRM114-Status: GOOD (  13.07  )
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


--owd7bvwanf7sxd4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
MIME-Version: 1.0

Hello,

On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
>=20
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
>=20
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
>=20
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
>=20
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.

With the discussion that a new name would ease the conversion, maybe
consider device_find_child_device() to also align the name (somewhat) to
the above mentioned (bus|class|driver)_find_device()?

Do you have a merge plan already? I guess this patch will go through
Greg's driver core tree?

Best regards
Uwe

--owd7bvwanf7sxd4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdSpdoACgkQj4D7WH0S
/k4dIQf/Zne0n0ncNUTb3GbDwFv4sf3wAVH368SbrNYMV23ZdWpNl4KZPovf5L1+
5nMlPkc2I/CBZGE2OJcZWUhHI7cZ2ZYDHBBAf/TYhsY9f0+6wXgdi2cc+bbbQpo1
JdabxMtgPX9tQ1Rbtv6jNu1AUvx8pONwQvUe5vmIBeLFDx5+wEwm4LppEVU+x9zB
dApq6D2VfLguHwMf8HDycoa0nd0GL3R4KIJF4+taiSmhz9q+yjewqiXD2ag3fYrF
1IeZ6pnyXoaq0aTwLmXXhI6se14Q+IZIVQPRXVQ5i9A8kbsWN0Fj2LfXnnNWhmHl
YR8uP+UVLcfagxTg7ascr+SuV4OlCw==
=cpdm
-----END PGP SIGNATURE-----

--owd7bvwanf7sxd4s--

