Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E98CA9EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 10:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F029B20684
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 10:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MgFMydh2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="c4+X8gj4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F029B20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4uGm3dqUur7MfKph75F0QStPDUo/obnq5xBNJaxnqSY=; b=MgFMydh2S3vJHbaLY2AINJThY
	7ygv+C21fh5o+YX2I+jqFf2Vg8Un+UOStlL7smkqwvCD4o4302b5CVXOkCQKLCTid3dxYnrVT8e0S
	2stFzYHODM3M/JpKnfT0ub3UOGJh5uLiCpgGLxM3ThPOWFZFAYokbnDsRmcCttHV3YS2xgqVsC5Vg
	A0GsGVzmSNzcD7gXxVKHU5D+L5B67XwkjJTypKF5m0U5AtSdiSluWheE8om7TnZJtM9mbMrZ1d+8w
	XMxRrjW9FvzI6JkX92z0Ek5E3SOaM4HoT7qnotCQaG5W/k+9G8IQIisSaurFevs7+Q6trKEe8tSOm
	gkPUkoyGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNaHy-0002Xt-O3; Thu, 24 Oct 2019 10:24:18 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNaHV-0002Bc-Jx; Thu, 24 Oct 2019 10:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8n+XLVyUobbc+/UmO7NjLUyrQevv80urDK3GZxqpQ8E=; b=c4+X8gj4RYEx2KngkvDNoMu8B
 Qjg8qvJqJ3godFzdWeP6qKmKU+4+ZXMinY7nH0VPiUWYYsybJmHa79Yv8qBIA4h0mUODNGCSWskBX
 D9pHA2GDiVOGL+wQfolwtQX6/P6W3bTxSSiGofTNVMneqBFVInRgAx3OVY5YQ9vS1h7WQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNaHT-0003IF-Ey; Thu, 24 Oct 2019 10:23:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C583027428E5; Thu, 24 Oct 2019 11:23:46 +0100 (BST)
Date: Thu, 24 Oct 2019 11:23:46 +0100
From: Mark Brown <broonie@kernel.org>
To: luhua xu <luhua.xu@mediatek.com>
Subject: Re: [PATCH 1/1] spi: mediatek: add power control when set_cs
Message-ID: <20191024102346.GB5207@sirena.co.uk>
References: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
 <1571834322-1121-2-git-send-email-luhua.xu@mediatek.com>
 <20191023151121.GC5723@sirena.co.uk>
 <1571898319.4311.3.camel@mbjsdccf07>
MIME-Version: 1.0
In-Reply-To: <1571898319.4311.3.camel@mbjsdccf07>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_032349_675221_B2ED4658 
X-CRM114-Status: UNSURE (   6.70  )
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
Content-Type: multipart/mixed; boundary="===============1065996070854560211=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1065996070854560211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 02:25:19PM +0800, luhua xu wrote:

> Spi framework provideds  spi_setup() to modify spi settings for spi
> device (maybe spi is runtime idle now), and this will call
> spi_controller->set_cs() accessing registers.

OK, so fix that so it takes the power at the setup() level then.

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xe7EACgkQJNaLcl1U
h9BupAf/enXFS1bm5HhfceiQntahs4gT3FPXaEDsQ+rJ2S90V4JwcUbi1oSpDvWj
w2OeywscDvkZdcEaQtre4ZASwvSefR01VajXmtigEOPry80kECDHAKGiSKVXBSJ/
9V9Qf/dFBi0ej5+/Nw+3wEGXN75TgQ472XrOoHykyWerqXI4qjnUWyCXTQXO7Asn
hzr9BF9bL/1BGCUG+eK86VPC7sG9bCaQL8pvn3VFHiTgiSfCdMlIIK24LfAMjS7x
/NfY0ARLNoF1MvvTbBHHGHbG1d1pp+FeqEo+Yj+5CgIvo390+KgCjSqhzTv+PQ4Z
RglXSQMhEAM9OExTQLMO86LCuoiC+Q==
=Qdg5
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--


--===============1065996070854560211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1065996070854560211==--

