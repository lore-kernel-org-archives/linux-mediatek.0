Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE29C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 09:05:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4022420792
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 09:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5ie/J8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4022420792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PA9Bl/0jCB8gRgr+genoxXbRqSH8PsilOCvwQt4g/Xs=; b=G5ie/J8oxL8AQXFT6eZX9tP3L
	ZtghtTeeqxisIASo4BVMWnjddaf+/gM6Lwc8r87o64gqTbNxJIVQonOTEswnacAP919oZ3PpyXk1U
	UFHEWLvWNgb4vLI2gir9u4Jy2z85B1FyTvYCrSWXht1QHTR4lLAqUSoVjwVIyTAhjYDnf+ycfwA+7
	e9lHMQzOah1VP8SvuBe0BWAsKJ7fsQKMpuzI2gv+G33ewTBXQib9P+XDOesRKkbIgTGQoaE0ix7sD
	PDnOdLlKpdYiciXecGeStGUFRAAaETyU1LbwZM6wsZ2RKi9PncXZBzRFcTgY15jSFjfG6OaQibd1m
	SDUpQzibw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3FMA-0005Zi-2N; Wed, 05 Aug 2020 09:05:06 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3FM5-0005Yf-Ty; Wed, 05 Aug 2020 09:05:03 +0000
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id C67C62C0829;
 Wed,  5 Aug 2020 10:56:34 +0200 (CEST)
Date: Wed, 5 Aug 2020 10:56:34 +0200
From: <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram
 in i2c driver
Message-ID: <20200805085634.GF1229@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <qiangming.xia@mediatek.com>, <devicetree@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
 <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
 <25ff4899-5e7d-f6e5-599c-4bf368a731e1@gmail.com>
 <1596010499.4371.3.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1596010499.4371.3.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_050502_141345_BB8F7D4D 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8498775927279925226=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8498775927279925226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> > > -{
> > > -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;
> >=20
> > I think you missed my comment in the last version:
> > I2C_DMA_4G_MODE is no longer needed, you can delete it.
> >=20
> > Regards,
> > Matthias
> >=20
>=20
> Sorry for missing that comment, I will remove it.
> Thank you for your comments and reminders.

If you send it real soon, I can still include it for 5.9.

(and please guys, shorten mails to the relevant parts)


--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qdEIACgkQFA3kzBSg
Kba7Cg/+JUqvW+SS4lYtyhkAsyAQbKl2kRygi8PEJ7f9Ag9VkjtcvgcxHaycRiOO
VXEr7OeKRzQpj0RSYLJXuEDfakHyorDNRDZGPBdLMrMsFh+xhuONqsv7chAQ8mhB
ZqAJpEgVbUTlJKL3Jee2uAI69e5l2Gn3lz40zBKVeCwVM6HaNNzgxdJ+saDA/PjM
p9ITszYHi4/DkA2KqeKFAW/NkQ/u1hPPqmPVmTgvj1Ez03w73rKEEUIyIF6URwOU
jVazs7geKM/IaxxH+Zz8qwRy2t2AmqxAHKwM4WN+XT/nbSPAH6Zg98xLkTS3wi7k
T3shPDV/R6al8+aths8ph0rf3ejNRoXTKx3FZzzfK9o5G/jmZqc4jz7PLgLxaTd0
+dcM46y/L30W0JfPJOKFswvycaOn8Z5/p/UAPzO8OF5hpG8r+6Ti3Qrp/lUULvP2
cs6g5Loma47PFGrSM4VZqldJq3YUHLZOLF4Jh6H4b8ydigBXHrTdLGNlMm3dco8y
3f/kg4ax5CwOrYy/bx+m8s9ZCdaEmGWcm/IIvrpMK2kKzBBOt8/Kkd3sG7kcGnwN
zXHfJvpW/ognlMwSbfqO8SopyqtOHpmOnJDioNfgyzL7fO/OMjtKnnuw2kGz+5HL
nRFdfSmAyrR3us3/xAH0VuKnGlSuEm/B8x7oxrhh6byZYsBQRFE=
=xphH
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--


--===============8498775927279925226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8498775927279925226==--

