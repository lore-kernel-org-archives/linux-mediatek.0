Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A7CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 18:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E35206A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 18:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1zYNaHV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs/5+UaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E35206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g1oYtn/7A3jTHhzOFaCZlsIW5+Uqefs+WlmZJp4dtgw=; b=S1zYNaHVI8cImi6ONNTR/Enew
	ZtBpoFMGnBvsR0mwgQ2Gk+kWbW2H5JGY3fqPPYF85tD59y+DwFwaALi6ZD7VlZAo9ZA6fUikDIk/L
	/lXij9vz0OjkASK0yuN6Iy8UO5P4d+y+QfIhyIuNuWXvpVBiskJ+ZMZ+qZm10uA1NkUPhOiX1pmmV
	VFv7DnvL4YVq37sEknqWqkfRWC2hnDGbtA3arieQfl2g4hYghc1Ex8TEmuLKBVQHF3gZOI2qFxUDF
	2ciSjkDH0dEDlW0NALqwg6v1RqF6CuyjpQKgcG5UsVc8prQne8UAEv8vPB6LHEgS5UfGFc1cf11z1
	iA5lvbY3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jejYN-0008H9-VZ; Fri, 29 May 2020 18:16:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jejYA-00087S-Vt; Fri, 29 May 2020 18:16:12 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E96E3206A4;
 Fri, 29 May 2020 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590776170;
 bh=GH7xgOfWGLC1xYWHZL51BlZXClwRjmPTGXTEkgGZCAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rs/5+UaBczGURiLrYQDpbv1FEsswVSL+V7v/G+hW1TcMvv846K+Vqn5aLBaf0Zth3
 fKZGLUa+ZDpzeu3pWLeubWt+46pbK9QSLhmRNRxYJwAmddJfx/XAE+WX2bhO/qkD1V
 RDEIci3V4TGyCD05zXZeC4PH9tOmCjRw2P5giNv4=
Date: Fri, 29 May 2020 19:16:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-ID: <20200529181606.GU4610@sirena.org.uk>
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
 <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
 <20200529130539.GK4610@sirena.org.uk>
 <CA+Px+wVhXoU=BdBmMW0sdPtUrnQH+Kn6dkFdW-n67qEDGceCEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wVhXoU=BdBmMW0sdPtUrnQH+Kn6dkFdW-n67qEDGceCEQ@mail.gmail.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_111611_044118_21674FFB 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============1025639654634941838=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1025639654634941838==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oP9at/Ymg5VWhwKB"
Content-Disposition: inline


--oP9at/Ymg5VWhwKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2020 at 01:26:20AM +0800, Tzung-Bi Shih wrote:
> On Fri, May 29, 2020 at 9:05 PM Mark Brown <broonie@kernel.org> wrote:

> > I thought that was normal for DMICs - is this selecting between left and
> > right or something?

> Not sure what is the common name but use the same context here.

> MT6358 accepts up to 2 PDM wires for 2 DMICs.
> If one wire mode is on, MT6358 only accepts 1 PDM wire.
> If one wire mode is off, MT6358 merges L/R from 2 PDM wires into 1
> I2S-like to SoC.

Oh, interesting - so it's essentially a mixer?  Not seen that before but
makes sense.  In any case this definitely seems like a good fit for a DT
property.

--oP9at/Ymg5VWhwKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RUWYACgkQJNaLcl1U
h9DzCAf/eSG8ftQqt2zLUXgVK2VdTkdi/4wwtHrEUTnLh92NVK3qVJo7AlDSmwxK
nq/ophHJqVsYmeXUCott6BaJKspd6r+KnrnyJRupzBixtLTx573x7VdREPful5eW
6cVUHkoI0quLHqspblBrZFW0kvt6iwuol2dK0pIORn6rRiaaQlzB9kTmE1BI5Clt
GZrYuFcCzsW7IHYLPWD3Mbl9IsTFius8mjWym4jiglkPFu+8c8bgXRLJE7wGgoGz
x60eHOnNmXwuzOBkrao6njQPWLX+/jtRU5aw4mQ5csVzf662KRmsciNScxyWLHMV
v00PW1FlfI9AGrtQdlSKb1UMyO+Rpg==
=ODhy
-----END PGP SIGNATURE-----

--oP9at/Ymg5VWhwKB--


--===============1025639654634941838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1025639654634941838==--

