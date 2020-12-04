Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34CFC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 17:41:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E88322B40
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 17:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E88322B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GxJ0MslYWfBiok/yqKOBRc3yNFs6QvpxUKQHAQ7cv+Y=; b=otaP8pNtNGdy/QQSMdAxD6hFb
	Me3w7BSabb8Rs+7TReMrIvRmGpQGN+5BBaatTf6PBTrjvgo722K0POwWcLu0mzRlI9g6FrzEF2/xL
	LdU+LBmQPvGcAMFN4ZvKcJtKLOi0z/r2DLN5c0Q6p6HMjwpN4qI/UtwCFQS6vTlejQ0ySH/lbnpp0
	V6FHvV76cafrqhdttFRSykWNua/15C53sPliHSKEpEKIPMKWUmiTPMTcwf39dEsZCFAEJCi1WUycL
	L5ZVlnZ7PjW5kIX0STkOviTsvshZQtB9k65R6pqNEK8TViI6UH2o5Iz7gQc+accY1XCIehZi8Oeja
	vfS1Clbdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klF5V-0004nW-ON; Fri, 04 Dec 2020 17:41:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klF5P-0004ki-VQ; Fri, 04 Dec 2020 17:41:40 +0000
Date: Fri, 4 Dec 2020 17:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607103698;
 bh=WGPvh/m1la/6pEZ0tQ/GOgG68+E+LycRUiq+bD3Iwkk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/TkCIMmBnQxPWxPF2qMZYVzCmn31CDUYt6k0CzRPEhcaQop/372ntwpVszp4hjIE
 vIVuuPebp/OC1i7cGxGjhjvFCBH+ZOpJXrqSfBUsLkg92qAaqtHe1oRjW2/LiLKRoP
 uV66KhSBbnh6OLWt+7k76XvCzSFsllU2Y5flxry9vND+O+lxolnf60O50XwwBPh+yq
 SoPzZkAnY4VxswfQ2GzN2EHfELa7v8aeYr2tU6kH0grOPrleQ/frQmRoOuiQC9upQJ
 YrsyZgnwacEkiNSykQCi1T9S/rE+RUrXs3/y3O5y2YsUSe/DVXEgxaJHuUZ1ya5ze9
 iTXQfDZc1wffA==
From: Mark Brown <broonie@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Message-ID: <20201204174135.GC4558@sirena.org.uk>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-Cookie: Not a flying toy.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_124140_208328_8DA5B635 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 alsa-devel <alsa-devel@alsa-project.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============1766878862915672679=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1766878862915672679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
> All warnings are related only to "wrong indentation", except one:
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
> [error] missing document start "---" (document-start)

It would make life easier (and be more normal practice) to split this up
by driver/subsystem and send a bunch of separate patches to the relevant
maintainers, this makes it much easier to review and handle things.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/KdM4ACgkQJNaLcl1U
h9BGjQf/UZkJEtI4D/7Y6K4QlL3HTskWfvSDmZF26Ea+sD/TdJ91T1YJulT15TOK
sKNLzMI5ERHHR+su1GGx0czMqpipoPYLvlULn6wLpL6fMbOx94cA+dc8Akr/JcjX
EfMthdqAlA+5P1Lz5FivyeWRk/B2YgNQ4+Pa9bbLW4iZogcNL2jZmN55GvBHYlSa
oyLVbN2YlJwy/t9b+c8mvlCGa5NyPDe5JmpplcFkCbn5DVZ9aFTHrGaQ0Ml1rv5W
DyyLnw1kpVUck0Phs49+unaEOb88Mh7FY4Jtsqz6SuqZDkHYZuWCwod5VHJG7q53
cpaFjB5+6e3/mAA/aRnxyzuOxLmoMA==
=82J7
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--


--===============1766878862915672679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1766878862915672679==--

