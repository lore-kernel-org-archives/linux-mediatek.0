Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6C9C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 07:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECB82173E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 07:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ohlJ473i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ECB82173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Y+twSQetOmCbTciNspFrwh+tmXbvgC78kzOMwVOkzo=; b=ohlJ473i2EeAef+AdbAy+oVuk
	7oSp3pV1uZ8qaNSmBk1b42gZtro0hx9mRszmLw2HLDjiFSltmOx3z3myRmfwWBpC0kbt3jqq53Ah5
	bqE406uptOxRplfZ9PR+vqGrTjyjAe2+4AkBT+mP1+FyzVxXSSNB9pSPS0NsLSZ7wXz97f1z5MWYc
	pk1RKc2WMX4ekIem8Q5nKOVsRLIR/NTrRmDu2jyrziUEa1m97ynZK7kmQs1xeubB0Du+6xPzSEhhF
	8rqA3u6BPkrCmrVNWrFPhivRPy0ObHqSvsWW3Ser9I3fDj686/7PQHZNIzefNl6Qe6w8wuf9hVwlC
	istG2EqJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSFog-0001qi-7Q; Wed, 06 Nov 2019 07:33:22 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSFoc-0001qF-6L; Wed, 06 Nov 2019 07:33:20 +0000
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
 by pokefinder.org (Postfix) with ESMTPSA id 8C8C02C04C1;
 Wed,  6 Nov 2019 08:33:14 +0100 (CET)
Date: Wed, 6 Nov 2019 08:33:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/28] usb: common: change usb_debug_root as static
 variable
Message-ID: <20191106073310.GA1085@ninjato>
References: <8cb137d5376b4e317dc22dcb9e81a1125b781f8f.1573008519.git.chunfeng.yun@mediatek.com>
 <79fd2ebd-b8c6-ee00-c71e-782475a20de6@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <79fd2ebd-b8c6-ee00-c71e-782475a20de6@roeck-us.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_233318_534395_6CD01479 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Peter Chen <Peter.Chen@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mans Rullgard <mans@mansr.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 bcm-kernel-feedback-list@broadcom.com,
 David Kershner <david.kershner@unisys.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mathias Payer <mathias.payer@nebelwelt.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Felipe Balbi <balbi@kernel.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Dmitry Torokhov <dtor@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: multipart/mixed; boundary="===============6774207778539443370=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6774207778539443370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Did exported variables run out of favor ? Sorry if there was a
> patch 0 of the series explaining the rationale and I missed it.

I neither got it if there was one. If there wasn't, I agree a cover
letter makes a lot of sense here.


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3CdzEACgkQFA3kzBSg
KbZnCA//RT51F7sQomza3c0j4QeRf3myleT3r28hWQ6/KnnDEZiANAUVrY8BHZ7N
2PepoJXgKN/NUtsBqZiPgF/b4BVmQbgg8FVD2mpdJ/YzBWXMNdv0ViVIPZxwltjR
nmPAqwpc6YrbNBAK8WwqVtfwD3+ppO1FLjWRmat/D5PQT9VsMalJS5dVxp/phkrS
17oD/+infVnlKhxZgO+vUysKbsqiVt06sbszkJzC+OMyFX2TLyhLXs3rrIhXcI6B
HiP9n68R2QBWGGGp28h/637IqK6jaD8QKaeZRmfyogYneDmDTHbT/rH/rnvA6tIM
7ZUVKP2gseVOiZb8aaBi1wdaNRdrmnvG9mSjTroBU0fnTHS+nZdL/ehTbr9zToL0
ih4Bat8Y/NYR7c8M1uY/bvGen2zbGhaEz2plEZC5NJowZa6ly8bk+sLTIvfV6GCS
XBJvdiGECdd1oM8ibt08JlVrTYZp3Lt1AJFErx5K1VOdwqNly9qofJtE8oxT45Qb
aGqMPWOB0qeP0aUmngTs84X/1hjwtq0pEKb0bs87YBTIK2wR0qOJk4U56o2vZ88m
sq0IQ/5Ikho8M51zRHwpbicI4YTbD4g95aclTT7MtfdADPEY2QU1YhrHlVkEceBk
VhDiFrgtfvVMc2si7TL/MBPyjvo3k+ncZQDZUDi/bYTsF6qMXf8=
=lqw7
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============6774207778539443370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6774207778539443370==--

