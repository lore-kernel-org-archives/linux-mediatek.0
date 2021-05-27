Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9841DC4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 20:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA7E6054E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 20:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA7E6054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMNiaA9ktWL6b7B496H7ZB3oQWne6Yat68UXyTOGzPo=; b=heVKKr1mm8Gch4nUe5cRQM2Dx8
	DiGliTybPMpVh//fMsjKaJFppD71UGEYSJMOZFhA1+ctobC5KyQlUaDm+FXlOfvaCYeFiZtjOPXIS
	+lavBPYgASLiDT7Q0wU8AnejGtBh5ExoGl78gEyJ2r+eEAK8kg8NlvCnF9xFlX5zHkxMPCw4g+8+S
	q0xUq5oqlJFFbr3B4GZV1NIQGpdFSZInMedQ5MvSoeStIZA+ck8oLeNV0eWU8kN4WWQttQUbNcOOb
	oQv+Ce1jlODE99Nb0wW97qBsFoRYQWa6xquY6u4ccupSt3NbjEfsi40nkrZTPhyiqQ5kBhO8pZLGD
	mhzaiCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmMVC-009HFw-Oi; Thu, 27 May 2021 20:21:10 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmMUi-009H5B-F4; Thu, 27 May 2021 20:20:42 +0000
Received: from localhost (p5486cb85.dip0.t-ipconnect.de [84.134.203.133])
 by pokefinder.org (Postfix) with ESMTPSA id 1CCC82C0548;
 Thu, 27 May 2021 22:13:02 +0200 (CEST)
Date: Thu, 27 May 2021 22:13:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Rename i2c irq name
Message-ID: <YK/9TUCeJ4KK2iOT@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
References: <1622115110-7051-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1622115110-7051-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_132040_686752_2D3F5EFD 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7245226741175770691=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7245226741175770691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sILsGz3QvM1DFVBY"
Content-Disposition: inline


--sILsGz3QvM1DFVBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 07:31:50PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> Rename i2c irq name with dev_name() which can provide unique
> naming in /proc/interrupts for each instance of the I2C IP core.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--sILsGz3QvM1DFVBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/U0ACgkQFA3kzBSg
KbYx6BAAkWj58w1lFsKaQkAp5AXfhbhvCamckXfqayy0Ezqeo3McWRJ/xndBAP2M
kr+SatOISl5dFYUm6QKcoOxfzCHtz+BqSFW/Qi8lr141mizyc4dR3Pw9Zdjuj08E
D1IIT7xEK6OCCDpgpgh2fr/gsaZ6vLWeeA8775Wc/2KN5XVDdP7lVIFVG1adTXEH
ucip2ZHgzI0LXYoVQaFyQZuDccBgkqX2iIHvlFkW+f3ikI5x43APXwX4++Kt1cGw
y3Jpjsy7Mu7e4m/AW77CqE0YSkAXRqG+ka8eSCtuT6wB8rVSZNOJnLVubt8muOic
yJcPy6Dp9gv6PwD+TNttz6sDB2ZO2I6ENqNFE/RZQRziGCBAMhAm23zuir0wHbyY
WbK5HZ0Ge5nHixHNUUezwKuQFusTf7aXV+ZIl0H86N8cMgPrWvH+0GSjeApH+Aq9
zfrDLOIL1Dzx1HWkmeEqXA3S0ZmlDhCLOdP/gi3gkPoOJU8PdYkbonFQxgeCdEiJ
1e/sMvpe0PSwAc+I0W84FEIyxCnhZTgi4Vf4GSWYjC9Y/3hDXri0flAa1grBxezN
4yAoC63A6Payws0xWLtPzUrHTQsNFm9zHuTo5ehVYBi71kEpViXZAHmnWle6lOGJ
PuSspzq81THiIxCSRwSwSTmyOt/JG/gEeSrk1CHMD3IZmGCq9F4=
=lM8p
-----END PGP SIGNATURE-----

--sILsGz3QvM1DFVBY--


--===============7245226741175770691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7245226741175770691==--

