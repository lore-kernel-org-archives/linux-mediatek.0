Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5139C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 16:13:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA0222210
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 16:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oloVQg8+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zv64p4zB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA0222210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gBUuWYuwHUxBpAZCT3LzjfZNNOGkx7GP91TyPttw4Ik=; b=oloVQg8+8XAv9z1SQvUl8u8dp
	seQCwuwNDpzLusib8iP+L4vTqvoG2u17XQyDmjVFnrU/t6q6ADijBA6qnqbu3/bI+k0WBFE9GmxY5
	ncXda9nvwV4b2I09NHgGB3NueODCo79LYGIXq0n94Yw8+6l+Jf7aEUKI3aWs5tTQFcJMwhEbS9U0A
	k0lECFj1OCQkxL6gKuoBLg/dC/zTQaIXvzmrwpOcmhU8y85n9IH/YOL0zsBEM1mfZS+/QxOvYbH2J
	m5XL+5mt62TbKWR96kgaGkKUMfBrWebuVZ7ymnMWmJVgrD3vmOJVF/XKls3OCEpVcn7jrXBC5/CD9
	kENwOOe+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT5sJ-00080i-TJ; Thu, 15 Oct 2020 16:13:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT5sC-0007zP-0L; Thu, 15 Oct 2020 16:13:00 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E68D421D7F;
 Thu, 15 Oct 2020 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602778378;
 bh=wYeGNA65xooghznt1NdP+AJ2P2uDRvjHr3QQlhRQdJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zv64p4zBHeZ3PPxAhPoimJW4wUmg5nR1YqruXK6ydTfrKj6gxgDs/npmBfiBUDRPJ
 nsmJobGaaDVM4rUT1Y/GTiitd3qgAuMtyxsJFK1Q7wbh8egz6TfyLLrxay9FmUCqOf
 RgqjlfejcNXGsg3/jrusuIfun2/skkP3Alzhz6xA=
Date: Thu, 15 Oct 2020 17:12:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201015161251.GF4390@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
X-Cookie: Neutrinos have bad breadth.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_121300_238256_9764C0A8 
X-CRM114-Status: GOOD (  23.11  )
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
Content-Type: multipart/mixed; boundary="===============6315834583647210439=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6315834583647210439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla

> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic

> > This information can come from the dai link description itself, why
> > should compatible string have this information?

> I think dailink description is not enough to specify everything
> machine driver needs to know.
> E.g. there is a variation where there are front mic and rear mic. We
> need to tell the machine driver about it so
> it can create proper widget, route, and controls.

That sounds like something that could be better described with
properties (including for example the existing bindings used for setting
up things like analogue outputs and DAPM routes)?

> The codec combination also matters. There will be a variation where
> rt5682 is replaced with adau7002 for dmic.
> Although machine driver can derive some information by looking at dailink,
> I think specifying it explicitly in the compatible string is easier to
> tell what machine driver should do, e.g.
> setting PLL related to rt5682 or not.

These feel more like things that fit with compatible, though please take
a look at Morimoto-san's (CCed) work on generic sound cards for more
complex devices:

   https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/

This is not yet implemented but it'd be good to make sure that the
Qualcomm systems can be handled too in future.

> You can see widget, route, controls are used according to the configuration.
> The alternative approach is to check whether "dmic-gpio" property
> exists to decide adding these stuff or not.
> But it makes the intent less easier to understand.

OTOH if you have lots of compatibles then it can get hard to work out
exactly which one corresponds to a given board.

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+IdQIACgkQJNaLcl1U
h9Cs0gf/aR5zd1VPFM/nOmIp2Or27oiqOMSopuxWeT8ZLdCC0srj7gRTUI8522lz
izypzvOW3riGLBh7X3uPWB5LyKHA80pa0yhNrAdJLBzmW0V5OlJ5Wt9VBz4V+qyq
oIfmqS/jhFQ4pPGdKQDPhV2NPLK7NT40qcSmCuqrCPR49XcqvTUt7PmETCp1LuqC
p5vUj1AqXOHLBRbmy6yc7svns2YEGkH3bxd5MED59nadECZl8QmCVWW+VHERFMnf
r5J8EW8FiPMaE6WRwmzf7KdPDHmfFJrRbCGjq9SiwS1qGre7qUdXm0lGagA3YUIq
KhE0K1VXxuMUGRohRmQ/sE555zuDBw==
=ZOAb
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--


--===============6315834583647210439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6315834583647210439==--

