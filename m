Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EEEC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 20:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73948613E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 20:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73948613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnb1CqU444HiiH7tfIZwNAy5PHOFwYDU9JI9Piz5W1U=; b=h101LF/vYbu51xEFz6JBB5h3BO
	729W40aKWtzvh/5Cb4VgFLQrpBrw19RIJGNbclkUHZF+rAW2rtRQtguUKEp3AOrOwc6fv5MRjl2gN
	ZrznMmTHpX63jdYbTYqh1RZp4Nhn+LUo7SjGh0HKNBewTHUVJvcGCvwRW3KlTA7xBZlFYJ/RK10FF
	d+KEflGtvGPcX1t7m/RikcZD88jUAAXgGHkut0fZsFVl0G9R861Ie5eTB6wkInjUrjUppsIxE9ump
	KOXSCaYVl9czGzCFum+o0qMVahEJE61QU93qFKlSi57RZU2u7iKktpOcMJcNy08qKUmL0sfhGP4mh
	MF1M939g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmMVD-009HGT-KK; Thu, 27 May 2021 20:21:11 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmMUi-009H5A-FL; Thu, 27 May 2021 20:20:42 +0000
Received: from localhost (p5486cb85.dip0.t-ipconnect.de [84.134.203.133])
 by pokefinder.org (Postfix) with ESMTPSA id DB29E2C05E0;
 Thu, 27 May 2021 22:14:56 +0200 (CEST)
Date: Thu, 27 May 2021 22:14:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
Message-ID: <YK/9wMhoACc0beN/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
References: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_132040_696072_F02B028A 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: multipart/mixed; boundary="===============4881260933268534871=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4881260933268534871==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I0LEN5JYjbsQxSJJ"
Content-Disposition: inline


--I0LEN5JYjbsQxSJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 08:04:04PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> The i2c controller driver do dma reset after transfer timeout,
> but sometimes dma reset will trigger an unexpected DMA_ERR irq.
> It will cause the i2c controller to continuously send interrupts
> to the system and cause soft lock-up. So we need to disable i2c
> start_en and clear intr_stat to stop i2c controller before dma
> reset when transfer timeout.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Is there a suitable Fixes tag for this?


--I0LEN5JYjbsQxSJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/cAACgkQFA3kzBSg
KbYFkA/8C40P82jqIEVljzAwazQ69azdDrsZ15whJ7MYNsuDsA2AZEDMn2LbI1KV
OgpanxfkKMY2q+3c6A6A8gJcKSGNFZMPLynIAUTNNS7bZH0WVe/O2IPCXEuWZE7P
jBFC7BOkSCMGpmbAwB2FnjGS3ns711st4VhMKRKEINvtFyXx5KyyBRLUxh3YnL6w
y4zj/i/dpvD4Hpppwam1xCKdJIKFscSr3GQsd2i58/ulSaHuC+e+mVI0O7M229vy
vRy9NSSM6p1kmzFsRrjBdsg1iqD5Jl+UazqDWpbHlqKw8/Q1EKVpjVibHrArNyZM
I4GwQDOkMqUmvse+YUe2WQKawH9r57Il0MnQTE02DmJcv9wzHJOYLwwEQXhyIuUM
7QrZ0CTsPeifWGbOinagLO3omauXAxGs4TocEIaOsyJKR+nrAsSCyB7azNsyILjr
SswVSmcASpGBzbu30ezENrDlZCTsho+e7Elj8slCD7i0M1ZGCaLVNSmH+n94RInD
qO1Ybpd0UxRrzMngUawMQxkzD5T9iGXrz/hzukm1C7jFP46Fqpe0j0T+vHZpF4D5
PgyE/aPc04h4wS5l0Mzlu0LTNPg1nc1sIqa8rQYZPejGSwkHqa1ekc8h50tRVkBW
E1gSM4n4akF814nH4JuJgnPG7lFmX5VhYEOd2wxoD9QH+DUXt34=
=AaA0
-----END PGP SIGNATURE-----

--I0LEN5JYjbsQxSJJ--


--===============4881260933268534871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4881260933268534871==--

