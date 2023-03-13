Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C93DC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZLHa97T2lfgDx+ZU6uYQ6bA/C6+hQ7+aBTPBuZdrtA=; b=pw4F56NY1vh5nFnQCng4/l+RI7
	x0tWlPEz/F45EJYnXotOgFOkBOz+R8RAPkInOAlvu4vsX0KLSZDI1CQBTtGYbIWdpxwMobHcp+0el
	hHt479hgR/5yXvipeHvaNMbPlsdFcX1Q3rFfNG6AJ9xpSIrH1zcyris5ChI/zkPN4YLeoz3c5UbeN
	5SP4A1qlBIUI9tAs+8fJQ9YiupAlUOPA9MHdf157qZI3W0BVs6lbfOmAVGXkTEmoGg6cuO4OdGqir
	MAH4qLZkekn1RaHVbyKqowMI2BBm/SDsiuf06pl51upYqUC3G+1xQehGFZhCRm8GL6vyeWjboi0U3
	VxrH+WIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiev-0060dl-DS; Mon, 13 Mar 2023 13:56:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiei-0060Zq-2f; Mon, 13 Mar 2023 13:56:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91957612C9;
	Mon, 13 Mar 2023 13:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A2FC4339B;
	Mon, 13 Mar 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678715763;
	bh=XrmPKmwKZEzUZa89QLtk4Hd7HK8rWUR7XZq2R52mvKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVNK4YgYZJ4K0piJo8DAROawkHWiV1+E7FZWwtIO/Rt2OOgmhtH/LqF7k/X39Ds9L
	 JSsJgJmRbkxqRUf5YCq+wkPHuyCBL2P0ko7LAjoBHxoTm0qDuxjZA1RM98qbYPlOym
	 wsLZ27sFCNUI2w7Fz0XFd/lZGognWMCA9U6zy5Uu+BgEoDaC/VIFVXXOQ7Gwxt8Eyg
	 DzeQcuT/4u9w83j46qXdIoAqx0e+xCT1jbWKVGEHftI6gGQ7X/bhw8k/W9Qi6NXwBz
	 AIhlybAlFKfBPsrkJjnaC3Mm6Jma9WXfIWBT9YlWkNAQ/6NtDWlbhl/U6beUoCKvsU
	 sD/YvX7+JerIw==
Date: Mon, 13 Mar 2023 13:55:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
Message-ID: <7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6DRAQdU86hSK7NNa"
Content-Disposition: inline
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Type louder, please.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_065604_181499_6BF6F0B8 
X-CRM114-Status: GOOD (  13.03  )
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


--6DRAQdU86hSK7NNa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 11:28:42PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
>=20
>   drivers/spi/spi-armada-3700.c:807:34: error: =E2=80=98a3700_spi_dt_ids=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]

It would be much better to fix of_match_ptr() and/or the module stuff
that also references the match table here.

--6DRAQdU86hSK7NNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQPK2oACgkQJNaLcl1U
h9CaXwf8DMJQ+FCZOrCTMX1qtiYniAQfqUZMw81w1uhZli/zJ0bkKyQuozjfL87N
j5LsX0tvE/nD48FYdMKnHL1aZ7gnmS3iVWPTCb2hYYCjMiRddTVEe4Sw9o13d/zo
8lJrUeGddSjzluNsDnpxQzwtR/z33eHcjNGU3KkauqbVczIkrQS9vSXiRxLydFPk
+T3QQHtIn3Ya4Q3IRY9TO4eAMBFZgoHeeMWyYA98GSVmrrTdygzyGXKvdv6xeJQD
cBAtY0MVSyUACuxgGJWvxTi1eGiHvQ0a4aWEgO6J29PAJJyMr71SaiKHcBI5W6CB
RRo4kwWeaZerBbrW1ByTmVBKFXbQIQ==
=vTNz
-----END PGP SIGNATURE-----

--6DRAQdU86hSK7NNa--

