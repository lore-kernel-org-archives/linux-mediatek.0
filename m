Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2647EE020C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0qSPmLbYOynCiSC+iECHSi++ruMZdbX9dUV56YGpAQ=; b=pj/tejjQ4FwqGq0JLldtMQ2iAW
	SdiVis4E2cIJaCxluZjOHQk8p6QUZN1ZLp7k0TbxzuOlT+Q01oP5QMAnZcHME6bS+Km5XtmY+CZyc
	AmXyXED/CVcNmdV6qw3WDWETK+Hu3pFNTlRy5fiPgcmJIr9JMoKDBha3ahPU7cQL69r7trww/YshD
	ZzrKiJzNJk6840cXYhagCdLm4JTfL02v54IN1AFy0ipP7384+AkdU52xYrhSe3WH6dUV4uQ+eu8Ze
	ujS+DnOzheZ9Gj8/9Ig41N0tACIHMcdmw+hlhQ2jHArk0w2cIKRbijoGmnVffrSfq8RUznjxZCeQF
	FRFliHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soM8e-00000009PWb-2fOv;
	Wed, 11 Sep 2024 12:08:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soM8b-00000009PW8-3qTA
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 12:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DFCDA44CD9;
	Wed, 11 Sep 2024 12:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B36C4CEC5;
	Wed, 11 Sep 2024 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726056476;
	bh=LtSntcKQsfPx+S5sN1yyCdCKm9ZA925LdRwDJ2opgDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/L3CCJWhxnYvKa0fZyz1vpuILqDQAOF6jH8Zxftt7eaxzwA9Sc8SQiBEyqDINzyy
	 hXPZ1wqRrGyoaE5a/fDyRzAe+cKsVc96BwGtGmOqodHPRAW93Cdrjd8txRP6fr8jhd
	 XCBM7wADLBoy1x2wJRjV5mHIgQDUQ5oeuPFKgYFOvTxv1kECSHIT8z9R7T9scrR1/f
	 HykP0/sGY1d7EkrtInq0vCyTusLTwPTBFk3KgVyZzJHoK9DRG5bT0S6XXIrcPfcpw2
	 hP3NszPduDeXmROUDPNPLNhuER10+K5f0tmXJ4PxHD+KkeHeMttzuD6ruNz+ihewpU
	 K3gGvBxUhfGeg==
Date: Wed, 11 Sep 2024 13:07:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <8d921122-7271-451a-8bcb-83a1066b7b87@sirena.org.uk>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
 <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
 <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
 <eb21bcab-333d-4ab3-9222-058764ced720@sirena.org.uk>
 <ZuGG3jk6oqq7sUMw@iZbp1asjb3cy8ks0srf007Z>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pDxhccTIA3Jgoyb3"
Content-Disposition: inline
In-Reply-To: <ZuGG3jk6oqq7sUMw@iZbp1asjb3cy8ks0srf007Z>
X-Cookie: No Canadian coins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_050758_042881_DCAE4ED3 
X-CRM114-Status: UNSURE (   8.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--pDxhccTIA3Jgoyb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2024 at 08:02:38PM +0800, Qianqiang Liu wrote:

> How about this new patch:

That looks good, thanks but an equivalent patch has already been sent
and is in my queue:

    https://lore.kernel.org/r/20240911111317.4072349-1-usama.anjum@collabora.com

--pDxhccTIA3Jgoyb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbhiBcACgkQJNaLcl1U
h9CP6Af8D9dqXjGlMuaHcvERZog4NrmsK6w85EjZUpKZ+rpKIiEj0psKY+7oTXjd
+1h1SuuRBNz2kzAGZ/gjSeg/r7ywekHnhYi5onqF+NsnQJUhmFhNmT6V4oZVtjhE
cVQ3InLJ4BHtzgmUi8XYTgSFSvIIluGl3e7WSThueE5ioHtcIUkxVgPpWsISPOCa
+h9Dax7DRS057Aq103ShsGxmgfm7K3fdspQO4f2PM06R5bwB5ER41ylYm74Ecstf
U6x2GGo4fxOdPegvz+PR8BMttoS89Dx0mZyoT+1E2tncOATnV5nDamLxUHWSyGjy
tmbJXBwmHVZkYIndWKacNSQe2Fi7ag==
=H6Fx
-----END PGP SIGNATURE-----

--pDxhccTIA3Jgoyb3--

