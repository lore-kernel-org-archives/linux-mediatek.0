Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0754CC388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:15:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824F620754
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 13:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vqNHzalg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpaowbDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 824F620754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JLxjEvWDCAHi5Z72PWiOj1clur2wzAA6R3Ik/ckBkVk=; b=vqNHzalgR55pGVg2DHzqzDl/r
	a2PG8izAxNyjsM+48w4+d0bbs/WhYE6w5bBNUn59I57pfyTYGUiFapYMQF67+5ztiBMfuAY/V91ZO
	a3Mb/xKbdrRBSuUfklTE4KRvBTlxG35hgJev3PBgW0nw8stepm8gC3xNmtGzLqC8kAK6yL/4PwuRg
	dSdAj3LaYrcHRRQsN5thqKy5K7JuU8ONR3W5D1QoUrpestgdD5PLYVeZsqzK4yFwZR6FKNDDXUEkB
	tEv7ChFY4NAwc+dLm1gofw84S4TCWLoI3fbVYuLgKhyaRYMCSxBLOoMsMBc5R7wk3O1FWUlYz2DQM
	DUvWtW1yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXOp0-0002t6-7C; Tue, 27 Oct 2020 13:15:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOow-0002rt-4N; Tue, 27 Oct 2020 13:15:26 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC2FF20754;
 Tue, 27 Oct 2020 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603804524;
 bh=CKo8KOUMplKS1VrSLuvL8FxdF3DDU1PHkPmmeQygRn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpaowbDKPCL8ZKLZ1CYaRphl4mwuEjsn3wuN+aR2nQeUruLgKyg7rAyYNG87W2d9N
 qNkTdA7YHzoPo0U7Uqmo5A7PtTwlgeMwVNcIT+HWZ/62sOStwIJmvzo7JTfahx2MA9
 TnOSpkOqUYG9TenOaH0QKJ2Yn/HutoXiIeEjf0+o=
Date: Tue, 27 Oct 2020 13:15:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
Message-ID: <20201027131519.GA4895@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk>
 <1603794538.26523.6.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1603794538.26523.6.camel@mhfsdcap03>
X-Cookie: That's no moon...
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_091526_271165_EB88F85B 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0714983752409389942=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0714983752409389942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 06:28:58PM +0800, Jiaxin Yu wrote:
> On Mon, 2020-10-26 at 12:33 +0000, Mark Brown wrote:

> > This seems like something that would apply equally to all DMICs so
> > should be done at a more general level rather than in this specific
> > driver, for example it could be done in the DMIC driver.

> So you suggest that we use sound/soc/codecs/dmic.c to control the delay
> after recording?
> If so, should we add one more CODEC('dmic-codec' and 'dmic-hifi') to
> dmic's dai-link? It looks link dmic.c has helped us do something to
> control dmics.

Yes, exactly.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+YHWYACgkQJNaLcl1U
h9A9lgf+PN31doFGHC7Emm3X2bk/3W8+ZvprGxuARbGdn20d4mbHrGrDUmP90wIU
dhB4VL04Mr+t2/7qLon3PfOWlzlCAyZ58pelvYwdx8Uqj5w9dBhGTobHXnadx53w
0cMC+BuJWDhr+J+7ct0y92v1V6hI23e4PCOk7QA2pLuE4iH6TQ6btK/olmXW9aDr
SJZxGryZCzriC19M7pxkULmHrk1A6DlDDpumT1dJ8/EUWw6SZVlzgt+cQykC0xhe
ZgE1HacS2EDS4CaUXj2mbUzaC+xDcfv5puAZoLDGKeVqxyX7/iTr9jCOidoZueJu
HhB1EDSlvibPjviYgtFncqKRdEcN/A==
=5+cB
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============0714983752409389942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0714983752409389942==--

