Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCC1C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 14:37:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14392177B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 14:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xsxiCToJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsqyybu2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14392177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2Ni38VwS1osdw5BCwwiMpydbTgNiigT2OLk/T81gnU=; b=xsxiCToJ33UfLuQwQY7CIcbuE
	IqP2O16uygnlGj00ZPiKwlrwjhF3EWFXp5jNvH0z7OFVu5hR1gHRsV8PurSfd5CFCGKPL0lQZoAs1
	KHKD0sQGdHf6ryIShA1uoX2j8I2Y6rB7BI6KWoeOm+gm1WT2Krw16iDHOCOf7k+BJVkzM13TkyNNw
	tNFj06UZApcu1M1xKt3Z0DtBpz7Ud0Qa/XOxhY8aWtUTdPm6EB4WxF3ed3pR1aU0tPyz9H+7XyJ81
	mJUVW9rtOaME63Qb1vTRZeG0+z6onBZSaII+BckTjBJ1tAG0VZRvTJ3HgyWa8Ubc9Azh6Z4hzx6g9
	LcJJImXdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUslU-0008K5-SP; Tue, 20 Oct 2020 14:37:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUslP-0008JF-Gr; Tue, 20 Oct 2020 14:37:24 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9389B21534;
 Tue, 20 Oct 2020 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603204642;
 bh=f6kugA3U0QakUulP0txsV8BTYj/A5215gpbs4UZBY38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsqyybu2MKInKfeRhYrW8vkb0ymsQrvurWgo03nA1Q5MVwC/kOLvNMmZ9Ed/8aRiL
 ya2rx+LZfiIkoLhgcYVnyIbRP1wd4AudxWlepqbUQDEjreJCGCBeJUqwlTALe6McPJ
 SM5qeM1oDBEh6KMnBudKKbJJ6ENN4MFTbDhuc4iM=
Date: Tue, 20 Oct 2020 15:37:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201020143711.GC9448@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_103724_152588_F4B40293 
X-CRM114-Status: GOOD (  29.49  )
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
 Patrick Lai <plai@codeaurora.org>,
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: multipart/mixed; boundary="===============4830637102202922354=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4830637102202922354==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 09:37:05PM +0800, Cheng-yi Chiang wrote:

> May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
> machine driver for 2mic" ?

> https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com

> I think adding code in the machine driver makes the intent straightforward.
> If we want the machine driver to be fully configurable,
> we can always add more code to handle properties like gpio, route,
> widget (mux, text selection) passed in from the device tree.

If the device has both front and rear mics and only one can be active at
once that seems obvious and sensible.  If the devices only have one of
these then this seems like a bad idea.

> But I feel that we don't need a machine driver to be that configurable
> from the device tree.
> I think having the logic scattered in various dtsi files and relying
> on manual inspection to understand the usage would be less
> maintainable than only exposing needed property like gpio.
> Especially in the complicated case where we need to create a mux
> widget with callback toggling the gpio like this:

I don't understand what "logic scattered in various dtsi files" means,
sorry.

> Yes, that should work to describe the dailink we are using.
> But a more tricky issue is how to do calls like setting PLL in dai startup ops.

...

> I think that asking a generic machine driver to do configuration like
> this with only a limited interface of device property
> might be too much of an ask for the machine driver.

Richard was looking at some basic configuration for PLLs.

> Would you mind if I simplify the compatible string like Srinivas
> suggested, and send a v12?

> As for other two kinds of variations that I am aware of:

> 1. front mic / rear mic
> 2. replace alc5682 with adau7002

The CODEC change is going to be described in the DT no matter what -
you'll have a reference to the CODEC node but it may make sense if
there's enough custom code around it.  For front vs rear mic the
simplest thing would just be to not mention which if this is a hardware
fixed thing, otherwise a control.

> We can set different board names and different compatible strings to
> achieve such variation.
> So that it would make sense to describe configuration in compatible
> strings like you suggested, and also provides UCM a way to distinguish
> different boards.

I don't recall having suggested distinguishing these things with a
compatible string, especially not the microphones.  UCM can already use
the display names for the boards to distinguish things.

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+O9hYACgkQJNaLcl1U
h9CspAf/b7bFcvyQbodhwCE9GoK96aMXJ54K2Y9rG4bcavB0WJbLggXc4xYp/uUS
oDymKZzLQr+vEzU9gO/inLAIXfMd2QTgLQWrrY4K/Z/q6+Wo702H2r0kwEXIpj3E
nB2VjUldnpl0XYCmavYeVaZLep8+qTL6QixnsLQq6zrwirPeyNpfQ2iu/FLzSYX6
EayieZWxAGuFfZkIoPg38GQqW6bZeuc8Nom0OY4Yqu/uoz29ekHKWOQm03DZyRK9
bTCBvPjsigi/ABXue224l0WavpRxvvjRNeswkQasH9rM/OIhY4CKktbaNmUW/1mH
FIkwdq2b8lvHefF3atCnALr5tCyx1Q==
=1PAU
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--


--===============4830637102202922354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4830637102202922354==--

