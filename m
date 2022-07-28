Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A9FC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCqvbsCRL3xw2z1zOMi6z4rVVsV5/f8O8vQF3Buv0OY=; b=gg3HTNY5u2gvEH9+TUnvFkJy27
	SGPVME9KO5pYWjDs4LKGKCMtRO/Gd8/pkISmCmMD6L6v9n1vRv3NqHTfwbccbfUvJmrT69W8BVfj8
	1rtap/GH1x+oLuMSX4aV+/btVMwGSZ0DUx07y3BxMV02x2XYbiMfL0f+6PkSBlGiXPJ58s3OGscyf
	73D9LbSmJPoxDhbSMiqXIoujZ+1ccfftXL6alfAIwdszk8nJVHlTQJw+LzeGO33TxFQcfvzktfv0k
	fByd9GhdCQXcBjHA+e3mx2uL80vfPJl8nLR/hE7It5FlBzhmFRapHS3jTulD4Ow4PWYmeaih6wHHQ
	DOK4BQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1F4-008YJx-2x; Thu, 28 Jul 2022 10:59:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1Et-008YFB-71; Thu, 28 Jul 2022 10:59:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DE7AB823DB;
	Thu, 28 Jul 2022 10:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761CEC433D6;
	Thu, 28 Jul 2022 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659005972;
	bh=W8zB8u+278oI2Tht4FAyuNGpeZIppdQ+WlcUV9UCJsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jW5Y/C7RYDe8wN323emUqPgme2owEznQSSBwaHbid2pZxzqc0L9J58Xjn9Bo1zpJ8
	 tqg5bXhA8eJt8IQ/0FjKOCTiXjhXa6p/mXMdM4v3J88W4u8dJoDJPbUs5alkVS/QHL
	 uSPilmRREd0l1NgNt2LAOl84khY3YMBKcZg+M1/zVu6z6Wy9K9iAkXsbpWKcoghaf3
	 Ao/vklow/p/yHaLd1oBn4oJ2GUGXxRpRFRsfNTT+ZlPkhQobkakGPJlrdrMljHChAz
	 /iG3+nwrE6wdRaZnDRXHJbTqgo3m0KJ42oQoLNbACxRAuR5emPevgEKi4pETKv9/J6
	 8u/rYqDr3FW/Q==
Date: Thu, 28 Jul 2022 11:59:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v2 0/1] Mediatek MT6366 Regulator patch
Message-ID: <YuJsDI8rqkHuysIT@sirena.org.uk>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EF9Dhh4p1JnapVZl"
Content-Disposition: inline
In-Reply-To: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
X-Cookie: People respond to people who respond.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_035935_423496_BE5453B7 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sen.chu@mediatek.com, allen-kh.cheng@mediatek.com, wen.su@mediatek.com, hui.liu@mediatek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, eddie.huang@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--EF9Dhh4p1JnapVZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 02:27:48PM +0800, Zhiyong Tao wrote:
> Add mt6366 binding documentation

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--EF9Dhh4p1JnapVZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLibAsACgkQJNaLcl1U
h9BQDwgAgnCNhlgMGhYw7HaqbKgbrRyZJJcsqo6ZGtKsrelWYwC9Dl6BAHubd0Py
6aJjP2A36ng35571uUI8/CcvkzCh0K8ohBE2+8UgXElPMJH/7i2Lvmxwz9REshOX
gYY8sV02SitN4wj6xWsDJbRqQDKNadHtw6GSYbyR3UaY6PP9egRUFMQTU1oT10Lj
FWT6PG5LqAzzSuAGBuLN9x2u5XdLKkQzfrUC4hffFiodazOnEWncI6StFPNK3tk0
5Lw+npv2e0u5jlR53jIaZnsnkF9MlsZV7PP4odHY31xhm4bMMo0bmbGct3YG/IkL
wz6MXlA/ueBsF1SvmpRBsKRaeWGWPQ==
=9UEF
-----END PGP SIGNATURE-----

--EF9Dhh4p1JnapVZl--

