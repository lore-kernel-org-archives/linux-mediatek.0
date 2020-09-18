Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE76C43465
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:53:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5891421741
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 20:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KsQ8sAIs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5891421741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t8Ifj9D1CaJWRmxTYsypoB3X3OQaeOOHHdhX28eISag=; b=KsQ8sAIsvEAla59fD1P27b67J
	hYdCiQcFy0tQ90nJA+GMl/b7B8MTCR7qWDzGJSTFQ0Qxr/yyGFLGqQlyVAaVLy3ugWd7tGPRBGN9q
	sAv2CStRzwInVSySW/K7AUBBvWATFAVxrwLfrEWeQxonuskhO+2ouya9rO/cOTwdzBK6hPNITeDoE
	zhjewJW+lwnwD7fLFbBMF2zfKUqKYZDgi2bE3A5UKaf5JkoKZTl/xMmGqELm6qOjDPCn+Yrin+shX
	DSop97+MC9LI7j5Hri1ZYgpjLjX8jbYkBMa5QXUoWnN9WcUZPm0MlgRyaoiGy6cNZofANd2aVxs5B
	jGyhukGkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNNF-0003IA-Or; Fri, 18 Sep 2020 20:52:53 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNN0-0003DW-PN; Fri, 18 Sep 2020 20:52:39 +0000
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id 470352C1730;
 Fri, 18 Sep 2020 22:52:38 +0200 (CEST)
Date: Fri, 18 Sep 2020 22:52:38 +0200
From: <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 2/2] i2c: mediatek: Send i2c master code at more than 1MHz
Message-ID: <20200918205238.GC52206@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
 <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_165238_965474_B506F9F9 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: multipart/mixed; boundary="===============7843137603796800698=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7843137603796800698==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 07:55:42PM +0800, Qii Wang wrote:
> The master code needs to being sent when the speed is more than
> I2C_MAX_FAST_MODE_PLUS_FREQ, not I2C_MAX_FAST_MODE_FREQ in the
> latest I2C-bus specification and user manual.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lHhYACgkQFA3kzBSg
KbaJbxAAo4wNNMezn5vLQeKn0+GodAJ4sALS9nvYJO8arUk+0fSCI6MB/+5BOV6O
HwcsUHUhfqdg3XnJ1m8RcrS8sI2emNrJPrijm8PYs8xNt4CbXtuc44EZO0qKiQMO
9/fBln1+jfPwymPForcFycETkBAVdBbv7+pYYLcl6qYASyLzeMq64d6TS5V9V9Oz
USWK4dbr7Ynewi8M6aWL9p4c0wEB3I8bTpf2ZDOOQvWdyGfS547etpDOEy71K1+Q
9AVDHap40DjgNoysvKow/DyE0iTyI4zzBqqrcZARSguYVYXX/bmlRnmCCXSYKllK
86ikJeKM6/Tn4GOTo3LJhDT/LD39PdYxmfe+AjUvyjFUwDQ8E771DH0RaiNbLNrU
hIdeNB45ZD1zqRr+E6ihBrgDO+4e3GYFOtyD+ZaJuhaSaAHF8XUCY8+6m/eP86ix
wPlnSNvzm6rhCLJWIwQhC0NSlwlWIyOxosMjCfb7C/gx8dMJnn8IEUFnI0Lph8g0
+bS690O/1V48iT6FSIfGfAebQvdiddulj2T0WMNZxyfuTZoCBlETnE7J8tLNcxAu
/zEupaGjGgR23I2PpiifPOfLxUZRTn9HdTxPSaN7OiYswNsxtp/7Hcfl+a6NBfdd
xBfjNHfIkct66H6kzQpyfQyYnMHNzecGxi5bdvtXbfC+b+ztlM4=
=Fedd
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--


--===============7843137603796800698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7843137603796800698==--

