Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C55DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzxsQC82UM4hipBZD0k65qUyAQp+h4Gkll6GRa/GneQ=; b=32p0yLCLeJNVWQqZiBFiSekhSp
	Ye0Zc9my3wOLkXfRgYP4meOWEhpGJ5eJcZ6vVlUduYUhMXIArNY0OKlH+DZexUhuAPNvAy5gbTm1o
	sj2c0xorscXArhTu/dCh8L0oOg3mSpbN/SZjWXn/iF3zXS4tUvRIqE8ZAkYqMY1RYy3+BEPCFgXHw
	Z0cjK8JZdXjaBGDhq3S5LqhEZX8/J81BJp0nQUiwD03UoUOPUGJnTqfgKqZXOFpbnrGo1sPisvnmW
	RemSYen633h9JErg1RREPsdQNfpBS0M+jcciidx6rM5xwXTGUijqNzNkhVtU2Ljt/yiN/dv+79wDK
	Gc3cDQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1necPk-0013ye-DP; Wed, 13 Apr 2022 12:48:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1necPU-0013t9-UO; Wed, 13 Apr 2022 12:47:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2AF55CE20C8;
 Wed, 13 Apr 2022 12:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E59C385A4;
 Wed, 13 Apr 2022 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649854064;
 bh=yxfL3ywdnIr/K38Xc28ibqWKM75z90Wz9zeFMmPk3kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z95JqEkfPGNdJWzbSpi3NXHM6dkFnLeZOUW5DykdRGN3491oeVNXbLa88V3MqBtnl
 66bDr/V/cepeXRamQiy1NjNBq95axE1bsc7yjdbXz7PlfoVl/P4JKs8yECTGf5huLS
 Rrh8DgajTZV2Qn2NGKE+zJdP57edr0z9L0taeKgzCE+Fy90fshg46gQg76BnUgSV/4
 CazjpgUbk4Zcv2lGr0J/jr9TBsI46NRLLaLhoIIJ23kTHrRcZxL7P4G/0NQDrnHmiT
 892jbMg/Ob8a6Mr9tRZhWjlc8GT9ZtbpCDzXYhM48X4kVD0bjP/FLUDlYEebUV0GNO
 eNm4KgPCGBAEg==
Date: Wed, 13 Apr 2022 13:47:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: ikjn@chromium.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
Message-ID: <YlbGaq/o888LNXGk@sirena.org.uk>
References: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
 <164979303551.449574.9303978009033918270.b4-ty@kernel.org>
 <aba056b08ed834edca7811ea00b957df748703a6.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <aba056b08ed834edca7811ea00b957df748703a6.camel@mediatek.com>
X-Cookie: The horror... the horror!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_054749_191385_F6FF08A1 
X-CRM114-Status: GOOD (  13.99  )
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
Content-Type: multipart/mixed; boundary="===============0073409311657046617=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0073409311657046617==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M26jxRTuGK/Rcnx4"
Content-Disposition: inline


--M26jxRTuGK/Rcnx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 13, 2022 at 11:33:47AM +0800, allen-kh.cheng wrote:

> Sorry, There is one issue I want to correct in commit message.

> "To handle both issues [etc]" should become something like:
> "Solve this issue by reinitializing the registers right after resuming
> the controller"

> Do you mind help me modify commit message? or I can send a new PATCH to
> correst this.

Sorry, there's a merge commit after the patch so I can't easily rebase
(which I don't generally do anyway) - it'll just have to stay the way it
is.  Not the end of the world even if it is unfortunate.

--M26jxRTuGK/Rcnx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJWxmkACgkQJNaLcl1U
h9CIYQf/besmgKeiisuhVRwPw3ZkHtB6qPamIdugavjaLLEaWWPkcwZpJXGH7RxA
xZnwy3/y6DVpBoFdYO6BMJ5LDsbAHAGwlxXWXhJVnec0y0KbMyAa31sTYgjpa4lP
KXcFT93FVRiklaJDtvuhi9EB8fz6tQBtrs/43Bd+sYyCVkZ/iqWIi+n4fnn0koSW
ETiOv73yw4pIm/UH3LdDrOZrngK+xZ9hCaODdZN2d5ziTy1KFr2MzpVKDPIMDS1R
4Zms4iEI+MInwIwhwY/V2Bg9zF7XZVy9j/YD7kLhp/QM2/J+oDK3mx5xza1GQNEL
iIMgjvz7vZgFtZoT88Qw9HQ0rdPaxQ==
=0F9p
-----END PGP SIGNATURE-----

--M26jxRTuGK/Rcnx4--


--===============0073409311657046617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0073409311657046617==--

