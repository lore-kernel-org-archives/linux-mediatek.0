Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5DEC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:07:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E4461245
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 20:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E4461245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4wUZlAmZcvHlRwWmUDUkVZWRQrHS64qvcl9JuFLKkuQ=; b=i3t6cteQvHkG0SLMh6R0o9NFc
	2FaDMsOxh4lrrCj0adm/tzkzET+QUuCywokEdWLsDjwsAamuczNh7Ia9RLFkgc1mb8XfU41xXYt2t
	e6Au3W6VSibEmE5wjuO2GIRLwtRzpIP87kmaADgiy2C2aF/A1ANqgE3YFrKr0nm7rOZYSna4CF4+9
	/2plqsqFhpKnJEx+zsr0vWAjPYS8lJlZSmJYvypMtGIQDqDeLGkd4j0J91w79bM9Q1r4+F1ZsbzAi
	l4ZkqhWPXWHGOyLdUgr1i1STVmsOukqAF7OZcPN765B5x7vpCjjEZ6LVtRZ0qi/KhfekZO5nalwJF
	dr/GcqPcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXrDw-00691W-9t; Sat, 17 Apr 2021 20:07:24 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrDh-0068z8-6R; Sat, 17 Apr 2021 20:07:13 +0000
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
 by pokefinder.org (Postfix) with ESMTPSA id C437D2C04D8;
 Sat, 17 Apr 2021 22:06:53 +0200 (CEST)
Date: Sat, 17 Apr 2021 22:06:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
Subject: Re: [PATCH 1/3] i2c: mediatek: Fix send master code at more than 1MHz
Message-ID: <20210417200651.GB9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_210709_369460_EE65C428 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: multipart/mixed; boundary="===============3147247317933235615=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3147247317933235615==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:50PM +0800, Qii Wang wrote:
> There are some omissions in the previous patch about replacing
> I2C_MAX_FAST_MODE__FREQ with I2C_MAX_FAST_MODE_PLUS_FREQ and
> need to fix it.
>=20
> Fixes: b44658e755b5("i2c: mediatek: Send i2c master code at more than 1MH=
z")
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7P9sACgkQFA3kzBSg
KbYszg//Ys8QY2ABRS7HhCXmy+h1BQOnBbmvO2Sk+srldLlKEV3XxiGXAMFKxDUK
alfu0bBeTL//v7gGJoHeoDQefjTfpje/mGgRrROCiInSE4gcVPohw5gdr4WdwNKs
FcUH3HldvjVETlXkTYT0lDitFmfFgcY34HvwXxZoG2fPGhNtmxNCOyCE+0P5/dvK
RX9KCDyPqh5nRRuTx3akh4xRUYBaGZ2T2sRgHmxFdPRLXAePtP2PBBXonAOzCFhD
8G2OmCqwjt9Iytem2z3BvBbPAt1mYqTtoHlZPr5PRwxJtp+aGoHhg3J/6TTBrCM1
P0tyMTGPIwwgvu9NnfM9zOIiWW5dmvsM9hPsLirwKM87Hf5qp25ZIHA2bWrS8M/U
Fwwo1mZjmpcaTIn1MRoa0JDX7MDiKwIpWgF2yFUHyelnzdyIf+bLifQCjRPRGBqF
wsOR/t1Rf0JnoQguoWcQLqqvt0KtwSZZGZUaM1a2Mpz/wi5QRzwvhJsZ2ZfqBcvt
rg+9XtmgmpEhe99e+ElwAbsqFgpXB5VGDvmI3+F+61OGF8vh/P1CrN/Vhgpl8qy9
FtAQmBFDW3LpFBKyrsRp8cZ/Ht1RyesGksRM08bX410LF0AUEQ+csEKQVm9rHr0d
zD5toVtXz/KkWW2OFS1/LZDLvrDvM/3cdFosBDTsNqqcbb4Q70o=
=2+Jz
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--


--===============3147247317933235615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3147247317933235615==--

