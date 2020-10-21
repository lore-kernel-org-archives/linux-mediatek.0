Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF57C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 12:39:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53332224E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 12:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MbEXD0A/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkxgulnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D53332224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9OM1ojyHcxUrr4o+9V5IQbdssdrBZpmPPOtUXguXPU=; b=MbEXD0A/aRFyjyaLx+0HPSC2V
	NuD/kBjX43HmvuPAfw9h1EeItNKW3Dp1aYnp71LQn8nsiMGw1bT88QvVFY6ssf+eW5OT0T+6807Wl
	h8Jf6PxhbNRI9msdkyMHnmkfxmcrkjJtmvNAAzuC+OTW8w2ade5y3Nua7Xjvbblb6Fb7tfC3Gys2N
	ALwDfFOwVj8Az1z51rNo5pcEALyxizwfudQ0uctvi9dzLN387oGSsEtMzHHDkcoumhxwMB8Oj+9f7
	pO0YNXAwQIBK5ZeyuhyAhBzPvmGrXboHJeENlPGj86Nm4Ut40Ev7+bvLV5gXLpjVjEwE5ZEjllF7q
	G1hiCsD+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVDP3-00060W-MW; Wed, 21 Oct 2020 12:39:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVDOo-0005uo-SN; Wed, 21 Oct 2020 12:39:28 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EE1422249;
 Wed, 21 Oct 2020 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603283964;
 bh=mWU0XX6TP23oXRtNhUtKZR9PQ/87umOD4p89GJOQWxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkxgulnNF2NFH9jo07oDU4EUHcw6hfl48FCyYKMbN/fSIbwuhDeBZjNQiRP4WeJVn
 B8QXAA2jbjmKiJc96KJ/3h4MnZ5r7rEFwrOTx6tdj9oAJl7UOSCPeJ3t17BykafjTz
 Zzm1hizSASBgt/k0uj2D29o+8bUuTp2GI6pY/12Q=
Date: Wed, 21 Oct 2020 13:39:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201021123913.GD4497@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
MIME-Version: 1.0
In-Reply-To: <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_083927_105396_9302AE20 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============3077938190710190861=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3077938190710190861==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 01:00:54PM +0100, Srinivas Kandagatla wrote:

> This is totally not very useful w.r.t UCM2 and makes it very difficult to
> common up parts of the configs.

> My suggestions are.
> 1. set card->driver_name to something more sensible in your sound card
> driver.

> 2. set long name in model DT property and set it as card long name

It's also worth taking a look at what Intel are doing here with their
cards.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QK/AACgkQJNaLcl1U
h9BbUwf/eOnrTlDEbw+QGCrFiYUmnzBGx64NN4D6F6QHebJyBsYrT6PB95nEpzei
/il7qT8KENMbMgMUSN4N3vMUVWAkrFYjtI5TXCjDvYy1h790B9UIPXyrq+1+hr3U
+KuyJJ4+adkM1dYEH904ynqdFapjo8DfVcD0YNZ2DstV8UdOnegpQP06Fygn7Vm8
7diV0uAnJrtMX74ezClTiKcTB6/Nl0B/ve5m9o8usTa9H1LL9v6HgGrqjrFhMS/p
6h8MzEw2zJS6+kAU//U8MNVBYAmhR7Urw93XHEx7gisLq3STJgnW0580I4lLHd0i
9/H/UCdqrnIcE7b8lByvQDy/V2Ydhw==
=jQZx
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--


--===============3077938190710190861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3077938190710190861==--

