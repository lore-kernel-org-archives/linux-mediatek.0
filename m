Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2245BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 21:13:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0074D20757
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 21:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1gzix6U3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0074D20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1pTZI+TuT6ORA4CU06Qds4UIA0wK/wx1PH2+0IHksSU=; b=1gzix6U3dVkVjH96eOdDs6Dgd
	VBpkfxPHZSqgddRpuHI0fo46Y9rsoB3t+PPsFa3NMmPR8OBEC1CItE2FcDnpfQMeX6dQi0ANH6XNZ
	l5DC+7RpAsVBeornmc+sHfiBiAeHJ9IPOTPfEPQeP/6X3f4NGs/zZT6Tdh+jC0wcCn0CBeEd1xgoT
	U9dfiZdNIlbt8AyCtfMy3LLyost1EFpcnaQhB41oQ/5704YSOjuETAWSVpbCkkcFSEICIqWkhvU1V
	bp9KS0F3Prvm9m80m8rirkEe67a81WzjJYJSLhL+DeYmGE1W4Awt68UY/krqnlIF7gybMEBxlfNNm
	buVg28U6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka3cJ-0003O2-IM; Tue, 03 Nov 2020 21:13:25 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka3cC-0003Kb-R3; Tue, 03 Nov 2020 21:13:18 +0000
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
 by pokefinder.org (Postfix) with ESMTPSA id 4BCBD2C0561;
 Tue,  3 Nov 2020 22:13:13 +0100 (CET)
Date: Tue, 3 Nov 2020 22:13:12 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: qii.wang@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: move dma reset before i2c reset
Message-ID: <20201103211312.GG1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 leilk.liu@mediatek.com
References: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1604059081-28197-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_161317_028603_E43FB696 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5349715694751468194=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5349715694751468194==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 07:58:01PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> The i2c driver default do dma reset after i2c reset, but sometimes
> i2c reset will trigger dma tx2rx, then apdma write data to dram
> which has been i2c_put_dma_safe_msg_buf(kfree). Move dma reset
> before i2c reset in mtk_i2c_init_hw to fix it.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hx+gACgkQFA3kzBSg
KbYX6Q//ZGVdd7tkdj2nWfdk4zLv7XxhsnNc0yRj5kGzxUJKvKNkQhYfnhhxFMX7
HPEU0NIyBcT0NniiLqHhqAvAe91PNdUt2rlaD8zoWJkm22nBHH06IO1XBLglK6Ok
9mQWJ/h4E9SZVA7pPoOKQE8XDdD4Th767jmIDQ16xvo/YyAWu0yxwMep5ausuIHr
RT2MmJisrXYHXXMDCVBkgBrD2UWR8XjNVrjap0aMfvdEb5N35BxsEB4BO3472XKI
Ex00+kTjc+mFbwOtMTxtjVnOqW9fqqYu7indYah0mqDX5W8XUK/Ztuqi1qnQ7FBE
4X3DXxmZYGBgMBYfU4oQYQJDbCu/+X7hljgmvZ+uobhnEMIBIcRZ1qgNIGG3/my5
9Xdzvc6fKdfZefYc2cUFoJ7EpLgY+KJP/oKEhYQ43y0ORN0ZWdO2eMH2GUOJdhhd
9YH1lPPnZQcvCkt14U5FYyDCT2ZnbgTcZFo9TgLctlNqdm2o7xTYokbwmbooBx1m
scA3peUJ+OyjQJrIX/b1+I1uYdh2v1Z/WRnIEIt2fdf+cBJGUEOC6VAP5v5FRO2M
Is7BlkZnyuLXMyIz3wHYng/ivGqE2SPrO/JYk3rR2O8w+8dn/2HWOsZsyydyKa/l
GPuN3WQru6TiDeD7lYTjRqRjl9jGzkSETQFO9jtdiTy3Wu+4uBk=
=YC2K
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--


--===============5349715694751468194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5349715694751468194==--

