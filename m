Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100C9C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D758B20679
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 11:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YZiPRvDV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9XD9p0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D758B20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b+AyQEEsgAui/vkgrWS/8ZAbvYnhv6P3dED2r/V4xLk=; b=YZiPRvDVu5RNGwu7bVHHkcF/A
	EkYuM0fkxTKRV5w2VTaJR4esPHu8g7mZAnIUbkuaowkAbegNy5WsHWyS0QeS+XWsmEq7FyVvuyD3i
	9OWI6DQX4INCSLGqKUZJVfxdWonmvWYxZXq8Y3FbKI+cZ9hyX668v+C4pTTO++JQM+h21GL4vwqSG
	/EQgX5k57W16nAGIhSyFqnGBgq+ctE9IVonmKMyEnKOFdq9zgITKkhgf44LuD7DA1sv1x8gZsh9tY
	FcUYodEPbTyYDwlRaPgy1NopI8WynZikr5H9sjm+sh7Utrl4p2/J73TI4JsuJlFtpsuJ3CMCPFosm
	xQvN497Wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkn9P-0003ks-TN; Mon, 15 Jun 2020 11:19:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkn9F-0003SE-Pk; Mon, 15 Jun 2020 11:19:30 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 058D020679;
 Mon, 15 Jun 2020 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592219969;
 bh=09YCLJTSpwXYksfyCYSJl2k+cwsJ7qFx3Cq3UzjbGyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9XD9p0MeL4taa2ELATHmZjnxuB2Qwom8k1ILpzM+ZKmgHncRSrZRkWHzXJoKUZYG
 RVzFdcjhfF4+7tviRu0Z7J7pql7QVnbcy5lmyaFqXh1wKUMpINf6iGMDn+vhj+ObwV
 iv9FZnGvAGdOWuUFB1fqKEZG7JlfMHbBDSJzRm08=
Date: Mon, 15 Jun 2020 12:19:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Message-ID: <20200615111927.GC4447@sirena.org.uk>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_041929_855629_A4AD73B8 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: alsa-devel@alsa-project.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-bluetooth@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============5729503977759751079=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5729503977759751079==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2020 at 08:46:52AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:

I also previously acked this one in 20200504100822.GA5491@sirena.org.uk.
Has anything changed here to cause the ack to be dropped?

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nWT4ACgkQJNaLcl1U
h9BSJQf9FR8Vke3pe9Gs5pnWmw6vzxds7jfidCUpXIKPoosgfYfzYQrN1G9m2fSm
pLlYWjhQBEAU+w9oq7WktfEZ8r736noKsRW4hd5a+Zf2koBr0M9O7ull4h7WlHvr
asCHlWuqJvpVevxf1ag9x0dAA9NRMqh8xxd8ah/ENWTbXmzZPir0Pa6Q+9lzG2Ld
aqgHcA+WbonAUk4BqLRSasRy6AkO3zUbYWqVecAV8xRPcVjiWd/PkhEQ/BV67wG9
Kh/sFCs6+PalKQu5PDZP70apmaRPYHwPZmkNu5Y8rAUsjsQradS2JB1zFlWDSxZk
0qIWVDJdY+FIcxlqt8Rda5akpjL2SQ==
=51fv
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--


--===============5729503977759751079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5729503977759751079==--

