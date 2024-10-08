Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AC1CED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi4Ed56vIcvtnLM7JqyGr/ImxZkDc5h+XhLmAzx4MIw=; b=Pl5Gt2chM2XnF8WPnNC/6r8NXf
	fPVaykS6vh2llpuO3YmpbTL9csSwoRKG4LEbIo2Wa5zegTxbmIJbSP7Gf74MxUu3bxJMHM+2IX75T
	y8eOdnpV1xxUW0lEAIgnFJM4FlARXM7h8gwLu+NF7VsPuyky3w//seriwcmWqBvWbMTxMKAJfbQLW
	JkB0H/onTKuuM4OTQzUhYruH1D/8wrxGl80b1Uhf17HC4y5D7K4n/pHL6a6j6o5xsrQG8iwOhIDW1
	08CEcAtL2JsReni95QUmOKN3OejJAgtc9sJOEbEDBeMLOZv7A6pt1Cu1Sx+jmIKLrpzuMgBSqc4Nm
	fWxV+rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5p1-0000000575F-3XJC;
	Tue, 08 Oct 2024 08:43:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5gG-000000054SJ-3tHN
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yi4E
	d56vIcvtnLM7JqyGr/ImxZkDc5h+XhLmAzx4MIw=; b=WhE/G/DbgeUftYkCEnQi
	TKiNmL4O8mJXVZGvVaiuxr2/Uuf+VnqQxjkFrl83lLwFQxOgpMaPVihqQQP9EnjQ
	dIvEhlY3XzytQGlC7HUjB+rJPNUUaVNqNEAFMmu3RCbIHBGS/aJikbNqKuoYncTa
	HWKmjBS7QXILHji8waVqo4Gfameve/bjUR8OZjfJ61xt5qQilme9R9mntWnpmVE6
	vI/DbcOiNyMYzTxRGso7HQtTPALxrXPSxb0LKFjJIGSMhdCJ3OEBcf6SjBEfzx0q
	xleKrYav5uunbP1dwomEPHueCWbUnYk2Hq3ZkmDA5X/S0ZeqJIqe1B8hi3Maegtt
	FQ==
Received: (qmail 402745 invoked from network); 8 Oct 2024 10:34:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:34:50 +0200
X-UD-Smtp-Session: l3s3148p1@1sW4AvMjXyttKPHJ
Date: Tue, 8 Oct 2024 10:34:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v8 3/8] i2c: core: Remove extra space in Makefile
Message-ID: <ZwTuqX301BqAltze@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gFj6OJQYOOPFj8BE"
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_013457_903493_B6747E9E 
X-CRM114-Status: UNSURE (   9.68  )
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


--gFj6OJQYOOPFj8BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 03:34:22PM +0800, Chen-Yu Tsai wrote:
> Some lines in the Makefile have a space before tabs. Remove those.
>=20
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, so you don't need to carry this patch anymore.
Thanks!


--gFj6OJQYOOPFj8BE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE7qkACgkQFA3kzBSg
KbYVTBAAnj3lYy0aHno8B+L4r4eegNvIoB88vkx4UB6TEssgEW4AB2kf+uAlTXfW
2cFXhFaPicKEc/DDqmhTTW430UIG27jxpQD6BC1tyapPQ6dChS9t6gCcElhWNTvb
sjCDblb1zor2vGYN+2f+BJPlaFDO20ZnMi9sbP5mlkkEEsTgJIwr2+DFmpWuMY5w
NCUbXbtEkPUBn5u49YJH0RgVsBW1hsiezALs1AxEQ26G7/cXVm6u6IvH7zbgnWE9
0DZKs3DdDxO9mV+ilW43Rm/Lx3s9n5Yy1aOZnkWVX0ddLfZZMR4iKbU5By4w+2uM
5i5uGSIialjycmGSthXpTNawcJfB89rClHpaKYsZCuursUxf5EQtc2MYDOud/bZN
rDz47+boX/yUhMV4FnlVsh+rfJaq5WmcbEd33ICh6CT/fc7T8uKIHF+vIsToTg+s
nx4IqNZ4VJc/6B/er9RLADWJKL2BrKYluECw6jlX1yZHWEka+UvVPlSQmcRxPt7N
fla7gKTB1jZj6vhS1GW5mtSJbQByt+AUbt1dtu9rWFvpsR/gda2MEqbzp62nAV8b
gy4teVjjlJAqKZ5zeQs7MDDszKlCXgv3k1YxsKBSOj6R7/WytM1TpO46BKUCXSZv
//MT9B3Mt7LFR+wFkv+5F4mazO1jkhGdS7wjUz9nk0QGqetl7HM=
=Xawz
-----END PGP SIGNATURE-----

--gFj6OJQYOOPFj8BE--

