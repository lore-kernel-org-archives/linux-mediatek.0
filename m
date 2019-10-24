Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B82ECA9EBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 11:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F4E2166E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 11:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yv7Tzur0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="bToP3Jv6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F4E2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AKf1V4J3eGE215vQJT7RfDywEjB/hBCZzHWawB2DZ8w=; b=Yv7Tzur0kpkszaPAPG8fpO/ED
	AHpfQUk9JpyTHdLPCTRtyk/T/OHjrPAGlQAot3B1Casjl5U8BCLoI532z88LE0O7AiMMxMhylilR7
	biiu4rnpXWxsdBMOlmKilbnguo+CK1XKOS5a0wACmaR32GaDXMx/8069kzX0k62MV/mpQtvP/BcPV
	XnXOnLiq6NxS3XQwmtYdYvuAljGak/HGh2dyc0Z2GPL+bTUeBY15nDgQRAF92o7F+hUsyC7fTCpob
	fEvVG0d3/krLcEM5vrCZYONjqsuuJzkHPMvkNL1OEuraS239Woui3/0glDJhA09bKUh9YILu5QhX4
	rN+DtJDXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNb9U-0005kX-4Z; Thu, 24 Oct 2019 11:19:36 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNb9I-0005Z5-0J; Thu, 24 Oct 2019 11:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUs9kMq2mPKrvQvT9q8/NbtkacnaWsd9kl1JMDd5J94=; b=bToP3Jv6SYLOWPs8MpGvMY/7b
 QlU0Vud00Dhl6l38d8K/x24mvL/5ht+Vp+HEBgiIqZbmROeCQfEUXB/+VN69SL+AAE6LfllZnNrpJ
 Ahf4DmCYGOH5ogZrZlLYf4ws05t6N3zef9TZdfypJeP6ZLlTKcBoYWg5ovesxygdyu6gg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNb9G-0003Np-7N; Thu, 24 Oct 2019 11:19:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 263F7274293C; Thu, 24 Oct 2019 12:19:21 +0100 (BST)
Date: Thu, 24 Oct 2019 12:19:20 +0100
From: Mark Brown <broonie@kernel.org>
To: luhua xu <luhua.xu@mediatek.com>
Subject: Re: [PATCH 1/1] spi: mediatek: add power control when set_cs
Message-ID: <20191024111920.GE5207@sirena.co.uk>
References: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
 <1571834322-1121-2-git-send-email-luhua.xu@mediatek.com>
 <20191023151121.GC5723@sirena.co.uk>
 <1571898319.4311.3.camel@mbjsdccf07>
 <1571911880.4955.11.camel@mbjsdccf07>
MIME-Version: 1.0
In-Reply-To: <1571911880.4955.11.camel@mbjsdccf07>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_041924_054790_2D121150 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4284874171647504409=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4284874171647504409==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 06:11:20PM +0800, luhua xu wrote:

>       (3)Enable spi clk  in  controller->set_cs  callback,  such as
> spi-geni-qcom.c.   =20
>       My patch works the same as (3).For mtk platform, without this
> patch, if user do spi_setup(), cs setting cannot take effect, and reg
> access violation occurs.

Other drivers having problems isn't a good reason to introduce more
drivers with problems.

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xiLgACgkQJNaLcl1U
h9A/Kwf+IpDhddKQiCGZu0Oyc2g59QHLKn2G271BZAq1tw3Rnnj/s4VqQkyLn/SJ
Spw/eC2ufhZI8/CblwrL5cwx6flAbfOi1EdLDdA26qGeWwso/Qxu2odY24OvV/8M
MZaXuDfYonJssSVXw1ri90G4mkXtMzzVxb4UoA5ssi3UF2JkZWcZ4ePaK3buteIf
lwvnDj4gNJYKDnZcz/wpTbrZoKWTAn2IjthZh2AlDFPCSZx/I0wJ2yU7rWYzS84H
rMbflX/QGmgPTfTtep+TIy2xTqLYGS/7Up7n0F0SLcOdDXCpK+Jo4lNJoeB75Q7Y
zHXfh3e//9ZULctc7j/NvX/TUeanyQ==
=vrlq
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--


--===============4284874171647504409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4284874171647504409==--

