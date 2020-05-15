Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A35C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 09:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B732C206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 09:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmChbFtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B732C206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cG++8GBObvacSPD4hOh2nmw3yrkK10V3x8HUSHmBCKg=; b=nmChbFtBTzLy8Qevt+4jGKimK
	Cv0YmB6n9IFSguTIS9Ocp8jUeSarwbTmw++M0l+y/ZuKxyo8W+QFk0ZvFu5ORNcOaykhlIv86UYDi
	DMfd2mNA3xMEwxmIpV2SJirFZd1HveyuULQ/ykuasl4GAR/fbnijR37giwNdlaIJHENcKsRp/V+KC
	MlFirtGDnjHUY1BpinRmbQb2Su4AGoSXszPfQGPOyWYPF+/yvQcki4mkTHdTmz1pTLlgbq/mXAldV
	REGg7cM/yH9m2/z9RMojNIp9FI38Q+AeFXKeXtmqFXM5uaF4RBAyz1moIHzRHvw1tTTQcSTY80eW7
	dLXge6Z2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZWpb-0000IQ-Ou; Fri, 15 May 2020 09:40:39 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZWpF-0008LK-7l; Fri, 15 May 2020 09:40:18 +0000
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
 by pokefinder.org (Postfix) with ESMTPSA id 3463C2C2051;
 Fri, 15 May 2020 11:40:15 +0200 (CEST)
Date: Fri, 15 May 2020 11:40:14 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
Message-ID: <20200515094014.GG2077@ninjato>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_024017_421436_6EBBA4E1 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2815024161687050612=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2815024161687050612==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HKEL+t8MFpg/ASTE"
Content-Disposition: inline


--HKEL+t8MFpg/ASTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:09:05PM +0800, Qii Wang wrote:
> This patch adds a algorithm to calculate some ac-timing parameters
> which can fully meet I2C Spec.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--HKEL+t8MFpg/ASTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+Y34ACgkQFA3kzBSg
KbYUSg//XhO3MQxenuSju7wYsEkq/XyaVAfqH+foUu4RPONPXv04M4Owx+6UdCek
8EjevvFVM5f9Ir47WkKKJkt4mlmsEV8ndKjwZyY7h1A5Ocna2bQ15pGFxpQ20oe1
DT5X4s/7HsTQIubSWGbDLSujQ8xHjrT3kDFBfEh6HxBGxsuHNLCP6WjLTHZbFN18
B87VCpVFINlqCHiX/ZAKTHN6HSF00+IwENs3zMCKfE10cVuqF4OaoVNSvQyDS64y
w9erXur3M7s8ijhnHWgmSz0Vs8xAuPwWmzBlHYFAmh4bJxpFpMkDuPQU8n1aAffT
IijkylZYp5vuQu93n1tkShlo+MOgHcmEA2uCoCOb9jMJOFO6wM3AeBRzSmpTCtnn
dZLUNy7asSTYtTrEpXGmaKg2l1gEKDt3Kn99OfV+hrdquJyzljY6+Z4B4WbIDtIN
BUU+XM0JUVttFDT8Y03LEb/a49c1f+SAtzu3gmHnjwVajXwghG/xXqm1Ux8hKqcZ
BRowZ2LNDub5N58kfMtRifOXAEfLwl7gsrj6TnO9MkiZ8NpEyBJUaVK2pn3VWc+g
O8Mye8aADI4A1NPuexyCiF3awZAOiT7iEZOUWJte9VaOULGs51C8ifddMN+RgbLY
6BnDf0z49UE/IoTvvMNCoxE8/fwXd16eFvqUnq1UgY5lZRG89ls=
=SLRe
-----END PGP SIGNATURE-----

--HKEL+t8MFpg/ASTE--


--===============2815024161687050612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2815024161687050612==--

