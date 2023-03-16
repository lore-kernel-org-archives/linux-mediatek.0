Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB579C7618A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USEO9TjPblYQ4apvEzG9UDyAkq0+JHPyxVQQXFTWDPU=; b=Pir93hVIqnp0HF7pXJv6PDAHR0
	5aUOalGHkcgSDJt2cVFL2tT7UytVS0a0aslEsS/qEBXRQgFzCwh85ibT1bZnbznlZr4lv9545EsgJ
	a5AANQDKr7BbeXF3hGEWAhthes/5gTnz/O2C7LJxdbx50wKAfV/zIrTofIcl4JbbZFdPw14fK/Do4
	ROcO23omUMXzUgnF+g+8ArlFmockdNBEZjp8D42upZuJMlCoNYk1IiCOmd99HQtbKMXcvIcAvzus6
	AL7KwaO8wfqFzV5Q5TKu7GQWqs1AnlozmlY8LCM6O4K+GW8gJJBv0Yx0JOEco0cRMlqmSSZyr73x7
	4zbhGEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcti4-00HRC7-02;
	Thu, 16 Mar 2023 19:56:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcthz-00HRAe-0k;
	Thu, 16 Mar 2023 19:56:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1BDDB82347;
	Thu, 16 Mar 2023 19:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9986EC433EF;
	Thu, 16 Mar 2023 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678996576;
	bh=PfUYV+9ZbNdnWPZGJkz3rVty4AE/q0+P1FyVLuVDiTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UknZIvIYCaejql9hITewhMGmVoY3p/uDlBHS25lpySIMpMa69hr1OzfiivzcyaRnR
	 32cfYTtKa+07kLPidicqI+9As3sC1Iw5vs4QKSvAw4mLzxjqiWCCCcY8KaDe6AXiyc
	 7s8G6eIQ3BF31cyqhiGVD3qz/6PSi9eJfSNMDPA4hs76d3DN6dInc45lC/ithmu46N
	 9DW8Zecux1xihK/JeEy8D0TVDrXQXA+0f/Ymmr6p+GgjX5dcFK7KDKY7Qt22KI35mS
	 aNsB8fbblnOd7OTn47B7ZUUZ7BwQAgVlQ3nw9kOafdXUPJ7jPPXuEiCRgCHesH+3Jm
	 v9Lalxrg5vtHw==
Date: Thu, 16 Mar 2023 20:56:12 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Message-ID: <ZBN0XAp8jm095my/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bKW2mF7l2ILB4D6Q"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_125619_568366_4D4600BA 
X-CRM114-Status: GOOD (  12.11  )
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


--bKW2mF7l2ILB4D6Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:54PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>=20
>   drivers/i2c/busses/i2c-mt65xx.c:514:34: error: =E2=80=98mtk_i2c_of_matc=
h=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--bKW2mF7l2ILB4D6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdFwACgkQFA3kzBSg
KbblQhAAhR2X5U38APPQWOy4gWDy7Xl2FMahiZoLJSZeabT1t8HHafaSSbQCKKbe
FvGEcDNCkPxAYqpeUW7gUgWsjRL1JB03UMn3B6TygU/rMD5Ty5RpHQnc16i5KX5r
Ebp+fhOo+BQhjJDld6bot7raM9ifyvq7tkzaiLjXeg1JIgEDklDRtTH6Yp7P3Rqr
irJ20AAKQbUWCwJQ0iL3hraxY+y44Ce3ofqi1e/eUha+4EFaC7KyWdyxXZfY8Rzt
+9G/ZZeBa71grd0nn6U4XjkkgLnA1cYg4o+UDPI//Q0LFl0puR6KM9wo7M4SOJ+1
5m2HSyO0kxbxaWmcB82jZWOCv3yvU7gx5HtOZGLTikSpnlGQ3QiMENwjDVT0X842
wis1bWmVcFq2hsx1XlJyX3jFY50icYw3M+A0pOYa0lWkk+l8Qkdn6LUI0ipq23IL
PTcvRzcu0Wcqatt9TOG9+f9LoV49j+18st5S3/3sOswCN5gqYzDhYxI/p/aDzCXF
cQh29BVe3nKmlANsGQxHDyn2gupsmNN1bCqk5Ny+lE22bMoR4vIcEFFmYVRAb1Ih
jWOH7lw/SzdNkhFjSqD28IHbrWLN1pA0v27UxqTi5lZT52M9qQncJDipBdK5kcpt
vNZa1plwLpOtPodH0cPEdj1xZIwSC/wWCCmbq5GGpoTCeSBb9rU=
=P7Qe
-----END PGP SIGNATURE-----

--bKW2mF7l2ILB4D6Q--

