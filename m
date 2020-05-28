Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC452C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5772075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 15:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrZCTZd4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="02+DmjcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5772075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thnI/MQ68yuTvbF9XebwcfVP6166GAUI6vLGXnPudww=; b=jrZCTZd4oyDEwUefWt486fLF1
	mrkw4SmLyoIh1dudEyuGd6dcNhipIb+BgHS4ENjC0WZJrO+QPxDmmxmZP2fjFJDz5wu3BD09H/LNE
	dtGMwAmD4nW9dXOMqt6vTQqn3CI21F5HKk6LkFdKNiZH1eDyXcSuh0qUXugjYdkUoVg7iLLc+BNw8
	plimNAh0vzbo7oqbh+i6FXPpseg1Rff4kYZdEgMsAxLHzEi7owqz1Rr1HFKrDqTUFRrEAaC1NqnLW
	qBGXQbtpf9ieGRfZ/51E4j1J9FhsqtBDeo2wGJ5+y4RqZCMZkuPMb4K2FcItp5IBQ1hy1dR4t51lp
	3lXrZh9Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeK7C-0004n1-RZ; Thu, 28 May 2020 15:06:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeK6U-0004Ci-BS; Thu, 28 May 2020 15:05:55 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1F9C2075F;
 Thu, 28 May 2020 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590678353;
 bh=+kL9LhCOGvjtZP4YPcHbUGU+IyjWZiXkw5UtPvN8QX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=02+DmjcYGsOPMYRrYToS00mFAOc3pQ4g19iM0Fy59nj933Nkv7+e5rx7sIb0VHqu9
 8O43OO/vO5hIdQFf8GKi98VPOXae2ph3gzrRD6ys5uWZHSb08fWbJnzp8qeg+Vnx1z
 0/J8Q79nSxN+47MxvnioDrdV3jHWdViSDcngxlSk=
Date: Thu, 28 May 2020 16:05:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/2] regmap: provide helpers for simple bit operations
Message-ID: <20200528150550.GH3606@sirena.org.uk>
References: <20200528142241.20466-1-brgl@bgdev.pl>
 <20200528142241.20466-2-brgl@bgdev.pl>
 <20200528144456.GG3606@sirena.org.uk>
 <CAMpxmJVB_L+otX2u80qwGjw4TXCJtwOXe=t11O4Daq3miMVk6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVB_L+otX2u80qwGjw4TXCJtwOXe=t11O4Daq3miMVk6Q@mail.gmail.com>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_080554_445032_28621352 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2359450114786228133=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2359450114786228133==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Content-Disposition: inline


--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 04:49:06PM +0200, Bartosz Golaszewski wrote:
> czw., 28 maj 2020 o 16:45 Mark Brown <broonie@kernel.org> napisa=C5=82(a):

> > The tenery here is redundant, it's converting a boolean value into a
> > boolean value.  Otherwise this looks good.

> Do you mind if I respin it right away? I don't want to spam the list.

Sure, go ahead.

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7P000ACgkQJNaLcl1U
h9AAggf4sQcyJHFUloflyzh/lLpY4EwFcuWbYHkDTzIGPDOo0qxyNCuTANexUK9i
0rryGP7sH+5PPNWfafBj96tM6tU6efhmBlMm/rz/LC0aFvi4zSf1tDZ58UeDUJ8j
CgEl1VwNyYXPOZ5Pyn1LyRddEBtBuohoC9+3ioc5bZKUT69FPscRSRDsqQ92fe2C
ryplo9IicX5u3ztzQKa00PhLqvPMMiJD+Q1D4siBOXy4M2GDESYc0WSJSPrkizCH
u9DaLdXZFPRpVpyKumF1eu60mtaZhS758X9gO3GHe+Vd+bng0C5ShbJ2w3rWcvsf
AFB+my302HXqBrtpIsfJs877uHpg
=efX/
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--


--===============2359450114786228133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2359450114786228133==--

