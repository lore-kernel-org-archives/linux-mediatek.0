Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26116C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:20:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDDA360462
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDDA360462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQTowtQJV3qlID4xM/LepGaTfUGH2gyPZRd+Vd4mbm8=; b=2Yi4qdxZveLZI+wsnRStu0S0IQ
	r02ApShdgi/hmfu1bpY1kjvSazZhUIZ82+SFd/c5rGz8PYCif+yE8QKBsajJdNEhVLC5U0ix5hA/+
	yEagkbqN6i5USqeJZSwhJDdJaxW2of8xvCrSQaabyZcMMqZsnpx6goxXPZyO0tvW+BHYJcXAp52uO
	SPEegcZ1DuN03g/ZVC19LM8pqMyOtMZ1UR/IOhfeV9IkDi1LaHMNUaXPFYiZMDG7scdnHDeoa4AY6
	pD5vgLqVps7BZViwJRXU0Iit4fnCNXlLPZLi0z7fqYJT3fTpIglO5DXsYrXOYt50bv/ReXdn/jQst
	vPrK5ePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZvJ-00D51P-SO; Fri, 13 Aug 2021 16:20:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZv7-00D4zs-3a; Fri, 13 Aug 2021 16:20:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 7D8C11F44AAA
Received: by earth.universe (Postfix, from userid 1000)
 id 6F3823C0C99; Fri, 13 Aug 2021 18:20:29 +0200 (CEST)
Date: Fri, 13 Aug 2021 18:20:29 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
 matti.vaittinen@fi.rohmeurope.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Message-ID: <20210813162029.q5slrkubelfy3mvh@earth.universe>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
 <20210813155438.4ssph6deqksob2uv@earth.universe>
 <20210813155858.GD5209@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20210813155858.GD5209@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_092033_334897_0DB63F3F 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: multipart/mixed; boundary="===============8828460962281656549=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8828460962281656549==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdfyujkmpuwincfd"
Content-Disposition: inline


--gdfyujkmpuwincfd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, Aug 13, 2021 at 04:58:58PM +0100, Mark Brown wrote:
> On Fri, Aug 13, 2021 at 05:54:38PM +0200, Sebastian Reichel wrote:
> > On Mon, Jul 19, 2021 at 11:39:11AM +0800, Gene Chen wrote:
> > > This patch series add MT6360 Charger support contains driver and bind=
ing
> > > document
>=20
> > Thanks, queued.
>=20
> We're still waiting for review from Matti on the linear ranges bit -
> normally that goes through the regulator tree, do you have a tag to pull
> in case of merge conflicts?

He actually already provided his Rb in v5, Gene did not carry it
over properly (I added it) and the patch looks simple enough, that
Linus will know what to do in case of a conflict. But if you insist
I can unroll my tree and create a topic branch for this.

-- Sebastian

--gdfyujkmpuwincfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmEWm80ACgkQ2O7X88g7
+ppouw/+MI2zSWoohv5esyfj7NAMNCDyaDrbHkrd4z1MhbA/awpyh8lTnGUwu8kk
caD03Omd6l/Pnsx+F4w6/SApqn3HxUrK5ge+6EqVczzWFGRtOHNhuksVEwa+EFxJ
w+iHtH0TABaKcbOXiwrGiRFu6VnOiODF2tn9EhVOS9LC5Rph01ixBxw9djbqZiKX
fToqLHwu4aEwScM1HRbp93ce5p1Iocx2AZBTT3cUk8DWSheIwW3UZVbh8jIE6amA
0DhakGzOSM62RFRq2rL0ZOsYxr74cpjt8e/onPTCmhFaFFeYVKs+x4sx15G7LAGV
hffKGf1yuxf7E0AshZDO1c1bk1qvwfdO7x+YoTNCoyoRH/xrcYgvZtQolzDk8AJM
b3jc6Y9y+mqSDCEStt7SyBxiK/YYjAonoS8zoA7BuMD/WgLiqCdZ+d+RUXZJ3OZQ
GWavHPZN3IafKG2B8pwHeP0ZftUStGUgozseGKxUc/AzwGE99toVYTb9UNOaGFkJ
pS2/077on37yQJy3OW6LWtd3v9DINSut/nra8IdC+Wz7ZqkEqGUmNvf72Y4g8KsF
ubMRl9ojT2KfLiwizAFuIHs7zuKzuBHMZ6VuDo9HSy4baXjsqM73b5NQKfLJY6U1
uPQYdGYY54Pkty/dzHwxK2PHFtHGtwsvWqkdTdEwqnDeD66/tPQ=
=fs0n
-----END PGP SIGNATURE-----

--gdfyujkmpuwincfd--


--===============8828460962281656549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8828460962281656549==--

