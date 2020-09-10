Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3833C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:03:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8563620BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 11:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2XF6I852";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="18mUZhE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8563620BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jd2pnthWIAx+XhJ6qlbFs3meNA75hofK1y93qS5uAcc=; b=2XF6I852bF7PJFbOTZ82wgnjd
	OgjUmMBvwAEHgA93d2bkQpwwWyr6WaTxyoBenIUQG66jGEV0Fd9ezEr1QFDGeyUSvF5dObUE9aGyM
	jbc1yZUPncuDxceM8kBNgevnIG76TIrkojV7CcvxYAFOVg1DmzUcRKHksWciUuUPUI4H5MzxCjDuT
	9Zy7JFARhYISOeuzkie/SjDeclBnBYEN7WLqfDkLQ9knUETuoqOWEnI8qm9XpbMKdDOFXelMiK8M+
	/9/UpSmzbGYc2+WsMau7a02tEXwmEzj9o7IpgDL5B3aQwuh4+NsfpEvj3d0iMoo2RAWgJsgp3oV+/
	wF4VJhQpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGKMY-0002i4-Kl; Thu, 10 Sep 2020 11:03:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGKMS-0002fy-Jm; Thu, 10 Sep 2020 11:03:29 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2DFF20720;
 Thu, 10 Sep 2020 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599735807;
 bh=dmrwyQMyeJMFMQp1EmqKFdckpq9rAe0lbenAUyImoHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=18mUZhE89SuUR9AkRIvaLcq0CV19oM50ifpHaALiIug/IWYJwyy6/yKbEXGWUq0e2
 ySMgHwdgAHR53xxhtsjqglHPRZ6z18CuVQ19qtjnOwsiniC5WkrCRFiC2Lm3RUg9ox
 sGG3YwHzjYvnF+tl2rakOguBKLp+KG5CEGtVhy5w=
Date: Thu, 10 Sep 2020 12:02:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200910110241.GA4898@sirena.org.uk>
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
 <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
X-Cookie: I disagree with unanimity.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_070328_805051_70B2BC12 
X-CRM114-Status: GOOD (  12.25  )
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
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Cheng-yi Chiang <cychiang@chromium.org>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: multipart/mixed; boundary="===============0283822021280007661=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0283822021280007661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 11:49:22AM -0600, Rob Herring wrote:

> I would assume a codec to be similar. The codec node (the alc5682
> node) should have any jack related properties (or possibly implicitly
> support it by default).

This isn't always clear - some jack detection is implemented entirely by
integrating simple components like GPIOs and ADCs or by integrating
limited support in one device with some external components to get more
features (like bolting an ADC on the side for button detect).  I would
not expect to ever see a device with jack detection support that could
just be unconditionally enabled, it will always require some board level
wiring up to provide the connections required to function.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9aB9EACgkQJNaLcl1U
h9AQugf/fpoDHSobmOyj7a1nUYga227O6hgeON+vz+LB7a1JnX599O2oELAe1IGT
xOV8DGUJpwdKUP1XWMHb/vMrtaS71E8m6Qsulc3s+Hdt6F38ObT5+z7zu0grr0rm
wN1qRoyWHkPhFczDkvF95J2xO+lbs+5DbmfT/YVL+npWCtyYRVgKDwhmwWvqk/Sv
5H7dVBlF1ivTTc4mAbG0FGGVlSL9hsg87i9b30jChkitX7BDRyvj41eVOdQs0Dpz
ghIR+b6ZFI4iihIbFj8kBDL6y6cekl0Cs9YUA5YLsDxSjSJUidnCiuX1UK3NNOW2
HiD76k32T+eskJVotOs6/DwV7UQS4A==
=knP8
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--


--===============0283822021280007661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0283822021280007661==--

