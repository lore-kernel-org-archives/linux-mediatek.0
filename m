Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242CDC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:06:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7BA207F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHsyPbZf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2sCbN+i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE7BA207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=axoUNOebVHoBWWZat76uO0Mmwn0+faqCnDFBWE7RvjE=; b=dHsyPbZfHiGVTsRKtzIPkMo9v
	id1r7jZWFVuLwhCHxNmDFX6YKU8RuSHcTfkX9j1QrldhNrqmyGPenB3GyiD9QRCr1Avev0+JhBuaG
	KUYjOzUzES9RxIo9wdrPLkCKAw//azgwneHvyQogs+UFC2L2oMfi/fmubZnRsj0pKFks9ZDq9TJ2U
	VL89/LF54XNJjh5gIo0ZGAwdcTqH0LbQeyAyohhLZQwwrK/N0d8kZ9JRIHV7vZiieTwLPy/8SZNre
	sTqQiGw/Xae/hhMMjHTUn6ZoZN2zEl/Ahho3fxzV2Gp9tT5L/ajBLJlvGBRysFns153S+4xTMB20U
	A7LPYd6oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeeiC-00038y-H8; Fri, 29 May 2020 13:06:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeehl-0002pJ-QZ; Fri, 29 May 2020 13:05:48 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B714E206B6;
 Fri, 29 May 2020 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590757543;
 bh=iujYvPFgp+kMyGs/HHL6d27m94u1qo0gtVVFdFB0M/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2sCbN+iq+BEr27d1TkCSeB+hJjmmTUlzYgQtmKUT88ehDy9jx8UgGGIPErHPLR54
 C/vcqmkGF5HZUV/dHn3msmqyvaFSHcBlTibGinAm7Kw+KMrh27uciL4Etw9ZyxZ5Pv
 HrKoTIT7/v9KH+mx6J/GeAsPi6tuIjURhuo22PFY=
Date: Fri, 29 May 2020 14:05:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-ID: <20200529130539.GK4610@sirena.org.uk>
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
 <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_060545_891832_95EF5B43 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0589053147185792077=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0589053147185792077==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 07:22:43PM +0800, Tzung-Bi Shih wrote:
> On Fri, May 29, 2020 at 7:09 PM Mark Brown <broonie@kernel.org> wrote:

> > What is DMIC one wire mode?  This doesn't sound like something I'd
> > expect to vary at runtime.

> It means: 1 PDM data wire carries 2 channel data (rising edge for left
> and falling edge for right).

I thought that was normal for DMICs - is this selecting between left and
right or something?

> The setting shouldn't and won't change at runtime.  Would you suggest
> putting it into DTS binding?

Yes.

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RCKMACgkQJNaLcl1U
h9Dt/gf/avkSzsxeit+z9NWHGp2tenf6Da8cB10e6pe1usBAJnkn+iqx1Si29kpO
V/fPJbNJY31D3PVd9dnyKQs4ASO+IbdUS2URSUDI795vnUy+fZ+5gu7CWoTc9LVy
PvRBFNaVmKrSxHTR3dgeFs3Ehf1cTKnxhL3wXnqg0WrN5tXSzChYnsjz7vHs2aqo
Rt6eiUaP3GKEyOLUeI/ND7iucB6eWqh/1RcDuGobJNZkhaVnh4Vk2RbbbJoREPki
ni2aN+zVokiZj+JywoG5DP7488T3JdEjWJ84dHAAtb9QhQoZwwO75nHWXhPvRr0q
ATS32LCIvu4eZCYa7kNcUqItzPKNDA==
=TM61
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--


--===============0589053147185792077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0589053147185792077==--

